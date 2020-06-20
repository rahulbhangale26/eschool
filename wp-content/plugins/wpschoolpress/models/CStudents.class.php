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
                       DISTINCT s.*
                    FROM ' . $this->strTableName . ' s
                        JOIN ' . $this->strTablePrefix . 'wpsp_subject sb ON s.class_id LIKE CONCAT( \'%\', sb.class_id , \'%\' )
                    WHERE
                
                        sb.sub_teach_id = ' . ( int ) $intUserId; 

        return $this->objDatabase->get_results( $strSql );
                
    }
    
    public function fetchStudentsByClassId( $intClassId ) {
        $strSql = 'SELECT
                        s.*
                    FROM ' . $this->strTableName . ' s
                    WHERE
                        s.class_id LIKE CONCAT ( \'%\', \'' . ( int ) $intClassId . '\', \'%\' )';
        
        return $this->objDatabase->get_results( $strSql );
    }
}

