<?php


class CTemplate {

    protected $arrmixTemplateVariables;
    protected $strTemplatePath;
    protected $strNavPath;
    protected $boolIsNavInclude = false;

    public function __construct() {

    }

    public function getTemplatePath() {
        return $this->strTemplatePath;
    }

    public function setTemplatePath( $strTemplatePath ) {
        $this->strTemplatePath = $strTemplatePath;
    }

    public function setNavPath( $strNavPath ) {
        $this->strNavPath = $strNavPath;
    }

    public function setIsNavInclude( $boolIsNavInclude ) {
        $this->boolIsNavInclude = $boolIsNavInclude;
    }

    public function addVar( $strKey, $strVal ) {
        $this->arrmixTemplateVariables[$strKey] = $strVal;
    }

    public function addVars( $arrmixTemplateVars ) {
        foreach ( ( array ) $arrmixTemplateVars AS $strKey => $arrmixTemplateVar ) {
            $this->arrmixTemplateVariables[$strKey] = $arrmixTemplateVar;
        }
    }

    public function render() {
        foreach( ( array ) $this->arrmixTemplateVariables AS $strKey => $arrmixValue ) {
            $$strKey = $arrmixValue;
        }

        if( true == $this->boolIsNavInclude ) {
            require_once WP_MOBI_PATH . $this->strNavPath;
        }

        require_once WP_MOBI_PATH . $this->strTemplatePath;
    }

}