<?php

class CDailyDiaryManager extends CFactory {
    
    protected $arrobjNotes;
    protected $arrobjLessonNotes;
    protected $arrobjPracticalNotes;  
    protected $arrobjTrades;
    protected $arrobjUnits;
    protected $arrmixFilter;
    
    protected $objInstructor;
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
            	
            case 'print_view':
            	$this->handlePrintView();
            	break;
        }
    }
    
    public function  handleViewDailyDiary() {

    	$this->arrmixFilter = [
    			'filter'        => 'filter',
    			'unit_id'		=> $this->getSessionData( [ 'filter', 'unit_id' ] ),
    			'start_date'    => date( 'Y-m-01'),
    			'end_date'      => date( 'Y-m-d' )
    	];
    	
    	if( true == is_string( $this->getRequestData( [ 'filter', 'filter' ] ) ) ) {
    		$this->arrmixFilter 			= $this->getRequestData( [ 'filter' ] );
    		$this->arrmixFilter['unit_id']	= $this->getSessionData( [ 'filter', 'unit_id' ] );
    	}
        
    	if(  CRole::ADMIN == $this->objUser->getRole() || ( CRole::TEACHER == $this->objUser->getRole() && true == in_array( $this->objUser->getTeacher()->designation_id, [ CDesignations::PRINCIPAL, CDesignations::CLERK ] ) ) ) {
    		$this->arrobjNotes	= CNotes::getInstance()->fetchNotesByFilter( $this->arrmixFilter );
    	} else {
    		$this->arrobjNotes	= CNotes::getInstance()->fetchNotesByInstructorIdByFilter( $this->objUser->getTeacher()->tid, $this->arrmixFilter );
    	}
        
        $this->displayViewDailyDiary();
    }
    
    public function handleAddNotes() {
        
        $arrmixRequestData = $this->getRequestData( [] );
        if( true == isset( $arrmixRequestData['add_note'] ) ) {
            switch ( NULL ) {
                default:               	
                	if( "" == $this->getSessionData( [ 'filter', 'unit_id' ] ) ) {
                		$this->addErrorMessage( 'Unit is required.' );
                		break;
                	}
                    
                    if( "" == $arrmixRequestData['note_date'] ) {
                        $this->addErrorMessage( 'Note Date is required.' );
                        break;
                    }
                    
                    if( "" == $arrmixRequestData['note_type_id'] ) {
                        $this->addErrorMessage( 'Note type is required.' );
                        break;
                    }
                    
                    $arrmixNote = [
                    	'unit_id'				=> ( int ) $this->getSessionData( [ 'filter', 'unit_id' ] ),
                        'note_type_id'          => ( int ) sanitize_text_field( $arrmixRequestData['note_type_id'] ),
                    	'number'				=> sanitize_text_field( $this->getRequestData( [ 'note_type_number' ] ) ),
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
   				'unit_id'			=> ( int ) $this->getSessionData( [ 'filter', 'unit_id' ] ),
    			'number'			=> sanitize_text_field( $this->getRequestData( [ 'note_type_number' ] ) ),
    			'note'				=> sanitize_textarea_field( $this->getRequestData( ['note'] ) ),
    			'note_type_id'		=> sanitize_text_field( $this->getRequestData( [ 'note_type_id' ] ) ),
    			'created_on'		=> sanitize_text_field( $this->getRequestData( [ 'note_date' ] ) )
    		];
    		
    		if( false == CNotes::getInstance()->update( $arrstrNote, [ 'id' => $intNoteId ] ) ){
    			$this->addErrorMessage( 'Unable to update note. Please contact administrator.' );
    			$this->displayAddNotes();
    			return false;
    		}
    		
    		$this->objNote	= CNotes::getInstance()->fetchNoteById( $intNoteId );
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
    
    public function handlePrintView() {
    	
    	if( "" == $this->getSessionData( [ 'filter', 'unit_id' ] ) ) {
    		echo json_encode( [ 'status' => false, 'message' => 'Unit selection is required to print.' ] );
    		exit;
    	}
    	
    	if( "" == $this->getRequestData( [ 'data', 'start_date' ] ) ) {
    		echo json_encode( [ 'status' => false, 'message' => 'Select Start Date.' ] );
    		exit;
    	}
    	
    	if( "" == $this->getRequestData( [ 'data', 'end_date' ] ) ) {
    		echo json_encode( [ 'status' => false, 'message' => 'Select End Date.' ] );
    		exit;
    	}
    	
    	$this->arrmixFilter = [
    			'unit_id'		=> ( int ) sanitize_text_field( $this->getSessionData( [ 'filter', 'unit_id' ] ) ),
    			'start_date'    => sanitize_text_field( $this->getRequestData( [ 'data', 'start_date' ] ) ),
    			'end_date'      => sanitize_text_field( $this->getRequestData( [ 'data', 'end_date' ] ) )
    	];
    	
    	if(  CRole::ADMIN == $this->objUser->getRole() || ( CRole::TEACHER == $this->objUser->getRole() && true == in_array( $this->objUser->getTeacher()->designation_id, [ CDesignations::PRINCIPAL, CDesignations::CLERK ] ) ) ) {
    		$this->arrobjLessonNotes	= CNotes::getInstance()->fetchPrintNotesByFilter( array_merge( [ 'note_type_id'	=> CNoteTypes::LESSON ], $this->arrmixFilter ), 'n.created_on ASC' );
    		$this->arrobjPracticalNotes	= CNotes::getInstance()->fetchPrintNotesByFilter( array_merge( [ 'note_type_id'	=> CNoteTypes::PRACTICAL ], $this->arrmixFilter ), 'n.created_on ASC' );
    		$this->arrobjTrades 		= $this->rekeyObjects( 'id', CTrade::getInstance()->fetchAllTrades() );
    		$this->arrobjUnits			= $this->rekeyObjects( 'id', CUnits::getInstance()->fetchAllUnits() );
    	} else {
    		$this->arrobjLessonNotes	= CNotes::getInstance()->fetchPrintNotesByInstructorIdByFilter( $this->objUser->getTeacher()->tid, array_merge( [ 'note_type_id' => CNoteTypes::LESSON ], $this->arrmixFilter ), 'n.created_on ASC' );
    		$this->arrobjPracticalNotes	= CNotes::getInstance()->fetchPrintNotesByInstructorIdByFilter( $this->objUser->getTeacher()->tid, array_merge( [ 'note_type_id' => CNoteTypes::PRACTICAL ], $this->arrmixFilter ), 'n.created_on ASC' );
    		$this->arrobjTrades 		= $this->rekeyObjects( 'id', CTrade::getInstance()->fetchTradesByInstructorId( $this->objUser->getTeacher()->tid ) );
    		$this->arrobjUnits			= $this->rekeyObjects( 'id', CUnits::getInstance()->fetchUnitByInstructorUserId( $this->objUser->getTeacher()->tid ) );
    	}
    	    	
    	$this->objInstructor = CTeachers::getInstance()->fetchTeacherByUnitIdByBatchId( $this->arrmixFilter['unit_id'], $this->arrobjUnits[$this->arrmixFilter['unit_id']]->batch_id );
    	
    	$this->displayPrintView();
    }
    
    public function displayViewDailyDiary() {
        
        $this->arrmixTemplateParams['notes']        			= $this->arrobjNotes;
        $this->arrmixTemplateParams['daily_diary_filter']		= $this->arrmixFilter;
        $this->arrmixTemplateParams['note_types']   = $this->rekeyObjects( 'id', CNoteTypes::getInstance()->fetchNoteTypesByIds( [ CNoteTypes::LESSON, CNoteTypes::PRACTICAL ] ) );
        $this->arrmixTemplateParams['instructors']	= $this->rekeyObjects( 'tid', CTeachers::getInstance()->fetchAllTeachers() );
        
        $this->renderPage( 'daily_diary/view_daily_diary.php' );
    }
    
    public function displayAddNotes() {
        
    	$this->arrmixTemplateParams['note']				= $this->objNote;
        $this->arrmixTemplateParams['note_types']       = CNoteTypes::getInstance()->fetchNoteTypesByIds( [ CNoteTypes::LESSON, CNoteTypes::PRACTICAL ] );
        
        $this->renderPage( 'daily_diary/add_notes.php' );
    }
    
    public function displayPrintView() {
    	
    	global $wpsp_settings_data;
    	
    	$this->arrmixTemplateParams['batches']			= $this->rekeyObjects( 'id', CBatches::getInstance()->fetchAllBatches() );
    	$this->arrmixTemplateParams['trades']			= $this->arrobjTrades;
    	$this->arrmixTemplateParams['units']			= $this->arrobjUnits;
    	$this->arrmixTemplateParams['lesson_notes']		= $this->rekeyObjects( 'note_date', $this->arrobjLessonNotes );
    	$this->arrmixTemplateParams['practical_notes']	= $this->rekeyObjects( 'note_date', $this->arrobjPracticalNotes );
    	$this->arrmixTemplateParams['filter']			= $this->arrmixFilter;
    	$this->arrmixTemplateParams['instructor']		= $this->objInstructor;
    	$this->arrmixTemplateParams['iti_name']         = isset( $wpsp_settings_data['sch_name'] ) && !empty( $wpsp_settings_data['sch_name'] ) ? $wpsp_settings_data['sch_name'] : __( 'ITIMS','WPSchoolPress' );
    	
    	$this->renderPage( 'daily_diary/print_daily_diary.php' );
    }
    
}

( new CDailyDiaryManager() )->run();