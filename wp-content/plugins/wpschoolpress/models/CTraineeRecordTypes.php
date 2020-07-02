<?php

class CTraineeRecordTypes extends CModel {
    
    protected static $_INSTANCE;
    
    const DAILY_DIARY       = 1;
    const DRAFTING_BOOK     = 2;
    const THEORY_FILE       = 3;
    const JOB_SHEET_BOOK    = 4;  
    const ASSIGNMENT_BOOK   = 5;
    const PRACTICLE_BOOK    = 6;
    const DRAWING_BOOK      = 7;
    const WSC_NOTEBOOK      = 8;
    const WSC_ASSIGNMENT    = 9;
    const PROGRESS          = 10;
    
    public function __construct() {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_trainee_record_type';
    }
    
    public static function getInstance() {
        if( true == is_object( self::$_INSTANCE ) ) {
            return self::$_INSTANCE;
        }
        
        return  self::$_INSTANCE = new self();
    }
    
    public function insert( $arrmixTraineeRecordType ) {
        if( false != $this->objDatabase->insert( $this->strTableName, $arrmixTraineeRecordType ) ) {
            return $this->objDatabase->insert_id;
        }
        return false;
    }
    
    public function fetchAllTraineeRecordTypes() {
        $strSql = 'SELECT * FROM ' . $this->strTableName . ' ORDER BY id ASC';
        return $this->objDatabase->get_results( $strSql );
    }
    
}

