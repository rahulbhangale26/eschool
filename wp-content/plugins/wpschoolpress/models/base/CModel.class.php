<?php

class CModel {

    protected $objDatabase;
    protected $strTablePrefix;
    
    public function __construct() {
        global $wpdb;
        $this->objDatabase = $wpdb;
        $this->strTablePrefix = $wpdb->prefix;
    }
}

