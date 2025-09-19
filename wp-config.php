<?php
define('WP_CACHE', true); // Added by SpeedyCache

/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wp_db');


/** Database username */
define( 'DB_USER', 'wp_user' );

/** Database password */
define( 'DB_PASSWORD', 'wp_pass' );

/** Database hostname */
define( 'DB_HOST', 'db' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'aykvqprphyqw5qgtaxzri1jcnjr3fqowctly4kg92tnquylfkqyyw1slzbhmmvvr' );
define( 'SECURE_AUTH_KEY',  'qxa1xhjpl8e5qryazz4mdymnhmcwzpviac5cy5g7hwbursgoww6ocuxewmobwlas' );
define( 'LOGGED_IN_KEY',    'ci9h9o1ishzwzsdteobsdlnp5ln47tcjpggkiiwxfs308j3wbpm27b9pbgwb37f1' );
define( 'NONCE_KEY',        'ojdg6qkofvvbyq8ci5cyv6idcdkqoib5ktpu30zz87dx1ps5hkuqryzx05fjumnd' );
define( 'AUTH_SALT',        'iqd7vvvw1gts7k2dv8l0cp5q0ul0l2rolmdhr0wowzklnak8cmm5tjzta6oadnpx' );
define( 'SECURE_AUTH_SALT', 'gysdtk05s7z4pjqqmlvvdlbosoviyu4rrgldkfqluoapsonz1tr68pm8wryh5rou' );
define( 'LOGGED_IN_SALT',   'fr8vrxqtbalx8csceiptrv37qgoeht9o3dzkohif54kejqdxql1r3r1ecxrvcqjl' );
define( 'NONCE_SALT',       'ograyaacwxrfv7pq0zlgif6xoupwtb3kk5cwd4dtd5khxips8dfjqadwzypwfwve' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 *
 * At the installation time, database tables are created with the specified prefix.
 * Changing this value after WordPress is installed will make your site think
 * it has not been installed.
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/#table-prefix
 */
$table_prefix = 'wput_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
 */
define( 'WP_DEBUG', true );

/* Add any custom values between this line and the "stop editing" line. */

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
