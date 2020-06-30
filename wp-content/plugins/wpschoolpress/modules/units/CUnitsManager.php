<?php

class CUnitsManager extends CFactory {
    
    protected $arrobjSubjects;
    
    public function __construct() {
        
    }
    
    public function initalize() {
        parent::initalize();
    }
    
    public function execute() {
        
        switch( $this->getPageAction() ) {
            case NULL:
                $this->handleViewUnits();
                break;
                
            case 'view_create_unit':
                $this->handleViewCreateUnit();
                break;
                
            case 'insert_or_update_unit':
                $this->handleInsertOrUpdateUnit();
                break;
        }
        
        
    }
    
    public function handleViewUnits() {
        
        $this->displayViewUnits();
    }
    
    public function handleViewCreateUnit() {
        
        $arrmixRequestData = $this->getRequestData( ['data'] );
        
        if( true == isset( $arrmixRequestData['trade_id'] ) && true == isset( $arrmixRequestData['year_or_semester_no'] ) ) {
            $this->arrobjSubjects = ( new CSubjects() )->fetchSubjectsByFilter( $arrmixRequestData );
        }
        

        $this->displayViewCreateUnit();
        
    }
    
    public function handleInsertOrUpdateUnit() {
    
        $arrmixRequestData = $this->getRequestData( [] );
        
        switch( NULL ) {
            default:
                if( false == isset( $arrmixRequestData['unit'] ) ||  false == isset( $arrmixRequestData['unit']['trade_id'] ) ) {
                    $this->addErrorMessage( 'Trade is required.' );
                    break;
                }
                
                if( false == isset( $arrmixRequestData['unit']['year_or_semester_no'] ) ) {
                    $this->addErrorMessage( 'Select year/semester.' );
                    break;
                }
                
                if( false == isset( $arrmixRequestData['unit']['instructor_incharge_id'] ) ) {
                    $this->addErrorMessage( 'Select Unit instructor incharge is requireds.' );
                    break;
                }
                
                if( false == isset( $arrmixRequestData['unit']['name'] ) ) {
                    $this->addErrorMessage( 'Unit name is required.' );
                    break;
                }

                if( false == isset( $arrmixRequestData['unit']['instructor'] ) ) {
                    $this->addErrorMessage( 'All Subject instructors are required.' );
                    break;
                }
                
                $arrmixUnit = [
                    'trade_id'              => ( int ) $arrmixRequestData['unit']['trade_id'],
                    'year_or_semester_no'   => ( int ) $arrmixRequestData['unit']['year_or_semester_no'],
                    'instructor_id'    => ( int ) $arrmixRequestData['unit']['instructor_incharge_id'],
                    'unit_name'             => $arrmixRequestData['unit']['name'],
                    'batch_id'              => ( int ) $arrmixRequestData['unit']['batch_id']
                ];
                
                if( false == ( $intUnitId = ( new CUnits() )->insert( $arrmixUnit ) ) ) {
                    $this->addErrorMessage( 'Unable to insert unit.' );
                    break;
                }
                    
                
                foreach ( $arrmixRequestData['unit']['instructor'] as $intSubjectId =>  $intInstructorId ) {
                    $arrmixSubjectInstructor = [
                        'subject_id'            => ( int ) $intSubjectId,
                        'instructor_id'         => ( int ) $intInstructorId,
                        'trade_id'              => ( int ) $arrmixRequestData['unit']['trade_id'],
                        'year_or_semester_no'   => ( int ) $arrmixRequestData['unit']['year_or_semester_no'],
                        'unit_id'               => ( int ) $intUnitId,
                        
                    ];

                    
                    if( false == ( new CSubjectInstructors() )->insert( $arrmixSubjectInstructor ) ) {
                        $this->addErrorMessage( 'Unable to insert Subject Teachers.' );
                        break;
                    } 
                }
                
                $this->addSuccessMessage( 'Successfully setuped unit.' );
        }
        
        
        $this->displayViewCreateUnit();
    }
    
    
    public function displayViewUnits() {
        $this->arrmixTemplateParams['batches']          = $this->rekeyObjects( 'id', CBatches::getInstance()->fetchAllBatches() );
        $this->arrmixTemplateParams['units']            = CUnits::getInstance()->fetchAllUnits();
        $this->arrmixTemplateParams['trades']           = $this->rekeyObjects( 'id', CTrade::getInstance()->fetchAllTrades() );
        
        $this->renderPage( 'units/view_units.php' );
    }
    
    public function displayViewCreateUnit() {
        
        $this->arrmixTemplateParams['trades']           = $this->rekeyObjects( 'id', CTrade::getInstance()->fetchAllTrades() );
        $this->arrmixTemplateParams['unit']             = $this->getRequestData([ 'data' ] );
        $this->arrmixTemplateParams['subjects']         = $this->arrobjSubjects;
        $this->arrmixTemplateParams['instructors']      = ( new CTeachers() )->fetchAllTeachers();
        $this->arrmixTemplateParams['batches']          = CBatches::getInstance()->fetchAllBatches();
        
        $this->renderPage( 'units/view_create_unit.php' );
    }
    
}



( new CUnitsManager() )->run();

