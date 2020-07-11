<?php

class CJobEvaluationTypes extends CModel {
    
    protected $_INSTANCE;
    
    const SKILLS                    = 1;
    const GRADES                    = 2;
    const EXTRA_TIME_DEDUCTION      = 3;
    const REMARK                    = 4;
    
    public function __construct() {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_job_evaluation_types';
    }
    
    public static function getInstance() {
        if( true == is_object( self::$_INSTANCE ) ) {
            return self::$_INSTANCE;
        }
        
        return  self::$_INSTANCE = new self();
    }
    
    public function insert( $arrmixSubject ) {
        if( false != $this->objDatabase->insert( $this->strTableName, $arrmixSubject ) ) {
            return $this->objDatabase->insert_id;
        }
        return false;
    }
    
    public function fetchAllJobEvaluationTypes() {
        return $this->objDatabase->get_results( 'SELECT * FROM ' . $this->strTableName );
    }
}

