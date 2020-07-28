<?php
class CQuestionBanks extends CModel {
    
    protected static $_INSTANCE;
    
    public function __construct() {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_question_banks';
    }
    
    public static function getInstance() {
        if( true == is_object( self::$_INSTANCE ) ) {
            return self::$_INSTANCE;
        }
        
        return  self::$_INSTANCE = new self();
    }
    
    public function insert( $arrmixQuestionBank ) {
        if( false != $this->objDatabase->insert( $this->strTableName, $arrmixQuestionBank ) ) {
            return $this->objDatabase->insert_id;
        }
        return false;
    }
    
    public function delete( $arrstrWhere ) {
        return $this->objDatabase->delete( $this->strTableName, $arrstrWhere );
    }
    
    public function fetchAllQuestionBanks() {
        $strSql = 'SELECT
                        qb.*,
                        CONCAT( f.file_path, f.file_name )  AS file_url
                    FROM
                        ' . $this->strTableName . ' qb
                        JOIN ' . CFiles::getInstance()->strTableName . ' f ON f.id = qb.file_id';
        
        return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchQuestionBanksByInstructorId( $intInstructorId ) {
    	$strSql = 'SELECT
                        qb.*,
                        CONCAT( f.file_path, f.file_name )  AS file_url
                    FROM
                        ' . $this->strTableName . ' qb
                        JOIN ' . CFiles::getInstance()->strTableName . ' f ON f.id = qb.file_id
					WHERE
						qb.instructor_id = ' . ( $intInstructorId );
    	
    	return $this->objDatabase->get_results( $strSql );    	
    }
    
    public function fetchQuestionBanksByUnitId( $intUnitId ) {
    	$strSql = 'SELECT
                        qb.*,
                        CONCAT( f.file_path, f.file_name )  AS file_url
                    FROM
                        ' . $this->strTableName . ' qb
                        JOIN ' . CFiles::getInstance()->strTableName . ' f ON f.id = qb.file_id
						JOIN ' . CSubjectInstructors::getInstance()->strTableName . ' si ON si.subject_id = qb.subject_id
					WHERE
						si.unit_id = ' . ( $intUnitId );
    	
    	return $this->objDatabase->get_results( $strSql );
    }
    
}

