<?php


class WpMobiShortcode extends CCore {

    public function __construct() {

        add_shortcode( 'wp_mobi', [ 'WpMobiShortcode', 'handleViewAppDownload'] );
    }

    public function initialize() {
    }

    public function execute() {

    }

    public function loadLinks() {
    }

    public function loadTabs() {
    }

    public static function handleViewAppDownload() {
        $objClientDetails = json_decode( get_option( 'wp_mobi' ) );
        return '<a href="' . esc_url( $objClientDetails->download_link  ). '"> <img src="' . WP_MOBI_URL . 'assets/images/androidlogo.png" width="100" height="100" /></a>';
    }

}

new WpMobiShortcode();
