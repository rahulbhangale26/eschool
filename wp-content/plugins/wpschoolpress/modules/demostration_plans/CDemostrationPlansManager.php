<?php

class CDemostrationPlansManager extends CFactory {
    
    protected $arrobjDemostrationPlans;
    
    public function __construct() {
        
    }
    
    public function initalize() {
        parent::initalize();
    }
    
    public function execute() {
        
        switch( $this->getPageAction() ) {
            case NULL:
                $this->handleViewDemostrationPlans();
                break;
                
            case 'view_upload_demostration_plan':
                $this->handleViewUploadDemostrationPlan();
                break;
                
            case 'delete_demostration_plan':
                $this->handleDeleteDemostrationPlan();
                break;
        }
    }
    
    public function handleViewDemostrationPlans() {
        
        if( ( CRole::TEACHER == $this->objUser->getRole() && CDesignations::PRINCIPAL == $this->objUser->getTeacher()->designation_id ) || CRole::ADMIN == $this->objUser->getRole() ) {
            $this->arrobjDemostrationPlans = CDemostrationPlans::getInstance()->fetchAllDemostrationPlans();
        } else {
            $this->arrobjDemostrationPlans = CDemostrationPlans::getInstance()->fetchDemostrationPlansByInstructorId( $this->objUser->getTeacher()->tid );
        }

        $this->displayViewDemostrationPlans();
    }
    
    public function handleViewUploadDemostrationPlan() {
        
        $arrmixRequestData = $this->getRequestData( [] );
        
        if( true == isset( $arrmixRequestData['upload_demonstration_plan'] ) ) {
            
            switch( NULL ) {
                default:
                    if( false == isset( $arrmixRequestData['demonstration_plan_name'] ) ) {
                        $this->addErrorMessage( 'Please provide Demonstration plan name.' );
                        break;
                    }
                    
                    if( false == isset( $_FILES['demonstration_plan_file'] ) ) {
                        $this->addErrorMessage( 'Please select the demonstration plan file to upload.' );
                        break;
                    }
                    
                    $strSubPath     = '/uploads/files/' . CFileTypes::DEMONSTRATION_PLAN . '/';
                    $strFilePath    = WP_CONTENT_DIR . $strSubPath;
                    $objUploader    =   new Uploader();
                    $objUploader->setExtensions( [ 'pdf' ] );
                    $objUploader->setMaxSize( 2 ); // size in mb.
                    $objUploader->setDir( $strFilePath );
                    
                    if( $objUploader->uploadFile( 'demonstration_plan_file' ) )  {
                        $strFileName  =   $objUploader->getUploadName();
                    }
                    else {
                        $this->addErrorMessage( $objUploader->getMessage() );
                        break;
                    }
                    
                    $arrmixFile = [
                        'file_type_id'      => CFileTypes::DEMONSTRATION_PLAN,
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
                    
                    $arrmixDemonstrationPlan = [
                        'name'              => $this->getRequestData( [ 'demonstration_plan_name' ] ),
                        'file_id'           => $intFileId,
                        'instructor_id'     => $this->objUser->getTeacher()->tid,
                        'created_on'        => date( 'Y-m-d H:i:s' )
                    ];
                    
                    if( false == CDemostrationPlans::getInstance()->insert( $arrmixDemonstrationPlan ) ) {
                        $this->addErrorMessage( 'Unable to upload Demonstration Plan.' );
                        break;
                    }
                    
                    $this->addSuccessMessage( 'Demonstration Plan uploaded successfully.' );
            }
            
        }
        
        $this->displayViewUploadDemonstrationPlan();
    }
    
    public function handleDeleteDemostrationPlan() {
        
        $arrmixRequestData = $this->getRequestData( [ 'data' ] );
        
        if( true == isset( $arrmixRequestData['demonstration_plan_id'] ) ) {
            
            if( false == CDemostrationPlans::getInstance()->delete( [ 'id' => $arrmixRequestData['demonstration_plan_id'] ] ) ) {
                echo 'error';
            }
            
            $this->handleViewDemostrationPlans();
        }

    }
    
    public function displayViewDemostrationPlans() {
        
        $this->arrmixTemplateParams['demonstration_plans']     = $this->arrobjDemostrationPlans;
        $this->arrmixTemplateParams['instructors']      = $this->rekeyObjects( 'tid', CTeachers::getInstance()->fetchAllTeachers() );
        
        $this->renderPage( 'demonstration_plan/view_demonstration_plan.php' );
    }
    
    public function displayViewUploadDemonstrationPlan() {
        
        $this->renderPage( 'demonstration_plan/view_upload_demonstration_plan.php' );
    }
    
}

( new CDemostrationPlansManager() )->run();

