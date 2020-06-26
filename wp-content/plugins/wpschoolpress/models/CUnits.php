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
    
    public function fetchUnitByUser( $objUser ) {

        if( CRole::STUDENT == $objUser->getRole() ) {
            $strSql = 'SELECT 
                            u.* 
                        FROM 
                            ' . CStudents::getInstance()->strTableName . ' s
                            JOIN ' . $this->strTableName . ' u ON u.id = s.current_unit_id 
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
            return $this->fetchAllUnits();
        }
        
        
        return $this->objDatabase->get_results( $strSql );
        
    }
    
    
}

