<?php
define( 'WP_MOBI_PATH', plugin_dir_path( __FILE__ ) );
define( 'WP_MOBI_URL', plugin_dir_url( __FILE__ ) );
define( 'WP_MOBI_ADMIN_URL', admin_url( 'admin.php?page=wp_mobi' ) );

define( 'WP_MOBI_API_URL', 'https://api.wpandro.com/');

$arrstrWpMobiTabPaths = [
    'general_settings'          => WP_MOBI_PATH . '/admin_panel/CWpMobiGeneralSettings.class.php',
    'view_build_and_publish'    => WP_MOBI_PATH . '/admin_panel/CWpMobiBuildAndPublish.class.php'
];