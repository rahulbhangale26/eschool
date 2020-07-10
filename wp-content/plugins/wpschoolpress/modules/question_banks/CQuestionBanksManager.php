<?php

class CQuestionBanksManager extends CFactory {
    
    protected $arrobjTrades;
    
    public function __construct() {
        
    }
    
    public function initalize() {
        parent::initalize();
    }
    
    public function execute() {
        
        switch( $this->getPageAction() ) {
            case NULL:
                $this->handleViewQuestionBanks();
                break;
                
            case 'add_question_bank':
                $this->handleAddQuestionBank();
                break;
        }
    }
    
    public function handleViewQuestionBanks() {
        
        $this->displayViewQuestionBanks();
    }
    
    public function handleAddQuestionBank() {
        
        $arrmixRequestData = $this->getRequestData( [] );

        if( true == isset( $arrmixRequestData[ 'upload_question_bank' ] ) ) {
            switch( NULL ) {
                default:
                    
                    if( false == isset( $arrmixRequestData['question_bank_name'] ) ) {
                        $this->addErrorMessage( 'Please provide Question Bank name.' );
                        break;
                    }

                    if( false == isset( $arrmixRequestData['trade_id'] ) || "" == $arrmixRequestData['trade_id'] ) {
                        $this->addErrorMessage( 'Please trade for Question Bank.' );
                        break;
                    }
                    
                    if( false == isset( $_FILES['question_bank_file'] ) || "" == $_FILES['question_bank_file']['name'] ) {
                        $this->addErrorMessage( 'Please select the question bank file to upload.' );
                        break;
                    }
                    
                    $strSubPath     = '/uploads/files/' . CFileTypes::QUESTION_BANKS . '/';
                    $strFilePath    = WP_CONTENT_DIR . $strSubPath;
                    $objUploader    =   new Uploader();
                    $objUploader->setExtensions( [ 'pdf' ] );
                    $objUploader->setMaxSize( 2 ); // size in mb.
                    $objUploader->setDir( $strFilePath );
                    
                    if( $objUploader->uploadFile( 'question_bank_file' ) )  {
                        $strFileName  =   $objUploader->getUploadName();
                    }
                    else {
                        $this->addErrorMessage( $objUploader->getMessage() );
                        break;
                    }
                    
                    $arrmixFile = [
                        'file_type_id'      => CFileTypes::QUESTION_BANKS,
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
                    
                    $arrmixQuestionBank = [
                        'file_id'           => $intFileId,
                        'trade_id'          => $arrmixRequestData['trade_id'],
                        'instructor_id'     => $this->objUser->getTeacher()->tid,
                        'name'              => $arrmixRequestData['question_bank_name']
                    ];
                    
                    if( false == CQuestionBanks::getInstance()->insert( $arrmixQuestionBank ) ) {
                        $this->addErrorMessage( 'Unable to add Question Bank. Please contact administrator.' );
                        break;
                    }
                    
                    $this->addSuccessMessage( 'Question Bank Uploaded Successfully.' );
            }
        }
        
        $this->displayAddQuestionBank();
    }
    
    public function displayViewQuestionBanks() {
        
        $this->arrmixTemplateParams['question_banks']       = CQuestionBanks::getInstance()->fetchAllQuestionBanks();
        $this->arrmixTemplateParams['trades']               = $this->rekeyObjects( 'id', CTrade::getInstance()->fetchAllTrades() );
        $this->renderPage( 'question_banks/view_question_banks.php' );
    }
    
    public function displayAddQuestionBank() {
        
        $this->arrmixTemplateParams['trades']   = CTrade::getInstance()->fetchAllTrades();
        $this->renderPage( 'question_banks/add_question_bank.php' );
    }
}

( new CQuestionBanksManager() )->run();

