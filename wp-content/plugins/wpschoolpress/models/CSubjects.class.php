<?php

class CSubjects extends CModel {
    public $strTableName;
    
    protected static $_INSTANCE;
    
    public function __construct( ) {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_subject';
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
    
    public function fetchSubjectsByFilter( $arrmixSubjectFilter ) {
        
        $arrstrWhere = [];
        
        if( true == isset( $arrmixSubjectFilter['trade_id'] ) ) {
            $arrstrWhere[] = ' trade_id = ' . ( int ) $arrmixSubjectFilter['trade_id'];
        }
        
        if( true == isset( $arrmixSubjectFilter['year_or_semester_no'] ) ) {
            $arrstrWhere[] = ' year_or_semester_no = ' . ( int ) $arrmixSubjectFilter['year_or_semester_no'];
        }
        
        $strSql = 'SELECT * FROM ' . $this->strTableName . (  ( true == is_array( $arrstrWhere ) && 0 < count( $arrstrWhere ) ) ? ' WHERE ' . implode( ' AND ', $arrstrWhere ) : '' );
       
        return $this->objDatabase->get_results( $strSql );
        
    }
    
    public function fetchSubjectsByUnitId( $intUnitId ) {
    	
    	$strSql = 'SELECT 
						s.* 
					FROM 
						' . $this->getInstance()->strTableName . ' s
						JOIN ' . CSubjectInstructors::getInstance()->strTableName . ' si ON si.subject_id = s.id  
					WHERE
						si.unit_id = ' . ( int ) $intUnitId ;

    	return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchSubjectsByUnitIdByInstructorId( $intUnitId, $intInstructorId ) {
    	$strSql = 'SELECT
						s.*
					FROM
						' . $this->getInstance()->strTableName . ' s
						JOIN ' . CSubjectInstructors::getInstance()->strTableName . ' si ON si.subject_id = s.id
					WHERE
						si.unit_id = ' . ( int ) $intUnitId . '
						AND si.instructor_id = ' . ( int ) $intInstructorId;
    	
    	return $this->objDatabase->get_results( $strSql );
    }
    
}

