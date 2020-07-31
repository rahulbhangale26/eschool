<?php

class CAttendance extends CModel {
    
    public $strTableName = '';
    
    public function __construct() {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_attendance';
    }
    
    public function fetchAttendanceByMonthByYearByUnitId( $intMonthNumber, $intYear, $intUnitId  ) {
        $strSql = 'SELECT 
	                   s.s_rollno,
                        GROUP_CONCAT( ( CASE
    	                   WHEN a.absents LIKE CONCAT( \'%\', s.wp_usr_id ,\'%\' ) THEN \'A\' 
                           WHEN a.sick_leave LIKE CONCAT(\'%\', s.wp_usr_id, \'%\' ) THEN \'SL\' 
                           WHEN a.casual_leave LIKE CONCAT(\'%\', s.wp_usr_id, \'%\' ) THEN \'CL\' 
                           WHEN a.special_leave LIKE CONCAT(\'%\', s.wp_usr_id, \'%\' ) THEN \'SPL\' 
                           ELSE \'P\'
                        END ) ORDER BY a.date ) AS attendances_by_dates,
                        GROUP_CONCAT( DAY(a.date) ORDER BY a.date ) AS dates
                    FROM iti_wpsp_student s
						JOIN ' . CStudentUnits::getInstance()->strTableName . ' su ON su.student_id = s.sid
                        LEFT JOIN iti_wpsp_attendance a ON su.unit_id = a.unit_id
                    WHERE
                       	su.unit_id = ' . ( int ) $intUnitId . '
                        AND MONTH( a.date ) = ' .  $intMonthNumber . '
                        AND YEAR( a.date ) = ' .  $intYear . '
                    GROUP BY s.s_rollno';
       
       return $this->objDatabase->get_results( $strSql );
    }
    
}

