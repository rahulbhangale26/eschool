<?php
class CUploadManager extends CFactory {
    public function __construct() {
        
    }
    
    public function initalize() {
        parent::initalize();
    }
    
    
    public function execute() {
        switch ( $this->getPageAction() ) {
            case 'upload_image':
                $this->handleUploadImage();
                break;
        }
        
    }
    
    public function handleUploadImage() {
        $strSubPath     = '/uploads/files/' . CFileTypes::DEMONSTRATION_PLAN . '/';
        $strFilePath    = WP_CONTENT_DIR . $strSubPath;
        
        $objUploader    =   new Uploader();
        $objUploader->setExtensions( [ 'png', 'jpg', 'jpeg' ] );
        $objUploader->setMaxSize( 2 ); // size in mb.
        $objUploader->setDir( $strFilePath );
        
        if( $objUploader->uploadFile( 'upload' ) )  {
            $strFileName  =   $objUploader->getUploadName();
        }
        else {
            $this->addErrorMessage( $objUploader->getMessage() );
            return false;
        }
        
        $arrmixFile = [
            'file_type_id'      => CFileTypes::DEMONSTRATION_PLAN,
            'file_name'         => $strFileName,
            'file_path'         => $strSubPath,
            'is_active'         => true,
            'uploaded_by'       => $this->objUser->getUserId(),
            'uploaded_on'       => date('Y-m-d H:i:s' )
        ];
        
        if( false == ( $intFileId = CFiles::getInstance()->insert( $arrmixFile ) ) ) {
            $this->addErrorMessage( 'Unable to insert into files. Please contact administrator.' );
        }
        
        echo '{"fileName":"' . $arrmixFile['file_name'] . '","uploaded":' . $intFileId . ',"url":"' .  WP_CONTENT_URL . $arrmixFile['file_path'] . $arrmixFile['file_name'] . '"}';
    
        exit;
    }
    
}

( new CUploadManager() )->run();
