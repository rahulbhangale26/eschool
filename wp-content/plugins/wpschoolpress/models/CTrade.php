<?php

class CTrade extends CModel  {
    
    protected static $_INSTANCE;
    
    public function __construct() {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_trades';
    }
    
    public static function getInstance() {
        if( true == is_object( self::$_INSTANCE ) ) {
            return self::$_INSTANCE;
        }
        
        return  self::$_INSTANCE = new self();
    }
    
    public function fetchTradeById( $intId ) {
        return array_pop( $this->objDatabase->get_results( 'SELECT * FROM ' . $this->strTableName . ' WHERE id =' . $intId ) );
    }
    
    public function fetchAllTrades() {
        return $this->objDatabase->get_results( 'SELECT * FROM ' . $this->strTableName );
    }
    
    public function fetchTradesByInstructorId( $intInstructorId ) {
        
        $strSql = 'SELECT
                        DISTINCT t.*
                    FROM ' . $this->strTableName . ' t
                        JOIN ' . $this->strTablePrefix . 'wpsp_subject_instructors si ON si.trade_id = t.id
                    WHERE
                        si.instructor_id = ' . ( int ) $intInstructorId;
        
        return $this->objDatabase->get_results( $strSql );
        
    }
    
}

