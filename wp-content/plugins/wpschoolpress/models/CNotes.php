<?php

class CNotes extends CModel {
    
    protected static $_INSTANCE;
    
    public function __construct() {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_notes';
    }
    
    public static function getInstance() {
        if( true == is_object( self::$_INSTANCE ) ) {
            return self::$_INSTANCE;
        }
        
        return  self::$_INSTANCE = new self();
    }
    
    public function insert( $arrmixNote ) {
        if( false != $this->objDatabase->insert( $this->strTableName, $arrmixNote ) ) {
            return $this->objDatabase->insert_id;
        }
        return false;
    }
    
    public function fetchAllNotes() {
        return $this->objDatabase->get_results( 'SELECT * FROM ' . $this->strTableName );
    }
    
    public function fetchNotesByInstructorId( $intInstructorId ) {
        return $this->objDatabase->get_results( 'SELECT * FROM ' . $this->strTableName .' WHERE instructor_id = ' . ( int ) $intInstructorId );
    }
       
}