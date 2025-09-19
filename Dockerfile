FROM wordpress:latest

# Remove default wp-content (if exists)
RUN rm -rf /var/www/html/wp-content

# Copy your code into the image
COPY wp-content /var/www/html/wp-content

# (Optional) Copy custom wp-config.php
COPY wp-config.php /var/www/html/wp-config.php

# Permission fix for production (owned by www-data)
RUN chown -R www-data:www-data /var/www/html/wp-content \
 && find /var/www/html/wp-content -type d -exec chmod 755 {} \; \
 && find /var/www/html/wp-content -type f -exec chmod 644 {} \;
