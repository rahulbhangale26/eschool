<?php
/*
Plugin Name: Wp Mobi
Plugin URI: https://wordpress.org/plugins/wp-mobi
Description: This plugin will help you to create/customize mobile app for your website.
Author: Rahul Bhangale
Version: 0.0.3
Author URI: https://wpandro.com/
*/

require_once 'wpmobi-config.php';
require_once 'core/CWpMobiOption.class.php';
require_once 'core/CommonFunctions.php';
require_once 'core/CCore.class.php';
require_once 'src/WpMobiShortcode..class.php';
if( true == is_admin() ) {
    include_once 'admin_panel/CWpMobiAdmin.class.php';
    if( true == isset( $arrstrWpMobiTabPaths[$_GET['tab']] ) ) {
        include_once $arrstrWpMobiTabPaths[$_GET['tab']];
    } else {
        include_once $arrstrWpMobiTabPaths['general_settings'];
    }
}
