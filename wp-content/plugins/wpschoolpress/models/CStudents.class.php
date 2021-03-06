<?php

class CStudents extends CModel {
    
    public $strTableName;
    
    protected static $_INSTANCE;
    
    public function __construct() {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_student';
    }
    
    public static function getInstance() {
        if( true == is_object( self::$_INSTANCE ) ) {
            return self::$_INSTANCE;
        }
        
        return  self::$_INSTANCE = new self();
    }
    
    public function fetchStudentById( $intStudentId ) {
        return array_pop( $this->objDatabase->get_results( 'SELECT * FROM ' . $this->strTableName . ' WHERE sid = ' . ( int ) $intStudentId ) );
    }
    
    public function fetchStudentByUserId( $intUserId ) {
    	return array_pop( $this->objDatabase->get_results( 'SELECT * FROM ' . $this->strTableName . ' WHERE wp_usr_id = ' . ( int ) $intUserId ) );
    }
    
    public function fetchAllStudents() {
        return $this->objDatabase->get_results( 'SELECT * FROM ' . $this->strTableName );
    }
    
    public function fetchStudentsByBatchId( $intBatchId ) {
         $strSql = 'SELECT 
                        s.*,
                        u.user_email
                    FROM ' .$this->strTableName . ' s
                        JOIN ' . $this->strTablePrefix . 'users u ON u.id = s.wp_usr_id
                    WHERE 1 = 1';
        
        $strSubWhere = '';
        
        if( false == is_null( $intBatchId ) && false != $intBatchId ) {
            $strSubWhere = ' AND batch_id = ' . ( int ) $intBatchId;
        }
        
        return $this->objDatabase->get_results( $strSql . $strSubWhere );
    }
    
    public function fetchStudentsByUserIdByBatchId( $intUserId, $intBatchId ) {
       $strSql = 'SELECT
                       DISTINCT s.*, u.user_email
                    FROM ' . $this->strTableName . ' s
                        JOIN ' . $this->strTablePrefix . 'wpsp_subject sb ON s.class_id LIKE CONCAT( \'%\', sb.class_id , \'%\' )
                        JOIN ' . $this->strTablePrefix . 'users u ON u.id = s.wp_usr_id
                    WHERE
                        sb.sub_teach_id = ' . ( int ) $intUserId . '';
       
       $strSubWhere = '';
       
       if( false == is_null( $intBatchId ) && false != $intBatchId  ) {
           $strSubWhere = ' AND s.batch_id = ' . ( int ) $intBatchId;
       }

       return $this->objDatabase->get_results( $strSql . $strSubWhere );
                
    }
    
    public function fetchStudentsByBatchIdByTradeId( $intBatchId, $intTradeId ) {
       $strSql = 'SELECT 
	                    	s.*,
                     	    u.user_email,
							(@cnt := @cnt + 1) AS sr_no
                        FROM 
	                       iti_wpsp_student s 
                        JOIN iti_users u ON u.id = s.wp_usr_id 
                        WHERE 
                            s.trade_id = ' . ( int ) $intTradeId .'
                            AND s.batch_id = ' . ( int ) $intBatchId . '
						ORDER BY s.s_rollno ASC';
       $this->objDatabase->get_results( 'SET @cnt = 0;' );
        return $this->objDatabase->get_results( $strSql );
        
    }
    
    public function fetchStudentsByUnitId( $intUnitId ) {
        $strSql = 'SELECT
                        s.*
                    FROM ' . $this->strTableName . ' s
						JOIN ' . CStudentUnits::getInstance()->strTableName . ' su ON su.student_id = s.sid
                    WHERE
                        su.unit_id = ' . ( int ) $intUnitId . '
                    ORDER BY s.s_rollno ASC';
        
        return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchStudentByFilters( $arrmixFilters ) {
        return $this->fetchStudentsByBatchIdByTradeId( $arrmixFilters[ 'batch_id' ], $arrmixFilters['trade_id'] );
    }
}

