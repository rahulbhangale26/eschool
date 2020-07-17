<?php
class CProgressCardManager extends CFactory {
	
	protected $arrobjTrades;
	protected $arrobjUnits;
	protected $arrobjStudents;
	protected $arrobjJobProgress;
	
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
		if(  CRole::ADMIN == $this->objUser->getRole() || ( CRole::TEACHER == $this->objUser->getRole() && true == in_array( $this->objUser->getTeacher()->designation_id, [ CDesignations::PRINCIPAL, CDesignations::CLERK ] ) ) ) {
			$this->arrobjTrades 		= $this->rekeyObjects( 'id', CTrade::getInstance()->fetchAllTrades() );
			$this->arrobjUnits			= $this->rekeyObjects( 'id', CUnits::getInstance()->fetchAllUnits() );
		} else {
			$this->arrobjTrades 		= $this->rekeyObjects( 'id', CTrade::getInstance()->fetchTradesByInstructorId( $this->objUser->getTeacher()->tid ) );
			$this->arrobjUnits			= $this->rekeyObjects( 'id', CUnits::getInstance()->fetchUnitByInstructorUserId( $this->objUser->getTeacher()->tid ) );
		}
		
		$this->displayViewProgressCard();
	}
	
	public function handleViewProgressCardFilter() {

		if(  CRole::ADMIN == $this->objUser->getRole() || ( CRole::TEACHER == $this->objUser->getRole() && true == in_array( $this->objUser->getTeacher()->designation_id, [ CDesignations::PRINCIPAL, CDesignations::CLERK ] ) ) ) {
			$this->arrobjTrades 		= $this->rekeyObjects( 'id', CTrade::getInstance()->fetchAllTrades() );
			$this->arrobjUnits			= $this->rekeyObjects( 'id', CUnits::getInstance()->fetchAllUnits() );
		} else {
			$this->arrobjTrades 		= $this->rekeyObjects( 'id', CTrade::getInstance()->fetchTradesByInstructorId( $this->objUser->getTeacher()->tid ) );
			$this->arrobjUnits			= $this->rekeyObjects( 'id', CUnits::getInstance()->fetchUnitByInstructorUserId( $this->objUser->getTeacher()->tid ) );
		}
		
		
		if( false == is_null( $this->getRequestData( [ 'data', 'unit_id' ] ) ) ) {
			$this->arrobjStudents		= CStudents::getInstance()->fetchStudentsByUnitId( $this->getRequestData( [ 'data', 'unit_id' ] ) );
		}
		
		$this->displayViewProgressCardFilter();
		
	}
	
	public function handleViewStudentProgressCard() {
		
		switch( NULL ) {
			default:
				if( true == is_null( $this->getRequestData( [ 'data', 'unit_id' ]  ) ) ) {
					$this->addErrorMessage( 'Unit is required to show progress card.' );
					break;
				}
				
				if( true == is_null( $this->getRequestData( ['data', 'student_id' ] ) ) ) {
					$this->addErrorMessage( 'Student is required to show progress card.' );
					break;
				}
				
				$this->objStudent			= CStudents::getInstance()->fetchStudentById( $this->getRequestData( [ 'data', 'student_id' ] ) );
				
				$arrobjJobProgress	= CJobMarks::getInstance()->fetchProgressDetailsByStudentId( $this->getRequestData( [ 'data', 'student_id' ] ) );
							
				foreach( $arrobjJobProgress AS $objJobProgress ) {
					if( 7 < ( int ) date( 'm', strtotime( $objJobProgress->start_date ) ) ) {
						$strYearStartDate	= date( 'Y', strtotime( $objJobProgress->start_date ) ) . '-08-01';
					} else {
						$strYearStartDate	= ( date( 'Y', strtotime( $objJobProgress->start_date ) ) - 1 ) . '-08-01';
					}

					$intWeekNo 				= round( ( strtotime( $objJobProgress->start_date ) - strtotime( $strYearStartDate ) ) / ( 60 * 60 * 24 * 7 ) );
					$this->arrobjJobProgress[ $intWeekNo ][] = $objJobProgress;
				}
				
		}
		
		$this->displayViewStudentProgressCard();
	}

	public function displayViewProgressCard() {
		$this->arrmixTemplateParams['batches']			= $this->rekeyObjects( 'id', CBatches::getInstance()->fetchAllBatches() );
		$this->arrmixTemplateParams['trades']			= $this->arrobjTrades;
		$this->arrmixTemplateParams['units']			= $this->arrobjUnits;
		
		$this->renderPage( 'progress_card/view_progress_card.php' );
	}
	
	public function displayViewProgressCardFilter() {
		
		$this->arrmixTemplateParams['batches']			= $this->rekeyObjects( 'id', CBatches::getInstance()->fetchAllBatches() );
		$this->arrmixTemplateParams['trades']			= $this->arrobjTrades;
		$this->arrmixTemplateParams['units']			= $this->arrobjUnits;
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
		
		$this->arrmixTemplateParams['iti_name']         = isset( $wpsp_settings_data['sch_name'] ) && !empty( $wpsp_settings_data['sch_name'] ) ? $wpsp_settings_data['sch_name'] : __( 'ITIMS','WPSchoolPress' );
		
		
		$this->renderPage( 'progress_card/view_student_progress_card.php' );
	}
	
}

( new CProgressCardManager() )->run();

