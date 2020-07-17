<?php

class CUser extends CModel {
    
    public $intUserId;
    public $objTeacher;
    public $objStudent;
    
    public $strRole;
    public function __construct() {
        parent::__construct();

    }
    
    public function setUserId( $intUserId ) {
        $this->intUserId = $intUserId;
    }
    
    public function setTeacher( $objTeacher ) {
        $this->objTeacher = $objTeacher;
    }
    
    public function setStudent( $objStudent ) {
    	$this->objStudent = $objStudent;
    }
    
    public function setRole( $strRole ) {
        $this->strRole = $strRole;
    }
    
    public function getUserId() {
        return $this->intUserId;
    }
    
    public function getTeacher() {
        return $this->objTeacher;
    }
    
    public function getStudent() {
    	return $this->objStudent;
    }
    
    public function getRole() {
        return $this->strRole;
    }
        
}

