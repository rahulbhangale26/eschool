<?php

class CUnits extends CModel {

    public $strTableName;
    
    protected static $_INSTANCE;
    
    public function __construct( ) {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_units';
    }
    
    public static function getInstance() {
        if( true == is_object( self::$_INSTANCE ) ) {
            return self::$_INSTANCE;
        }
        
        return  self::$_INSTANCE = new self();
    }
    
    public function insert( $arrmixSubject ) {
        if( false != $this->objDatabase->insert( $this->strTableName, $arrmixSubject ) ) {
            return $this->objDatabase->insert_id;
        }
        return false;
    }
    
    public function fetchUnitByInstructorUserId( $intInstructorUserId ) {
        $strSql = 'SELECT * FROM ' . $this->strTableName . ' WHERE instructor_id = ' . ( int ) $intInstructorUserId;
        return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchAllUnits() {
        return $this->objDatabase->get_results( 'SELECT * FROM ' . $this->strTableName );
    }
    
    public function fetchUnitById( $intUnitId ) {
        return array_pop( $this->objDatabase->get_results( 'SELECT * FROM ' . $this->strTableName . ' WHERE id=' . ( int ) $intUnitId ) );
    }
    
    public function fetchUnitByUser( $objUser, $boolIsPassed = NULL ) {

        if( CRole::STUDENT == $objUser->getRole() ) {
            $strSql = 'SELECT 
                            u.* 
                        FROM 
                            ' . CStudents::getInstance()->strTableName . ' s
							JOIN ' . CStudentUnits::getInstance()->strTableName . ' su ON su.student_id = s.sid
                            JOIN ' . $this->strTableName . ' u ON u.id = su.unit_id
                        WHERE
                            s.wp_usr_id = ' . ( int ) $objUser->getUserId();
         }
        
        if( CRole::TEACHER == $objUser->getRole() ) {
             $strSql = 'SELECT
                            DISTINCT u.*
                        FROM
                            ' . $this->strTablePrefix . 'wpsp_subject_instructors si 
                            JOIN ' . CTeachers::getInstance()->strTableName . ' t ON si.instructor_id = t.tid
                            JOIN ' . $this->strTableName . ' u ON u.id = si.unit_id
                        WHERE
                            t.wp_usr_id = ' .( int ) $objUser->getUserId();
             
           
        }
        
        if( CRole::ADMIN == $objUser->getRole() || ( CRole::TEACHER == $objUser->getRole() && ( CDesignations::PRINCIPAL == $objUser->getTeacher()->designation_id ) ) ) {
        	$strSql = 'SELECT * FROM ' . $this->strTableName . ' u WHERE 1 = 1 ';
        }
        
        if( false === $boolIsPassed ) {
        	$strSql .= ' AND u.is_passed = false';
        }
        
        $strSql .= ' ORDER BY u.unit_name DESC'; 
        
        return $this->objDatabase->get_results( $strSql );
        
    }
    
    
    public function fetchUnitByUserByTradeIdByBatchId( $objUser, $intTradeId, $intBatchId ) {
        
        if( CRole::STUDENT == $objUser->getRole() ) {
            $strSql = 'SELECT
                            u.*
                        FROM
                            ' . CStudents::getInstance()->strTableName . ' s
							JOIN ' . CStudentUnits::getInstance()->strTableName . ' su ON su.student_id = s.sid
                            JOIN ' . $this->strTableName . ' u ON u.id = su.unit_id
                        WHERE
                            s.wp_usr_id = ' . ( int ) $objUser->getUserId() . '
                            AND u.trade_id = ' . ( int ) $intTradeId;
        }
        
        if( CRole::TEACHER == $objUser->getRole() ) {
            $strSql = 'SELECT
                            DISTINCT u.*
                        FROM
                            ' . $this->strTablePrefix . 'wpsp_subject_instructors si
                            JOIN ' . CTeachers::getInstance()->strTableName . ' t ON si.instructor_id = t.tid
                            JOIN ' . $this->strTableName . ' u ON u.id = si.unit_id
                        WHERE
                            t.wp_usr_id = ' .( int ) $objUser->getUserId() . '
                            AND u.trade_id = ' . ( int ) $intTradeId . '
                            AND u.batch_id = ' . ( int ) $intBatchId; 
        }
        
        if( CRole::ADMIN == $objUser->getRole() || ( CRole::TEACHER == $objUser->getRole() && ( true == in_array( $objUser->getTeacher()->designation_id, [ CDesignations::CLERK, CDesignations::PRINCIPAL ] ) ) ) ) {
            return $this->objDatabase->get_results( 'SELECT * FROM ' . $this->strTableName . ' WHERE trade_id = ' . ( int ) $intTradeId . ' AND batch_id = ' . ( int ) $intBatchId );
        }
        
        
        return $this->objDatabase->get_results( $strSql );
        
    }
    
    public function fetchUnitByTradeId( $intTradeId ) {
        $strSql = 'SELECT * FROM ' . $this->strTableName . ' WHERE trade_id = ' . ( int ) $intTradeId;
        
        return $this->objDatabase->get_results( $strSql );
    }
    
    
}

