<?php
class CExamsManager extends CFactory {
	
	public function __construct() {
		
	}
	
	public function initalize() {
		parent::initalize();
	}
	
	public function execute() {
		
		switch( $this->getPageAction() ) {
			case NULL:
				$this->handleViewExams();
				break;
		}
	}
	
	public function handleViewExams() {
		
		$this->displayViewExams();
	}
	
	public function displayViewExams() {
		$this->renderPage( 'exams/view_exams.php' );
	}
}

( new CExamsManager() )->run();
