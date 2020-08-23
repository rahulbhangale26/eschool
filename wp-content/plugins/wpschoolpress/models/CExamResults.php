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
	
	public function fetchExamResultsByUnitIdByStudentId( $intUnitId, $intStudentId ) {
	    $strSql = 'SELECT 
                        er.* 
                    FROM 
                        ' . $this->strTableName . ' er 
                        JOIN ' . CExams::getInstance()->strTableName . ' e ON e.id = er.exam_id 
                    WHERE
                        er.student_id = ' . ( int ) $intStudentId . '
                        AND e.unit_id = ' . ( int ) $intUnitId;
	    
	    return $this->getResults( $strSql );
	}
	
	public function fetchQuarterlyAvgExamResultsByUnitIdByStudentId( $intUnitId, $intStudentId ) {
	    $strSql = 'SELECT
                        AVG( er.obtained_marks ) AS obtained_marks,
                        er.subject_id,
                        CASE 
                            WHEN MONTH( e.start_date ) IN( 08, 09, 10 ) THEN 1
                            WHEN MONTH( e.start_date ) IN( 11, 12, 01 ) THEN 2
                            WHEN MONTH( e.start_date ) IN( 02, 03, 04 ) THEN 3
                            ELSE 4 
                        END AS quarter
                    FROM
                        ' . $this->strTableName . ' er
                        JOIN ' . CExams::getInstance()->strTableName . ' e ON e.id = er.exam_id
                    WHERE
                        er.student_id = ' . ( int ) $intStudentId . '
                        AND e.unit_id = ' . ( int ) $intUnitId . '
                    GROUP BY
                         CASE 
                            WHEN MONTH( e.start_date ) IN( 08, 09, 10 ) THEN 1
                            WHEN MONTH( e.start_date ) IN( 11, 12, 01 ) THEN 2
                            WHEN MONTH( e.start_date ) IN( 02, 03, 04 ) THEN 3
                            ELSE 4 
                        END,
                        er.subject_id';
	    
	    return $this->getResults( $strSql );
	}
	
}
	