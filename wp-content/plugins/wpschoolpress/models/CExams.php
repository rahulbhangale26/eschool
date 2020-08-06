<?php
class CExams extends CModel {

	protected static $_INSTANCE;
	
	public function __construct() {
		parent::__construct();
		$this->strTableName = $this->strTablePrefix . 'wpsp_exams';
	}
	
	public static function getInstance() {
		if( true == is_object( self::$_INSTANCE ) ) {
			return self::$_INSTANCE;
		}
		
		return  self::$_INSTANCE = new self();
	}
	
	public function insert( $arrmixExam ) {
		if( false != $this->objDatabase->insert( $this->strTableName, $arrmixExam ) ) {
			return $this->objDatabase->insert_id;
		}
		return false;
	}
	
	public function update( $arrstrFields, $arrstrWhere ) {
		return $this->objDatabase->update( $this->strTableName, $arrstrFields, $arrstrWhere );
	}
	
	public function fetchExamById( $intExamId ) {
		
		$strSql = 'SELECT
						*
					FROM
						' . $this->strTableName . ' e
					WHERE
						id = ' . ( int ) $intExamId;
		
		return array_pop( $this->objDatabase->get_results( $strSql ) );
	}
	
	public function fetchExamsByUnitId( $intUnitId ) {
		$strSql = 'SELECT * FROM ' . $this->strTableName . ' WHERE unit_id = ' . $intUnitId;
		
		return $this->objDatabase->get_results( $strSql );
	}
}