<?php
class CFiles extends CModel {

    protected static $_INSTANCE;

    public function __construct() {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_files';
    }

    public static function getInstance() {
        if( true == is_object( self::$_INSTANCE ) ) {
            return self::$_INSTANCE;
        }
    
        return  self::$_INSTANCE = new self();
    }
    
    public function insert( $arrmixSyllabus ) {
        if( false != $this->objDatabase->insert( $this->strTableName, $arrmixSyllabus ) ) {
            return $this->objDatabase->insert_id;
        }
        return false;
    }
    
    public function fetchFilesByIds( $arrintIds ) {
        if( false == is_array( $arrintIds ) || 0 == count( $arrintIds ) ) return [];
        
        $strSql = 'SELECT * FROM ' . $this->strTableName . ' WHERE id IN ( ' . implode( ',', $arrintIds ) . ' )';
        return $this->getResults( $strSql );
        
    }

}

