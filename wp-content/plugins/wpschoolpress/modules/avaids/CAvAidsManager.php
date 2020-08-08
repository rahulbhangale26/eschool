<?php
class CAvAidsManager extends CFactory {
	
	public function __construct() {
		
	}
	
	public function initalize() {
		parent::initalize();
	}
	
	public function execute() {
		switch( $this->getPageAction() ) {
			case NULL:
				$this->handleViewAvAids();
				break;
				
			case 'add_a_v_aid':
				$this->handleAddAVAid();
				break;
				
			case 'get_link_details':
				$this->handleGetLinkDetails();
				break;
		}
	}
	
	public function handleViewAvAids() {
		
		$this->displayViewAvAids();
	}
	
	public function handleAddAVAid() {
		
		$this->displayAddAVAid();
	}
	
	public function handleGetLinkDetails() {
		$strLink = $this->getRequestData( [ 'data', 'link' ] );
		
		switch ( NULL ) {
			default:
				if( false === strpos( $strLink, 'youtube' ) ) {
					$this->arrstrJsonRespose = [ 'status' => false, 'message' => 'Invalid Youtube link' ];
					break;
				}
				
				$objYoutube = new CYoutube();
				$objYoutube->setUrl( $strLink );
				
				if( false == $objYoutube->scrape() ) {
					$this->arrstrJsonRespose = [ 'status' => false, 'message' => 'Unable to fetch details from youtube.' ];
					break;
				}
				
				$this->arrstrJsonRespose = [
					'status'		=> true,
					'title'			=> htmlspecialchars( $objYoutube->getTitle() ),
					'description'	=> htmlspecialchars( $objYoutube->getDescription() ),
					'preview_url'	=> htmlspecialchars( $objYoutube->getPreviewUrl() ),
					'embed_url'		=> htmlspecialchars( $objYoutube->getEmbedUrl() )
				];
				break;
		}
		
		$this->displayJson();
	}
	
	public function displayViewAvAids() {
		
		$this->renderPage( 'avaids/view_av_aids.php' );
	}
	
	public function displayAddAVAid() {
		
		$this->renderPage( 'avaids/add_a_v_aid.php' );
	}
	
}

( new CAvAidsManager() )->run();