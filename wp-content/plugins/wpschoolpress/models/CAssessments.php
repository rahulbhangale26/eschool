<?php
class CAssessments extends CModel {

	protected static $_INSTANCE;
	
	public function __construct() {
		parent::__construct();
		$this->strTableName = $this->strTablePrefix . 'wpsp_assessments';
	}
	
	public static function getInstance() {
		if( true == is_object( self::$_INSTANCE ) ) {
			return self::$_INSTANCE;
		}
		
		return  self::$_INSTANCE = new self();
	}
	
	public function fetchAllAssessments() {
		$strSql = 'SELECT * FROM ' . $this->strTableName . '';
		return $this->getResults( $strSql );
	}
	
	public function fetchParentAssessments() {
		$strSql = 'SELECT * FROM ' . $this->strTableName . ' WHERE assessment_id = 0';
		return $this->getResults( $strSql );
	}
	
	public function fetchSiblingAssessments( $intAssessmentId ) {
		$strSql = 'SELECT * FROM ' . $this->strTableName . ' WHERE assessment_id = ' . ( int ) $intAssessmentId;
		return $this->getResults( $strSql );
	}
	
	public function fetchAssessmentById( $intId ) {
		$strSql = 'SELECT * FROM ' . $this->strTableName . ' WHERE id = ' . ( int ) $intId;
		return array_pop( $this->getResults( $strSql ) );
	}
	
}