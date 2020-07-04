<?php

class CTimeTableManager extends CFactory {
    
    public function __construct() {
        
    }
    
    public function initalize() {
        parent::initalize();
    }
    
    public function execute() {
        
        switch( $this->getPageAction() ) {
            case NULL:
                $this->handleViewTimeTable();
                break;
                
        }
    }
    
    public function handleViewTimeTable() {
        
        $arrmixRequestData = $this->getRequestData( [] );
        
        if( true == isset( $arrmixRequestData['upload_timetable'] ) ) {
            
            switch( NULL ) {
                default:
                    if( false == isset( $_FILES['time_table'] ) ) {
                        $this->addErrorMessage( 'Please select time table file.' );
                        break;
                    }
                    
                    $strSubPath     = '/uploads/files/' . CFileTypes::TIMETABLE . '/';
                    $strFilePath    = WP_CONTENT_DIR . $strSubPath;
                    $objUploader    =   new Uploader();
                    $objUploader->setExtensions( [ 'pdf' ] );
                    $objUploader->setMaxSize( 2 ); // size in mb.
                    $objUploader->setDir( $strFilePath );
                    
                    if( $objUploader->uploadFile( 'time_table' ) )  {
                        $strFileName  =   $objUploader->getUploadName();
                    }
                    else {
                        $this->addErrorMessage( $objUploader->getMessage() );
                        break;
                    }
                    
                    $arrmixFile = [
                        'file_type_id'      => CFileTypes::TIMETABLE,
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
                    
                    if( false == COptions::getInstance()->addOrUpdate( COptions::TIMETABLE,  [ 'url' => $strSubPath . $strFileName, 'name'  => $strFileName ] ) ) {
                        $this->addErrorMessage( 'Unable to upload timetable. Please contact administrator.' );
                        break;
                    }
                    
                    $this->addSuccessMessage( 'TIme table uploaded successfully.'  );
            }
            
        }
        
        $this->displayViewTimeTable();
    }
    
    public function displayViewTimeTable() {

        $this->arrmixTemplateParams['time_table'] = COptions::getInstance()->getOption( COptions::TIMETABLE );
        
        $this->renderPage( 'timetable/view_time_table.php' );
    }
    
}

( new CTimeTableManager() )->run();
