<?php

class CSubjectInstructors extends CModel {
    
    public $strTableName;
    
    public function __construct( ) {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_subject_instructors';
    }
    
    public static function getInstance() {
        if( true == is_object( self::$_INSTANCE ) ) {
            return self::$_INSTANCE;
        }
        
        return  self::$_INSTANCE = new self();
    }
    
    public function insert( $arrmixSubject ) {
        return $this->objDatabase->insert( $this->strTableName, $arrmixSubject );
    }
    
    
    
}

