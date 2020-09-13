<?php

class CScriptsManager extends CFactory {
    
    public function __construct() {
        
    }
    
    public function initalize() {
        parent::initalize();
    }
    
    public function execute() {
        
        switch( $this->getPageAction() ) {
            case 'migrate_lesson_plan':
                $this->handleMigrateLessonPlan();
                break;
        }
    }
    
    public function handleMigrateLessonPlan() {
        $objFileIO         = new CFileIO();
        $arrobjLessonPlans = CLessonPlans::getInstance()->fetchLessonPlanByFormatType( CLessonPlans::CUSTOM );
               
        foreach ( $arrobjLessonPlans AS $objLessonPlan ) {
            $arrobjFiles = CFiles::getInstance()->fetchFilesByIds( explode( ',', $objLessonPlan->file_ids ) );

            if( true == is_array( $arrobjFiles ) AND 0 < count( $arrobjFiles ) ) {
                foreach( $arrobjFiles AS $objFile ) {
                    $strContent = '';
                    $arrstrmatches = [];
                    $arrstrLessonPlan = [];
                    
                    $objFileIO->setDir( WP_CONTENT_DIR . $objFile->file_path );
                    $strContent = stripslashes( $objFileIO->read( $objFile->file_name ) );
                    $objFileIO->close();
                    
                    $strContent = str_replace( "\r", '', $strContent );
                    $strContent = str_replace( "\t", '', $strContent );
                    $strContent = str_replace( "\n", '', $strContent );
                    
                    if( '' == $strContent ) continue;
                    
                    if( strpos( $strContent, 'ITINAME') !== false) continue;

                    if( false === preg_match_all('/<td ?.*>(.*)<\/td>/U', $strContent, $arrstrmatches ) ) continue;

                    $arrstrLessonPlan = $arrstrmatches[1];
                    
                    ob_start();
                    require WPSP_PLUGIN_PATH . 'pages/lesson_plan/view_lesson_plan_migration_template.php';
                    $strModifiedContent = ob_get_clean();
                    
                    $objFileIO->write( $strModifiedContent, $objFile->file_name );
                    $objFileIO->close();
                }
            }
        }
    }
}

( new CScriptsManager() )->run();

