<?php

class CQuestionBanksManager extends CFactory {
    
    protected $arrobjSubjects;
    protected $arrobjQuestionBanks;

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
                
            case 'delete_question_bank':
                $this->handleDeleteQuestionBank();
                break;
        }
    }
    
    public function handleViewQuestionBanks() {
    	if(  CRole::ADMIN == $this->objUser->getRole() || ( CRole::TEACHER == $this->objUser->getRole() && true == in_array( $this->objUser->getTeacher()->designation_id, [ CDesignations::PRINCIPAL, CDesignations::CLERK ] ) ) ) {
    		$this->arrobjQuestionBanks = CQuestionBanks::getInstance()->fetchQuestionBanksByUnitId( $this->getSessionData( [ 'filter', 'unit_id' ] ) );
    	} else if( CRole::TEACHER == $this->objUser->getRole() )  {
    		$this->arrobjQuestionBanks = CQuestionBanks::getInstance()->fetchQuestionBanksByInstructorId( $this->objUser->getTeacher()->tid );
    	} else if( CRole::STUDENT == $this->objUser->getRole() ) {
    		$this->arrobjQuestionBanks = CQuestionBanks::getInstance()->fetchQuestionBanksByUnitId( $this->getSessionData( [ 'filter', 'unit_id' ] ) );
    	}
    	
        $this->displayViewQuestionBanks();
    }
    
    public function handleAddQuestionBank() {
        
        $arrmixRequestData = $this->getRequestData( [] );

        if( true == isset( $arrmixRequestData[ 'upload_question_bank' ] ) ) {
            switch( NULL ) {
                default:
                	if( false == isset( $arrmixRequestData['question_bank_name'] ) && "" == $arrmixRequestData['question_bank_name']  ) {
                        $this->addErrorMessage( 'Please provide Question Bank name.' );
                        break;
                    }

                    if( false == isset( $arrmixRequestData['subject_id'] ) || "" == $arrmixRequestData['subject_id'] ) {
                        $this->addErrorMessage( 'Please select subject for Question Bank.' );
                        break;
                    }
                    
                    if( false == isset( $_FILES['question_bank_file'] ) || "" == $_FILES['question_bank_file']['name'] ) {
                        $this->addErrorMessage( 'Please select the question bank file to upload.' );
                        break;
                    }
                    
                    $strSubPath     = '/uploads/files/' . CFileTypes::QUESTION_BANKS . '/';
                    $strFilePath    = WP_CONTENT_DIR . $strSubPath;
                    $objUploader    =   new Uploader();
                    $objUploader->setExtensions( [ 'pdf', 'jpeg', 'png', 'jpg' ] );
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
                        'subject_id'        => $arrmixRequestData['subject_id'],
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
        
        if(  CRole::ADMIN == $this->objUser->getRole() || ( CRole::TEACHER == $this->objUser->getRole() && true == in_array( $this->objUser->getTeacher()->designation_id, [ CDesignations::PRINCIPAL, CDesignations::CLERK ] ) ) ) {
	        $this->arrobjSubjects = CSubjects::getInstance()->fetchSubjectsByUnitId( $this->getSessionData( [ 'filter', 'unit_id' ] ), $this->objUser->getTeacher()->tid );
        } else {
        	$this->arrobjSubjects = CSubjects::getInstance()->fetchSubjectsByUnitIdByInstructorId( $this->getSessionData( [ 'filter', 'unit_id' ] ), $this->objUser->getTeacher()->tid );
        }
        
        $this->displayAddQuestionBank();
    }
    
    public function handleDeleteQuestionBank() {
        if( true == is_null( $this->getRequestData( [ 'data', 'question_bank_id' ] ) ) ) {
            echo 'error';
            exit;
        }
        
        if( false == CQuestionBanks::getInstance()->delete( [ 'id' => ( int ) $this->getRequestData( [ 'data', 'question_bank_id' ] ) ] ) ) {
            echo 'error';
            exit;
        }
        
        $this->handleViewQuestionBanks();
    }
    
    public function displayViewQuestionBanks() {
        
        $this->arrmixTemplateParams['question_banks']       = $this->arrobjQuestionBanks;
        $this->arrmixTemplateParams['subjects']             = $this->rekeyObjects( 'id', CSubjects::getInstance()->fetchSubjectsByUnitId( $this->getSessionData( [ 'filter', 'unit_id' ] ) ) );
        $this->renderPage( 'question_banks/view_question_banks.php' );
    }
    
    public function displayAddQuestionBank() {
        
    	$this->arrmixTemplateParams['subjects']   = $this->arrobjSubjects;

        $this->renderPage( 'question_banks/add_question_bank.php' );
    }
}

( new CQuestionBanksManager() )->run();

