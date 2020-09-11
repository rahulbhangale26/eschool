<?php
class CFileIO {
    
    protected $intFilePointer;
    protected $arrstrErrorMsgs = [];
    protected $strDir;
    
    const WRITE_MODE = 'w';
    const READ_MODE = 'r';
    
    public function __construct() {
        
    }
    
    public function getErrorMsgs() {
        return $this->arrstrErrorMsgs;
    }
    
    public function setDir( $strDir ) {
        $this->strDir = $strDir;
    }
    
    public function addErrorMsg( $strMsg ) {
        $this->arrstrErrorMsgs[] = $strMsg;
    }
    
    public function open( $strFileName, $strMode = self::WRITE_MODE ) {

        if(!is_dir( $this->strDir ) )
            mkdir( $this->strDir );

        $this->intFilePointer = fopen( $this->strDir . $strFileName, $strMode );
        
        if( false === $this->intFilePointer ) {
            $this->addErrorMsg( 'Unable to open file.' );
        }
    }
    
    public function read( $strFileName, $strMode = self::READ_MODE ) {
        
        if( false === $this->fileExists( $strFileName ) ) return '';
        
        if( NULL !== $strFileName ) {
            $this->open( $strFileName, $strMode );
        }
        
        if( 0 < count( $this->arrstrErrorMsgs ) ) {
            return  false;
        }

        $intFileSize = filesize( $this->strDir . $strFileName );
       
        if( 0 == $intFileSize ) return '';
        
        $strContent = fread( $this->intFilePointer, $intFileSize );

        return $strContent;
    }
    
    public function fileExists( $strFileNam ) {
        return file_exists( $this->strDir . $strFileNam );        
    }
        
    public function write( $strContent, $strFileName = NULL ) {
        
        if( NULL !== $strFileName ) {
            $this->open( $strFileName );
        }
        
        if( 0 < count( $this->arrstrErrorMsgs ) ) {
            return  false;
        }
        
        if( false === $intWrittenBytes = fwrite( $this->intFilePointer, $strContent ) ) {
            $this->addErrorMsg( 'Write operation failed on file.' );
            return false;
        }
        
        return $intWrittenBytes;
    }
    
    public function close() {
        fclose( $this->intFilePointer );
    }
    
}