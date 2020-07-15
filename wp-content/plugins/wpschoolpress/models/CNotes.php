<?php

class CNotes extends CModel {
    
    protected static $_INSTANCE;
    
    public function __construct() {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_notes';
    }
    
    public static function getInstance() {
        if( true == is_object( self::$_INSTANCE ) ) {
            return self::$_INSTANCE;
        }
        
        return  self::$_INSTANCE = new self();
    }
    
    public function insert( $arrmixNote ) {
        if( false != $this->objDatabase->insert( $this->strTableName, $arrmixNote ) ) {
            return $this->objDatabase->insert_id;
        }
        return false;
    }
    
    public function update( $arrmixFieldsToUpdate, $arrstrWhere ) {
    	return $this->objDatabase->update( $this->strTableName, $arrmixFieldsToUpdate, $arrstrWhere );
    }
    
    public function delete( $arrstrWhere ) {
    	return $this->objDatabase->delete( $this->strTableName, $arrstrWhere );
    }
    
    public function fetchNoteById( $intNoteId ) {
    	
    	$strSql = 'SELECT 
						n.*,
						u.batch_id,
						u.trade_id
					FROM 
						' . $this->strTableName . ' n
						JOIN ' . CUnits::getInstance()->strTableName . ' u ON u.id = n.unit_id 
					WHERE 
						n.id = ' . ( int ) $intNoteId;

    	return array_pop( $this->objDatabase->get_results( $strSql ) );
    }
    
    public function fetchNotesByFilter( $arrmixFilter, $strOrder = 'n.created_on DESC' ) {
    	
    	$strSql = 'SELECT 
						n.*,
						u.trade_id,
						u.batch_id
					FROM 
						' . $this->strTableName . ' n
						JOIN ' . CUnits::getInstance()->strTableName . ' u ON u.id = n.unit_id 
					WHERE
						n.created_on BETWEEN \'' . date( 'Y-m-d', strtotime( $arrmixFilter['start_date'] ) ) . ' 00:00:00\' AND \'' . date( 'Y-m-d', strtotime( $arrmixFilter['end_date'] ) ) . ' 23:59:59\'';
    	
    	if( false == is_null( $arrmixFilter['unit_id'] ) ) {
    		$strSql .= ' AND n.unit_id = ' . ( int ) $arrmixFilter['unit_id'];
    	}

    	$strSql .= ' ORDER BY ' . $strOrder;
    	
        return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchNotesByInstructorIdByFilter( $intInstructorId, $arrmixFilter, $strOrder = 'n.created_on DESC' ) {
    	$strSql = 'SELECT 
						n.*,
						u.trade_id,
						u.batch_id
					FROM 
						' . $this->strTableName .' n
						JOIN ' . CUnits::getInstance()->strTableName . ' u ON u.id = n.unit_id 
					WHERE 
						n.instructor_id = ' . ( int ) $intInstructorId . '
						AND n.created_on BETWEEN \'' . date( 'Y-m-d', strtotime( $arrmixFilter['start_date'] ) ) . ' 00:00:00\' AND \'' . date( 'Y-m-d', strtotime( $arrmixFilter['end_date'] ) ) . ' 23:59:59\'';
    	
    	if( false == is_null( $arrmixFilter['unit_id'] ) ) {
    		$strSql .= ' AND n.unit_id = ' . ( int ) $arrmixFilter['unit_id'];
    	}
    	
    	$strSql .= ' ORDER BY ' . $strOrder;

    	return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchPrintNotesByFilter( $arrmixFilter, $strOrder = 'n.created_on DESC' ) {
    	
    	$strSql = 'SELECT
						CAST( n.created_on AS DATE ) AS note_date,
						GROUP_CONCAT( n.note  SEPARATOR \', \' ) AS note,
						GROUP_CONCAT( n.number SEPARATOR \',\' ) AS number
					FROM
						' . $this->strTableName . ' n
						JOIN ' . CUnits::getInstance()->strTableName . ' u ON u.id = n.unit_id
					WHERE
						n.created_on BETWEEN \'' . date( 'Y-m-d', strtotime( $arrmixFilter['start_date'] ) ) . ' 00:00:00\' AND \'' . date( 'Y-m-d', strtotime( $arrmixFilter['end_date'] ) ) . ' 23:59:59\'';
    	
    	if( false == is_null( $arrmixFilter['unit_id'] ) ) {
    		$strSql .= ' AND n.unit_id = ' . ( int ) $arrmixFilter['unit_id'];
    	}
    	
    	if( false == is_null( $arrmixFilter['note_type_id'] ) ) {
    		$strSql .= ' AND n.note_type_id = ' . ( int ) $arrmixFilter['note_type_id'];
    	}
    	
    	$strSql .= ' GROUP BY CAST( n.created_on AS DATE )';
    	$strSql .= ' ORDER BY ' . $strOrder;

    	return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchPrintNotesByInstructorIdByFilter( $intInstructorId, $arrmixFilter, $strOrder = 'n.created_on DESC' ) {
    	$strSql = 'SELECT
						CAST( n.created_on AS DATE ) AS note_date,
						GROUP_CONCAT( n.note  SEPARATOR \', \' ) AS note,
						GROUP_CONCAT( n.number SEPARATOR \',\' ) AS number
					FROM
						' . $this->strTableName .' n
						JOIN ' . CUnits::getInstance()->strTableName . ' u ON u.id = n.unit_id
					WHERE
						n.instructor_id = ' . ( int ) $intInstructorId . '
						AND n.created_on BETWEEN \'' . date( 'Y-m-d', strtotime( $arrmixFilter['start_date'] ) ) . ' 00:00:00\' AND \'' . date( 'Y-m-d', strtotime( $arrmixFilter['end_date'] ) ) . ' 23:59:59\'';
    	
    	if( false == is_null( $arrmixFilter['unit_id'] ) ) {
    		$strSql .= ' AND n.unit_id = ' . ( int ) $arrmixFilter['unit_id'];
    	}
    	
    	if( false == is_null( $arrmixFilter['note_type_id'] ) ) {
    		$strSql .= ' AND n.note_type_id = ' . ( int ) $arrmixFilter['note_type_id'];
    	}
    	
    	$strSql .= ' GROUP BY CAST( n.created_on AS DATE )';
    	$strSql .= ' ORDER BY ' . $strOrder;

    	return $this->objDatabase->get_results( $strSql );
    }
       
}