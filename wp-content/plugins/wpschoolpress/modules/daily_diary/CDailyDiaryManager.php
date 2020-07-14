<?php

class CDailyDiaryManager extends CFactory {
    
    protected $arrobjNotes;
    protected $arrmixFilter;
    
    protected $objNote;
    
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
                
            case 'edit_note':
            	$this->handleEditNote();
            	break;
            
            case 'delete_note':
            	$this->handleDeleteNote();
            	break;
            
        }
    }
    
    public function  handleViewDailyDiary() {

    	$this->arrmixFilter = [
    			'filter'        => 'filter',
    			'start_date'    => date( 'Y-m-01'),
    			'end_date'      => date( 'Y-m-d' )
    	];
    	
    	if( true == is_string( $this->getRequestData( [ 'filter', 'filter' ] ) ) ) {
    		$this->arrmixFilter = $this->getRequestData( [ 'filter' ] );
    	}
        
        if( ( CRole::TEACHER == $this->objUser->getRole() && true == in_array( $this->objUser->getTeacher()->designation_id, [ CDesignations::PRINCIPAL, CDesignations::CLERK ] ) ) || CRole::ADMIN == $this->objUser->getRole() ) {
        	$this->arrobjNotes = CNotes::getInstance()->fetchNotesByFilter( $this->arrmixFilter );
        } else {
        	$this->arrobjNotes = CNotes::getInstance()->fetchNotesByInstructorIdByFilter( $this->objUser->getTeacher()->tid, $this->arrmixFilter );
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
    
    public function handleEditNote() {
    	$intNoteId		= $this->getRequestData( [ 'note_id' ] );
    	$this->objNote	= CNotes::getInstance()->fetchNoteById( $intNoteId );
    	
    	if( true == is_string( $this->getRequestData( [ 'add_note' ] ) ) ) {
    		$arrstrNote = [
    			'note'				=> sanitize_textarea_field( $this->getRequestData( ['note'] ) ),
    			'note_type_id'		=> sanitize_text_field( $this->getRequestData( [ 'note_type_id' ] ) ),
    			'created_on'		=> sanitize_text_field( $this->getRequestData( [ 'note_date' ] ) )
    		];
    		
    		if( false == CNotes::getInstance()->update( $arrstrNote, [ 'id' => $intNoteId ] ) ){
    			$this->addErrorMessage( 'Unable to update note. Please contact administrator.' );
    			$this->displayAddNotes();
    			return false;
    		}
    		
    		$this->addSuccessMessage( 'Note updated successfully.' );
    	}
    	
    	$this->displayAddNotes();
    }
    
    public function handleDeleteNote() {
    	if( false == CNotes::getInstance()->delete( [ 'id' => ( int ) $this->getRequestData( [ 'data', 'note_id' ] ) ] ) ) {
    		echo 'error';
    		exit;
    	}
    	
    	$this->handleViewDailyDiary();
    }
    
    public function displayViewDailyDiary() {
        
        $this->arrmixTemplateParams['notes']        = $this->arrobjNotes;
        $this->arrmixTemplateParams['filter']		= $this->arrmixFilter;
        $this->arrmixTemplateParams['note_types']   = $this->rekeyObjects( 'id', CNoteTypes::getInstance()->fetchNoteTypesByIds( [ CNoteTypes::LESSON, CNoteTypes::PRACTICAL ] ) );
        $this->arrmixTemplateParams['instructors']	= $this->rekeyObjects( 'tid', CTeachers::getInstance()->fetchAllTeachers() );
        
        $this->renderPage( 'daily_diary/view_daily_diary.php' );
    }
    
    public function displayAddNotes() {
        
    	$this->arrmixTemplateParams['note']				= $this->objNote;
        $this->arrmixTemplateParams['note_types']       = CNoteTypes::getInstance()->fetchNoteTypesByIds( [ CNoteTypes::LESSON, CNoteTypes::PRACTICAL ] );
        
        $this->renderPage( 'daily_diary/add_notes.php' );
    }
    
}

( new CDailyDiaryManager() )->run();

