<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wphooray');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', 'root');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '{m9/cq~XnKy:|JJbmpG6xj&t6N)o(Bqt8FmT?N+Vj#IHBVD62n`i0q$ FbVmwO(4');
define('SECURE_AUTH_KEY',  '?4ACp]CMHd.Z.;k9[d!yRGQf!G(D3u4X44VyIT7]tMlWD8}s70)!IO; RP!:=;hK');
define('LOGGED_IN_KEY',    'qq 2Pty),N`32Ga1mO8%?aLTN/iw<t@1q|IkQ.R:mlig8B]9~4Up/{icr5@<Jy]W');
define('NONCE_KEY',        'L:d!%jNoUO?&< C9tXn(}cH>E`wvJi3S[;8>,<`Xr0$GGv~*SbT&zU:*pnV7L]JW');
define('AUTH_SALT',        'eYW%0om2pi;k)W,FoY6~ h~:PlTx~;F+aKvYW`DMSN^=ew?,aR#{~uLKon{v[b26');
define('SECURE_AUTH_SALT', 'b@Cf*TJ0b&[AllQndN`,=mci)tf#:NTM).T2(PlQ(vSTdY%KED!4$4Tso<]_eu ?');
define('LOGGED_IN_SALT',   '(*|p|NCBwk4fU-{i}MSewDGtPJ*XSCF~WKq0_H$lv#8mHwvK7XX2>s,/@f5U0TOp');
define('NONCE_SALT',       'ZX(X@s<?wv iSKd0XmjsyAbX=GRa>0)V~YPwcHKXdSEtZ(qEijX!+j!|!b!q9u{M');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
