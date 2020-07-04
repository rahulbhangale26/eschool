<?php
class CDemostrationPlans extends CModel {
    
    public $strTableName;
    
    protected static $_INSTANCE;
    
    public function __construct() {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_demostration_plans';
    }
    
    public static function getInstance() {
        if( true == is_object( self::$_INSTANCE ) ) {
            return self::$_INSTANCE;
        }
        
        return  self::$_INSTANCE = new self();
    }
    
    public function insert( $arrmixDemostrationPlan ) {
        if( false != $this->objDatabase->insert( $this->strTableName, $arrmixDemostrationPlan ) ) {
            return $this->objDatabase->insert_id;
        }
        return false;
    }
    
    public function delete( $arrmixDemostrationPlan ) {
        return $this->objDatabase->delete( $this->strTableName, $arrmixDemostrationPlan );
    }
    
    public function fetchAllDemostrationPlans() {
        
        $strSql = 'SELECT
                        dp.*,
                        CONCAT( f.file_path, f.file_name )  AS file_url
                    FROM
                        ' . $this->strTableName . ' dp
                        JOIN ' . CFiles::getInstance()->strTableName . ' f ON f.id = dp.file_id';
        
        return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchDemostrationPlansByInstructorId( $intInstructorId) {
        
        $strSql = 'SELECT
                        dp.*,
                        CONCAT( f.file_path, f.file_name )  AS file_url
                    FROM
                        ' . $this->strTableName . ' dp
                        JOIN ' . CFiles::getInstance()->strTableName . ' f ON f.id = dp.file_id
                    WHERE
                        dp.instructor_id = ' . ( int ) $intInstructorId;
        
        return $this->objDatabase->get_results( $strSql );
    }
    
}