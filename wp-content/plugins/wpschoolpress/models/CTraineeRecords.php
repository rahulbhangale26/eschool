<?php

class CTraineeRecords extends CModel {
    
    protected static $_INSTANCE;
    
    public function __construct() {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_trainee_records';
    }
    
    public static function getInstance() {
        if( true == is_object( self::$_INSTANCE ) ) {
            return self::$_INSTANCE;
        }
        
        return  self::$_INSTANCE = new self();
    }
    
    public function insert( $arrmixTraineeRecord ) {
        if( false != $this->objDatabase->insert( $this->strTableName, $arrmixTraineeRecord ) ) {
            return $this->objDatabase->insert_id;
        }
        return false;
    }
    
}

