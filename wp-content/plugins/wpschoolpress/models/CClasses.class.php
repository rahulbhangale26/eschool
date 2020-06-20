<?php

class CClasses extends CModel {
    
    public $strTableName;
    
    public function __construct( ) {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_class';
    }
    
    public function fetchClassesByUserId( $intUserId ) {
        
        
       $strSql = 'SELECT 
                        DISTINCT c.*
                    FROM
                        ' . $this->strTableName . ' c
                        JOIN ' . ( new CSubjects() )->strTableName . ' s ON s.class_id = c.cid
                    WHERE
                        s.sub_teach_id = ' . ( int ) $intUserId;

        return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchClassesByStudentUserId( $intStudentUserId ) {
        $strSql = 'SELECT
                        DISTINCT c.*
                    FROM
                        ' . $this->strTableName . ' c
                        JOIN ' . ( new CStudents() )->strTableName . ' s ON  s.class_id LIKE CONCAT( \'%\', c.cid , \'%\' )
                    WHERE
                        s.wp_usr_id = ' . ( int ) $intStudentUserId;
        
        return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchAllClasses() {
        return $this->objDatabase->get_results( 'SELECT * FROM ' .$this->strTableName );
    }
}

