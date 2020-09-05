<?php
class CLessonPlanManager extends CFactory {
    
    protected $arrobjLessonPlans;
    protected $arrmixLessonPlan;
    protected $arrobjFiles;
    
    protected $objLessonPlan;
    
    public function __construct() {
        
    }
    
    public function initalize() {
        parent::initalize();
    }
    
    public function execute() {
        
        switch( $this->getPageAction() ) {
            case NULL:
                $this->handleViewLessonPlans();
                break;
                
            case 'view_lesson_plan':
                $this->handleViewLessonPlan();
                break;
                
            case 'view_upload_lesson_plan':
                $this->handleViewUploadLessonPlan();
                break;
                
            case 'edit_lesson_plan':
                $this->handleEditLessonPlan();
                break;
                
            case 'remove_lesson_plan_file':
                $this->handleRemoveLessonPlanFile();
                break;

            case 'view_lesson_plan_template':
                $this->handleViewLessonPlanTemplate();
                break;
                
            case 'delete_lesson_plan':
                $this->handleDeleteLessonPlan();
                break;
        }
    }
    
    public function handleViewLessonPlans() {
        
        if( ( CRole::TEACHER == $this->objUser->getRole() && true == in_array( $this->objUser->getTeacher()->designation_id, [ CDesignations::PRINCIPAL, CDesignations::CLERK ] ) ) || CRole::ADMIN == $this->objUser->getRole() ) {
            $this->arrobjLessonPlans = CLessonPlans::getInstance()->fetchAllLessonPlans();
        } else {
            $this->arrobjLessonPlans = CLessonPlans::getInstance()->fetchLessonPlansByInstructorId( $this->objUser->getTeacher()->tid );
        }
        
        $this->displayViewLessonPlans();
    }
    
    public function handleViewLessonPlan() {
        $intLessonPlanId        = sanitize_text_field( $this->getRequestData( [ 'lesson_plan_id' ] ) );
        $this->objLessonPlan    = CLessonPlans::getInstance()->fetchLessonPlanById( $intLessonPlanId );
        $this->arrobjFiles      = $this->rekeyObjects( 'id', CFiles::getInstance()->fetchFilesByIds( explode( ',', $this->objLessonPlan->file_ids ) ) );
        
        $this->displayViewLessonPlan();
    }
        
    public function handleViewUploadLessonPlan() {
        
        $arrmixRequestData = $this->getRequestData( [] );
        
        if( true == isset( $arrmixRequestData['upload_lesson_plan'] ) ) {
            
            switch( NULL ) {
                default:
                    $this->arrmixLessonPlan = $arrmixRequestData;
                    
                    if( "" == $arrmixRequestData['lesson_plan_name'] ) {
                        $this->addErrorMessage( 'Please provide Lesson plan name.' );
                        break;
                    }
                    
                    if( "" == $arrmixRequestData['lesson_plan_type'] ) {
                        $this->addErrorMessage( 'Please provide Lesson plan format type.' );
                        break;
                    }
                    
                    if( false === ( $strFileIds = $this->uploadLessonPlanFiles() ) ) {
                        break;
                    }

                   $arrmixLessonPlan = [
                        'name'                  => $this->getRequestData( [ 'lesson_plan_name' ] ),
                        'number'                => sanitize_text_field( $this->getRequestData( ['lesson_plan_number'] ) ),
                        'format_type'           => sanitize_text_field( $arrmixRequestData ['lesson_plan_type'] ), 
                        'file_ids'              => $strFileIds,
                        'instructor_id'         => $this->objUser->getTeacher()->tid,
                        'created_on'            => date( 'Y-m-d H:i:s' )
                    ];
                    
                    if( false == CLessonPlans::getInstance()->insert( $arrmixLessonPlan ) ) {
                        $this->addErrorMessage( 'Unable to upload Lesson Plan.' );
                        break;
                    }
                    
                    $this->addSuccessMessage( 'Lesson Plan uploaded successfully.' );
                    $this->handleViewLessonPlans();
                    return true;
            }
   
        }
        
        $this->displayViewUploadLessonPlan();
    }
    
