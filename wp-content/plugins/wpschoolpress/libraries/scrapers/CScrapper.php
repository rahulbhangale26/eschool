<?php

class CScrapper {

	protected $strUrl;
	protected $strHtml;
	protected $arrstrMetaTags;
	
	public function __construct() {
		
	}
	
	public function setUrl( $strUrl ) {
		$this->strUrl = $strUrl;
	}
	
	public function getUrl() {
		return $this->strUrl;
	}
	
	
	public function scrape() {
		$intFile = fopen( $this->strUrl, 'r' );
		
		if( !$intFile ) {
			return false;
		} else {
			$this->strHtml = '';
			while(!feof( $intFile ) ) {
				$this->strHtml .= fgets( $intFile, 1024 );
			}
		}
		
		$this->arrstrMetaTags = get_meta_tags( $this->strUrl );
		
		return true;
	}

}

