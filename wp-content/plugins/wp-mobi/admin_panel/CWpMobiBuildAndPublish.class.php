<?php


class CWpMobiBuildAndPublish extends CWpMobiAdmin {

    protected $arrstrParameters;

    public function __construct() {
        parent::__construct();
    }

    public function initialize() {
        parent::initialize();
    }

    public function execute() {
        switch ( $this->getRequestAction() ) {
            case NULL;
            case 'view_build_and_publish':
                $this->handleViewBuildAndPublish();
                break;

            case 'request_build':
                $this->handleRequestBuild();
                break;

            default:
                break;
        }
    }

    public function handleViewBuildAndPublish() {
        if( true == is_null( $this->objWpMobiOption->getBuildCompletedOn() ) ) {
            $this->checkDownloadReady();
        }

        $this->arrstrParameters['wp_mobi_option'] = $this->objWpMobiOption;
        $this->setRenderTemplate( 'admin_panel/views/view_build_and_publish.php', $this->arrstrParameters, true );
    }

    public function handleRequestBuild() {
        require_once WP_MOBI_PATH . '/library/WpMobiApi/CClient.class.php';

        $this->objWpMobiOption->setBuildRequestedOn( ( new DateTime() )->format( 'Y-m-d H:i:s' ) );

        $objWpMobiClient = new CClient();
        $objWpMobiClient->setAppKey( $this->objWpMobiOption->getAppKey() );
        $objWpMobiClient->setSecretKey( $this->objWpMobiOption->getSecretKey() );
        $objWpMobiClient->setName(   $this->objWpMobiOption->getAppName() );
        $objWpMobiClient->setLauncherUrl( wp_get_attachment_image_url( $wp_mobi_option->getLauncherIconId(), 'thumbnail', true ) );
        $objWpMobiClient->setUrl( site_url() );

        switch ( NULL ) {
            default:

                if( false == $objWpMobiClient->create() ) {
                    $this->addErrorMsg( $objWpMobiClient->getErrorMsg() );
                    break;
                }

                $this->objWpMobiOption->setAppId( $objWpMobiClient->getResponseData()['app_id'] );

                if( false == $this->objWpMobiOption->update() ) {
                    $this->addErrorMsg( 'Unable to request build. Please contact administrator.' );
                    break;
                }

                $this->addSuccessMsg( $objWpMobiClient->getSuccessMsg() );
        }

        $this->handleViewBuildAndPublish();
    }

    public function checkDownloadReady() {
        require_once WP_MOBI_PATH . '/library/WpMobiApi/CClient.class.php';
        $objWpMobiClient = new CClient();
        $objWpMobiClient->setAppKey( $this->objWpMobiOption->getAppKey() );
        $objWpMobiClient->setSecretKey( $this->objWpMobiOption->getSecretKey() );
        $objWpMobiClient->setAppId(   $this->objWpMobiOption->getAppId() );

        switch ( NULL ) {
            default:
                if( false == $objWpMobiClient->checkDownload() ) {
                    break;
                }

                $this->objWpMobiOption->setDownloadLink( $objWpMobiClient->getResponseData()['download_link'] );
                $this->objWpMobiOption->setBuildCompletedOn( $objWpMobiClient->getResponseData()['build_completed_on'] );


                if( false == $this->objWpMobiOption->update() ) {
                    $this->addErrorMsg( 'Unable to save build completed, Please contact administrator.' );
                    break;
                }

                $this->addSuccessMsg( 'You build is successfull and ready to download.' );
                return true;
        }

        return false;


    }

    public function loadLinks() {
        parent::loadLinks();
        $this->arrstrLinks['request_build']             = WP_MOBI_ADMIN_URL . '&tab=view_build_and_publish&action=request_build';
    }

}

new CWpMobiBuildAndPublish();