<?php

class CBatches extends CModel {

    public $strTableName;
    
    public function __construct() {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_batches';
    }
    
    public function fetchAllBatches() {
        return $this->objDatabase->get_results( 'SELECT * FROM ' . $this->strTableName );
    }

}

