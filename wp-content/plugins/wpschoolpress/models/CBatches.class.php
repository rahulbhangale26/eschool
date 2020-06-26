<?php

class CBatches extends CModel {

    public $strTableName;
    
    protected static $_INSTANCE;
    
    public function __construct() {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_batches';
    }
    
    
    public static function getInstance() {
        if( true == is_object( self::$_INSTANCE ) ) {
            return self::$_INSTANCE;
        }
        
        return  self::$_INSTANCE = new self();
    }
    
    
    public function fetchAllBatches() {
        return $this->objDatabase->get_results( 'SELECT * FROM ' . $this->strTableName );
    }
    
    public function fetchBatchesByInstructorId( $intInstructorId ) {
        
       $strSql = 'SELECT
                        DISTINCT b.*
                    FROM ' . $this->strTableName . ' b
                        JOIN ' . CStudents::getInstance()->strTableName . ' s ON s.batch_id = b.id
                        JOIN ' . $this->strTablePrefix . 'wpsp_subject_instructors si ON si.unit_id = s.current_unit_id
                    WHERE
                        si.instructor_id = ' . ( int ) $intInstructorId;
        
        return $this->objDatabase->get_results( $strSql );
        
    }

}

