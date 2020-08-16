<?php

class CModel extends CAbstractModel {

    protected $objDatabase;
    protected $strTableName;   
    protected $strTablePrefix;
    
    public function __construct() {
        global $wpdb;
        $this->objDatabase = $wpdb;
        $this->strTablePrefix = $wpdb->prefix;
    }
    
    public static function getInstance() {
        
    }
    
    public function insert( $arrmixInsertFields ) {
    	if( false != $this->objDatabase->insert( $this->strTableName, $arrmixInsertFields ) ) {
    		return $this->objDatabase->insert_id;
    	}
    	return false;
    }
    
    public function update( $arrstrUpdatedFields, $arrstrWhereFields ) {
    	return $this->objDatabase->update( $this->strTableName, $arrstrUpdatedFields, $arrstrWhereFields );
    }
    
    public function delete( $arrstrWhere ) {
    	return $this->objDatabase->delete( $this->strTableName, $arrstrWhere );
    }
    
    public function getResults( $strSql ) {
    	return $this->objDatabase->get_results( $strSql );
    }
    
    
}

