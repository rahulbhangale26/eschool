<?php

class CTeachers extends CModel {
    public $strTableName;
    
    protected static $_INSTANCE;
    
    public function __construct( ) {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_teacher';
    }
    
    public static function getInstance() {
        if( true == is_object( self::$_INSTANCE ) ) {
            return self::$_INSTANCE;
        }
        
        return  self::$_INSTANCE = new self();
    }
        
    public function fetchTeacherByUserId( $intUserId ) {
        $strSql = 'SELECT * FROM ' . $this->strTableName . ' WHERE wp_usr_id = ' . ( int ) $intUserId;
        $arrobjTeachers = ( array ) $this->objDatabase->get_results( $strSql );
        return  array_pop( $arrobjTeachers );;
    }
    
    public function fetchAllTeachers() {
        return $this->objDatabase->get_results( 'SELECT * FROM ' . $this->strTableName );
    }
    
    public function fetchTeacherByUnitIdByBatchId( $intUnitId, $intBatchId ) {
        $strSql = 'SELECT 
                        * 
                    FROM 
                        ' . $this->strTableName . ' t
                        JOIN ' . CUnits::getInstance()->strTableName . ' u ON u.instructor_id = t.tid 
                    WHERE
                        u.id = ' . ( int ) $intUnitId .' 
                        AND u.batch_id = ' . ( int ) $intBatchId;
        
        return array_pop( $this->objDatabase->get_results( $strSql ) );
        
    }
    
    public function fetchTeachersByUnitId( $intUnitId ) {
        $strSql = 'SELECT
                        DISTINCT t.*
                    FROM
                        ' . $this->strTableName . ' t
                        JOIN ' . CSubjectInstructors::getInstance()->strTableName . ' si ON si.instructor_id = t.tid 
                    WHERE
                        si.unit_id = ' . ( int ) $intUnitId;
        return $this->getResults( $strSql );
    }
    
    
    public function fetchTeachersByTid( $intTid ) {
        $strSql = 'SELECT * FROM ' . $this->strTableName . ' WHERE tid = ' . ( int ) $intTid;
        return $this->objDatabase->get_results( $strSql );
    }
}

