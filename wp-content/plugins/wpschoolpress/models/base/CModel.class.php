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
    
    
}

