<?php
class COptions extends CModel {
    
    public $strTableName;
    
    protected static $_INSTANCE;
    
    const TIMETABLE = 'time_table_file';
    
    public function __construct() {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'options';
    }
    
    public static function getInstance() {
        if( true == is_object( self::$_INSTANCE ) ) {
            return self::$_INSTANCE;
        }
        
        return  self::$_INSTANCE = new self();
    }
    
    public function getOption( $strOptionKey ) {
        return get_option( $strOptionKey );
    }
    
    public function addOrUpdate( $strOptionKey, $arrmixValue ) {
        if( false == get_option( $strOptionKey ) ) {
            return add_option( $strOptionKey, $arrmixValue );
        } else {
            return update_option( $strOptionKey, $arrmixValue );
        }
    }
}