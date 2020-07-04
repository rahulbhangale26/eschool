<?php
class CLessonPlans extends CModel {
    
    public $strTableName;
    
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
                        lp.*,
                        CONCAT( f.file_path, f.file_name )  AS file_url
                    FROM
                        ' . $this->strTableName . ' lp
                        JOIN ' . CFiles::getInstance()->strTableName . ' f ON f.id = lp.file_id';
        
        return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchLessonPlansByInstructorId( $intInstructorId) {
        
        $strSql = 'SELECT
                        lp.*,
                        CONCAT( f.file_path, f.file_name )  AS file_url
                    FROM
                        ' . $this->strTableName . ' lp
                        JOIN ' . CFiles::getInstance()->strTableName . ' f ON f.id = lp.file_id
                    WHERE
                        lp.instructor_id = ' . ( int ) $intInstructorId;
        
        return $this->objDatabase->get_results( $strSql );
    }
    
}