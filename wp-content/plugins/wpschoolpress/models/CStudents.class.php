<?php

class CStudents extends CModel {
    
    public $strTableName;
    
    public function __construct() {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_student';
    }
    
    public function fetchAllStudents() {
        return $this->objDatabase->get_results( 'SELECT * FROM ' . $this->strTableName );
    }
    
    public function fetchStudentsByUserId( $intUserId ) {
       $strSql = 'SELECT
                        *
                    FROM ' . $this->strTableName . ' s
                        JOIN ' . $this->strTablePrefix . 'wpsp_subject sb ON s.class_id LIKE CONCAT( \'%\', sb.class_id , \'%\' )
                    WHERE
                
                        sb.sub_teach_id = ' . ( int ) $intUserId; 

        return $this->objDatabase->get_results( $strSql );
                
    }
}

