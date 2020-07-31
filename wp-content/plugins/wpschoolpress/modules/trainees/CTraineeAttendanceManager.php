<?php

class CTraineeAttendanceManager extends CFactory {
    
    protected $arrobjTrades;
    protected $arrobjStudents;
    protected $arrobjTraineeAttendances;
    
    protected $objBatch;
    protected $objTrade;
    protected $objUnit;
    
    protected $arrstrFilter;
    
    
    public function __construct() {
        
    }
    
    public function initalize() {
        parent::initalize();
    }
    
    public function execute() {
        
        switch( $this->getPageAction() ) {
            case NULL:
                $this->handleTraineAttendance();
                break;
                
            case 'add_trainee_attendance':
                $this->handleAddTraineeAttendance();
                break;
                
            case 'trainee_attendance_form':
                $this->handleTraineeAttendanceForm();
                break;
        }
    }
    
    public function handleTraineAttendance() {
        
        $this->arrstrFilter = $this->getRequestData( [ 'filter' ] );
        
        if( false == isset( $this->arrstrFilter[ 'filter' ] ) ) {
            $this->arrstrFilter = [
                'filter'        => 'filter',
                'start_date'    => date( 'Y-m-01'),
                'end_date'      => date( 'Y-m-d' ),
            	'unit_id'		=> $this->getSessionData( [ 'filter', 'unit_id' ] )
            ];
        }
        
        $this->arrstrFilter['unit_id'] = $this->getSessionData( [ 'filter', 'unit_id' ] );
        
        if(  CRole::ADMIN == $this->objUser->getRole() || ( CRole::TEACHER == $this->objUser->getRole() && true == in_array( $this->objUser->getTeacher()->designation_id, [ CDesignations::PRINCIPAL, CDesignations::CLERK ] ) ) ) {
            $this->arrobjTraineeAttendances = CTraineeAttendances::getInstance()->fetchGroupedTraineeAttendance( $this->arrstrFilter );
        } else {
            $this->arrobjTraineeAttendances = CTraineeAttendances::getInstance()->fetchGroupedTraineeAttendanceByInstructorId( $this->objUser->getTeacher()->tid, $this->arrstrFilter );
        }
        
        $this->displayTraineeAttendance();
    }
    
    public function handleAddTraineeAttendance() {
        
        $boolIsSuccess      = true;
        $arrmixRequestData  = $this->getRequestData([] );
        
        if( true == isset( $arrmixRequestData['submit'] ) ) {
            $intBatchId             = $this->getSessionData( [ 'filter', 'batch_id' ] );
            $intTradeId             = $this->getSessionData( [ 'filter', 'trade_id' ] );
            $arrobjAttendanceTypes  = CAttendanceTypes::getInstance()->fetchAllAttendanceTypes();
            $this->arrobjStudents   = CStudents::getInstance()->fetchStudentsByBatchIdByTradeId( $intBatchId, $intTradeId );
            $strAttendanceDate      = date( 'Y-m-d', strtotime( $arrmixRequestData['attendance_date'] ) );
            
            if( true == isset( $arrmixRequestData['is_edit'] ) && true == $arrmixRequestData['is_edit'] ) {
                CTraineeAttendances::getInstance()->deleteAttendancesBYTradeIdByBatchIdByInstructorIdByAttendanceDate( $intTradeId, $intBatchId, $this->objUser->getTeacher()->tid, $strAttendanceDate );
            }
            
            foreach ( $this->arrobjStudents as $objStudent ) {
            
                foreach( $arrobjAttendanceTypes as $objAttendanceType ) {
                    
                    if( true == isset( $arrmixRequestData['attendance'] ) && true == isset( $arrmixRequestData['attendance'][$objAttendanceType->id] ) && true == isset( $arrmixRequestData['attendance'][$objAttendanceType->id][$objStudent->sid] ) ) {
                        
                        $arrmixAttendance = [
                            'attendance_type_id'    => $objAttendanceType->id,
                            'student_id'            => $objStudent->sid,
                            'instructor_id'         => $this->objUser->getTeacher()->tid,
                            'attendance_date'       => date( 'Y-m-d', strtotime( $arrmixRequestData['attendance_date'] ) ),
                            'reason'                => $arrmixRequestData['attendance']['reason'][$objStudent->sid]
                        ];
                     
                        if( false == CTraineeAttendances::getInstance()->insert( $arrmixAttendance ) ) {
                            $boolIsSuccess = false;
                            $this->addErrorMessage( 'Unable to insert trainee attendance.' );
                            break 2;
                        }
                    }
                }
            }
            
            if( true == $boolIsSuccess ) {
                $this->addSuccessMessage( 'Trainee record inserted successfully.' );
            }

        }
        
        $this->displayAddTraineeAttendance();
    }
    
