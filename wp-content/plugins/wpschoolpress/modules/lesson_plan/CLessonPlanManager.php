<?php

class CLessonPlanManager extends CFactory {
    
    protected $arrobjLessonPlans;
    
    public function __construct() {
        
    }
    
    public function initalize() {
        parent::initalize();
    }
    
    public function execute() {
        
        switch( $this->getPageAction() ) {
            case NULL:
                $this->handleViewLessonPlan();
                break;
                
            case 'view_upload_lesson_plan':
                $this->handleViewUploadLessonPlan();
                break;
                
            case 'delete_lesson_plan':
                $this->handleDeleteLessonPlan();
                break;
        }
    }
    
    public function handleViewLessonPlan() {
        
        if( ( CRole::TEACHER == $this->objUser->getRole() && true == in_array( $this->objUser->getTeacher()->designation_id, [ CDesignations::PRINCIPAL, CDesignations::CLERK ] ) ) || CRole::ADMIN == $this->objUser->getRole() ) {
            $this->arrobjLessonPlans = CLessonPlans::getInstance()->fetchAllLessonPlans();
        } else {
            $this->arrobjLessonPlans = CLessonPlans::getInstance()->fetchLessonPlansByInstructorId( $this->objUser->getTeacher()->tid );
        }
        
        $this->displayViewLessonPlan();
    }
    
    public function handleViewUploadLessonPlan() {
        
        $arrmixRequestData = $this->getRequestData( [] );
        
        if( true == isset( $arrmixRequestData['upload_lesson_plan'] ) ) {
            
            switch( NULL ) {
                default:
                    if( false == isset( $arrmixRequestData['lesson_plan_name'] ) ) {
                        $this->addErrorMessage( 'Please provide Lesson plan name.' );
                        break;
                    }
                    
                    if( false == isset( $_FILES['lesson_plan_file'] ) ) {
                        $this->addErrorMessage( 'Please select the lesson plan file to upload.' );
                        break;
                    }
                    
                    $strSubPath     = '/uploads/files/' . CFileTypes::LESSON_PLAN . '/';
                    $strFilePath    = WP_CONTENT_DIR . $strSubPath;
                    $objUploader    =   new Uploader();
                    $objUploader->setExtensions( [ 'pdf' ] );
                    $objUploader->setMaxSize( 2 ); // size in mb.
                    $objUploader->setDir( $strFilePath );
                    
                    if( $objUploader->uploadFile( 'lesson_plan_file' ) )  {
                        $strFileName  =   $objUploader->getUploadName();
                    }
                    else {
                        $this->addErrorMessage( $objUploader->getMessage() );
                        break;
                    }
                    
                    $arrmixFile = [
                        'file_type_id'      => CFileTypes::LESSON_PLAN,
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
                    
                    $arrmixLessonPlan = [
                        'name'              => $this->getRequestData( [ 'lesson_plan_name' ] ),
                        'file_id'           => $intFileId,
                        'instructor_id'     => $this->objUser->getTeacher()->tid,
                        'created_on'        => date( 'Y-m-d H:i:s' )
                    ];
                    
                    if( false == CLessonPlans::getInstance()->insert( $arrmixLessonPlan ) ) {
                        $this->addErrorMessage( 'Unable to upload Lesson Plan.' );
                        break;
                    }
                    
                    $this->addSuccessMessage( 'Lesson Plan uploaded successfully.' );       
            }
            
        }
        
        $this->displayViewUploadLessonPlan();
    }
    
    public function handleDeleteLessonPlan() {
        
        $arrmixRequestData = $this->getRequestData( [ 'data' ] );
        
        if( true == isset( $arrmixRequestData['lesson_plan_id'] ) ) {
            
            if( false == CLessonPlans::getInstance()->delete( [ 'id' => $arrmixRequestData['lesson_plan_id'] ] ) ) {
                echo 'error';
            }
           
            $this->handleViewLessonPlan();
        }
    }
    
    public function displayViewLessonPlan() {
        
        $this->arrmixTemplateParams['lesson_plans']     = $this->arrobjLessonPlans;
        $this->arrmixTemplateParams['instructors']      = $this->rekeyObjects( 'tid', CTeachers::getInstance()->fetchAllTeachers() );
        
        $this->renderPage( 'lesson_plan/view_lesson_plan.php' );
    }
    
    public function displayViewUploadLessonPlan() {
        
        $this->renderPage( 'lesson_plan/view_upload_lesson_plan.php' );
    }
       
}

( new CLessonPlanManager() )->run();

