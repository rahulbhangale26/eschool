<?php
class CSellManager extends CFactory {
    
    public function __construct() {
        
    }
    
    public function initalize() {
        parent::initalize();
    }
    
    public function execute() {
        
        switch( $this->getPageAction() ) {
            case NULL:
                $this->handleViewSell();
                break;
                
            case 'download_demostration_plan':
                $this->handleDownloadDemostrationPlan();
                break;
        }
        
    }
    
    public function handleViewSell() {
        
        $arrmixRequestData = $this->getRequestData( [] );

        if( true == isset( $arrmixRequestData['download_demostration_plan'] ) || true == isset( $arrmixRequestData['download_lesson_plan'] ) ) {
            switch( NULL ) {
                default:
                    if( "" == $this->getRequestData( [ 'customer_iti_name' ] ) ) {
                        $this->addErrorMessage( 'Please enter valid ITI Name.' );
                        break;
                    }
                    
                    if( "" == $this->getRequestData( [ 'customer_instructor_name' ] ) ) {
                        $this->addErrorMessage( 'Please enter valid Instructor Name.' );
                        break;
                    }
                    
                    if( true == isset( $arrmixRequestData['download_demostration_plan'] ) ) {
                        $this->handleDownloadDemostrationPlan();
                        break;
                    }
                    
                    if( true == isset( $arrmixRequestData['download_lesson_plan'] ) ) {
                        $this->handleDownloadLessonPlan();
                        break;
                    }
            }

        }
        
        $this->displayViewSell();
    }
    
    public function handleDownloadDemostrationPlan() {
        require_once WP_VENDOR_PATH . 'autoload.php';
        
        $objFileIO                  = new CFileIO();
        $strITIName                 = $this->getRequestData( [ 'customer_iti_name' ] );
        $strInstructorName          = $this->getRequestData( [ 'customer_instructor_name' ] );
        $strContent                 = '';
        $arrobjDemostrationPlans    = CDemostrationPlans::getInstance()->fetchDemonstrationPlansByFormatByInstructorId( 'custom', $this->objUser->getTeacher()->tid );
        $objMpdf                    = new \Mpdf\Mpdf( ['mode' => 'utf-8'] );
        $boolIsFirst = true;
        foreach ( $arrobjDemostrationPlans AS $objDp ) {
            $arrobjFiles = CFiles::getInstance()->fetchFilesByIds( explode( ',', $objDp->file_ids ) );

            if( true == is_array( $arrobjFiles ) AND 0 < count( $arrobjFiles ) ) {
                foreach( $arrobjFiles AS $objFile ) {
                    $objFileIO->setDir( WP_CONTENT_DIR . $objFile->file_path );
                    $strContent = stripslashes( $objFileIO->read( $objFile->file_name ) );
                    if( '' == $strContent ) continue;
                    
                    if( false == $boolIsFirst ) {
                        $objMpdf->AddPage();
                    }
                    
                    if( "" != $strContent ) {
                        $strContent = preg_replace('/<ITINAME>(.*)<\/ITINAME>/is', '<ITINAME>'. $strITIName . '</ITINAME>', $strContent );
                        $strContent = preg_replace('/<INAME>(.*)<\/INAME>/is', '<INAME>Name: '. $strInstructorName . '</INAME>', $strContent );
                        $objMpdf->WriteHTML( '<style>div, p, td { font-family: freeserif !important; }</style>' . $strContent );
                    }
                    
                    $boolIsFirst = false;
                }
            }
        }
        
        $objMpdf->Output();
        exit;
    }
    
    public function handleDownloadLessonPlan() {
        require_once WP_VENDOR_PATH . 'autoload.php';
        
        $objFileIO                  = new CFileIO();
        $strITIName                 = $this->getRequestData( [ 'customer_iti_name' ] );
        $strInstructorName          = $this->getRequestData( [ 'customer_instructor_name' ] );
        $strContent                 = '';
        $arrobjLessonPlans          = CLessonPlans::getInstance()->fetchLessonPlansByFormatTypeByInstructorId( 'custom', $this->objUser->getTeacher()->tid );

        $objMpdf                    = new \Mpdf\Mpdf();
        $objMpdf->autoLangToFont    = true;
        $mpdf->autoScriptToLang = true;
        $boolIsFirst                = true;
        foreach ( $arrobjLessonPlans AS $objLessonPlan ) {

            $arrobjFiles = CFiles::getInstance()->fetchFilesByIds( explode( ',', $objLessonPlan->file_ids ) );
            
            if( true == is_array( $arrobjFiles ) AND 0 < count( $arrobjFiles ) ) {
                
                foreach( $arrobjFiles AS $objFile ) {
                    $objFileIO->setDir( WP_CONTENT_DIR . $objFile->file_path );
                    $strContent = stripslashes( $objFileIO->read( $objFile->file_name ) );

                    if( '' == $strContent ) continue;
                    
                    if( false == $boolIsFirst ) {
                        $objMpdf->AddPage();
                    }
                    
                    if( "" != $strContent ) {
                        $strContent = preg_replace('/<ITINAME>(.*)<\/ITINAME>/is', '<ITINAME>'. $strITIName . '</ITINAME>', $strContent );
                        $strContent = preg_replace('/<INAME>(.*)<\/INAME>/is', '<INAME>INSTRUCTOR: '. $strInstructorName . '</INAME>', $strContent );
                        $objMpdf->WriteHTML( '<style>td, p, tr, div { font-family: freeserif !important; }</style>' . $strContent );
                    }
                    
                    $boolIsFirst = false;
                }
            }
        }

        $objMpdf->Output();
        exit;
    }
    
    public function displayViewSell() {
               
        $this->renderPage( 'sell/view_sell.php' );
    }
    
}

( new CSellManager() )->run();