    public function handleTraineeAttendanceForm() {
        $intBatchId             = $this->getSessionData( [ 'filter', 'batch_id' ] );
        $intTradeId             = $this->getSessionData( [ 'filter', 'trade_id' ] );
        $intUnitId              = $this->getSessionData( [ 'filter', 'unit_id' ] );
        $strAttendanceDate      = $this->getRequestData( [ 'data', 'attendance_date' ] );
        
        if( true == isset( $intBatchId ) && true == isset( $intTradeId ) ) {
            $this->arrobjStudents   = CStudents::getInstance()->fetchStudentsByBatchIdByTradeId( $intBatchId, $intTradeId );
            $this->objTrade         = CTrade::getInstance()->fetchTradeById( $intTradeId );
            $this->objUnit          = CUnits::getInstance()->fetchUnitById( $intUnitId );
            $this->objBatch         = CBatches::getInstance()->fetchBatchById( $intBatchId );
            $this->arrobjTraineeAttendances = CTraineeAttendances::getInstance()->fetchAttendancesByBatchIdByAttendanceDate( $intBatchId, date('Y-m-d', strtotime( $strAttendanceDate ) ) );
        }      
        
        $this->displayTraineeAttendanceForm();
        
    }
    
    public function displayTraineeAttendance() {
        
        
        $this->arrmixTemplateParams['trainee_attendances']          = $this->arrobjTraineeAttendances;
        $this->arrmixTemplateParams['instructors']                  = $this->rekeyObjects( 'tid', CTeachers::getInstance()->fetchAllTeachers() );
        $this->arrmixTemplateParams['start_date']                   = $this->arrstrFilter['start_date'];
        $this->arrmixTemplateParams['end_date']                     = $this->arrstrFilter['end_date'];
        
        
        $this->renderPage( 'trainees/attendance/view_trainee_attendance.php' );
    }
    
    public function displayAddTraineeAttendance() {
        
        $this->arrmixTemplateParams['edit_attendance']          = $this->getRequestData( [] );
        
        $this->renderPage( 'trainees/attendance/add_trainee_attendance.php' );
    }
    
    public function displayTraineeAttendanceForm() {
                
        $this->arrmixTemplateParams['unit']                 = $this->objUnit;
        $this->arrmixTemplateParams['attendance_date']      = $this->getRequestData( [ 'data', 'attendance_date' ] );
        $this->arrmixTemplateParams['trade']                = $this->objTrade;
        $this->arrmixTemplateParams['batch']                = $this->objBatch;
        $this->arrmixTemplateParams['students']             = $this->arrobjStudents;
        $this->arrmixTemplateParams['trainee_attendances']  = $this->rekeyObjects( 'student_id', $this->arrobjTraineeAttendances );
        $this->arrmixTemplateParams['attendance_types']     = CAttendanceTypes::getInstance()->fetchAllAttendanceTypes();
        
        $this->renderPage( 'trainees/attendance/trainee_attendance_form.php' );
    }
}

( new CTraineeAttendanceManager() )->run();
