<?php
class CProgressCardManager extends CFactory {
	
	protected $arrobjTrades;
	protected $arrobjUnits;
	protected $arrobjStudents;
	protected $arrobjJobProgress;
	protected $arrobjJobs;
	
	protected $objStudent;
	
	public function __construct() {
		
	}

	public function initalize() {
		parent::initalize();
	}

	public function execute() {
		
		switch( $this->getPageAction() ) {
			case NULL:
				$this->handleViewProgressCard();
				break;
				
			case 'view_progress_card_filter':
				$this->handleViewProgressCardFilter();
				break;
				
			case 'view_student_progress_card':
				$this->handleViewStudentProgressCard();
				break;
		}
	}

	public function handleViewProgressCard() {
		
		if( false == is_null( $this->getSessionData( [ 'filter', 'unit_id' ] ) ) ) {
			$this->arrobjStudents		= CStudents::getInstance()->fetchStudentsByUnitId( $this->getSessionData( [ 'filter', 'unit_id' ] ) );
		}
		
		
		$this->displayViewProgressCard();
	}
	
	public function handleViewProgressCardFilter() {

		if( false == is_null( $this->getSessionData( [ 'filter', 'unit_id' ] ) ) ) {
			$this->arrobjStudents		= CStudents::getInstance()->fetchStudentsByUnitId( $this->getSessionData( [ 'filter', 'unit_id' ] ) );
		}
		
		$this->displayViewProgressCardFilter();
		
	}
	
	public function handleViewStudentProgressCard() {
		
		switch( NULL ) {
			default:			
				if( true == is_null( $this->getRequestData( ['data', 'student_id' ] ) ) ) {
					$this->addErrorMessage( 'Student is required to show progress card.' );
					break;
				}
				
				$this->objStudent			= CStudents::getInstance()->fetchStudentById( $this->getRequestData( [ 'data', 'student_id' ] ) );
				$arrobjJobs					= CJobs::getInstance()->fetchJobsByUnitId( $this->getSessionData( [ 'filter', 'unit_id' ] ) );
				$arrobjJobProgress			= CJobMarks::getInstance()->fetchProgressDetailsByStudentId( $this->getRequestData( [ 'data', 'student_id' ] ) );
				$this->arrobjJobs			= $this->rekeyObjects( 'number', $arrobjJobs );
				$this->arrobjJobProgress	= $this->rekeyObjects( 'job_id', $arrobjJobProgress );
				
		}
		
		$this->displayViewStudentProgressCard();
	}

	public function displayViewProgressCard() {
		
		$this->arrmixTemplateParams['students']			= $this->arrobjStudents;
		$this->renderPage( 'progress_card/view_progress_card.php' );
	}
	
	public function displayViewProgressCardFilter() {
		
		$this->arrmixTemplateParams['students']			= $this->arrobjStudents;
		$this->arrmixTemplateParams['filter']			= $this->getRequestData( [ 'data' ] );
		
		
		
		$this->renderPage( 'progress_card/view_progress_card_filter.php' );
		
	}
	
	public function displayViewStudentProgressCard() {
		global $wpsp_settings_data;
		
		$this->arrmixTemplateParams['student']			= $this->objStudent;
		$this->arrmixTemplateParams['batches']			= $this->rekeyObjects( 'id', CBatches::getInstance()->fetchAllBatches() );
		$this->arrmixTemplateParams['trades']			= $this->rekeyObjects( 'id', CTrade::getInstance()->fetchAllTrades() );
		$this->arrmixTemplateParams['units']			= $this->rekeyObjects( 'id', CUnits::getInstance()->fetchAllUnits() );
		$this->arrmixTemplateParams['job_progress']		= $this->arrobjJobProgress;
		$this->arrmixTemplateParams['jobs']				= $this->arrobjJobs;
		
		$this->arrmixTemplateParams['iti_name']         = isset( $wpsp_settings_data['sch_name'] ) && !empty( $wpsp_settings_data['sch_name'] ) ? $wpsp_settings_data['sch_name'] : __( 'ITIMS','WPSchoolPress' );
		
		
		$this->renderPage( 'progress_card/view_student_progress_card.php' );
	}
	
}

( new CProgressCardManager() )->run();

