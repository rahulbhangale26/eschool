<?php
class CYoutube extends CScrapper {

	protected $strTitle;
	protected $strDescription;
	protected $strPreviewUrl;
	protected $strEmbedUrl;
	protected $strVideoId;
	
	public function __construct() {
		parent::__construct();
	}
	
	public function scrape() {
		if( false == parent::scrape() ) {
			return false;
		}
		
		/** Scrapping Title */
		$this->strTitle = '';
		
		if( array_key_exists( 'og:title', $this->arrstrMetaTags ) ) {
			$this->strTitle = $this->arrstrMetaTags['og:title'];
		} else if( array_key_exists( 'twitter:title', $this->arrstrMetaTags ) ) {
			$this->strTitle = $this->arrstrMetaTags['twitter:title'];
		} else {
			$title_pattern = '/<title>(.+)<\/title>/i';
			preg_match_all( $title_pattern, $this->strHtml, $this->strTitle, PREG_PATTERN_ORDER);
			
			if( !is_array( $this->strTitle[1] ) ) {
				$this->strTitle = $this->strTitle[1];
			} else {
				if( count( $this->strTitle[1] ) > 0 )
					$this->strTitle = $this->strTitle[1][0];
				else
					$this->strTitle = 'Title not found!';
			}
		}
		
		$this->strTitle = ucfirst( $this->strTitle );

		/** Scrapping Description */
		
		$this->strDescription = '';
		
		if( array_key_exists( 'description', $this->arrstrMetaTags ) ) {
			$this->strDescription = $this->arrstrMetaTags['description'];
		} else if( array_key_exists( 'og:description', $this->arrstrMetaTags ) ) {
			$this->strDescription = $this->arrstrMetaTags['og:description'];
		} else if( array_key_exists( 'twitter:description', $this->arrstrMetaTags ) ) {
			$this->strDescription = $this->arrstrMetaTags['twitter:description'];
		} else {
			$this->strDescription = 'Description not found!';
		}
		
		$this->strDescription = ucfirst( $this->strDescription );
		
		/** Scrapping preview image */
		
		$this->strPreviewUrl = '';
		if( array_key_exists( 'og:image', $this->arrstrMetaTags ) ) {
			$this->strPreviewUrl = $this->arrstrMetaTags['og:image'];
		} else if( array_key_exists( 'og:image:src', $this->arrstrMetaTags ) ) {
			$this->strPreviewUrl = $this->arrstrMetaTags['og:image:src'];
		} else if( array_key_exists( 'twitter:image', $this->arrstrMetaTags ) ) {
			$this->strPreviewUrl = $this->arrstrMetaTags['twitter:image'];
		} else if( array_key_exists('twitter:image:src', $this->arrstrMetaTags ) ) {
			$this->strPreviewUrl = $this->arrstrMetaTags['twitter:image:src'];
		} else {
			// Image not found in meta tags so find it from content
			$img_pattern = '/<img[^>]*'.'src=[\"|\'](.*)[\"|\']/Ui';
			$images = '';
			preg_match_all( $img_pattern, $this->strHtml, $images, PREG_PATTERN_ORDER );
			
			$total_images = count($images[1]);
			if( $total_images > 0 )
				$images = $images[1];
				
				for($i=0; $i<$total_images; $i++) {
					if( getimagesize( $images[$i] ) ) {
						list( $width,$height,$type,$attr ) = getimagesize( $images[$i] );
						
						if( $width > 600 ) {
							$this->strPreviewUrl = $images[$i];
							break;
						}
					}
				}
		}
		
		/** Scrapping Embedded */
		
		if( array_key_exists( 'twitter:player', $this->arrstrMetaTags ) ) {
			$this->strEmbedUrl = $this->arrstrMetaTags['twitter:player'];
		} else {
			$arrstrMatches = [];
			// Here is a sample of the URLs this regex matches: (there can be more content after the given URL that will be ignored)
			
			// http://youtu.be/dQw4w9WgXcQ
			// http://www.youtube.com/embed/dQw4w9WgXcQ
			// http://www.youtube.com/watch?v=dQw4w9WgXcQ
			// http://www.youtube.com/?v=dQw4w9WgXcQ
			// http://www.youtube.com/v/dQw4w9WgXcQ
			// http://www.youtube.com/e/dQw4w9WgXcQ
			// http://www.youtube.com/user/username#p/u/11/dQw4w9WgXcQ
			// http://www.youtube.com/sandalsResorts#p/c/54B8C800269D7C1B/0/dQw4w9WgXcQ
			// http://www.youtube.com/watch?feature=player_embedded&v=dQw4w9WgXcQ
			// http://www.youtube.com/?feature=player_embedded&v=dQw4w9WgXcQ
			
			// It also works on the youtube-nocookie.com URL with the same above options.
			// It will also pull the ID from the URL in an embed code (both iframe and object tags)
			
			preg_match('%(?:youtube(?:-nocookie)?\.com/(?:[^/]+/.+/|(?:v|e(?:mbed)?)/|.*[?&]v=)|youtu\.be/)([^"&?/ ]{11})%i', $this->strUrl, $arrstrMatches );
			$this->strVideoId = ( true == isset( $arrstrMatches[1] ) ? $arrstrMatches[1] : false );
			
			if( false != $this->strVideoId ) {
				$this->strEmbedUrl	= 'https://www.youtube.com/embed/' . $this->strVideoId; 
			} else {
				$this->strEmbedUrl 	= false;
			}		
		}
		
		return true;
		
	}
	
	public function getVideoId() {
		return $this->strVideoId;
	}
		
	public function getTitle() {
		return $this->strTitle;
	}
	
	public function getDescription() {
		return $this->strDescription;
	}
	
	public function getPreviewUrl() {
		return $this->strPreviewUrl;
	}
	
	public function getEmbedUrl() {
		return $this->strEmbedUrl;
	}	

}

