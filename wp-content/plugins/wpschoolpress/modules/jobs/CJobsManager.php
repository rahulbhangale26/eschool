<?php

class CJobsManager extends CFactory {
    
    protected $arrobjJobs;
    protected $arrobjJobOperationalSkills;
    protected $arrobjTrades;
    protected $arrobjStudents;
    protected $arrobjSkillJobMarks;
    protected $objGradeJobMarks;
    protected $objDeductionJobMarks;
    protected $objRemarkJobMarks;
    
    protected $objJob;
    protected $objStudent;
    
    protected $arrobjJobMarks;
    
    protected $intTotalMarks;
    
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
                
            case 'add_or_edit_job_marks':
                $this->handleAddOrEditJobMarks();
                break;
                
            case 'students_job_marks_list':
                $this->handleStudentJobMarksList();
                break;
                
            case 'student_job_marks_form':
                $this->handleStudentJobMarksForm();
                break;
                
            case 'save_job_marks':
                $this->handleSaveJobMarks();
                break;

            case 'view_evaluation_sheet':
                $this->handleViewEvaluationSheet();
                break;
                
            case 'view_evaluation_sheet_second':
                $this->handleViewEvaluationSheetSecond();
                break;
                
            case 'view_evaluation_sheet_second_details':
                $this->handleViewEvaluationSheetSecondDetails();
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
    
    public function handleAddOrEditJobMarks() {
        
        if(  CRole::ADMIN == $this->objUser->getRole() || ( CRole::TEACHER == $this->objUser->getRole() && true == in_array( $this->objUser->getTeacher()->designation_id, [ CDesignations::PRINCIPAL, CDesignations::CLERK ] ) ) ) {
            $this->arrobjTrades = CTrade::getInstance()->fetchAllTrades();
        } else {
            $this->arrobjTrades = CTrade::getInstance()->fetchTradesByInstructorId( $this->objUser->getTeacher()->tid );
        }
        
        $this->objJob = CJobs::getInstance()->fetchJobById( $this->getRequestData( [ 'job_id' ] ) );
        
        $this->displayAddOrEditJobMarks();
    }
    
    public function handleStudentJobMarksList() {
        
        $intUnitId = $this->getRequestData([ 'data', 'unit_id' ] );
        
        $this->arrobjStudents = CStudents::getInstance()->fetchStudentsByUnitId( $intUnitId );
        
        $this->displayStudentJobMarksList();
        
    }
    
    public function handleStudentJobMarksForm() {

        $this->objJob                       = CJobs::getInstance()->fetchJobById( $this->getRequestData( [ 'data', 'job_id' ] ) );
        $this->objStudent                   = CStudents::getInstance()->fetchStudentById( $this->getRequestData( [ 'data', 'student_id' ] ) );       
        $this->arrobjJobOperationalSkills   = CJobOperationalSkills::getInstance()->fetchJobOperationalSkillsBYJobId( $this->getRequestData( [ 'data', 'job_id' ] ) );
        $arrobjJobMarks               = CJobMarks::getInstance()->fetchJobMarksByStudentIdByJobId( $this->getRequestData( [ 'data', 'student_id' ] ), $this->getRequestData( [ 'data', 'job_id' ] ) );

        foreach ( $arrobjJobMarks AS $objJobMark ) {
            if( $objJobMark->job_evaluation_type_id == CJobEvaluationTypes::SKILLS ) {
                $this->arrobjSkillJobMarks[$objJobMark->job_operational_skill_id] = $objJobMark;
            } else if( $objJobMark->job_evaluation_type_id == CJobEvaluationTypes::GRADES ) {
                $this->objGradeJobMarks = $objJobMark;
            } else if( $objJobMark->job_evaluation_type_id == CJobEvaluationTypes::EXTRA_TIME_DEDUCTION ) {
                $this->objDeductionJobMarks = $objJobMark;
            } else if( $objJobMark->job_evaluation_type_id == CJobEvaluationTypes::REMARK ) {
                $this->objRemarkJobMarks = $objJobMark;
            }
        }
        
        $this->displayStudentJobMarksForm();
        
    }
    
