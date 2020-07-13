<?php

class CDailyDiaryManager extends CFactory {
    
    protected $arrobjNotes;
    
    public function __construct() {
        
    }
    
    public function initalize() {
        parent::initalize();
    }
    
    public function execute() {
        
        switch( $this->getPageAction() ) {
            case NULL:
                $this->handleViewDailyDiary();
                break;
                
            case 'add_notes':
                $this->handleAddNotes();
                break;
            
        }
    }
    
    public function  handleViewDailyDiary() {
        
        if( ( CRole::TEACHER == $this->objUser->getRole() && true == in_array( $this->objUser->getTeacher()->designation_id, [ CDesignations::PRINCIPAL, CDesignations::CLERK ] ) ) || CRole::ADMIN == $this->objUser->getRole() ) {
            $this->arrobjNotes = CNotes::getInstance()->fetchAllNotes();
        } else {
            $this->arrobjNotes = CNotes::getInstance()->fetchNotesByInstructorId( $this->objUser->getTeacher()->tid );
        }        
        
        $this->displayViewDailyDiary();
    }
    
    public function handleAddNotes() {
        
        $arrmixRequestData = $this->getRequestData( [] );
        if( true == isset( $arrmixRequestData['add_note'] ) ) {
            switch ( NULL ) {
                default:
                    
                    if( "" == $arrmixRequestData['note_date'] ) {
                        $this->addErrorMessage( 'Note Date is required.' );
                        break;
                    }
                    
                    if( "" == $arrmixRequestData['note_type_id'] ) {
                        $this->addErrorMessage( 'Note type is required.' );
                        break;
                    }
                    
                    $arrmixNote = [
                        'note_type_id'          => ( int ) sanitize_text_field( $arrmixRequestData['note_type_id'] ),
                        'created_on'            => date( 'Y-m-d H:i:s', strtotime( $arrmixRequestData['note_date'] ) ),
                        'note'                  => sanitize_textarea_field( $arrmixRequestData['note'] ),
                        'instructor_id'         => $this->objUser->getTeacher()->tid,
                    ];
             
                    if( false == CNotes::getInstance()->insert( $arrmixNote ) ) {
                        $this->addErrorMessage( 'Unable to insert note. Please contact administrator.' );
                        break;
                    }
                    
                    $this->addSuccessMessage( 'Note added successfully.' );
            }
        }
        $this->displayAddNotes();
    }
    
    public function displayViewDailyDiary() {
        
        $this->arrmixTemplateParams['notes']        = $this->arrobjNotes;
        $this->arrmixTemplateParams['note_types']   = $this->rekeyObjects( 'id', CNoteTypes::getInstance()->fetchNoteTypesByIds( [ CNoteTypes::LESSON, CNoteTypes::PRACTICAL ] ) );
        
        $this->renderPage( 'daily_diary/view_daily_diary.php' );
    }
    
    public function displayAddNotes() {
        
        $this->arrmixTemplateParams['note_types']       = CNoteTypes::getInstance()->fetchNoteTypesByIds( [ CNoteTypes::LESSON, CNoteTypes::PRACTICAL ] );
        
        $this->renderPage( 'daily_diary/add_notes.php' );
    }
    
}

( new CDailyDiaryManager() )->run();