    public function handleEditLessonPlan() {
        
        $intLessonPlanId        = sanitize_text_field( $this->getRequestData( [ 'lesson_plan_id' ] ) );
        $arrmixRequestData      = $this->getRequestData( [] );
        $this->objLessonPlan    = CLessonPlans::getInstance()->fetchLessonPlanById( $intLessonPlanId );
        
        if( true == isset( $arrmixRequestData['upload_lesson_plan'] ) ) {
            
            switch( NULL ) {
                default:
                    $this->arrmixLessonPlan = $arrmixRequestData;
                    
                    if( "" == $arrmixRequestData['lesson_plan_name'] ) {
                        $this->addErrorMessage( 'Please provide Lesson plan name.' );
                        break;
                    }
                    
                    if( false === ( $strFileIds = $this->uploadLessonPlanFiles() ) ) {
                        break;
                    }
                    
                    if( 'image' == $this->objLessonPlan->format_type ) {
                        $strFileIds = $this->objLessonPlan->file_ids . ',' . $strFileIds;
                    }
                    
                    $strFileIds = implode(',', array_filter( explode( ',', $strFileIds ) ) );
                    
                    $arrmixLessonPlan = [
                        'name'                  => $this->getRequestData( [ 'lesson_plan_name' ] ),
                        'number'                => sanitize_text_field( $this->getRequestData( ['lesson_plan_number'] ) ),
                        'file_ids'              => $strFileIds
                    ];
                    
                    $this->objLessonPlan->file_ids = $strFileIds;
                    
                    if( false === CLessonPlans::getInstance()->update( $arrmixLessonPlan, [ 'id' => $this->objLessonPlan->id ] ) ) {
                        $this->addErrorMessage( 'Unable to update Lesson Plan.' );
                        break;
                    }
                    
                    $this->addSuccessMessage( 'Lesson Plan updated successfully.' );
            }
            
        }
        
        
        $this->arrobjFiles      = $this->rekeyObjects( 'id', CFiles::getInstance()->fetchFilesByIds( explode( ',', $this->objLessonPlan->file_ids ) ) );

        $this->displayEditLessonPlan();
    }
    
    public function handleRemoveLessonPlanFile() {
        $intLessonPlanId        = sanitize_text_field( $this->getRequestData( [ 'data', 'lesson_plan_id' ] ) );
        $intFileId              = sanitize_text_field( $this->getRequestData( [ 'data', 'file_id' ] ) );
        $this->objLessonPlan    = CLessonPlans::getInstance()->fetchLessonPlanById( $intLessonPlanId );
        
        $arrintFileIds = explode( ',',  $this->objLessonPlan->file_ids );

        if( true == is_array( $arrintFileIds ) && false  !== $intKey = array_search( $intFileId, $arrintFileIds ) ) {
            unset( $arrintFileIds[$intKey] );
            $this->objLessonPlan->file_ids = implode( ',', $arrintFileIds );
        }
        
        if( false === CLessonPlans::getInstance()->update( [ 'file_ids' => $this->objLessonPlan->file_ids ], [ 'id' => $this->objLessonPlan->id ] ) ) {
            $this->arrstrJsonRespose = ['status' => false, 'message' => 'Unable to remove file.' ];
            $this->displayJson();
            return false;
        }
        
        $this->arrstrJsonRespose = ['status' => true, 'message' => 'File removed successfully.' ];
        $this->displayJson();
        return true;
    }
    
    public function handleViewLessonPlanTemplate() {
        
        $this->displayViewLessonPlanTemplate();
    }
    
    public function handleDeleteLessonPlan() {
        
        $arrmixRequestData = $this->getRequestData( [ 'data' ] );
        
        if( true == isset( $arrmixRequestData['lesson_plan_id'] ) ) {
            
            if( false == CLessonPlans::getInstance()->delete( [ 'id' => $arrmixRequestData['lesson_plan_id'] ] ) ) {
                echo 'error';
                exit;
            }
           
            $this->handleViewLessonPlan();
        }
    }
    
    public function displayViewLessonPlans() {
        
        $this->arrmixTemplateParams['lesson_plans']     = $this->arrobjLessonPlans;
        $this->arrmixTemplateParams['instructors']      = $this->rekeyObjects( 'tid', CTeachers::getInstance()->fetchAllTeachers() );
        
        $this->renderPage( 'lesson_plan/view_lesson_plans.php' );
    }
    
    public function displayViewLessonPlan() {
        
        $this->arrmixTemplateParams['lesson_plan']      = $this->objLessonPlan;
        $this->arrmixTemplateParams['files']            = $this->arrobjFiles;
        
        $this->renderPage( 'lesson_plan/view_lesson_plan.php' );
        
    }
    
    public function displayViewUploadLessonPlan() {
        global $wpsp_settings_data;
        $this->arrmixTemplateParams['iti_name']         = isset( $wpsp_settings_data['sch_name'] ) && !empty( $wpsp_settings_data['sch_name'] ) ? $wpsp_settings_data['sch_name'] : __( 'ITIMS','WPSchoolPress' );
        $this->arrmixTemplateParams['trade']            = CTrade::getInstance()->fetchTradeById( $this->getSessionData( [ 'filter', 'trade_id' ] ) );
        $this->arrmixTemplateParams['lesson_plan']      = $this->arrmixLessonPlan;
        
        $this->renderPage( 'lesson_plan/view_upload_lesson_plan.php' );
    }

    public function displayViewLessonPlanTemplate() {
        global $wpsp_settings_data;
        
        $this->arrmixTemplateParams['iti_name']         = isset( $wpsp_settings_data['sch_name'] ) && !empty( $wpsp_settings_data['sch_name'] ) ? $wpsp_settings_data['sch_name'] : __( 'ITIMS','WPSchoolPress' );
        $this->arrmixTemplateParams['lesson_plans']     = $this->arrobjLessonPlans;
        $this->arrmixTemplateParams['instructors']      = $this->rekeyObjects( 'tid', CTeachers::getInstance()->fetchAllTeachers() );
        
        $this->renderPage( 'lesson_plan/view_lesson_plan_template.php' );
    }
    
