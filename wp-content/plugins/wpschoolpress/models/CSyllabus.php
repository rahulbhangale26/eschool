<?php


class CSyllabus extends CModel {
    
    protected static $_INSTANCE;
    
    public function __construct() {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_syllabus';
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
    
    public function fetchAllSyllabus() {
        
        $strSql = 'SELECT
                        s.*,
                        CONCAT( f.file_path, f.file_name )  AS file_url
                    FROM
                        ' . $this->strTableName . ' s
                        JOIN ' . CFiles::getInstance()->strTableName . ' f ON f.id = s.file_id';
        
        return $this->objDatabase->get_results( $strSql ); 
    }
    
    public function fetchSyllabusById( $intSyllabusId ) {
        
        $strSql = 'SELECT 
                        s.*,
                        CONCAT( f.file_path, f.file_name )  AS file_url
                    FROM 
                        ' . $this->strTableName . ' s
                        JOIN ' . CFiles::getInstance()->strTableName . ' f ON f.id = s.file_id
                    WHERE
                        s.id = ' . ( int ) $intSyllabusId;

        return array_pop( $this->objDatabase->get_results( $strSql) );
    }
    
}

