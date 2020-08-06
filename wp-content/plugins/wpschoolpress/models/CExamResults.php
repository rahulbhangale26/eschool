<?php
class CExamResults extends CModel {
	
	protected static $_INSTANCE;
	
	public function __construct() {
		parent::__construct();
		$this->strTableName = $this->strTablePrefix . 'wpsp_exam_results';
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
	
	public function delete( $arrstrWhere ) {
		return $this->objDatabase->delete( $this->strTableName, $arrstrWhere );
	}
	
	public function fetchExamResultsByExamId( $intExamId ) {
		$strSql = 'SELECT *, CONCAT( student_id, \'_\', subject_id ) AS student_subject FROM ' . $this->strTableName . ' WHERE exam_id = ' . ( int ) $intExamId;
		return $this->objDatabase->get_results( $strSql );
	}
	
}
	