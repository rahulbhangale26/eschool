<?php

class CSubjects extends CModel {
    public $strTableName;
    
    public function __construct( ) {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_subject';
    }
}

