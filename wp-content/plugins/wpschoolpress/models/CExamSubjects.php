<?php
class CExamSubjects extends CModel {

	protected static $_INSTANCE;
	
	public function __construct() {
		parent::__construct();
		$this->strTableName = $this->strTablePrefix . 'wpsp_exam_subjects';
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
	
	public function fetchExamSubjectsByExamId( $intExamId ) {
		$strSql = 'SELECT * FROM ' . $this->strTableName . ' WHERE exam_id = ' . $intExamId;
		return $this->objDatabase->get_results( $strSql );
	}
	
	public function deleteExamSubjectsByExamIdBySubjectId( $intExamId, $arrintSubjectIds ) {
	    
	    if( false == is_array( $arrintSubjectIds ) || 0 >= count( $arrintSubjectIds ) ) return [];
	    
	    $strSql = 'DELETE FROM ' . $this->strTableName . ' WHERE exam_id = ' .  ( int ) $intExamId . ' AND subject_id IN ( ' . implode( ',', $arrintSubjectIds ) . ' )';
	    return $this->objDatabase->query( $strSql );
	}
}