<?php

class CStudentUnits extends CModel {
	
	public $strTableName;
	
	protected static $_INSTANCE;
	
	public function __construct( ) {
		parent::__construct();
		$this->strTableName = $this->strTablePrefix . 'wpsp_student_units';
	}
	
	public static function getInstance() {
		if( true == is_object( self::$_INSTANCE ) ) {
			return self::$_INSTANCE;
		}
		
		return  self::$_INSTANCE = new self();
	}
	
	public function insert( $arrmixStudentUnit ) {
		if( false != $this->objDatabase->insert( $this->strTableName, $arrmixStudentUnit ) ) {
			return $this->objDatabase->insert_id;
		}
		return false;
	}
	
	public function delete( $arrstrWhere ) {
		return $this->objDatabase->delete( $this->strTableName, $arrstrWhere );
	}
	
	public function fetchStudentUnitsByStudentId( $intStudentId ) {
		$strSql = 'SELECT * FROM ' . $this->strTableName . ' WHERE student_id = ' . ( int ) $intStudentId;
		
		return  $this->objDatabase->get_results( $strSql );
	}
	
}

