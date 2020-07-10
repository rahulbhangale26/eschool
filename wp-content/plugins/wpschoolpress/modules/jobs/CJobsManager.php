<?php

class CJobsManager extends CFactory {
    
    protected $arrobjJobs;
    protected $arrobjJobOperationalSkills;
    
    protected $intTotalMarks;
    
    protected $objJob;
    
    public function __construct() {
        
    }
    
    public function initalize() {
        parent::initalize();
    }
    
    public function execute() {
        
        switch( $this->getPageAction() ) {
            case NULL:
                $this->handleViewJobs();
                break;
                
            case 'view_add_job_form':
                $this->handleViewAddJobForm();
                break;
                
            case 'edit_job':
                $this->handleEditJob();
                break;
                
            case 'view_evaluation_sheet':
                $this->handleViewEvaluationSheet();
                break;
        }
    }
    
    public function handleViewJobs() {
        
        if( ( CRole::TEACHER == $this->objUser->getRole() && true == in_array( $this->objUser->getTeacher()->designation_id, [ CDesignations::PRINCIPAL, CDesignations::CLERK ] ) ) || CRole::ADMIN == $this->objUser->getRole() ) {
            $this->arrobjJobs = CJobs::getInstance()->fetchAllJobs();
        } else {
            $this->arrobjJobs = CJobs::getInstance()->fetchJobsByInstructorId( $this->objUser->getTeacher()->tid );
        }
        
        $this->displayViewJobs();
    }
    
