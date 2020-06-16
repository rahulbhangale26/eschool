<?php

class CWpMobiOption {

    protected $boolIsOptionExists;

    protected $strAppId;
    protected $strAppName;
    protected $strDownloadLink;
    protected $strLauncherIconId;

    private $strAppKey;
    private $strSecretKey;

    protected $strBuildRequestedOn;
    protected $strBuildCompletedOn;

    const WP_MOBI_OPTION = 'wp_mobi_option';

    public function __construct() {
        $this->boolIsOptionExists = false;
        $arrstrWpMobiOption = get_option( self::WP_MOBI_OPTION );
        if( false != $arrstrWpMobiOption ) {
            $this->boolIsOptionExists = true;
            $this->setValues( $arrstrWpMobiOption );
        }
    }

    public function getIsOptionExists() {
        return $this->boolIsOptionExists;
    }

    public function getAppId() {
        return $this->strAppId;
    }

    public function getAppName() {
        return $this->strAppName;
    }

    public function getAppKey() {
        return $this->strAppKey;
    }

    public function getSecretKey() {
        return $this->strSecretKey;
    }

    public function getBuildRequestedOn() {
        return $this->strBuildRequestedOn;
    }

    public function getBuildCompletedOn() {
        return $this->strBuildCompletedOn;
    }

    public function getDownloadLink() {
        return $this->strDownloadLink;
    }
    
    public function getLauncherIconId() {
        return $this->strLauncherIconId;
    }

    public function setAppId( $strAppId ) {
        $this->strAppId = $strAppId;
    }

    public function setAppName( $strAppName ) {
        $this->strAppName = $strAppName;
    }

    public function setAppKey( $strAppKey ) {
        $this->strAppKey = $strAppKey;
    }

    public function setSecretKey( $strSecretKey ) {
        $this->strSecretKey = $strSecretKey;
    }

    public function setBuildRequestedOn( $strBuildRequestedOn ) {
        $this->strBuildRequestedOn = $strBuildRequestedOn;
    }

    public function setBuildCompletedOn( $strBuildCompletedOn ) {
        $this->strBuildCompletedOn = $strBuildCompletedOn;
    }

    public function setDownloadLink( $strDownloadLink ) {
        $this->strDownloadLink = $strDownloadLink;
    }
    
    public function setLauncherIconId( $strLauncherIconId ) {
        $this->strLauncherIconId = $strLauncherIconId;
    }

    public function setValues( $arrstrValues ) {
        if( true == isset( $arrstrValues['app_id'] ) )              $this->setAppId( trim( sanitize_text_field( $arrstrValues['app_id'] ) ) );
        if( true == isset( $arrstrValues['app_name'] ) )            $this->setAppName( trim( sanitize_text_field( $arrstrValues['app_name'] ) ) );
        if( true == isset( $arrstrValues['app_key'] ) )             $this->setAppKey( trim( sanitize_text_field( $arrstrValues['app_key'] ) ) );
        if( true == isset( $arrstrValues['secret_key'] ) )          $this->setSecretKey( trim( sanitize_text_field( $arrstrValues['secret_key'] ) ) );
        if( true == isset( $arrstrValues['build_requested_on'] ) )  $this->setBuildRequestedOn( trim( sanitize_text_field( $arrstrValues['build_requested_on'] ) ) );
        if( true == isset( $arrstrValues['build_completed_on'] ) )  $this->setBuildCompletedOn( trim( sanitize_text_field( $arrstrValues['build_completed_on'] ) ) );
        if( true == isset( $arrstrValues['download_link'] ) )       $this->setDownloadLink( trim( sanitize_text_field( $arrstrValues['download_link'] ) ) );
        if( true == isset( $arrstrValues['launcher_icon_id'] ) )    $this->setLauncherIconId( trim( sanitize_text_field( $arrstrValues['launcher_icon_id'] ) ) );
    }

    public function valAppName() {
        if( true == preg_match('/[^a-z_\-0-9\s]/i', $this->strAppName ) ) {
            return false;
        }

        return true;
    }

    public function update() {
        return update_option( self::WP_MOBI_OPTION, $this->toArray() );
    }

    public function add() {
        return add_option( self::WP_MOBI_OPTION, $this->toArray() );
    }

    public function addOrUpdate() {
        if( false == $this->boolIsOptionExists ) {
            return $this->add();
        }

        return $this->update();
    }

    public function toArray() {
        $arrstrWpMobiOption = [
            'app_id'                => $this->getAppId(),
            'app_name'              => $this->getAppName(),
            'app_key'               => $this->getAppKey(),
            'secret_key'            => $this->getSecretKey(),
            'build_requested_on'    => $this->getBuildRequestedOn(),
            'build_completed_on'    => $this->getBuildCompletedOn(),
            'download_link'         => $this->getDownloadLink(),
            'launcher_icon_id'      => $this->getLauncherIconId()
        ];

        return $arrstrWpMobiOption;
    }

}