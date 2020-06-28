<?php

class CTraineeRecordTypes extends CModel {
    
    protected static $_INSTANCE;
    
    const PROGRESS = 10;
    
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
        $strSql = 'SELECT * FROM ' . $this->strTableName;
        return $this->objDatabase->get_results( $strSql );
    }
    
}

