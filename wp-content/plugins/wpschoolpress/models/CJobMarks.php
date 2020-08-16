
<?php

class CJobMarks extends CModel {
    
    protected static $_INSTANCE;
    
    public function __construct() {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_job_marks';
    }
    
    public static function getInstance() {
        if( true == is_object( self::$_INSTANCE ) ) {
            return self::$_INSTANCE;
        }
        
        return  self::$_INSTANCE = new self();
    }
    
    public function insert( $arrmixJobMarks ) {
        if( false != $this->objDatabase->insert( $this->strTableName, $arrmixJobMarks ) ) {
            return $this->objDatabase->insert_id;
        }
        return false;
    }
    
    public function delete( $arrmixWhere ) {
        return $this->objDatabase->delete( $this->strTableName, $arrmixWhere );
    }
    
    public function fetchJobMarksByJobId( $intJobId ) {
    	return $this->objDatabase->get_results( ' SELECT * FROM ' . $this->strTableName . ' WHERE job_id = ' . ( int ) $intJobId );
    }
    
    public function fetchJobMarksByStudentIdByJobId( $intStudentId, $intJobId ) {
        return $this->objDatabase->get_results( ' SELECT * FROM ' . $this->strTableName . ' WHERE student_id = ' . ( int ) $intStudentId . ' AND job_id = ' . ( int ) $intJobId );
    }
    
    public function fetchJobMarksByStudentIdsByJobId( $arrintStudentIds, $intJobId ) {
        
        if( 0 >= count( $arrintStudentIds ) ) return [];
        
        $strSql = 'SELECT
                        *
                    FROM
                        ' . $this->strTableName . '
                    WHERE
                        student_id IN ( ' . implode( ',', $arrintStudentIds ) . ' )
                        AND job_id = ' . ( int ) $intJobId;
        
        return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchProgressDetailsByStudentId( $intStudentId ) {
    	$strSql = 'SELECT
						jm.job_id,
						j.number,
						j.title,
						SUM(
							CASE
								WHEN jm.job_evaluation_type_id IN (' . implode( ',', [ CJobEvaluationTypes::SKILLS, CJobEvaluationTypes::GRADES ] ) .' ) THEN jm.obtained_marks
								WHEN jm.job_evaluation_type_id = ' . CJobEvaluationTypes::EXTRA_TIME_DEDUCTION . ' THEN -1 * jm.obtained_marks
								ELSE 0
							END
						) AS total_marks,
						MAX( 
							CASE
								WHEN jm.job_evaluation_type_id = ' . CJobEvaluationTypes::REMARK . ' THEN jm.remark ELSE NULL 
							END
						 ) AS remark,
						j.start_date 
					FROM
						' . $this->strTableName . ' jm
						JOIN ' . CJobs::getInstance()->strTableName . ' j ON j.id = jm.job_id
					WHERE
						jm.student_id = ' . ( int ) $intStudentId . '
					GROUP BY jm.job_id';
    	
    	return $this->objDatabase->get_results( $strSql );
    }
    
}
