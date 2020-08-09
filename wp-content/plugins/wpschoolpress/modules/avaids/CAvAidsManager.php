<?php
class CAvAidsManager extends CFactory {
	
	protected $objAvaid;
	
	protected $arrobjAvaids;
	
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
				
			case 'edit_aid':
				$this->handleEditAid();
				break;
				
			case 'delete_aid':
				$this->handleDeleteAid();
				break;
				
			case 'view_aid':
				$this->handleViewAid();
				break;
				
			case 'get_link_details':
				$this->handleGetLinkDetails();
				break;
		}
	}
	
	public function handleViewAvAids() {
		
		$this->arrobjAvaids = CAvaids::getInstance()->fetchAvaidsByUnitId( $this->getSessionData( [ 'filter', 'unit_id' ] ) );
		$this->displayViewAvAids();
	}
	
	public function handleAddAVAid() {
		
		if( "" != $this->getRequestData( ['add_av_aid'] ) ) {
			switch( NULL ) {
				default:
					if( '' == $this->getRequestData( ['title'] ) ) {
						$this->addErrorMessage( 'Title is required.' );
						break;
					}
					
					if( '' == $this->getRequestData( ['link'] ) ) {
						$this->addErrorMessage( 'Title is required.' );
						break;
					}
					
					$arrmixAvaids = [
						'unit_id'		=> $this->getSessionData( [ 'filter', 'unit_id' ] ),
						'title'			=> sanitize_text_field( $this->getRequestData( [ 'title' ] ) ),
						'description'	=> sanitize_textarea_field( $this->getRequestData( [ 'description' ] ) ),
						'link'			=> sanitize_url( $this->getRequestData( [ 'link' ] ) ),
						'embed_url'		=> sanitize_url( $this->getRequestData( [ 'embed_url' ] ) ),
						'preview_url'	=> sanitize_url( $this->getRequestData( [ 'preview_url' ] ) )
					];
					
					if( false == CAvaids::getInstance()->insert( $arrmixAvaids ) ) {
						$this->addErrorMessage( 'Unable to insert the data.' );
						break;
					}
					
					$this->addSuccessMessage( 'Aid added successfully.' );
			}
			
		}
		
		$this->displayAddAVAid();
	}
	
	public function handleEditAid() {
		
		if(  "" != $this->getRequestData( [ 'update_av_aid' ] ) ) {
			switch( NULL ) {
				default:
					if( '' == $this->getRequestData( ['title'] ) ) {
						$this->addErrorMessage( 'Title is required.' );
						break;
					}
					
					if( '' == $this->getRequestData( ['link'] ) ) {
						$this->addErrorMessage( 'Title is required.' );
						break;
					}
					
					$arrmixAvaids = [
							'unit_id'		=> $this->getSessionData( [ 'filter', 'unit_id' ] ),
							'title'			=> sanitize_text_field( $this->getRequestData( [ 'title' ] ) ),
							'description'	=> sanitize_textarea_field( $this->getRequestData( [ 'description' ] ) ),
							'link'			=> sanitize_url( $this->getRequestData( [ 'link' ] ) ),
							'embed_url'		=> sanitize_url( $this->getRequestData( [ 'embed_url' ] ) ),
							'preview_url'	=> sanitize_url( $this->getRequestData( [ 'preview_url' ] ) )
					];
					
					if( false == CAvaids::getInstance()->update( $arrmixAvaids, [ 'id' => sanitize_text_field( $this->getRequestData( [ 'avaid_id' ] ) ) ] ) ) {
						$this->addErrorMessage( 'Unable to update the data.' );
					}
					
					$this->addSuccessMessage( 'Aid updated successfully.' );
				
			}
		}
		
		$this->objAvaid = CAvaids::getInstance()->fetchAvaidById( sanitize_key( $this->getRequestData( [ 'avaid_id' ] ) ) );
		
		$this->displayEditAid();
	}
	
	public function handleGetLinkDetails() {
		$strLink = $this->getRequestData( [ 'data', 'link' ] );
		
		switch ( NULL ) {
			default:
				if( false === strpos( $strLink, 'youtube' ) && false === strpos( $strLink, 'youtu.be' ) ) {
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
	
	public function handleDeleteAid() {
		
		if( "" == $this->getRequestData( [ 'data', 'avaid_id' ] ) ) {
			echo 'error';
			exit;
		}
		 
		if( false == CAvaids::getInstance()->delete( [ 'id' => sanitize_text_field( $this->getRequestData( [ 'data', 'avaid_id' ] ) ) ] ) ) {
			echo 'error';
			exit;
		}
		
		$this->handleViewAvAids();
		
	}

	public function handleViewAid() {
		
		$this->objAvaid = CAvaids::getInstance()->fetchAvaidById( sanitize_key( $this->getRequestData( [ 'avaid_id' ] ) ) );
		
		if( "" == $this->objAvaid->embed_url ) {
			header( 'Location: ' . $this->objAvaid->link );
		}
		
		$this->displayViewAid();
	}
	
	public function displayViewAvAids() {
		
		$this->arrmixTemplateParams['avaids']		= $this->arrobjAvaids;
		
		$this->renderPage( 'avaids/view_av_aids.php' );
	}
	
	public function displayAddAVAid() {
		
		$this->renderPage( 'avaids/add_a_v_aid.php' );
	}
	
	public function displayEditAid() {
		
		$this->arrmixTemplateParams['avaid'] = $this->objAvaid;
		
		$this->renderPage( 'avaids/add_a_v_aid.php' );
	}
	
	public function displayViewAid() {
		$this->arrmixTemplateParams['avaid'] = $this->objAvaid;
		
		$this->renderPage( 'avaids/view_aid.php' );
		
	}
	
}

( new CAvAidsManager() )->run();