<?php

class CTeachers extends CModel {
    public $strTableName;
    
    public function __construct( ) {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_teacher';
    }
        
    public function fetchTeacherByUserId( $intUserId ) {
        $strSql = 'SELECT * FROM ' . $this->strTableName . ' WHERE wp_usr_id = ' . ( int ) $intUserId;
        $arrobjTeachers = ( array ) $this->objDatabase->get_results( $strSql );
        return  array_pop( $arrobjTeachers );;
    }
}

