<?php

class CNoteTypes extends CModel {
    
    protected static $_INSTANCE;
   
    const LESSON        = 1;
    const PRACTICAL     = 2;

    public function __construct() {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_note_types';
    }
    
    public static function getInstance() {
        if( true == is_object( self::$_INSTANCE ) ) {
            return self::$_INSTANCE;
        }
        
        return  self::$_INSTANCE = new self();
    }
    
    public function insert( $arrmixNoteType ) {
        if( false != $this->objDatabase->insert( $this->strTableName, $arrmixNoteType ) ) {
            return $this->objDatabase->insert_id;
        }
        return false;
    }
    
    public function fetchNoteTypesByIds( $arrintIds ) {
        
        if( 0 >= count( $arrintIds ) ) return [];
        
        $strSql = 'SELECT 
                        *
                    FROM
                        ' . $this->strTableName . '
                    WHERE
                        id IN ( ' . implode( ', ', $arrintIds ) . ' )';
        
        return $this->objDatabase->get_results( $strSql );
    }
    
}

