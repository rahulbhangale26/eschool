<?php
class CTraineeRecordManager extends CFactory {
    
    protected $arrobjTrades;
    protected $arrobjTraineeRecords;
    protected $arrobjStudents;
    protected $arrobjTraineeRecordSummary;
    
    protected $arrobjBatches;
    
    public function __construct() {
        
    }
    
    public function initalize() {
        parent::initalize();
    }
    
    public function execute() {
        
        switch( $this->getPageAction() ) {
            case NULL:
                $this->handleViewTraineeDailyDiary();
                break;
                
            case 'add_record':
                $this->handleAddRecord();
                break;
                
            case 'trainee_record_check_form':
                $this->handleTraineeRecordCheckForm();
                break;
                
            case 'view_monthly_report':
                $this->handleViewMonthlyReport();
                break;
                
            case 'view_monthly_report_details':
                $this->handleViewMonthlyReportDetails();
                break;
        }
    }
    
    public function handleViewTraineeDailyDiary() {
        
        
        if(  CRole::ADMIN == $this->objUser->getRole() || ( CRole::TEACHER == $this->objUser->getRole() && true == in_array( $this->objUser->getTeacher()->designation_id, [ CDesignations::PRINCIPAL, CDesignations::CLERK ] ) ) ) {
            $this->arrobjTraineeRecordSummary = CTraineeRecords::getInstance()->fetchDailyGroupedTraineeRecords();
        } else {
            $this->arrobjTraineeRecordSummary = CTraineeRecords::getInstance()->fetchDailyGroupedTraineeRecordsByInstructorId(  $this->objUser->getTeacher()->tid );
        }
        
        $this->displayViewTraineeDailyDiary();
    }
    
    public function handleAddRecord() {
        
        $arrmixRequestData = $this->getRequestData( [] );
        $boolIsSuccess = true;
        
        if( true == isset( $arrmixRequestData['submit'] ) ) {
                       
            $this->arrobjStudents           = CStudents::getInstance()->fetchStudentsByUnitId( $arrmixRequestData['unit_id'] );
            $arrobjTraineeRecordTypes       = CTraineeRecordTypes::getInstance()->fetchAllTraineeRecordTypes();
            $strCheckedOnDate               = date( 'Y-m-d', strtotime( $arrmixRequestData['from_date'] ) );
            
            if( true == isset( $arrmixRequestData['is_edit'] ) && true == $arrmixRequestData['is_edit'] ) {
                CTraineeRecords::getInstance()->delete( [
                    'instructor_id'             => $this->objUser->getTeacher()->tid,
                    'checked_on'                => $strCheckedOnDate
                ] );
            }

            foreach ( $arrobjTraineeRecordTypes as $objTraineeRecordType ) {
                foreach( $this->arrobjStudents as $objStudent ) {
                    $strProgress = '';
                    
                    if( true == isset( $arrmixRequestData['progress'] ) && true == isset( $arrmixRequestData['progress'][$objTraineeRecordType->id] ) && true == isset( $arrmixRequestData['progress'][$objTraineeRecordType->id][$objStudent->sid] ) ) {
                        $strProgress = $arrmixRequestData['progress'][$objTraineeRecordType->id][$objStudent->sid];
                    } else if( false == ( true == isset( $arrmixRequestData['checked_for'] ) && true == isset( $arrmixRequestData['checked_for'][$objTraineeRecordType->id] ) &&  true == isset( $arrmixRequestData['checked_for'][$objTraineeRecordType->id][$objStudent->sid] ) ) ) {
                        continue;   
                    }
                                       
                    $arrmixTraineeRecord = [
                        'student_id'                => $objStudent->sid,
                        'trainee_record_type_id'    => $objTraineeRecordType->id,
                        'instructor_id'             => $this->objUser->getTeacher()->tid,
                        'is_checked'                => true,
                        'checked_on'                => $strCheckedOnDate,
                        'progress'                  => $strProgress
                    ];
                    
                     if( false == CTraineeRecords::getInstance()->insert( $arrmixTraineeRecord ) ) {
                        $boolIsSuccess = false;
                        $this->addErrorMessage( 'Unable to insert trainee records.' );
                        break 2;
                    } 
                }
            }
            
            if( true == $boolIsSuccess ) {
                $this->addSuccessMessage( 'Trainee record inserted successfully.' );
            }
        }
        
        if(  CRole::ADMIN == $this->objUser->getRole() || ( CRole::TEACHER == $this->objUser->getRole() && true == in_array( $this->objUser->getTeacher()->designation_id, [ CDesignations::PRINCIPAL, CDesignations::CLERK ] ) ) ) {
            $this->arrobjTrades = CTrade::getInstance()->fetchAllTrades();
        } else {
            $this->arrobjTrades = CTrade::getInstance()->fetchTradesByInstructorId( $this->objUser->getTeacher()->tid );
        }
        
        $this->displayAddRecord();
    }
    
