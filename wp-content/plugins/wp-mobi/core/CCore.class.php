<?php
require_once 'CTemplate.php';

abstract class CCore {

    protected $objTemplate;

    protected $arrstrJsonRespose;
    protected $arrstrErrorMsg;
    protected $arrstrLinks;
    protected $arrstrSuccessMsgs;

    protected $arrmixTemplateParameters;
    protected $strSelectedTab;
    protected $arrstrTabs;


    public function __construct() {
    }

    public abstract function initialize();
    public abstract function execute();
    public abstract function loadLinks();
    public abstract function loadTabs();

    public function run() {
        $this->initialize();
        $this->execute();
    }

    public function getErrorMsg() {
        return $this->arrstrErrorMsgs;
    }

    public function getSuccessMsg() {
        return $this->arrstrSuccessMsgs;
    }

    public function addErrorMsg( $strErrorMsg ) {
        $this->arrstrErrorMsgs[] = $strErrorMsg;
    }

    public function addSuccessMsg( $strSuccessMsg ) {
        $this->arrstrSuccessMsgs[] = $strSuccessMsg;
    }

    public function setRenderTemplate( $strTemplatePath, $arrmixTemplateVars, $boolIsNavInclude ) {
        $this->loadLinks();
        $this->loadTabs();
        $this->objTemplate = new CTemplate();
        $this->objTemplate->addVars( $arrmixTemplateVars );
        $this->objTemplate->addVars( [ 'links' => $this->arrstrLinks ] );
        $this->objTemplate->addVars( [ 'success_msgs' => $this->arrstrSuccessMsgs ] );
        $this->objTemplate->addVars( [ 'error_msgs' => $this->arrstrErrorMsgs ] );
        $this->objTemplate->addVars( [ 'nav_tabs' => $this->arrstrTabs ] );
        $this->objTemplate->addVars( [ 'selected_tab' => $this->strSelectedTab ] );
        $this->objTemplate->setTemplatePath( $strTemplatePath );
        $this->objTemplate->setIsNavInclude( $boolIsNavInclude );
    }

    public function getRequestData( array $arrstrKeys ) {
        $arrmixRequest = $_REQUEST;
        if( false == valArr( $arrstrKeys ) ) {
            return $arrmixRequest;
        }

        foreach( $arrstrKeys AS $strKey ) {
            $arrmixRequest = ( true == isset( $arrmixRequest[$strKey] ) ? $arrmixRequest[$strKey] : NULL );
        }

        return $arrmixRequest;

    }

    public function getRequestAction() {
        if( true == is_string( $this->getRequestData( ['action'] ) ) )
            return sanitize_text_field( $this->getRequestData( ['action'] ) );

        return NULL;
    }

    public function renderTemplate() {
        if( false == is_object( $this->objTemplate ) ) {
            $this->objTemplate = new CTemplate();
        }

        $this->objTemplate->render();
    }

    public function renderJson() {
        echo json_encode( $this->arrstrJsonRespose );
        exit;
    }

}