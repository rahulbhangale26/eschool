<?php

class CFactory {
    
    protected $objUser;
    
    protected $arrmixHeaderParams;
    protected $arrmixFooterParams;
    protected $arrmixTemplateParams;
    protected $arrmixLinks;
    protected $arrmixMessages;
    protected $arrstrJsonRespose;
    protected $arrstrSuccessMessages;
    protected $arrstrErrorMessages;
    
    protected $boolIsAjaxRequest = false;
    
    
    public function __construct() {
        
    }
        
    public function getPageAction() {
        if( true == isset( $_REQUEST['page_action'] ) ) {
            return $_REQUEST['page_action'];
        }
        
        return NULL;
    }
    
    public function getPage() {
        if( true == isset( $_REQUEST['page'] ) ) {
            return $_REQUEST['page'];
        }
        
        return NULL;
    }
    
    public function getRequestData( $arrstrParam = NULL ) {
        
        if( true == is_null( $arrstrParam  ) ) {
            return $_REQUEST;
        }
        
        $arrstrRequestParam = $_REQUEST;
        foreach ( ( array ) $arrstrParam AS $strParam ) {
            if( false == isset( $arrstrRequestParam[$strParam] ) ) return NULL;
            $arrstrRequestParam = $arrstrRequestParam[$strParam];
        }
        
        return $arrstrRequestParam;
    }
    
    public function getSessionData( $arrstrParam = NULL ) {
        
        if( true == is_null( $arrstrParam  ) ) {
            return $_SESSION;
        }
        
        $arrstrRequestParam = $_SESSION;
        
        foreach ( ( array ) $arrstrParam AS $strParam ) {
            if( false == isset( $arrstrRequestParam[$strParam] ) ) return NULL;
            $arrstrRequestParam = $arrstrRequestParam[$strParam];
        }
        
        return $arrstrRequestParam;
    }
       
    public function setSessionData( $strKey, $strValue ) {
        $_SESSION[$strKey] = $strValue;
    }
    
    public function run() {
        $this->initalize();
        $this->initalizeTemplateParams();
        $this->execute();
        $this->finalize();
    }
    
    public function initalize() {
        global $objUser;
        $this->objUser = $objUser;

        if( true == defined('DOING_AJAX') && DOING_AJAX) { 
            $this->boolIsAjaxRequest = true;
        }
        
        $this->loadLinks();
    }
    
    public function initalizeTemplateParams() {
        $this->arrmixTemplateParams['is_ajax_request']  = $this->boolIsAjaxRequest;
        $this->arrmixTemplateParams['slug_module']      = $this->getRequestData( [ 'page' ] );
        $this->arrmixTemplateParams['user']             = $this->objUser;
        $this->arrmixTemplateParams['wp_content_url']   = WP_CONTENT_URL;
    }
    
    public function execute() {
        
    }
    
    public function finalize() {
        if( true == $this->boolIsAjaxRequest ) {
            exit;
        }
    }
    
    public function destroy() {
        
    }
    
    public function loadLinks() {
        
    }
    
    public function addSuccessMessage( $strMessage ) {
        $this->arrstrSuccessMessages[] = $strMessage;
    }
    
    public function addErrorMessage( $strErrorMessage ) {
        $this->arrstrErrorMessages[] = $strErrorMessage;
    }
    
    public function renderJson() {
        echo json_encode( $this->arrstrJsonRespose );
        exit;
    }
    
    public function displayJson() {
        $this->renderJson();
    }
    
   
    public function renderPage( $strPage ) {

        
        $this->arrmixTemplateParams['success_messages']     = $this->arrstrSuccessMessages;
        $this->arrmixTemplateParams['error_messages']       = $this->arrstrErrorMessages;
        
        foreach ( $this->arrmixTemplateParams AS $strKey => $strValue ){
            $$strKey = $strValue;
        }
        
        
        if( false == $this->boolIsAjaxRequest ) {
            require_once WPSP_PLUGIN_PATH . 'pages/wpsp-header.php';
            require_once WPSP_PLUGIN_PATH . 'pages/' . $strPage;
            require_once WPSP_PLUGIN_PATH . 'pages/wpsp-footer.php';
        } else {
            require_once WPSP_PLUGIN_PATH . 'pages/' . $strPage;
        }
    }
    
    public function enqueueScripts() {
        
    }
    
    public function rekeyObjects( $strKey, $arrObjects ) {
        $arrobjReKeyedObjects = [];
        foreach ( $arrObjects AS $obj ) {
            $arrobjReKeyedObjects[$obj->$strKey] = $obj;
        }
        
        return $arrobjReKeyedObjects;
    }
    
}
?>