<?php

class CSyllabusManager extends CFactory {
    
    protected $arrobjSyllabus;
    protected $objSyllabus;
    
    public function __construct() {
        
    }
    
    public function initalize() {
        parent::initalize();
    }
    
    public function execute() {

        switch( $this->getPageAction() ) {
            case NULL:
                $this->handleViewSyllabus();
                break;
                
            case 'view_upload_syllabus':
                $this->handleViewUploadSyllabus();
                break;
                
            case 'read_syllabus':
                $this->handleReadSyllabus();
                break;
        }
    }
    
    public function handleViewSyllabus() {
        
        $this->arrobjSyllabus = CSyllabus::getInstance()->fetchAllSyllabus();

        $this->displayViewSyllabus();
    }
    
    public function handleViewUploadSyllabus() {
        
        $arrmixRequestData = $this->getRequestData( [] );
        if( true == isset( $arrmixRequestData['upload_syllabus'] ) ) {
            
            switch( NULL ) {
                default:
                    if( false == isset( $arrmixRequestData['syllabus_name'] ) ) {
                        $this->addErrorMessage( 'Please provide syllabus name.' );
                        break;
                    }
                    
                    if( false == isset( $arrmixRequestData['trade_id'] ) ) {
                        $this->addErrorMessage( 'Please trade for syllabus.' );
                        break;
                    }

                    if( false == isset( $_FILES['syllabus_file'] ) ) {
                        $this->addErrorMessage( 'Please select the syllabus file to upload.' );
                        break;
                    }
                    $strSubPath     = '/uploads/files/' . CFileTypes::SYLLABUS . '/';
                    $strFilePath    = WP_CONTENT_DIR . $strSubPath;
                    $objUploader    =   new Uploader();
                    $objUploader->setExtensions( [ 'pdf' ] );
                    $objUploader->setMaxSize( 2 ); // size in mb.
                    $objUploader->setDir( $strFilePath );
                    
                    if( $objUploader->uploadFile( 'syllabus_file' ) )  {
                        $strFileName  =   $objUploader->getUploadName();
                    }
                    else {
                        $this->addErrorMessage( $objUploader->getMessage() );
                        break;
                    }
                    
                    $arrmixFile = [
                        'file_type_id'      => CFileTypes::SYLLABUS,
                        'file_name'         => $strFileName,
                        'file_path'         => $strSubPath,
                        'is_active'         => true,
                        'uploaded_by'       => $this->objUser->getUserId(),
                        'uploaded_on'       => date('Y-m-d H:i:s' )
                    ];
                    
                    if( false == ( $intFileId = CFiles::getInstance()->insert( $arrmixFile ) ) ) {
                        $this->addErrorMessage( 'Unable to insert into files. Please contact administrator.' );
                        break;
                    }
                    
                    $arrmixSyllabus = [
                        'file_id'   => $intFileId,
                        'trade_id'  => ( int ) $arrmixRequestData['trade_id'],
                        'name'      => sanitize_text_field( $arrmixRequestData['syllabus_name'] )
                    ];
                    
                    if( false == CSyllabus::getInstance()->insert( $arrmixSyllabus ) ) {
                        $this->addErrorMessage( 'Unable to add Syllabus. Please contact administrator.' );
                        break;
                    }
                    
                    $this->addSuccessMessage( 'Syllabus uploaded successfully.' );
            }
            
            
        }
        
        $this->displayViewUploadSyllabus();
    }
    
    public function handleReadSyllabus() {
        
        $intSyllabusId = $this->getRequestData(  ['syllabus_id' ] );
        $this->objSyllabus = CSyllabus::getInstance()->fetchSyllabusById( $intSyllabusId );

        $this->displayReadSyllabus();
    }
    
    public function  displayViewSyllabus() {
        
        $this->arrmixTemplateParams['syllabus']     = $this->arrobjSyllabus;
        $this->arrmixTemplateParams['trades']       = CTrade::getInstance()->fetchAllTrades();
        
        $this->renderPage( 'syllabus/view_syllabus.php' );
    }
    
    public function displayViewUploadSyllabus() {
        
        $this->arrmixTemplateParams['trades']   = CTrade::getInstance()->fetchAllTrades();
        
        $this->renderPage( 'syllabus/view_upload_syllabus.php' );
        
    }
    
    public function displayReadSyllabus() {
        
        $this->arrmixTemplateParams['syllabus']         = $this->objSyllabus;

        $this->renderPage( 'syllabus/read_syllabus.php' );
    }
}

( new CSyllabusManager() )->run();

