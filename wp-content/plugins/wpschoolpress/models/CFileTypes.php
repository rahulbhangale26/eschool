<?php
class CFileTypes extends CModel {
    
    protected static $_INSTANCE;
    
    const SYLLABUS = 1;
    
    public function __construct() {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_file_types';
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
    
}