    public function handleViewAddJobForm() {
        
        $arrmixRequestData = $this->getRequestData( [] );

        if( true == isset( $arrmixRequestData[ 'add_job' ] ) ) {
            
            switch ( NULL ) {
                default:
                    
                    if( false == isset( $arrmixRequestData['title'] ) || "" == $arrmixRequestData['title'] ) {
                        $this->addErrorMessage( 'Job Title is required.' );
                        break;
                    }
                    
                    if( false == isset( $arrmixRequestData['time_given'] ) || "" == $arrmixRequestData['time_given'] ) {
                        $this->addErrorMessage( 'Please provide the time given.' );
                        break;
                    }
                    
                    if( false == isset( $arrmixRequestData['start_date'] ) || "" == $arrmixRequestData['start_date'] ) {
                        $this->addErrorMessage( 'Please provide the start date.' );
                        break;
                    }
                    
                    if( false == isset( $arrmixRequestData['end_date'] ) || "" == $arrmixRequestData['end_date'] ) {
                        $this->addErrorMessage( 'Please provide the end date.' );
                        break;
                    }

                    if( false == isset( $_FILES['job_diagram_file']['name'] ) || "" == $_FILES['job_diagram_file']['name'] ) {
                        $this->addErrorMessage( 'Please select job diagram file.' );
                        break;
                    }
                    
                    $strSubPath     = '/uploads/files/' . CFileTypes::JOB_DIAGRAM . '/';
                    $strFilePath    = WP_CONTENT_DIR . $strSubPath;
                    $objUploader    =   new Uploader();
                    $objUploader->setExtensions( [ 'jpg', 'png', 'jpeg' ] );
                    $objUploader->setMaxSize( 2 ); // size in mb.
                    $objUploader->setDir( $strFilePath );
                    
                    if( $objUploader->uploadFile( 'job_diagram_file' ) )  {
                        $strFileName  =   $objUploader->getUploadName();
                    }
                    else {
                        $this->addErrorMessage( $objUploader->getMessage() );
                        break;
                    }
                    
                    $arrmixFile = [
                        'file_type_id'      => CFileTypes::JOB_DIAGRAM,
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
                    
                    $arrmixJob = [
                        'file_id'           => $intFileId,
                        'instructor_id'     => $this->objUser->getTeacher()->tid,
                        'title'             => $arrmixRequestData['title'],
                        'description'       => $arrmixRequestData['description'],
                        'start_date'        => date( 'Y-m-d H:i:s', strtotime( $arrmixRequestData['start_date'] ) ),
                        'end_date'          => date( 'Y-m-d H:i:s', strtotime( $arrmixRequestData['end_date'] ) ),
                        'time_given'        => $arrmixRequestData['time_given'],
                        'tolerance'         => $arrmixRequestData['tolerance'],
                        'material'          => $arrmixRequestData['material']
                    ];
                    
                    if( false == ( $intJobId = CJobs::getInstance()->insert( $arrmixJob ) ) ) {
                        $this->addErrorMessage( 'Unable to insert Job. Unexpected error occured. Please contact administrator.' );
                        break;
                    }
                    
                    foreach( $arrmixRequestData['skill_name'] AS $intIndex => $strSkill ) {
                        $arrmixSkill = [
                            'job_id'        => $intJobId,
                            'name'          => $strSkill,
                            'marks'         => ( true == isset( $arrmixRequestData['marks'] ) && true == isset(  $arrmixRequestData['marks'][$intIndex] ) ) ? $arrmixRequestData['marks'][$intIndex] : 0
                        ];
                        
                        if( false == CJobOperationalSkills::getInstance()->insert( $arrmixSkill ) ) {
                            $this->addErrorMessage( 'Unable to insert Job Operation Skills. Unexpected error occured. Please contact administrator.' );
                            break;
                        }
                    }
                    
                    $this->addSuccessMessage( 'Job added successfully.' );
            }
            
        }
        
        $this->displayViewAddJobForm();
    }
    
    public function handleEditJob() {
        
        $arrmixRequestData = $this->getRequestData( [] );
        
        if( true == isset( $arrmixRequestData['edit_job'] ) ) {
            $boolIsFileUpdate = false;
            
            switch( NULL ) {
                default:
                    if( false == isset( $arrmixRequestData['title'] ) || "" == $arrmixRequestData['title'] ) {
                        $this->addErrorMessage( 'Job Title is required.' );
                        break;
                    }
                    
                    if( false == isset( $arrmixRequestData['time_given'] ) || "" == $arrmixRequestData['time_given'] ) {
                        $this->addErrorMessage( 'Please provide the time given.' );
                        break;
                    }
                    
                    if( false == isset( $arrmixRequestData['start_date'] ) || "" == $arrmixRequestData['start_date'] ) {
                        $this->addErrorMessage( 'Please provide the start date.' );
                        break;
                    }
                    
                    if( false == isset( $arrmixRequestData['end_date'] ) || "" == $arrmixRequestData['end_date'] ) {
                        $this->addErrorMessage( 'Please provide the end date.' );
                        break;
                    }
                    
                    
                    if( "" != $_FILES['job_diagram_file']['name'] ) {
                        $strSubPath     = '/uploads/files/' . CFileTypes::JOB_DIAGRAM . '/';
                        $strFilePath    = WP_CONTENT_DIR . $strSubPath;
                        $objUploader    =   new Uploader();
                        $objUploader->setExtensions( [ 'jpg', 'png', 'jpeg' ] );
                        $objUploader->setMaxSize( 2 ); // size in mb.
                        $objUploader->setDir( $strFilePath );
                        
                        if( $objUploader->uploadFile( 'job_diagram_file' ) )  {
                            $strFileName  =   $objUploader->getUploadName();
                        }
                        else {
                            $this->addErrorMessage( $objUploader->getMessage() );
                            break;
                        }
                        
                        $arrmixFile = [
                            'file_type_id'      => CFileTypes::JOB_DIAGRAM,
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
                        
                        $boolIsFileUpdated = true;
                    }
                    
                    $arrmixJob = [
                        'instructor_id'     => $this->objUser->getTeacher()->tid,
                        'title'             => $arrmixRequestData['title'],
                        'description'       => $arrmixRequestData['description'],
                        'start_date'        => date( 'Y-m-d H:i:s', strtotime( $arrmixRequestData['start_date'] ) ),
                        'end_date'          => date( 'Y-m-d H:i:s', strtotime( $arrmixRequestData['end_date'] ) ),
                        'time_given'        => $arrmixRequestData['time_given'],
                        'tolerance'         => $arrmixRequestData['tolerance'],
                        'material'          => $arrmixRequestData['material']
                    ];
                    
                    if( true == $boolIsFileUpdated ) {
                        $arrmixJob['file_id']   = $intFileId;
                    }
                                          
                    if( false === CJobs::getInstance()->update( $arrmixJob, [ 'id' => $this->getRequestData( [ 'job_id' ] ) ] ) ) {
                        $this->addErrorMessage( 'Unable to update Job. Unexpected error occured. Please contact administrator.' );
                        break;
                    }
                    
                    foreach( $arrmixRequestData['skill_id'] AS $intIndex => $intJobOpSkillId  ) {
                        $arrmixSkill = [
                            'name'          => ( true == isset( $arrmixRequestData['skill_name'] ) && true == isset(  $arrmixRequestData['skill_name'][$intIndex] ) ) ? $arrmixRequestData['skill_name'][$intIndex] : '',
                            'marks'         => ( true == isset( $arrmixRequestData['marks'] ) && true == isset(  $arrmixRequestData['marks'][$intIndex] ) ) ? $arrmixRequestData['marks'][$intIndex] : 0
                        ];
                        
                        if( false === CJobOperationalSkills::getInstance()->update( $arrmixSkill, [ 'id' => $intJobOpSkillId, 'job_id' => $this->getRequestData( [ 'job_id' ] ) ] ) ) {
                            $this->addErrorMessage( 'Unable to insert Job Operation Skills. Unexpected error occured. Please contact administrator.' );
                            break;
                        }
                    }

                    $this->addSuccessMessage( 'Job updated successfully.' );
                    
            }
        }
        
        $this->objJob                       = CJobs::getInstance()->fetchJobById( $this->getRequestData( [ 'job_id'] ) );
        $this->arrobjJobOperationalSkills   = CJobOperationalSkills::getInstance()->fetchJobOperationalSkillsBYJobId( $this->getRequestData( [ 'job_id' ] ) );
        
        $this->displayEditJob();
    }
    
    public function handleViewEvaluationSheet() {
        
        $this->objJob                       = CJobs::getInstance()->fetchJobById( $this->getRequestData( [ 'job_id'] ) );
        $this->arrobjJobOperationalSkills   = CJobOperationalSkills::getInstance()->fetchJobOperationalSkillsBYJobId( $this->getRequestData( [ 'job_id' ] ) );
        $this->intTotalMarks                = 0;
        
        foreach( $this->arrobjJobOperationalSkills AS $objJobOpSkill ) {
            $this->intTotalMarks += $objJobOpSkill->marks;    
        }
        
        $this->displayViewEvaluationSheet();
    }
    
    public function displayViewJobs() {
        
        $this->arrmixTemplateParams['jobs']         = $this->arrobjJobs;
        $this->arrmixTemplateParams['instructors']  = $this->rekeyObjects( 'tid', CTeachers::getInstance()->fetchAllTeachers() );
        
        $this->renderPage( 'jobs/view_jobs.php' );
    }
    
    public function displayViewAddJobForm() {
        
        $this->renderPage( 'jobs/view_add_job_form.php' );
    }
    
    public function displayEditJob() {
        
        $this->arrmixTemplateParams['job']          = $this->objJob;
        $this->arrmixTemplateParams['job_ops']      = $this->arrobjJobOperationalSkills;
        
        $this->renderPage( 'jobs/view_add_job_form.php' );
    }
    
    public function displayViewEvaluationSheet() {
        
        $this->arrmixTemplateParams['job']          = $this->objJob;
        $this->arrmixTemplateParams['job_ops']      = $this->arrobjJobOperationalSkills;
        $this->arrmixTemplateParams['total_marks']  = $this->intTotalMarks;
        
        $this->renderPage( 'jobs/view_evaluation_sheet.php' );
    }
}

( new CJobsManager() )->run();

