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
}

