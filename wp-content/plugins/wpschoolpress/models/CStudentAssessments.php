<?php
class CStudentAssessments extends CModel {
	
	protected static $_INSTANCE;
	
	public function __construct() {
		parent::__construct();
		$this->strTableName = $this->strTablePrefix . 'wpsp_student_assessments';
	}
	
	public static function getInstance() {
		if( true == is_object( self::$_INSTANCE ) ) {
			return self::$_INSTANCE;
		}
		
		return  self::$_INSTANCE = new self();
	}
	
	public function fetchStudentIdsByStudentIds( $arrintStudentIds ) {	
		if( false == is_array( $arrintStudentIds ) || 0 >= count( $arrintStudentIds ) ) return [];
		
		$strSql = 'SELECT DISTINCT student_id FROM ' . $this->strTableName . ' WHERE student_id IN ( ' . implode( ',', $arrintStudentIds ) . ' ) ';
		return $this->getResults( $strSql );
	}
	
	public function fetchStudentAssessmentsByStudentIds( $arrintStudentIds ) {
		if( false == is_array( $arrintStudentIds ) || 0 >= count( $arrintStudentIds ) ) return [];
		
		$strSql = 'SELECT * FROM ' . $this->strTableName . ' WHERE student_id IN ( ' . implode( ',', $arrintStudentIds ) . ' ) ';
		return $this->getResults( $strSql );
	}
	
}