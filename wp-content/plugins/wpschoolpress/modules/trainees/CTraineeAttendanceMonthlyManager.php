<?php

class CTraineeAttendanceMonthlyManager extends CFactory {
    
    protected $arrobjTrades;
    protected $objTeacher;
    protected $objUnit;
    protected $objTrade;
    protected $objBatch;
    
    protected $arrobjTraineeAttendances;
    protected $arrobjTraineeAttendancesSummary;
    protected $arrobjDailyTraineeAttendanceStat;
    protected $arrobjLastMonthTraineeAttendancesSummary;
    protected $arrobjStudents;
    
    public function __construct() {
        
    }
    
    public function initalize() {
        parent::initalize();
    }
    
    public function execute() {
        
        switch( $this->getPageAction() ) {
            case NULL:
                $this->handleViewTraineAttendanceMonthly();
                break;
                
            case 'view_muster_report':
                $this->handleViewMusterReport();
                break;
                
        }
    }
    
    public function handleViewTraineAttendanceMonthly() {
        
        if(  CRole::ADMIN == $this->objUser->getRole() || ( CRole::TEACHER == $this->objUser->getRole() && true == in_array( $this->objUser->getTeacher()->designation_id, [ CDesignations::PRINCIPAL, CDesignations::CLERK ] ) ) ) {
            $this->arrobjTrades = CTrade::getInstance()->fetchAllTrades();
        } else {
            $this->arrobjTrades = CTrade::getInstance()->fetchTradesByInstructorId( $this->objUser->getTeacher()->tid );
        }
        
        $this->displayViewTraineAttendanceMonthly();
    }
    
    public function handleViewMusterReport() {
        
        $intBatchId             = $this->getRequestData( [ 'data', 'batch_id' ] );
        $intTradeId             = $this->getRequestData( [ 'data', 'trade_id' ] );
        $intUnitId              = $this->getRequestData( [ 'data', 'unit_id' ] );
        $strAttendanceDate      = $this->getRequestData( [ 'data', 'attendance_date' ] );
        $strAttendanceDate      = $this->getRequestData( [ 'data', 'attendance_date' ] );
        
        $this->objTrade         = CTrade::getInstance()->fetchTradeById( $intTradeId );
        $this->objUnit          = CUnits::getInstance()->fetchUnitById( $intUnitId );
        $this->objBatch         = CBatches::getInstance()->fetchBatchById( $intBatchId );
        $this->objTeacher       = CTeachers::getInstance()->fetchTeacherByUnitIdByBatchId( $intUnitId, $intBatchId );
        $this->arrobjStudents   =  CStudents::getInstance()->fetchStudentsByUnitId( $intUnitId );
        list( $intYear, $intMonth ) = explode( '-', $strAttendanceDate );
        
        $this->arrobjTraineeAttendances         = CTraineeAttendances::getInstance()->fetchAttendancesByBatchIdByTradeIdByUnitIdByMonthByYear( $intBatchId, $intTradeId, $intUnitId,  $strAttendanceDate, $intMonth, $intYear );
        $this->arrobjTraineeAttendancesSummary  = CTraineeAttendances::getInstance()->fetchSummaryAttendancesByBatchIdByTradeIdByUnitIdByMonthByYear( $intBatchId, $intTradeId, $intUnitId,  $strAttendanceDate, $intMonth, $intYear );       
        $this->arrobjDailyTraineeAttendanceStat = CTraineeAttendances::getInstance()->fetchDailyAttendanceStatByBatchIdByTradeIdByUnitIdByMonthByYear( $intBatchId, $intTradeId, $intUnitId,  $strAttendanceDate, $intMonth, $intYear );
        
        $intLastMonth = $intMonth - 1;
        if( $intLastMonth == 0 ) {
            $intLastMonth = 12;
        }
        
        $this->arrobjLastMonthTraineeAttendancesSummary  = CTraineeAttendances::getInstance()->fetchTotalSummaryAttendancesByBatchIdByTradeIdByUnitIdByMonthByYear( $intBatchId, $intTradeId, $intUnitId,  $strAttendanceDate, $intMonth, $intYear );
                
        $this->displayViewMusterReport();
    }
    
    public function displayViewTraineAttendanceMonthly() {
        
        $this->arrmixTemplateParams['batches']          = CBatches::getInstance()->fetchAllBatches();
        $this->arrmixTemplateParams['trades']           = $this->arrobjTrades;
        
        $this->renderPage( 'trainees/attendance/view_trainee_attendance_monthly.php' );
        
    }
    
    public function displayViewMusterReport() {
        
        global $wpsp_settings_data;
        
        $strAttendanceDate = $this->getRequestData( [ 'data', 'attendance_date' ] );
        list( $intYear, $intMonth ) = explode( '-', $strAttendanceDate );
        
        $this->arrmixTemplateParams['month']                            = $intMonth;
        $this->arrmixTemplateParams['year']                             = $intYear;
        $this->arrmixTemplateParams['trade']                            = $this->objTrade;
        $this->arrmixTemplateParams['batch']                            = $this->objBatch;
        $this->arrmixTemplateParams['unit']                             = $this->objUnit;
        $this->arrmixTemplateParams['teacher']                          = $this->objTeacher;
        $this->arrmixTemplateParams['students']                         = $this->arrobjStudents;
        $this->arrmixTemplateParams['trainee_attendances']              = $this->rekeyObjects( 'id', $this->arrobjTraineeAttendances );
        $this->arrmixTemplateParams['attendance_types']                 = $this->rekeyObjects( 'id', CAttendanceTypes::getInstance()->fetchAllAttendanceTypes() );
        $this->arrmixTemplateParams['trainee_attendance_summary']       = $this->arrobjTraineeAttendancesSummary;
        $this->arrmixTemplateParams['last_month_summary']               = $this->arrobjLastMonthTraineeAttendancesSummary;
        $this->arrmixTemplateParams['daily_trainee_attendance_stats']   = $this->rekeyObjects( 'attendance_date', $this->arrobjDailyTraineeAttendanceStat );
        $this->arrmixTemplateParams['iti_name']                         = isset( $wpsp_settings_data['sch_name'] ) && !empty( $wpsp_settings_data['sch_name'] ) ? $wpsp_settings_data['sch_name'] : __( 'ITIMS','WPSchoolPress' );
        
        $this->renderPage( 'trainees/attendance/view_muster_report.php' );
    }
    
    
}

( new  CTraineeAttendanceMonthlyManager() )->run();

