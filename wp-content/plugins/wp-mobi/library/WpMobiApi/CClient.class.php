<?php

class CClient {

    private $strAppKey;
    private $strSecretKey;

    private $arrstrHeaders;

    protected $strName;
    protected $strPackageName;
    protected $strUrl;
    protected $strLauncherUrl;

    protected $strAppId;
    protected $strErrorMsg = '';

    protected $strSuccessMsg = '';
    protected $arrstrResponseData;

    public function getErrorMsg() {
        return $this->strErrorMsg;
    }

    public function getSuccessMsg() {
        return $this->strSuccessMsg;
    }

    public function __construct() {
    }

    public function setAppKey( $strAppKey ) {
        $this->strAppKey = $strAppKey;
    }

    public function setSecretKey( $strSecretKey ) {
        $this->strSecretKey = $strSecretKey;
    }

    public function setName( $strName ) {
        $this->strName = $strName;
    }

    public function setPackageName( $strPackageName ) {
        $this->strPackageName = $strPackageName;
    }

    public function setUrl( $strUrl ) {
        $this->strUrl = $strUrl;
    }

    public function setResponseData( $arrstrResponseData ) {
        $this->arrstrResponseData = $arrstrResponseData;
    }

    public function setAppId( $strAppId ) {
        $this->strAppId = $strAppId;
    }
    
    public function setLauncherUrl( $strLauncherUrl ) {
        $this->strLauncherUrl = $strLauncherUrl;
    }

    public function getAppKey() {
        return $this->strAppKey;
    }

    public function getSecretKey() {
        return $this->strSecretKey;
    }

    public function getName() {
        return $this->strName;
    }

    public function getPackageName() {
        return $this->strPackageName;
    }

    public function getUrl() {
        return $this->strUrl;
    }

    public function getResponseData() {
        return $this->arrstrResponseData;
    }

    public function getAppId() {
        return $this->strAppId;
    }
    
    public function getLauncherUrl() {
        return $this->strLauncherUrl;
    }
    public function setHeaders( $arrstrHeaders ) {
        $this->arrstrHeaders = $arrstrHeaders;
    }

    public function addHeaders( $arrstrHeaders ) {
        foreach ( $arrstrHeaders AS $strHeaderName => $strHeaderValue ) {
            $this->arrstrHeaders[$strHeaderName] = $strHeaderValue;
        }
    }

    public function create() {

        $this->addHeaders( [
            'Authorization' => 'Basic ' . base64_encode( $this->getAppKey() . ':' . $this->getSecretKey() )
        ] );

        return $this->sendPost( WP_MOBI_API_URL . 'service/client/create',[
            'body' => [
                'application[app_name]' => $this->strName,
                'application[site_url]' => $this->strUrl,
            ],

        ] );
    }

    public function checkDownload() {

        $this->addHeaders( [
            'Authorization' => 'Basic ' . base64_encode( $this->getAppKey() . ':' . $this->getSecretKey() )
        ] );

        return $this->sendPost( WP_MOBI_API_URL . 'service/client/check_download_ready', [
            'body' => [
                'application[app_id]'    => $this->strAppId,
            ]
        ] );

    }

    private function sendPost( $strUrl, $arrstrParams ) {

        $arrstrParams['headers']    = $this->arrstrHeaders;
        $arrstrResponse             = wp_remote_post( $strUrl, $arrstrParams );

        if( false == is_array( $arrstrResponse ) ) {
            $this->addErrorMsg( 'Invalid Response: Please contact administrator.', true );
            return false;
        }

        $arrstrResponse = json_decode( ( isset( $arrstrResponse['body'] ) ? $arrstrResponse['body'] : NULL ), true );

        if( false == $arrstrResponse ) {
            $this->addErrorMsg( 'Invalid Response: Please contact administrator.', true );
            return false;
        }

        if( true == isset( $arrstrResponse['status'] ) ) {
            if( true == $arrstrResponse['status'] ) {
                $this->setResponseData( $arrstrResponse['data'] );
                $this->addSuccessMsg( $arrstrResponse['message'] );
                return true;
            } else {
                $this->addErrorMsg( $arrstrResponse['message'] );
                return false;
            }
        }

        $this->addErrorMsg( 'Invalid Response: please contact administrator.' );
        return false;
    }

    public function addErrorMsg( $strErrorMsg ) {
        $this->strErrorMsg .= $strErrorMsg;
    }

    public function addSuccessMsg( $strSuccessMsg ) {
        $this->strSuccessMsg .= $strSuccessMsg;
     }


}