<?php

class CNotes extends CModel {
    
    protected static $_INSTANCE;
    
    public function __construct() {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_notes';
    }
    
    public static function getInstance() {
        if( true == is_object( self::$_INSTANCE ) ) {
            return self::$_INSTANCE;
        }
        
        return  self::$_INSTANCE = new self();
    }
    
    public function insert( $arrmixNote ) {
        if( false != $this->objDatabase->insert( $this->strTableName, $arrmixNote ) ) {
            return $this->objDatabase->insert_id;
        }
        return false;
    }
    
    public function update( $arrmixFieldsToUpdate, $arrstrWhere ) {
    	return $this->objDatabase->update( $this->strTableName, $arrmixFieldsToUpdate, $arrstrWhere );
    }
    
    public function delete( $arrstrWhere ) {
    	return $this->objDatabase->delete( $this->strTableName, $arrstrWhere );
    }
    
    public function fetchNoteById( $intNoteId ) {
    	
    	$strSql = 'SELECT * FROM ' . $this->strTableName . ' WHERE id = ' . ( int ) $intNoteId;

    	return array_pop( $this->objDatabase->get_results( $strSql ) );
    }
    
    public function fetchNotesByFilter( $arrmixFilter ) {
    	
    	$strSql = 'SELECT 
						* 
					FROM 
						' . $this->strTableName . '
					WHERE
						created_on BETWEEN \'' . date( 'Y-m-d', strtotime( $arrmixFilter['start_date'] ) ) . ' 00:00:00\' AND \'' . date( 'Y-m-d', strtotime( $arrmixFilter['end_date'] ) ) . ' 23:59:59\'';
    	    	
        return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchNotesByInstructorIdByFilter( $intInstructorId, $arrmixFilter ) {
    	$strSql = 'SELECT 
						*
					FROM 
						' . $this->strTableName .' 
					WHERE 
						instructor_id = ' . ( int ) $intInstructorId . '
						AND created_on BETWEEN \'' . date( 'Y-m-d', strtotime( $arrmixFilter['start_date'] ) ) . ' 00:00:00\' AND \'' . date( 'Y-m-d', strtotime( $arrmixFilter['end_date'] ) ) . ' 23:59:59\'';
    	
    	return $this->objDatabase->get_results( $strSql );
    }
       
}