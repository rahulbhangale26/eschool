<?php
class CTraineeRecordManager extends CFactory {
    
    protected $arrobjTrades;
    protected $arrobjStudents;
    
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
        }
    }
    
    public function handleViewTraineeDailyDiary() {
        
        $this->displayViewTraineeDailyDiary();
    }
    
    public function handleAddRecord() {
        
        $arrmixRequestData = $this->getRequestData( [] );
        $boolIsSuccess = true;
        

        if( true == isset( $arrmixRequestData['submit'] ) ) {
            
            $this->arrobjStudents = CStudents::getInstance()->fetchStudentsByUnitId( $arrmixRequestData['unit_id'] );
            $arrobjTraineeRecordTypes = CTraineeRecordTypes::getInstance()->fetchAllTraineeRecordTypes();
            $strCheckedOnDate = $arrmixRequestData['from_date'];
            foreach ( $arrobjTraineeRecordTypes as $objTraineeRecordType ) {
                foreach( $this->arrobjStudents as $objStudent ) {
                    $arrmixTraineeRecord = [
                        'student_id'                => $objStudent->sid,
                        'trainee_record_type_id'    => $objTraineeRecordType->id,
                        'is_checked'                => ( true == isset( $arrmixRequestData['checked_for'] ) && true == isset( $arrmixRequestData['checked_for'][$objTraineeRecordType->id] ) &&  true == isset( $arrmixRequestData['checked_for'][$objTraineeRecordType->id][$objStudent->sid] ) ),
                        'checked_on'                => $strCheckedOnDate
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
    
    public function handleTraineeRecordCheckForm() {
        
        $intUnitId = $this->getRequestData([ 'data', 'unit_id' ] );
        
        $this->arrobjStudents = CStudents::getInstance()->fetchStudentsByUnitId( $intUnitId );
        $this->displayTraineeRecordCheckForm();
    }
    
    public function displayViewTraineeDailyDiary() {
        $this->renderPage( 'trainees/records/view_trainee_records.php' );
    }
    
    public function displayAddRecord() {
        
        $this->arrmixTemplateParams['trainee_record_types']     = CTraineeRecordTypes::getInstance()->fetchAllTraineeRecordTypes();
        $this->arrmixTemplateParams['trades']                   = $this->arrobjTrades;
        
        $this->renderPage( 'trainees/records/add_record.php' );
    }
    
    public function displayTraineeRecordCheckForm() {
        $this->arrmixTemplateParams['trainee_record_types']     = CTraineeRecordTypes::getInstance()->fetchAllTraineeRecordTypes();
        $this->arrmixTemplateParams['students']                 = $this->arrobjStudents;
        
        $this->renderPage( 'trainees/records/trainee_record_check_form.php' );
        
    }
    
}

( new CTraineeRecordManager() )->run();