<?php

class CSubjectsManager extends CFactory {
   
    protected $arrobjTrades;
    protected $arrobjSubjects;
    
    protected $arrmixSubjectFilter = [];
    
    public function __construct() {
        
    }
    
    public function initalize() {
        parent::initalize();
    }
    
    public function execute() {

        switch( $this->getPageAction() ) {
            case NULL:
                $this->handleViewSubjects();
                break;
                
            case 'add_subject':
                $this->handleAddSubject();
                break;

            case 'view_filter':
                $this->handleViewFilter();
                break;

            case 'view_create_subject':
                $this->handleViewCreateSubject();
                break;
        }
        
    }
    
    public function handleViewSubjects() {
        
        if( NULL != $this->getRequestData( [ 'data', 'trade_id' ] ) ) {
            $this->arrmixSubjectFilter['trade_id'] = $this->getRequestData( [  'data', 'trade_id' ] );
        }
        
        if( NULL != $this->getRequestData( [ 'data', 'year_or_semester_no' ] ) ) {
            $this->arrmixSubjectFilter['year_or_semester_no'] = $this->getRequestData( [  'data', 'year_or_semester_no' ] );
        }
        
        $this->arrobjSubjects = ( new CSubjects() )->fetchSubjectsByFilter( $this->arrmixSubjectFilter );
        
        $this->displayViewSubjects();
    }
    
    public function handleAddSubject() {
        
        $objSubject = new CSubjects();
        $arrmixSubject = $this->getRequestData( ['data' ] );
        
        switch( NULL ) {
            
            default:

                if( false == isset( $arrmixSubject['trade_id'] ) ) {
                    $this->addErrorMessage( 'Trade is required.' );
                    break;
                }
                
                if( false == isset( $arrmixSubject['year_or_semester_no'] ) ) {
                    $this->addErrorMessage( 'Select Year/Semester.' );
                    break;
                }
                
                if( false == is_string( $arrmixSubject['sub_name'] ) ) {
                    $this->addErrorMessage( 'Subject Name is required.' );
                    break;
                }
                
                if( false == $objSubject->insert( $arrmixSubject ) ) {
                    $this->addErrorMessage( 'Unkown error occurred while inserting subject. Please contact administrator.');
                    break;
                }
                
                $this->addSuccessMessage( 'Subject Added Successfully.' );

        }
        
        $this->displayViewCreateSubject();
    }
    
    public function handleViewFilter() {

        if( NULL != $this->getRequestData( [ 'data', 'trade_id' ] ) ) {
            $this->arrmixSubjectFilter['trade_id'] = $this->getRequestData( [  'data', 'trade_id' ] );
        }
        
        $this->displayViewFilter();
    }
    
    public function handleViewCreateSubject() {

        $this->displayViewCreateSubject();
    }
    
    public function displayViewFilter() {
        $this->arrmixTemplateParams['subject_filter']   = $this->arrmixSubjectFilter;
        $this->arrmixTemplateParams['subjects']         = $this->arrobjSubjects;
        $this->arrmixTemplateParams['trades']           = $this->rekeyObjects( 'id', CTrade::getInstance()->fetchAllTrades() );

        $this->renderPage( 'subjects/view_filter.php' );
    }
    
    public function displayViewSubjects() {
        
        $this->arrmixTemplateParams['subject_filter']   = $this->arrmixSubjectFilter;
        $this->arrmixTemplateParams['subjects']         = $this->arrobjSubjects;
        $this->arrmixTemplateParams['trades']           = $this->rekeyObjects( 'id', CTrade::getInstance()->fetchAllTrades() );

        $this->renderPage( 'subjects/view_subjects.php' );
    }
    
    public function displayViewCreateSubject() {

        $this->arrmixTemplateParams['trades']           = $this->rekeyObjects( 'id', CTrade::getInstance()->fetchAllTrades() );
        $this->arrmixTemplateParams['subject']          = $this->getRequestData([ 'data' ] );
        $this->renderPage( 'subjects/view_create_subject.php' );
    }
        
}

( new CSubjectsManager() )->run();

