<?php

class CTradesManager extends CFactory {

    
    protected $arrmixTrades;
    public function __construct() {
        
    }
    
    public function initalize() {
        parent::initalize();
    }
    
    public function execute() {
        
        switch( $this->getPageAction() ) {
            case NULL:
                $this->handleViewTrades();
                break;
                
            case 'get_trade_unit_lists':
                $this->handleGetTradeUnitLists();
                break;

        }
        
    }
    
    public function handleViewTrades() {
        
        if( CRole::ADMIN != $this->objUser->getRole() ) {
            $this->renderPage( 'messages/error_messages.php' );
            return false;
        }
        
        $this->arrmixTrades = CTrade::getInstance()->fetchAllTrades();
        
        $this->displayViewTrades();
    }
    
    public function handleGetTradeUnitLists() {
        $intTradeId = $this->getRequestData( [ 'data', 'TradeId' ] );
        $intBatchId = $this->getRequestData( [ 'data', 'BatchId' ] );

        if( false != $intTradeId ) {
            $arrobjUnits = CUnits::getInstance()->fetchUnitByUserByTradeIdByBatchId( $this->objUser, $intTradeId, $intBatchId );
        }
        
        echo json_encode( $arrobjUnits );
        exit;
    }
    
    public function displayViewTrades( ) {
        
        $this->arrmixTemplateParams['trades'] = $this->arrmixTrades;
        
        $this->renderPage( 'trades/wpsp-trades.php' );
    }
    
}

( new CTradesManager() )->run();

