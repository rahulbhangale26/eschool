<?php

class CTraineeRecords extends CModel {
    
    protected static $_INSTANCE;
    
    public function __construct() {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_trainee_records';
    }
    
    public static function getInstance() {
        if( true == is_object( self::$_INSTANCE ) ) {
            return self::$_INSTANCE;
        }
        
        return  self::$_INSTANCE = new self();
    }
    
    public function insert( $arrmixTraineeRecord ) {
        if( false != $this->objDatabase->insert( $this->strTableName, $arrmixTraineeRecord ) ) {
            return $this->objDatabase->insert_id;
        }
        return false;
    }
    
    public function delete( $arrmixTraineeRecords ) {
        return $this->objDatabase->delete( $this->strTableName, $arrmixTraineeRecords );
    }
    
    public function fetchTraineeRecordsByCheckedOnByInstructorId( $strCheckedOn, $intInstructorId ) {
        return $this->objDatabase->get_results( 'SELECT * FROM ' . $this->strTableName . ' WHERE instructor_id = ' . ( int ) $intInstructorId . ' AND CAST( checked_on AS DATE )  = \'' . $strCheckedOn . '\'');
    }
    
    public function fetchTraineeRecordsByUnitIdByMonthByYear( $intUnitId, $intMonth, $intYear ) {
        
        $strSql = 'SELECT
                        tr.*
                    FROM
                        ' . $this->strTableName . ' tr 
                        JOIN ' . CTraineeRecordTypes::getInstance()->strTableName . ' trt ON trt.id = tr.trainee_record_type_id 
                        JOIN ' . CStudents::getInstance()->strTableName . ' s ON s.sid = tr.student_id 
                    WHERE
                        MONTH( tr.checked_on ) = ' . ( int ) $intMonth . '
                        AND YEAR( tr.checked_on ) = ' . ( int ) $intYear . '
                        AND s.current_unit_id = ' . ( int ) $intUnitId . '    
                    ORDER BY s.sid ASC';
        
        return $this->objDatabase->get_results( $strSql );
        
    }
    
    public function fetchDailyGroupedTraineeRecords() {
        $strSql = 'SELECT 
	                   tr.checked_on, 
                       tr.instructor_id,
                       s.trade_id ,
                       s.current_unit_id AS unit_id,
                       s.batch_id
                    FROM
	                   iti_wpsp_trainee_records tr
                        JOIN iti_wpsp_trainee_record_type trt ON trt.id = tr.trainee_record_type_id
                        JOIN iti_wpsp_student s ON s.sid = tr.student_id
                    GROUP BY
	                    tr.checked_on, tr.instructor_id, s.trade_id, s.current_unit_id
                    ORDER BY
	                    tr.checked_on DESC';
        
        return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchDailyGroupedTraineeRecordsByInstructorId( $intInstructorId ) {
        $strSql = 'SELECT
	                   tr.checked_on,
                       tr.instructor_id,
                       s.trade_id ,
                       s.current_unit_id AS unit_id,
                       s.batch_id
                    FROM
	                   iti_wpsp_trainee_records tr
                        JOIN iti_wpsp_trainee_record_type trt ON trt.id = tr.trainee_record_type_id
                        JOIN iti_wpsp_student s ON s.sid = tr.student_id
                    WHERE
                        tr.instructor_id = ' . ( int ) $intInstructorId . '
                    GROUP BY
	                    tr.checked_on, tr.instructor_id, s.trade_id, s.current_unit_id
                    ORDER BY
                        tr.checked_on DESC';
        
        return $this->objDatabase->get_results( $strSql );
    }
    
}

