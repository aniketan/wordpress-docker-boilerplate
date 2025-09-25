#!/bin/sh

export UID=$(id -u)
export GID=$(id -g)

ENV_FILE="$(dirname "$0")/.env"
DB_DIR="db"
SQL_FILE="$DB_DIR/02-siteurl.sql"

# ---- Helper Functions ----
print_help() {
    cat <<EOF
Usage: $0 [OPTION]

Options:
  --rebuild       Rebuild containers and remove all volumes (DB reset).
  --reset-db      Only reset database volumes.
  --yes, -y       Auto-confirm destructive actions.
  --detach, -d    Run docker-compose in detached mode.
  --help, -h      Show this help message.

EOF
}

confirm_action() {
    if [ "$AUTO_CONFIRM" = true ]; then
        return 0
    fi
    echo -n "Do you want to continue? (y/n): "
    read -r response
    case "$response" in
        [yY]|[yY][eE][sS]) return 0 ;;
        *) echo "Cancelled."; exit 0 ;;
    esac
}

# ---- Parse Arguments ----
AUTO_CONFIRM=false
DETACH=false
ACTION="start"

for arg in "$@"; do
    case $arg in
        --rebuild|-r) ACTION="rebuild" ;;
        --reset-db) ACTION="reset-db" ;;
        --yes|-y) AUTO_CONFIRM=true ;;
        --detach|-d) DETACH=true ;;
        --help|-h) print_help; exit 0 ;;
        *) echo "Unknown option: $arg"; print_help; exit 1 ;;
    esac
done

# ---- Pre-checks ----
[ -f "$ENV_FILE" ] || { echo "❌ $ENV_FILE file not found!"; exit 1; }
[ -d "$DB_DIR" ] || mkdir -p "$DB_DIR"

# Load environment
set -a
. "$ENV_FILE"
set +a

# Site URL from .env or fallback
SITE_URL="${SITE_URL:-http://localhost:8080}"
TABLE_PREFIX="${WORDPRESS_TABLE_PREFIX:-wp_}"

# Generate SQL
cat <<EOF > "$SQL_FILE"
UPDATE ${TABLE_PREFIX}options SET option_value='${SITE_URL}' WHERE option_name='home' OR option_name='siteurl';
EOF

# ---- Actions ----
case "$ACTION" in
    rebuild)
        echo "⚠️  WARNING: This will rebuild containers and remove ALL volumes."
        echo "All database data will be reset."
        confirm_action
        docker compose down -v --remove-orphans
        if [ "$DETACH" = true ]; then
            docker compose up --build -d
        else
            docker compose up --build
        fi
        ;;
    reset-db)
        echo "⚠️  WARNING: This will remove database volumes ONLY."
        confirm_action
        docker compose down -v --remove-orphans
        if [ "$DETACH" = true ]; then
            docker compose up -d
        else
            docker compose up
        fi
        ;;
    start)
        docker compose down
        if [ "$DETACH" = true ]; then
            docker compose up -d
        else
            docker compose up
        fi
        ;;
esac
