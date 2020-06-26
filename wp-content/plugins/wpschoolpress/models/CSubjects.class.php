<?php

class CSubjects extends CModel {
    public $strTableName;
    
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
    
}

