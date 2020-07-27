<?php

class CJobs extends CModel {
    
    public $strTableName;
    
    protected static $_INSTANCE;
    
    public function __construct() {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_jobs';
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
    
    public function update( $arrstrUpdatedFields, $arrstrWhereFields ) {
        return $this->objDatabase->update( $this->strTableName, $arrstrUpdatedFields, $arrstrWhereFields );
    }
    
    public function delete( $arrmixTraineeRecords ) {
        return $this->objDatabase->delete( $this->strTableName, $arrmixTraineeRecords );
    }
    
    public function fetchAllJobs() {
        
        $strSql = 'SELECT 
                        j.*,
                        CONCAT( f.file_path, f.file_name ) AS file_url
                    FROM 
                        ' . $this->strTableName . ' j
                        JOIN ' . CFiles::getInstance()->strTableName . ' f ON f.id = j.file_id
					ORDER BY j.number';
        
        return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchJobsByUnitId( $intUnitId ) {
    	$strSql = 'SELECT
                        j.*,
                        CONCAT( f.file_path, f.file_name ) AS file_url
                    FROM
                        ' . $this->strTableName . ' j
                        JOIN ' . CFiles::getInstance()->strTableName . ' f ON f.id = j.file_id
					WHERE
						j.unit_id = ' . ( int ) $intUnitId;
    	
    	return $this->objDatabase->get_results( $strSql );
    	
    }
    
    public function fetchJobsByInstructorIdByUnitId( $intInstructorId, $intUnitId ) {
        
        $strSql = 'SELECT
                        j.*,
                        CONCAT( f.file_path, f.file_name ) AS file_url
                    FROM
                        ' . $this->strTableName . ' j
                        JOIN ' . CFiles::getInstance()->strTableName . ' f ON f.id = j.file_id
                    WHERE
                        j.instructor_id = ' . ( int ) $intInstructorId . '
						AND j.unit_id = ' . ( int ) $intUnitId . '
					ORDER BY j.number';
        
        return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchJobById( $intId ) {
        
        $strSql = 'SELECT
                        j.*,
                        CONCAT( f.file_path, f.file_name ) AS file_url
                    FROM
                        ' . $this->strTableName . ' j
                        JOIN ' . CFiles::getInstance()->strTableName . ' f ON f.id = j.file_id
                    WHERE
                        j.id = ' . ( int ) $intId;
        
        return array_pop( $this->objDatabase->get_results( $strSql ) );
    }
    
}

