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
    
    public function fetchDemostrationPlanById( $intId ) {
        $strSql = 'SELECT * FROM ' . $this->strTableName . ' WHERE id = ' . ( int ) $intId;
        return $this->getResult( $strSql );
    }
    
    public function fetchAllDemostrationPlans() {
        
        $strSql = 'SELECT
                        dp.*
                    FROM
                        ' . $this->strTableName . ' dp';
        
        return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchDemostrationPlansByInstructorId( $intInstructorId) {
        
        $strSql = 'SELECT
                        dp.*
                    FROM
                        ' . $this->strTableName . ' dp
                    WHERE
                        dp.instructor_id = ' . ( int ) $intInstructorId . '
                    ORDER BY number';
        
        return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchDemonstrationPlansByFormatByInstructorId( $strFormat, $intInstructorId ) {
        $strSql = 'SELECT
                        dp.*
                    FROM
                        ' . $this->strTableName . ' dp
                    WHERE
                        dp.instructor_id = ' . ( int ) $intInstructorId . '
                        AND dp.format_type = \''. $strFormat . '\'
                    ORDER BY number';

        return $this->getResults( $strSql );
        
    }
    
}