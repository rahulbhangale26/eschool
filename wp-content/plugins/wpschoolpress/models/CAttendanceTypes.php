<?php

class CAttendanceTypes extends CModel {
        
    public $strTableName;
    
    protected static $_INSTANCE;
    
    public function __construct( ) {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_attendance_types';
    }
    
    public static function getInstance() {
        if( true == is_object( self::$_INSTANCE ) ) {
            return self::$_INSTANCE;
        }
        
        return  self::$_INSTANCE = new self();
    }
    
    public function insert( $arrmixAttendanceType ) {
        if( false != $this->objDatabase->insert( $this->strTableName, $arrmixAttendanceType ) ) {
            return $this->objDatabase->insert_id;
        }
        return false;
    }
    
    public function fetchAllAttendanceTypes() {
        return $this->objDatabase->get_results( 'SELECT * FROM ' . $this->strTableName );
    }
    
}

