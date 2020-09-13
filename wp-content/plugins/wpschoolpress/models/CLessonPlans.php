<?php
class CLessonPlans extends CModel {
    
    public $strTableName;
    
    const CUSTOM = 'custom';
    
    protected static $_INSTANCE;
    
    public function __construct() {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_lesson_plans';
    }
    
    public static function getInstance() {
        if( true == is_object( self::$_INSTANCE ) ) {
            return self::$_INSTANCE;
        }
        
        return  self::$_INSTANCE = new self();
    }
    
    public function insert( $arrmixLessonPlan ) {
        if( false != $this->objDatabase->insert( $this->strTableName, $arrmixLessonPlan ) ) {
            return $this->objDatabase->insert_id;
        }
        return false;
    }
    
    public function delete( $arrmixTraineeRecords ) {
        return $this->objDatabase->delete( $this->strTableName, $arrmixTraineeRecords );
    }
    
    public function fetchAllLessonPlans() {
        
        $strSql = 'SELECT
                        lp.*
                    FROM
                        ' . $this->strTableName . ' lp';
        
        return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchLessonPlansByInstructorId( $intInstructorId) {
        
        $strSql = 'SELECT
                        lp.*
                    FROM
                        ' . $this->strTableName . ' lp
                    WHERE
                        lp.instructor_id = ' . ( int ) $intInstructorId;
        
        return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchLessonPlansByFormatTypeByInstructorId( $strFormatType, $intInstructorId) {
        
        $strSql = 'SELECT
                        lp.*
                    FROM
                        ' . $this->strTableName . ' lp
                    WHERE
                        lp.instructor_id = ' . ( int ) $intInstructorId . '
                        AND lp.format_type = \'' . $strFormatType . '\'';
        
        return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchLessonPlanByFormatType( $strFormatType ) {
        $strSql = 'SELECT
                        lp.*
                    FROM
                        ' . $this->strTableName . ' lp
                    WHERE
                        lp.format_type = \'' . $strFormatType . '\'
                    ORDER BY lp.number ASC';
        return $this->getResults( $strSql );
    }
    
    public function fetchLessonPlanById( $intId ) {
        $strSql = 'SELECT * FROM ' . $this->strTableName . ' WHERE id = ' . ( int ) $intId;
        return $this->getResult( $strSql );
    }
    
}