<?php

class CTraineeAttendances extends CModel {
    
    public $strTableName;
    
    protected static $_INSTANCE;
    
    public function __construct( ) {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_trainee_attendances';
    }
    
    public static function getInstance() {
        if( true == is_object( self::$_INSTANCE ) ) {
            return self::$_INSTANCE;
        }
        
        return  self::$_INSTANCE = new self();
    }
    
    public function insert( $arrmixAttendance ) {
                
        if( false != $this->objDatabase->insert( $this->strTableName, $arrmixAttendance ) ) {
            return $this->objDatabase->insert_id;
        }
        return false;
    }
    
    public function fetchAttendancesByBatchIdByAttendanceDate( $intBatchId, $strAttendanceDate ) {
        $strSql = 'SELECT
                        ta.*
                    FROM
                        ' . $this->strTableName . ' ta 
                        JOIN ' . CStudents::getInstance()->strTableName . ' s ON s.sid = ta.student_id 
                    WHERE
                        s.batch_id = ' . ( int ) $intBatchId . '
                        AND CAST( ta.attendance_date AS DATE ) = \'' . $strAttendanceDate . '\'';
        
        return $this->objDatabase->get_results( $strSql );
    }
    
    public function deleteAttendancesBYTradeIdByBatchIdByInstructorIdByAttendanceDate( $intTradeId, $intBatchId, $intInstructorId, $strAttendanceDate ) {
      $strSql = 'DELETE
                        ta 
                    FROM 
                        ' . $this->strTableName . ' ta 
                        JOIN ' . CStudents::getInstance()->strTableName . ' s ON s.sid = ta.student_id 
                    WHERE 
                        s.batch_id = ' . ( int ) $intBatchId . '
                        AND s.trade_id = ' . ( int ) $intTradeId . '
                        AND ta.instructor_id = ' . ( int ) $intInstructorId . '
                        AND CAST( ta.attendance_date AS DATE)= \'' . $strAttendanceDate . '\'';

      
        return $this->objDatabase->query( $strSql );
                        
    }
    
