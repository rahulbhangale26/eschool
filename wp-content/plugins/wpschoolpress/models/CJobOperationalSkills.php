<?php

class CJobOperationalSkills extends CModel {
    
    public $strTableName;
    
    protected static $_INSTANCE;
    
    public function __construct() {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_job_operational_skills';
    }
    
    public static function getInstance() {
        if( true == is_object( self::$_INSTANCE ) ) {
            return self::$_INSTANCE;
        }
        
        return  self::$_INSTANCE = new self();
    }
    
    public function insert( $arrmixLessonPlan ) {
        if( false != $this->objDatabase->insert( $this->strTableName, $arrmixLessonPlan ) ) {
            return $this->objDatabase->insert_id;
        }
        return false;
    }
    
    public function delete( $arrmixTraineeRecords ) {
        return $this->objDatabase->delete( $this->strTableName, $arrmixTraineeRecords );
    }
    
    public function fetchJobOperationalSkillsBYJobId( $intJobId ) {
        $strSql = 'SELECT * FROM ' . $this->strTableName . ' WHERE job_id = ' . ( int ) $intJobId . ' ORDER BY id ASC';
        
        return $this->objDatabase->get_results( $strSql );
    }
    
}