    public function handleViewMonthlyReport() {
        
        $this->arrobjBatches = CBatches::getInstance()->fetchAllBatches();
        
        if(  CRole::ADMIN == $this->objUser->getRole() || ( CRole::TEACHER == $this->objUser->getRole() && true == in_array( $this->objUser->getTeacher()->designation_id, [ CDesignations::PRINCIPAL, CDesignations::CLERK ] ) ) ) {
            $this->arrobjTrades = CTrade::getInstance()->fetchAllTrades();
        } else {
            $this->arrobjTrades = CTrade::getInstance()->fetchTradesByInstructorId( $this->objUser->getTeacher()->tid );
        }
        
        $this->displayViewMonthlyReport();
    }
    
    public function handleTraineeRecordCheckForm() {
        $strCreatedOn = date( 'y-m-d', strtotime( $this->getRequestData( [ 'data', 'checked_on' ] ) ) );
        $this->arrobjTraineeRecords = CTraineeRecords::getInstance()->fetchTraineeRecordsByCheckedOnByInstructorId( $strCreatedOn, $this->objUser->getTeacher()->tid );

        $intUnitId = $this->getRequestData([ 'data', 'unit_id' ] );
        
        $this->arrobjStudents = CStudents::getInstance()->fetchStudentsByUnitId( $intUnitId );
        $this->displayTraineeRecordCheckForm();
    }
    
    public function handleViewMonthlyReportDetails() {
        
        $intUnitId      = $this->getRequestData( [ 'data', 'unit_id' ] );
        $intTradeId     = $this->getRequestData( [ 'data', 'trade_id' ] );
        $intBatchId     = $this->getRequestData( [ 'data', 'batch_id' ] );
        $strReportMonth = $this->getRequestData( [ 'data', 'report_month' ] );
        list( $intYear, $intMonth )     = explode( '-', $strReportMonth );
        
        
        $this->arrobjStudents           = CStudents::getInstance()->fetchStudentsByUnitId( $intUnitId );
        $arrobjTraineeRecords     = CTraineeRecords::getInstance()->fetchTraineeRecordsByUnitIdByMonthByYear( $intUnitId, $intMonth, $intYear );
        
        foreach ( $arrobjTraineeRecords AS $objTraineeRecord ) {
            
            if( false == isset( $this->arrobjTraineeRecords[$objTraineeRecord->student_id] ) ) {
                $this->arrobjTraineeRecords[$objTraineeRecord->student_id] = [];
            }
            
            $this->arrobjTraineeRecords[$objTraineeRecord->student_id][$objTraineeRecord->checked_on][] = $objTraineeRecord;
        }
                
        $this->displayViewMonthlyReportDetails();
    }
    
    public function displayViewTraineeDailyDiary() {
        
        $this->arrmixTemplateParams['trainee_records_summary']      = $this->arrobjTraineeRecordSummary;
        $this->arrmixTemplateParams['units']                        = $this->rekeyObjects( 'id', CUnits::getInstance()->fetchAllUnits() );
        $this->arrmixTemplateParams['trades']                       = $this->rekeyObjects( 'id', CTrade::getInstance()->fetchAllTrades() );
        $this->arrmixTemplateParams['instructors']                  = $this->rekeyObjects( 'tid', CTeachers::getInstance()->fetchAllTeachers() );
        
        $this->renderPage( 'trainees/records/view_trainee_records.php' );
    }
    
    public function displayAddRecord() {
       
        $this->arrmixTemplateParams['trainee_record_types']     = CTraineeRecordTypes::getInstance()->fetchAllTraineeRecordTypes();
        $this->arrmixTemplateParams['trades']                   = $this->arrobjTrades;
        $this->arrmixTemplateParams['batches']                  = CBatches::getInstance()->fetchAllBatches();
        
        $this->renderPage( 'trainees/records/add_record.php' );
    }
    
    public function displayTraineeRecordCheckForm() {
        
        $this->arrmixTemplateParams['trainee_records']          = $this->rekeyObjects( 'id', $this->arrobjTraineeRecords );
        $this->arrmixTemplateParams['trainee_record_types']     = CTraineeRecordTypes::getInstance()->fetchAllTraineeRecordTypes();
        $this->arrmixTemplateParams['students']                 = $this->arrobjStudents;
        
        $this->renderPage( 'trainees/records/trainee_record_check_form.php' );
        
    }
    
    public function displayViewMonthlyReport() {
        
        $this->arrmixTemplateParams['batches']          = $this->arrobjBatches;
        $this->arrmixTemplateParams['trades']           = $this->arrobjTrades;
        
        $this->renderPage( 'trainees/records/view_monthly_report.php' );
    }
    
    public function displayViewMonthlyReportDetails() {
        $this->arrmixTemplateParams['students']         = $this->arrobjStudents;
        $this->arrmixTemplateParams['trainee_records']  = $this->arrobjTraineeRecords;
        
        $this->renderPage( 'trainees/records/view_monthly_report_details.php' );
    }
    
}

( new CTraineeRecordManager() )->run();