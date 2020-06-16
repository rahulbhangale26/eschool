<?php

class CWpMobiGeneralSettings extends CWpMobiAdmin {

    public function __construct() {
        parent::__construct();
        add_action( 'wp_ajax_get_laucher_icon_preview', [ $this, 'getLauncherIconPreview' ]  );
    }

    public function initialize() {
        parent::initialize();
    }

    public function execute() {
        switch ( $this->getRequestAction() ) {
            case NULL;
            case 'general_settings':
                $this->handleViewGeneralSettings();
                break;

            case 'save_general_settings':
                $this->handleSaveGeneralSettings();
                break;

            default:
                break;
        }

    }

    public function handleViewGeneralSettings() {
        $arrmixParameters                   = [];
        $arrmixParameters['wp_mobi_option'] = $this->objWpMobiOption;
        $this->setRenderTemplate( 'admin_panel/views/general_settings.php', $arrmixParameters, true );
    }

    public function handleSaveGeneralSettings() {

        $this->objWpMobiOption->setValues( $this->getRequestData( ['wp_mobi'] ) );

        switch ( NULL ) {
            default:
                if( false == $this->objWpMobiOption->valAppName() ) {
                    $this->addErrorMsg( 'Please enter valide app Name.' );
                    break;
                }

                if( false == $this->objWpMobiOption->addOrUpdate() ) {
                    $this->addErrorMsg( 'Unable to save setting, Please contact administrator.' );
                    break;
                }

                $this->addSuccessMsg( 'Your settings saved successfully.' );
        }

        $this->handleViewGeneralSettings();
    }
    
    public function getLauncherIconPreview() {
        if(isset($_GET['launcher_icon_id']) ){
            $image = wp_get_attachment_image( filter_input( INPUT_GET, 'launcher_icon_id', FILTER_VALIDATE_INT ), 'medium', false, array( 'id' => 'myprefix-preview-image' ) );
            $data = array(
                'image'    => $image,
            );
            wp_send_json_success( $data );
        } else {
            wp_send_json_error();
        }
    }

    public function handleBuildApp() {
        require_once WP_MOBI_PATH . '/library/WpMobiApi/CClient.class.php';

        $arrmixParameters = [];

        $objClientDetails = json_decode( get_option( 'wp_mobi' ) );
        $objWpMobiClient = new CClient();
        $objWpMobiClient->setName( $objClientDetails->app_name );
        $objWpMobiClient->setUrl( $objClientDetails->app_url );
        $objWpMobiClient->setClientId( $objClientDetails->client_id );

        if( true == $objWpMobiClient->checkDownload() ) {
            $objClientDetails->download_link = esc_url_raw( $objWpMobiClient->getResponseData()['download_link'] );
            update_option( 'wp_mobi', json_encode( $objClientDetails ) );

            $arrmixParameters['message'] = $objWpMobiClient->getSuccessMsg();
            $arrmixParameters['download_link'] = $objWpMobiClient->getResponseData()['download_link'];
        }

        $this->setRenderTemplate( 'admin_panel/views/build_app.php', $arrmixParameters );
    }

    public function handleViewPublishSettings() {

        update_option( 'wp_mobi_step' , 'view_publish_settings' );
        $objClientDetails = json_decode( get_option( 'wp_mobi' ) );

        $arrmixParameters = [];
        $arrmixParameters['download_link'] = $objClientDetails->download_link;

        wp_enqueue_script( 'jquery-ui-accordion' );
        wp_enqueue_script( 'jquery-ui-accordion' );
        $this->setRenderTemplate( 'admin_panel/views/view_publish_settings.php', $arrmixParameters );
    }

    public function loadLinks() {
        parent::loadLinks();
        $this->arrstrLinks['request_build']             = WP_MOBI_ADMIN_URL . '&tab=view_build_and_publish&action=request_build';
        $this->arrstrLinks['save_general_settings']     = WP_MOBI_ADMIN_URL . '&tab=general_settings&action=save_general_settings';
    }
    
    public function enqueueStylesheets() {
        
        parent::enqueueStylesheets();
        wp_enqueue_media();
        wp_register_style( 'wpmobi_jquery_style', WP_MOBI_URL . 'admin_panel/assets/libs/jquery-ui.min.css' );
        wp_enqueue_script( 'wpmobi_launcher_icon_selector', WP_MOBI_URL . 'admin_panel/assets/js/launcher_icon_selecor.js', array('jquery'), '0.1' );
    }

}

new CWpMobiGeneralSettings();