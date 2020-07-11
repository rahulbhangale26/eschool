<?php

class CJobMarks extends CModel {
    
    protected static $_INSTANCE;
    
    public function __construct() {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_job_marks';
    }
    
    public static function getInstance() {
        if( true == is_object( self::$_INSTANCE ) ) {
            return self::$_INSTANCE;
        }
        
        return  self::$_INSTANCE = new self();
    }
    
    public function insert( $arrmixJobMarks ) {
        if( false != $this->objDatabase->insert( $this->strTableName, $arrmixJobMarks ) ) {
            return $this->objDatabase->insert_id;
        }
        return false;
    }
    
    public function delete( $arrmixWhere ) {
        return $this->objDatabase->delete( $this->strTableName, $arrmixWhere );
    }
    
    public function fetchJobMarksByStudentIdByJobId( $intStudentId, $intJobId ) {
        return $this->objDatabase->get_results( ' SELECT * FROM ' . $this->strTableName . ' WHERE student_id = ' . ( int ) $intStudentId . ' AND job_id = ' . ( int ) $intJobId );
    }
    
}
