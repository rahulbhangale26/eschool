<?php

class CAvaids extends CModel {
		
	protected static $_INSTANCE;
	
	public function __construct() {
		parent::__construct();
		$this->strTableName = $this->strTablePrefix . 'wpsp_avaids';
	}
	
	public static function getInstance() {
		if( true == is_object( self::$_INSTANCE ) ) {
			return self::$_INSTANCE;
		}
		
		return  self::$_INSTANCE = new self();
	}
	
	public function fetchAvaidById( $intId ) {
		$strSql = 'SELECT * FROM ' . $this->strTableName . ' WHERE id = ' . ( int ) $intId;
		
		return array_pop( $this->objDatabase->get_results( $strSql ) );
	}
	
	public function fetchAvaidsByUnitId( $intUnitId ) {
		$strSql = 'SELECT * FROM ' . $this->strTableName . ' WHERE unit_id = ' . ( int ) $intUnitId;

		return $this->objDatabase->get_results( $strSql );
	}
	
}