    public function handleSaveJobMarks() {
        
        $arrmixRequestData = $this->getRequestData( [ 'data', 'marks' ] );
        
        if( true == isset( $arrmixRequestData ) ) {
            $arrobjJobMarks = CJobMarks::getInstance()->fetchJobMarksByStudentIdByJobId( $arrmixRequestData['student_id'], $arrmixRequestData['job_id'] );
            if( true == is_array( $arrobjJobMarks ) && 0 < count( $arrobjJobMarks ) ) {
                foreach( $arrobjJobMarks as $objJobMark ) {
                    CJobMarks::getInstance()->delete( [ 'id' => $objJobMark->id, 'student_id' => ( int ) $arrmixRequestData['student_id'], 'job_id' => $arrmixRequestData['job_id'] ] );
                }
            }
            
            $this->arrobjJobOperationalSkills = CJobOperationalSkills::getInstance()->fetchJobOperationalSkillsBYJobId( $arrmixRequestData['job_id'] );

            foreach( $this->arrobjJobOperationalSkills AS $objJobOpsSkill ) {
                if( "" == $arrmixRequestData['ops_skill_' . $objJobOpsSkill->id] ) {
                    continue;
                }
                
                $intObtainedMarks = $arrmixRequestData['ops_skill_' . $objJobOpsSkill->id];
                
                $arrmixJobMarks = [
                    'student_id'                => ( int ) sanitize_text_field( $arrmixRequestData['student_id'] ),
                    'job_id'                    => ( int ) sanitize_text_field( $arrmixRequestData[ 'job_id' ] ),
                    'instructor_id'             => ( int ) $this->objUser->getTeacher()->tid,
                    'job_evaluation_type_id'    => CJobEvaluationTypes::SKILLS,
                    'job_operational_skill_id'  => $objJobOpsSkill->id,
                    'obtained_marks'            => ( int ) sanitize_text_field( $intObtainedMarks )
                ];
                
                if( false == CJobMarks::getInstance()->insert( $arrmixJobMarks ) ) {
                    echo json_encode( [ 'status' => false, message => 'Unable to save marks.' ] );
                    exit;
                }
                
            }
            
            $arrmixJobMarks = [
                'student_id'                => ( int ) sanitize_text_field( $arrmixRequestData['student_id'] ),
                'job_id'                    => ( int ) sanitize_text_field( $arrmixRequestData[ 'job_id' ] ),
                'instructor_id'             => ( int ) $this->objUser->getTeacher()->tid,
                'job_evaluation_type_id'    => CJobEvaluationTypes::GRADES,
                'obtained_marks'            => ( int ) sanitize_text_field( $arrmixRequestData['grade'] )
            ];
            
            if( false == CJobMarks::getInstance()->insert( $arrmixJobMarks ) ) {
                echo json_encode( [ 'status' => false, message => 'Unable to save grade marks.' ] );
                exit;
            }
            
            $arrmixJobMarks = [
                'student_id'                => ( int ) sanitize_text_field( $arrmixRequestData['student_id'] ),
                'job_id'                    => ( int ) sanitize_text_field( $arrmixRequestData[ 'job_id' ] ),
                'instructor_id'             => ( int ) $this->objUser->getTeacher()->tid,
                'job_evaluation_type_id'    => CJobEvaluationTypes::EXTRA_TIME_DEDUCTION,
                'obtained_marks'            => ( int ) sanitize_text_field( $arrmixRequestData['extra_time_deduction'] )
            ];
            
            if( false == CJobMarks::getInstance()->insert( $arrmixJobMarks ) ) {
                echo json_encode( [ 'status' => false, message => 'Unable to save extra time deduction marks.' ] );
                exit;
            }
            
            $arrmixJobMarks = [
                'student_id'                => ( int ) sanitize_text_field( $arrmixRequestData['student_id'] ),
                'job_id'                    => ( int ) sanitize_text_field( $arrmixRequestData[ 'job_id' ] ),
                'instructor_id'             => ( int ) $this->objUser->getTeacher()->tid,
                'job_evaluation_type_id'    => CJobEvaluationTypes::REMARK,
                'remark'                    => sanitize_text_field( $arrmixRequestData['remark'] )
            ];
            
            if( false == CJobMarks::getInstance()->insert( $arrmixJobMarks ) ) {
                echo json_encode( [ 'status' => false, message => 'Unable to save remark.' ] );
                exit;
            }
                        
            echo json_encode( [ 'status' => true, message => 'Marks saved successfully.' ] );
        }
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
    
    public function handleViewEvaluationSheetSecond() {
        
        if(  CRole::ADMIN == $this->objUser->getRole() || ( CRole::TEACHER == $this->objUser->getRole() && true == in_array( $this->objUser->getTeacher()->designation_id, [ CDesignations::PRINCIPAL, CDesignations::CLERK ] ) ) ) {
            $this->arrobjTrades = CTrade::getInstance()->fetchAllTrades();
        } else {
            $this->arrobjTrades = CTrade::getInstance()->fetchTradesByInstructorId( $this->objUser->getTeacher()->tid );
        }
        
        $this->objJob                       = CJobs::getInstance()->fetchJobById( $this->getRequestData( [ 'job_id'] ) );
        
        $this->displayViewEvaluationSheetSecond();
    }
    
    public function handleViewEvaluationSheetSecondDetails() {
        
        $this->objJob                       = CJobs::getInstance()->fetchJobById( $this->getRequestData( ['data', 'job_id'] ) );
        $this->arrobjJobOperationalSkills   = CJobOperationalSkills::getInstance()->fetchJobOperationalSkillsBYJobId( $this->objJob->id );
        $this->arrobjStudents               = $this->rekeyObjects( 'sid', CStudents::getInstance()->fetchStudentsByUnitId( $this->getRequestData( ['data', 'unit_id' ] ) ) );
        $arrobjJobMarks                     = CJobMarks::getInstance()->fetchJobMarksByStudentIdsByJobId( array_keys( $this->arrobjStudents ), $this->getRequestData( [ 'data', 'job_id' ] ) );

        foreach( $this->arrobjStudents AS $objStudent ) {
            foreach( $arrobjJobMarks AS $objJobMarks ) {
               
                if( $objJobMarks->student_id == $objStudent->sid && $objJobMarks->job_evaluation_type_id == CJobEvaluationTypes::SKILLS ) {
                    $objStudent->skill_marks[$objJobMarks->job_operational_skill_id] = $objJobMarks;
                } else if( $objJobMarks->student_id == $objStudent->sid && $objJobMarks->job_evaluation_type_id == CJobEvaluationTypes::GRADES ) {
                    $objStudent->grade_marks = $objJobMarks;
                } else if( $objJobMarks->student_id == $objStudent->sid && $objJobMarks->job_evaluation_type_id == CJobEvaluationTypes::EXTRA_TIME_DEDUCTION ) {
                    $objStudent->deduction_marks = $objJobMarks;
                } else if( $objJobMarks->student_id == $objStudent->sid && $objJobMarks->job_evaluation_type_id == CJobEvaluationTypes::REMARK ) {
                    $objStudent->remark = $objJobMarks;
                }
            }
        }
        
        $this->displayViewEvaluationSheetSecondDetails();
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
    
    public function displayAddOrEditJobMarks() {
        
        $this->arrmixTemplateParams['batches']      = CBatches::getInstance()->fetchAllBatches();
        $this->arrmixTemplateParams['trades']       = $this->arrobjTrades;
        $this->arrmixTemplateParams['job']          = $this->objJob;
        
        $this->renderPage( 'jobs/add_or_edit_job_marks.php' );
    }
    
    public function displayStudentJobMarksList() {       
        $this->arrmixTemplateParams['students']         = $this->arrobjStudents;
        
        $this->renderPage( 'jobs/students_job_marks_list.php' );
    }
    
    public function displayStudentJobMarksForm() {
        
        $this->arrmixTemplateParams['job']                  = $this->objJob;
        $this->arrmixTemplateParams['student']              = $this->objStudent;
        $this->arrmixTemplateParams['job_op_skill']         = $this->arrobjJobOperationalSkills;
        $this->arrmixTemplateParams['skill_job_marks']      = $this->arrobjSkillJobMarks;
        $this->arrmixTemplateParams['grade_job_marks']      = $this->objGradeJobMarks;
        $this->arrmixTemplateParams['deduction_job_marks']  = $this->objDeductionJobMarks;
        $this->arrmixTemplateParams['remark_job_marks']     = $this->objRemarkJobMarks;

        $this->renderPage( 'jobs/student_job_marks_form.php' );
    }
    
    public function displayViewEvaluationSheet() {
        
        $this->arrmixTemplateParams['job']          = $this->objJob;
        $this->arrmixTemplateParams['job_ops']      = $this->arrobjJobOperationalSkills;
        $this->arrmixTemplateParams['total_marks']  = $this->intTotalMarks;
        
        $this->renderPage( 'jobs/view_evaluation_sheet.php' );
    }
    
    public function displayViewEvaluationSheetSecond() {
        
        $this->arrmixTemplateParams['batches']      = CBatches::getInstance()->fetchAllBatches();
        $this->arrmixTemplateParams['trades']       = $this->arrobjTrades;
        $this->arrmixTemplateParams['job']          = $this->objJob;
        
        $this->renderPage( 'jobs/view_evaluation_sheet_second.php' );
    }
    
    public function displayViewEvaluationSheetSecondDetails() {
        global $wpsp_settings_data;
        
        $this->arrmixTemplateParams['batch']        = CBatches::getInstance()->fetchBatchById( $this->getRequestData( [ 'data', 'batch_id' ] ) );
        $this->arrmixTemplateParams['trade']        = CTrade::getInstance()->fetchTradeById( $this->getRequestData( [ 'data', 'trade_id' ] ) );
        $this->arrmixTemplateParams['unit']         = CUnits::getInstance()->fetchUnitById( $this->getRequestData( ['data', 'unit_id'] ) );
        $this->arrmixTemplateParams['iti_name']     = isset( $wpsp_settings_data['sch_name'] ) && !empty( $wpsp_settings_data['sch_name'] ) ? $wpsp_settings_data['sch_name'] : __( 'ITIMS','WPSchoolPress' );
        $this->arrmixTemplateParams['job']          = $this->objJob;
        $this->arrmixTemplateParams['instructors']  = $this->rekeyObjects( 'tid', CTeachers::getInstance()->fetchAllTeachers() );
        $this->arrmixTemplateParams['job_ops_skills']   = $this->arrobjJobOperationalSkills;
        $this->arrmixTemplateParams['students']     = $this->arrobjStudents;
        
        $this->renderPage( 'jobs/view_evaluation_sheet_second_details.php' );
    }
}

( new CJobsManager() )->run();