    public function fetchGroupedTraineeAttendanceByInstructorId( $intInstructorId, $arrstrFilter ) {
        
        if( false == isset( $arrstrFilter['start_date'] ) ) return [];
        if( false == isset( $arrstrFilter['end_date'] ) ) return [];
        if( false == isset( $arrstrFilter['unit_id'] ) ) return [];
        
        $strSql = 'SELECT
                        ta.attendance_date,
                        ta.instructor_id,
                        s.trade_id,
                        s.batch_id,
                        su.unit_id
                    FROM 
                        ' . $this->strTableName . ' ta
						JOIN ' . CStudentUnits::getInstance()->strTableName . ' su ON su.student_id = ta.student_id
                        JOIN  ' . CStudents::getInstance()->strTableName . ' s ON s.sid = ta.student_id 
                    WHERE
                        ta.instructor_id = ' . ( int ) $intInstructorId . '
                        AND CAST( ta.attendance_date AS date ) BETWEEN \'' . $arrstrFilter['start_date'] . '\' AND \'' . $arrstrFilter['end_date'] . '\'
						AND su.unit_id = ' . ( int ) $arrstrFilter['unit_id'] . '
                    GROUP By
                        ta.attendance_date, su.unit_id
                    ORDER BY ta.attendance_date DESC';
        
        return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchGroupedTraineeAttendance( $arrstrFilter ) {
        
        if( false == isset( $arrstrFilter['start_date'] ) ) return [];
        if( false == isset( $arrstrFilter['end_date'] ) ) return [];
        if( false == isset( $arrstrFilter['unit_id'] ) ) return [];
        
        $strSql = 'SELECT
                        ta.attendance_date,
                        ta.instructor_id,
                        s.trade_id,
                        s.batch_id,
                        su.unit_id
                    FROM
                        ' . $this->strTableName . ' ta
						JOIN ' . CStudentUnits::getInstance()->strTableName . ' su ON su.student_id = ta.student_id
                        JOIN  ' . CStudents::getInstance()->strTableName . ' s ON s.sid = ta.student_id
                    WHERE
                        CAST( ta.attendance_date AS date ) BETWEEN \'' . $arrstrFilter['start_date'] . '\' AND \'' . $arrstrFilter['end_date'] . '\'
						AND su.unit_id = ' . ( int ) $arrstrFilter['unit_id'] . '
                    GROUP By
                        ta.attendance_date, su.unit_id
                    ORDER BY ta.attendance_date DESC';
        
        return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchAttendancesByBatchIdByTradeIdByUnitIdByMonthByYear( $intBatchId, $intTradeId, $intUnitId, $intInstructorId, $strAttendanceDate, $intMonth, $intYear ) {
        $strSql = 'SELECT
                        ta.*,
                        DAY( ta.attendance_date ) AS attendance_day,
                        s.trade_id,
                        s.batch_id,
                        su.unit_id
                    FROM
                        ' . $this->strTableName . ' ta
						JOIN ' . CStudentUnits::getInstance()->strTableName . ' su ON su.student_id = ta.student_id
                        JOIN  ' . CStudents::getInstance()->strTableName . ' s ON s.sid = ta.student_id
                        JOIN ' . CAttendanceTypes::getInstance()->strTableName . ' at ON at.id = ta.attendance_type_id 
                    WHERE
                        s.batch_id = ' . ( int ) $intBatchId . '
                        AND s.trade_id = ' . ( int ) $intTradeId . '
                        AND su.unit_id = ' . ( int ) $intUnitId . '
						AND ta.instructor_id = ' . ( int ) $intInstructorId . '
                        AND MONTH( ta.attendance_date )  = ' . ( int ) $intMonth . '
                        AND YEAR( ta.attendance_date ) = ' . ( int ) $intYear;
        
        return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchSummaryAttendancesByBatchIdByTradeIdByUnitIdByMonthByYear( $intBatchId, $intTradeId, $intUnitId, $intInstructorId, $strAttendanceDate, $intMonth, $intYear ) {
        $strSql = 'SELECT
                        DAY( ta.attendance_date ),
                        ta.student_id,
                        SUM( CASE
                                    WHEN ta.attendance_type_id = 1 THEN 1 ELSE 0 
                                END
                        ) AS present_count,

                        SUM( CASE
                                    WHEN ta.attendance_type_id = 2 THEN 1 ELSE 0 
                                END
                        ) AS absent_count,

                        SUM( CASE
                                    WHEN ta.attendance_type_id = 3 THEN 1 ELSE 0 
                                END
                        ) AS sl_count,

                        SUM( CASE
                                    WHEN ta.attendance_type_id = 4 THEN 1 ELSE 0 
                                END
                        ) AS cl_count, 
                        SUM( CASE
                                    WHEN ta.attendance_type_id = 5 THEN 1 ELSE 0 
                                END
                        ) AS spl_count, 
                        COUNT( ta.id ) AS total_working_day_count
                    FROM
                        ' . $this->strTableName . ' ta
						JOIN ' . CStudentUnits::getInstance()->strTableName . ' su ON su.student_id = ta.student_id
                        JOIN  ' . CStudents::getInstance()->strTableName . ' s ON s.sid = ta.student_id
                        JOIN ' . CAttendanceTypes::getInstance()->strTableName . ' ats ON ats.id = ta.attendance_type_id
                    WHERE
                        s.batch_id = ' . ( int ) $intBatchId . '
                        AND s.trade_id = ' . ( int ) $intTradeId . '
                        AND su.unit_id = ' . ( int ) $intUnitId . '
						AND ta.instructor_id = ' . ( int ) $intInstructorId . '
                        AND MONTH( ta.attendance_date )  = ' . ( int ) $intMonth . '
                        AND YEAR( ta.attendance_date ) = ' . ( int ) $intYear . '
                    GROUP BY
                        ta.student_id';
        
        return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchTotalSummaryAttendancesByBatchIdByTradeIdByUnitIdByMonthByYear( $intBatchId, $intTradeId, $intUnitId, $intInstructorId, $strAttendanceDate, $intMonth, $intYear ) {
        if( 7 < $intMonth ) {
            $intStartYear = $intYear;
        } else {
        	$intStartYear = $intYear - 1;
        }

        $strSql = 'SELECT
                        DAY( ta.attendance_date ),
                        ta.student_id,
                        SUM( CASE
                                    WHEN ta.attendance_type_id = 1 THEN 1 ELSE 0
                                END
                        ) AS present_count,
            
                        SUM( CASE
                                    WHEN ta.attendance_type_id = 2 THEN 1 ELSE 0
                                END
                        ) AS absent_count,
            
                        SUM( CASE
                                    WHEN ta.attendance_type_id = 3 THEN 1 ELSE 0
                                END
                        ) AS sl_count,
            
                        SUM( CASE
                                    WHEN ta.attendance_type_id = 4 THEN 1 ELSE 0
                                END
                        ) AS cl_count,
                        SUM( CASE
                                    WHEN ta.attendance_type_id = 5 THEN 1 ELSE 0
                                END
                        ) AS spl_count,
                        COUNT( ta.id ) AS total_working_day_count
                    FROM
                        ' . $this->strTableName . ' ta
						JOIN ' . CStudentUnits::getInstance()->strTableName . ' su ON su.student_id = ta.student_id
                        JOIN  ' . CStudents::getInstance()->strTableName . ' s ON s.sid = ta.student_id
                        JOIN ' . CAttendanceTypes::getInstance()->strTableName . ' ats ON ats.id = ta.attendance_type_id
                    WHERE
                        s.batch_id = ' . ( int ) $intBatchId . '
                        AND s.trade_id = ' . ( int ) $intTradeId . '
                        AND su.unit_id = ' . ( int ) $intUnitId . '
						AND ta.instructor_id = ' . ( int ) $intInstructorId . '
                        AND CAST( ta.attendance_date AS DATE ) BETWEEN \'' . $intStartYear . '-08-01\' AND \'' . $intYear . '-' . ( $intMonth - 1 ). '-31\'
                    GROUP BY
                        ta.student_id';
        
        return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchDailyAttendanceStatByBatchIdByTradeIdByUnitIdByMonthByYear( $intBatchId, $intTradeId, $intUnitId, $intInstructorId, $strAttendanceDate, $intMonth, $intYear ) {
        $strSql = 'SELECT
                        DAY( ta.attendance_date ) AS attendance_date,
                        SUM( CASE
                                    WHEN ta.attendance_type_id = 1 THEN 1 ELSE 0 
                                END
                        ) AS daily_present_count,

                        SUM( CASE
                                    WHEN ta.attendance_type_id = 2 THEN 1 ELSE 0 
                                END
                        ) AS daily_absent_count,

                        SUM( CASE
                                    WHEN ta.attendance_type_id = 3 THEN 1 ELSE 0 
                                END
                        ) AS daily_sl_count,

                        SUM( CASE
                                    WHEN ta.attendance_type_id = 4 THEN 1 ELSE 0 
                                END
                        ) AS daily_cl_count, 
                        SUM( CASE
                                    WHEN ta.attendance_type_id = 5 THEN 1 ELSE 0 
                                END
                        ) AS daily_spl_count
                    FROM
                        ' . $this->strTableName . ' ta
						JOIN ' . CStudentUnits::getInstance()->strTableName . ' su ON su.student_id = ta.student_id
                        JOIN  ' . CStudents::getInstance()->strTableName . ' s ON s.sid = ta.student_id
                        JOIN ' . CAttendanceTypes::getInstance()->strTableName . ' ats ON ats.id = ta.attendance_type_id
                    WHERE
                        s.batch_id = ' . ( int ) $intBatchId . '
                        AND s.trade_id = ' . ( int ) $intTradeId . '
                        AND su.unit_id = ' . ( int ) $intUnitId . '
						AND ta.instructor_id = ' . ( int ) $intInstructorId . '
                        AND MONTH( ta.attendance_date )  = ' . ( int ) $intMonth . '
                        AND YEAR( ta.attendance_date ) = ' . ( int ) $intYear . '
                    GROUP BY
                        DAY( ta.attendance_date )';
        
        return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchQuarterlyAttendanceReport( $strStartDate, $strEndDate, $intStudentId ) {
       $strSql = 'SELECT
                        COUNT( ta.id ) AS possible_days,
                        SUM( CASE
                                    WHEN ta.attendance_type_id = 1 THEN 1 ELSE 0 
                                END
                        ) AS present_counts,
                        CASE 
                            WHEN MONTH( ta.attendance_date ) IN( 08, 09, 10 ) THEN 1
                            WHEN MONTH( ta.attendance_date ) IN( 11, 12, 01 ) THEN 2
                            WHEN MONTH( ta.attendance_date ) IN( 02, 03, 04 ) THEN 3
                            ELSE 4 
                        END AS quarter
                    FROM 
                        ' . $this->strTableName . ' ta
                    WHERE
                        ta.attendance_date BETWEEN \'' . $strStartDate . '\' AND \'' . $strEndDate . '\'
                        AND ta.student_id = ' . ( int ) $intStudentId . '
                    GROUP BY
                        CASE 
                            WHEN MONTH( ta.attendance_date ) IN( 08, 09, 10 ) THEN 1
                            WHEN MONTH( ta.attendance_date ) IN( 11, 12, 01 ) THEN 2
                            WHEN MONTH( ta.attendance_date ) IN( 02, 03, 04 ) THEN 3
                            ELSE 4 
                        END';
       
        return $this->getResults( $strSql );
    }
}

