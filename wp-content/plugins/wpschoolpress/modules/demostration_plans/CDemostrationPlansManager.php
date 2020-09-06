<?php

class CDemostrationPlansManager extends CFactory {
    
    protected $arrobjFiles;
    protected $arrobjDemostrationPlans;
    protected $arrmixDemonstrationPlan;
    
    protected $objDemostrationPlan;
    
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
                
            case 'view_demostration_plan':
                $this->handleViewDemostrationPlan();
                break;
                               
            case 'view_upload_demostration_plan':
                $this->handleViewUploadDemostrationPlan();
                break;
                
            case 'view_demostration_plan_template':
                $this->handleViewDemostrationPlanTemplate();
                break;
                
            case 'edit_demostration_plan':
                $this->handleEditDemostrationPlan();
                break;
                
            case 'remove_demostration_plan_file':
                $this->handleRemoveDemostrationPlanFile();
                break;
                
            case 'delete_demostration_plan':
                $this->handleDeleteDemostrationPlan();
                break;
        }
    }
    
    public function handleViewDemostrationPlans() {
        
        if( ( CRole::TEACHER == $this->objUser->getRole() && true == in_array( $this->objUser->getTeacher()->designation_id, [ CDesignations::PRINCIPAL, CDesignations::CLERK ] ) ) || CRole::ADMIN == $this->objUser->getRole() ) {
            $this->arrobjDemostrationPlans = CDemostrationPlans::getInstance()->fetchAllDemostrationPlans();
        } else {
            $this->arrobjDemostrationPlans = CDemostrationPlans::getInstance()->fetchDemostrationPlansByInstructorId( $this->objUser->getTeacher()->tid );
        }

        $this->displayViewDemostrationPlans();
    }
    
    public function handleViewDemostrationPlan() {
        $this->objDemostrationPlan  = CDemostrationPlans::getInstance()->fetchDemostrationPlanById( sanitize_text_field( $this->getRequestData( [ 'demostration_plan_id' ] ) ) );
        $arrintFileIds              = explode( ',', $this->objDemostrationPlan->file_ids );
        $this->arrobjFiles          = CFiles::getInstance()->fetchFilesByIds( $arrintFileIds );
        
        $this->displayViewDemostrationPlan();
    }
    
    public function handleViewUploadDemostrationPlan() {
        
        $arrmixRequestData = $this->getRequestData( [] );
        if( true == isset( $arrmixRequestData['upload_demonstration_plan'] ) ) {
            
            switch( NULL ) {
                default:
                    $this->arrmixDemonstrationPlan = $arrmixRequestData;
                    
                    if( false == isset( $arrmixRequestData['demostration_plan_name'] ) ) {
                        $this->addErrorMessage( 'Please provide Demonstration plan name.' );
                        break;
                    }
                    
                    
                    if( "" == $arrmixRequestData['demostration_plan_type'] ) {
                        $this->addErrorMessage( 'Please provide Demostration plan format type.' );
                        break;
                    }
                    
                    if( false === ( $strFileIds = $this->uploadDemostrationPlanFiles() ) ) {
                        break;
                    }
                    
                    $arrmixDemostrationPlan = [
                        'name'                  => $this->getRequestData( [ 'demostration_plan_name' ] ),
                        'number'                => sanitize_text_field( $this->getRequestData( ['demostration_plan_number'] ) ),
                        'format_type'           => sanitize_text_field( $arrmixRequestData ['demostration_plan_type'] ),
                        'file_ids'              => $strFileIds,
                        'instructor_id'         => $this->objUser->getTeacher()->tid,
                        'created_on'            => date( 'Y-m-d H:i:s' )
                    ];
                    
                    if( false == CDemostrationPlans::getInstance()->insert( $arrmixDemostrationPlan ) ) {
                        $this->addErrorMessage( 'Unable to upload Demostration Plan.' );
                        break;
                    }
                    
                    $this->addSuccessMessage( 'Demostration Plan uploaded successfully.' );
                    $this->handleViewDemostrationPlans();
                    return true;
            }
            
        }
        
        $this->displayViewUploadDemonstrationPlan();
    }
    
    public function handleViewDemostrationPlanTemplate() {
        
        $this->displayViewDemostrationPlanTemplate();
    }
    
    public function handleEditDemostrationPlan() {
        
        $this->objDemostrationPlan  = CDemostrationPlans::getInstance()->fetchDemostrationPlanById( sanitize_text_field( $this->getRequestData( ['demostration_plan_id'] ) ) );
        $arrmixRequestData          = $this->getRequestData( [] );
        
        if( true == isset( $arrmixRequestData['upload_demonstration_plan'] ) ) {
            
            switch( NULL ) {
                default:
                    $this->arrmixDemonstrationPlan = $arrmixRequestData;
                    
                    if( "" == $arrmixRequestData['demostration_plan_name'] ) {
                        $this->addErrorMessage( 'Please provide Lesson plan name.' );
                        break;
                    }
                    
                    if( false === ( $strFileIds = $this->uploadDemostrationPlanFiles() ) ) {
                        break;
                    }
                    
                    if( 'image' == $this->objDemostrationPlan->format_type ) {
                        $strFileIds = $this->objDemostrationPlan->file_ids . ',' . $strFileIds;
                    }
                    
                    $strFileIds = implode(',', array_filter( explode( ',', $strFileIds ) ) );
                    
                    $arrmixDemonstrationPlan = [
                        'name'                  => $this->getRequestData( [ 'demostration_plan_name' ] ),
                        'number'                => sanitize_text_field( $this->getRequestData( ['demostration_plan_number'] ) ),
                        'file_ids'              => $strFileIds
                    ];
                    
                    $this->objDemostrationPlan->file_ids = $strFileIds;
                    
                    if( false === CDemostrationPlans::getInstance()->update( $arrmixDemonstrationPlan, [ 'id' => $this->objDemostrationPlan->id ] ) ) {
                        $this->addErrorMessage( 'Unable to update Lesson Plan.' );
                        break;
                    }
                    
                    $this->addSuccessMessage( 'Demostration Plan updated successfully.' );
            }
            
        }
        
        $this->arrobjFiles          = CFiles::getInstance()->fetchFilesByIds( explode( ',', $this->objDemostrationPlan->file_ids ) );
        
        $this->displayEditDemostrationPlan();
    }
    
    public function handleRemoveDemostrationPlanFile() {
        $intDpId                = sanitize_text_field( $this->getRequestData( [ 'data', 'demostration_plan_id' ] ) );
        $intFileId              = sanitize_text_field( $this->getRequestData( [ 'data', 'file_id' ] ) );
        $this->objDemostrationPlan    = CDemostrationPlans::getInstance()->fetchDemostrationPlanById( $intDpId );
        
        $arrintFileIds = explode( ',',  $this->objDemostrationPlan->file_ids );
        
        if( true == is_array( $arrintFileIds ) && false  !== $intKey = array_search( $intFileId, $arrintFileIds ) ) {
            unset( $arrintFileIds[$intKey] );
            $this->objDemostrationPlan->file_ids = implode( ',', $arrintFileIds );
        }
        
        if( false === CDemostrationPlans::getInstance()->update( [ 'file_ids' => $this->objDemostrationPlan->file_ids ], [ 'id' => $this->objDemostrationPlan->id ] ) ) {
            $this->arrstrJsonRespose = ['status' => false, 'message' => 'Unable to remove file.' ];
            $this->displayJson();
            return false;
        }
        
        $this->arrstrJsonRespose = ['status' => true, 'message' => 'File removed successfully.' ];
        $this->displayJson();
        return true;
    }
    
    public function handleDeleteDemostrationPlan() {
        
        $arrmixRequestData = $this->getRequestData( [ 'data' ] );
        
        if( true == isset( $arrmixRequestData['demonstration_plan_id'] ) ) {
            
            if( false == CDemostrationPlans::getInstance()->delete( [ 'id' => $arrmixRequestData['demonstration_plan_id'] ] ) ) {
                echo 'error';
                exit;
            }
            
            $this->handleViewDemostrationPlans();
        }

    }
    
    public function displayViewDemostrationPlans() {
        
        $this->arrmixTemplateParams['demonstration_plans']     = $this->arrobjDemostrationPlans;
        $this->arrmixTemplateParams['instructors']      = $this->rekeyObjects( 'tid', CTeachers::getInstance()->fetchAllTeachers() );
        
        $this->renderPage( 'demonstration_plan/view_demonstration_plans.php' );
    }
    
    public function displayViewDemostrationPlan() {
        $this->arrmixTemplateParams['dp']       = $this->objDemostrationPlan;
        $this->arrmixTemplateParams['dp_files'] = $this->arrobjFiles;
        
        $this->renderPage( 'demonstration_plan/view_demostration_plan.php' );
    }
    
    public function displayViewDemostrationPlanTemplate() {

        
        $this->renderPage( 'demonstration_plan/view_demostration_plan_template.php' );
    }
    
    public function displayEditDemostrationPlan() {
        
        $this->arrmixTemplateParams['dp']           = $this->objDemostrationPlan;
        $this->arrmixTemplateParams['dp_files']     = $this->arrobjFiles;
        
        $this->renderPage( 'demonstration_plan/edit_demostration_plan.php' );
    }
    
    public function displayViewUploadDemonstrationPlan() {
        $this->arrmixTemplateParams['demonstration_plan'] = $this->arrmixDemonstrationPlan;
        
        $this->renderPage( 'demonstration_plan/view_upload_demonstration_plan.php' );
    }
    
    /**
     * Other Functions.
     */
    
    public function uploadDemostrationPlanFiles() {
        $arrmixRequestData  = $this->getRequestData( [] );
        $objUploader        =   new Uploader();
        $strSubPath         = '/uploads/files/' . CFileTypes::DEMONSTRATION_PLAN . '/' . $arrmixRequestData['demostration_plan_type'] . '/';
        $strFilePath        = WP_CONTENT_DIR . $strSubPath;
        $objUploader->setMaxSize( 2 ); // size in mb.
        
        
        switch( $arrmixRequestData['demostration_plan_type'] ) {
            case 'pdf':
                $objUploader->setExtensions( [ 'pdf' ] );
                $objUploader->setDir( $strFilePath );
                
                if( $objUploader->uploadFile( 'demostration_plan_file_1' ) )  {
                    $strFileName  =   $objUploader->getUploadName();
                }
                else {
                    $this->addErrorMessage( $objUploader->getMessage() );
                    return false;
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
                        'file_type_id'      => CFileTypes::DEMONSTRATION_PLAN,
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
                    if( false !== strpos( $strKey, 'demostration_plan_custom_' ) ) {
                        $arrstrCustomDemostrationPlans[$strKey] = $arrmixValue;
                    }
                }
                
                foreach ( $arrstrCustomDemostrationPlans AS $strKey => $strContent ) {
                    $strFileName = randomString( 15 ) . '-' . time() . '.html';
                    
                    if( false === $objFile->write( $strContent, $strFileName ) ) {
                        $this->addErrorMessage( implode( ',', $objFile->getErrorMsgs() ) );
                        return false;
                    }
                    
                    $arrmixFile = [
                        'file_type_id'      => CFileTypes::DEMONSTRATION_PLAN,
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

( new CDemostrationPlansManager() )->run();

