<?php

class CTraineesManager extends CFactory {
    
    protected $arrobjBatches;
    
    public function __construct() {
        
    }
    
    public function initalize() {
        parent::initalize();
        
        add_action('admin_enqueue_scripts', array(
            $this,
            'enqueueScripts'
        ));
    }
    
    public function execute() {
        
        switch( $this->getAction() ) {
            case NULL:
                $this->handleViewTrainees();
                break;
        }
        
    }
    
    public function handleViewTrainees() {
        
        $this->displayViewTrainees();
    }
    
    public function displayViewTrainees() {
        $this->renderPage( 'trainees/view_trainees.php' );
    }
    
    public function enqueueScripts() {
        wp_enqueue_script('student_list', WPSP_PLUGIN_URL . 'js/common/student-list.js' );
    }
    
}

( new CTraineesManager() )->run();