    public function displayEditLessonPlan() {
        global $wpsp_settings_data;

        $this->arrmixTemplateParams['iti_name']         = isset( $wpsp_settings_data['sch_name'] ) && !empty( $wpsp_settings_data['sch_name'] ) ? $wpsp_settings_data['sch_name'] : __( 'ITIMS','WPSchoolPress' );
        $this->arrmixTemplateParams['lesson_plan']          = $this->objLessonPlan;
        $this->arrmixTemplateParams['lesson_plan_files']    = $this->arrobjFiles;
        
        $this->renderPage( 'lesson_plan/edit_lesson_plan.php' );
    }
    
    /**
     * Other Functions.
     */
    
    public function uploadLessonPlanFiles() {
        $arrmixRequestData  = $this->getRequestData( [] );
        $objUploader        =   new Uploader();
        $strSubPath         = '/uploads/files/' . CFileTypes::LESSON_PLAN . '/' . $arrmixRequestData['lesson_plan_type'] . '/';
        $strFilePath        = WP_CONTENT_DIR . $strSubPath;
        $objUploader->setMaxSize( 2 ); // size in mb.
        
        
        switch( $arrmixRequestData['lesson_plan_type'] ) {
            case 'pdf':
                $objUploader->setExtensions( [ 'pdf' ] );
                $objUploader->setDir( $strFilePath );
                
                if( $objUploader->uploadFile( 'lesson_plan_file_1' ) )  {
                    $strFileName  =   $objUploader->getUploadName();
                }
                else {
                    $this->addErrorMessage( $objUploader->getMessage() );
                    return false;
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
                    return false;
                }

                return $intFileId;
                break;

            case 'image':
                $arrintFileIds = [];
                $objUploader->setExtensions( [ 'jpg', 'jpeg', 'png' ] );
                $objUploader->setDir( $strFilePath );

                if( 0 == count( $_FILES ) ) return '';
                
                foreach( $_FILES AS $strKey => $arrmixFile ) {             
                    if( $objUploader->uploadFile( $strKey ) )  {
                        $strFileName  =   $objUploader->getUploadName();
                    }
                    else {
                        $this->addErrorMessage( $objUploader->getMessage() );
                        return false;
                    }
                    
                    $arrmixFile = [
                        'file_type_id'      => CFileTypes::LESSON_PLAN,
                        'file_name'         => $strFileName,
                        'file_path'         => $strSubPath,
                        'is_active'         => true,
                        'uploaded_by'       => $this->objUser->getUserId(),
                        'uploaded_on'       => date('Y-m-d H:i:s' )
                    ];
                    
                    if( false == ( $arrintFileIds[] = CFiles::getInstance()->insert( $arrmixFile ) ) ) {
                        $this->addErrorMessage( 'Unable to insert into files. Please contact administrator.' );
                        return false;
                    }
                }
                
                return ( 0 < count( $arrintFileIds ) ) ? implode( ',', $arrintFileIds ) : '';
                break;
                
            case 'custom':
                $objFile    = new CFileIO();
                $intIndex   = 1;
                
                $objFile->setDir( $strFilePath );
                
                foreach( $arrmixRequestData AS $strKey => $arrmixValue ) {
                    if( false !== strpos( $strKey, 'lesson_plan_custom_' ) ) {
                        $arrstrCustomLessonPlans[$strKey] = $arrmixValue;
                    }
                }
                
                foreach ( $arrstrCustomLessonPlans AS $strKey => $strContent ) {
                    $strFileName = randomString( 15 ) . '-' . time() . '.html';
                    
                    if( false === $objFile->write( $strContent, $strFileName ) ) {
                        $this->addErrorMessage( implode( ',', $objFile->getErrorMsgs() ) );
                        return false;
                    }
                    
                    $arrmixFile = [
                        'file_type_id'      => CFileTypes::LESSON_PLAN,
                        'file_name'         => $strFileName,
                        'file_path'         => $strSubPath,
                        'is_active'         => true,
                        'uploaded_by'       => $this->objUser->getUserId(),
                        'uploaded_on'       => date('Y-m-d H:i:s' )
                    ];
                    
                    if( false == ( $arrintFileIds[] = CFiles::getInstance()->insert( $arrmixFile ) ) ) {
                        $this->addErrorMessage( 'Unable to insert into files. Please contact administrator.' );
                        return false;
                    }
                    
                    $intIndex++;
                }
                
                return ( 0 < count( $arrintFileIds ) ) ? implode( ',', $arrintFileIds ) : '';
                break;
                
        }
        
    }
    
}

( new CLessonPlanManager() )->run();

