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
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wordpress' );

/** MySQL database password */
define( 'DB_PASSWORD', 'wordpress' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'Dsa:hy2U3akJ+~,~>T3X{a%b(}K5vH}{1`<[OC<B|3|5CKB-;W+aFKpDh(3!m#p5');
define('SECURE_AUTH_KEY',  'KAsFY}A 0simvGemHeps_ml[2Fw&MHp,8<O2xeqn,a,q_H#giX>zt6>~<>J4#%+M');
define('LOGGED_IN_KEY',    'iT)=cYl(KJ,)X4eVzm|`Vo=au8LkP+ Hlc4a$&@<&FF7V$HL{bY@)8jl?9|)(a_#');
define('NONCE_KEY',        'nyv<iPxsxnn:g/G=7i;MIipwd.O{&:wg+o;/J)J+MG+rCO7~)cT@qkDqkVxIHSn<');
define('AUTH_SALT',        'Lx^8.ja7+:~-4/#|.,YB}uU0Z0X)/U?+h,f_!N=c#|! VAt:Y+h;c>PaVhO5|m(7');
define('SECURE_AUTH_SALT', '} ,L&A/{fmw0_}S3oiU~Qy+>$tP)=Jsil`yrK_T<7Fz+6I{71^bD/b00j9TgM|>*');
define('LOGGED_IN_SALT',   '|>DU$ S+^7wBe[wGa#S+#=#dRSv$APw*(zm-h|p#<M_xvol9pW|`K^8r4zD+:6+>');
define('NONCE_SALT',       'H0@br+c-SO-`b4gNg$])+G+=*<Wl!m<P|eQ7}@cF52_d kA&+AidO7i|I?_|B}?U');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

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
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
