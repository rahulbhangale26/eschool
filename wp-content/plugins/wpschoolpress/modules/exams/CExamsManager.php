<?php
class CExamsManager extends CFactory {
	
	protected $objExam;
	
	protected $arrobjExams;
	protected $arrobjSubjects;
	protected $arrobjTrainees;
	protected $arrobjExamResults;
	protected $arrobjExamSubjects;
	
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
				
			case 'add_exam':
				$this->handleAddExam();
				break;
				
			case 'edit_exam':
				$this->handleEditExam();
				break;
				
			case 'view_manage_exam':
				$this->handleViewManageExam();
				break;
				
			case 'save_exam_timetable':
				$this->handleSaveExamTimetable();
				break;
				
			case 'save_exam_results':
				$this->handleSaveExamResults();
				break;
		}
	}
	
	public function handleViewExams() {
		$this->arrobjExams = CExams::getInstance()->fetchExamsByUnitId( $this->getSessionData( [ 'filter', 'unit_id' ] ) );
		
		$this->displayViewExams();
	}
	
	public function handleAddExam() {
		if( "" != $this->getRequestData( [ 'add_exam' ] ) ) {
			switch ( NULL ) {
				default:
					if( "" == $this->getRequestData( [ 'exam_name' ] ) ) {
						$this->addErrorMessage( 'Exam name is required.' );
						break;
					}
					
					if( "" == $this->getRequestData( [ 'start_date' ] ) ) {
						$this->addErrorMessage( 'Start date is required.' );
						break;
					}
					
					if( "" == $this->getRequestData( [ 'end_date' ] ) ) {
						$this->addErrorMessage( 'End date is required.' );
						break;
					}
					
					$arrstrExam = [
						'unit_id'			=> $this->getSessionData( ['filter', 'unit_id' ] ),
						'instructor_id'		=> $this->objUser->getTeacher()->tid,
						'name'				=> sanitize_text_field( $this->getRequestData( [ 'exam_name' ] ) ),
						'start_date'		=> sanitize_text_field( $this->getRequestData( ['start_date' ] ) ),
						'end_date'			=> sanitize_text_field( $this->getRequestData( ['end_date' ] ) ),
					];
					
					if( false == CExams::getInstance()->insert( $arrstrExam ) ) {
						$this->addErrorMessage( 'Unable to insert exam details.' );
						break;
					}
					
					$this->addSuccessMessage( 'Exam added Successfully.' );
			}
		}
		
		$this->displayAddExam();
	}
	
	public function handleEditExam() {
		if( "" != $this->getRequestData( ['edit_exam'] ) ) {
			switch ( NULL ) {
				default:
					if( "" == $this->getRequestData( [ 'exam_name' ] ) ) {
						$this->addErrorMessage( 'Exam name is required.' );
						break;
					}
					
					if( "" == $this->getRequestData( [ 'start_date' ] ) ) {
						$this->addErrorMessage( 'Start date is required.' );
						break;
					}
					
					if( "" == $this->getRequestData( [ 'end_date' ] ) ) {
						$this->addErrorMessage( 'End date is required.' );
						break;
					}
					
					$arrstrExam = [
							'unit_id'			=> $this->getSessionData( ['filter', 'unit_id' ] ),
							'name'				=> sanitize_text_field( $this->getRequestData( [ 'exam_name' ] ) ),
							'start_date'		=> sanitize_text_field( $this->getRequestData( [ 'start_date' ] ) ),
							'end_date'			=> sanitize_text_field( $this->getRequestData( [ 'end_date' ] ) ),
					];
					
					if( false == CExams::getInstance()->update( $arrstrExam, [ 'id' =>  sanitize_text_field( $this->getRequestData( [ 'exam_id'] ) ) ] ) ) {
						$this->addErrorMessage( 'Unable to update the exam.' );
						break;
					}
					
					$this->addSuccessMessage( 'Exam updated successfully.' );
			}
		}
				
		$this->objExam = CExams::getInstance()->fetchExamById( $this->getRequestData( ['exam_id' ] ) );
		
		$this->displayEditExam();
		
	}
	
	public function handleViewManageExam() {
		$this->objExam 				= CExams::getInstance()->fetchExamById( sanitize_text_field( $this->getRequestData( ['exam_id' ] ) ) );
		$this->arrobjSubjects		= CSubjects::getInstance()->getInstance()->fetchSubjectsByUnitId( $this->getSessionData( [ 'filter', 'unit_id' ] ) );
		$this->arrobjTrainees		= CStudents::getInstance()->fetchStudentsByUnitId( $this->getSessionData( ['filter', 'unit_id'] ) );
		$this->arrobjExamSubjects	= $this->rekeyObjects( 'subject_id', CExamSubjects::getInstance()->fetchExamSubjectsByExamId( $this->objExam->id ) );
		$this->arrobjExamResults 	= CExamResults::getInstance()->fetchExamResultsByExamId( $this->objExam->id );
		
		$this->displayViewManageExam();
	}
	
	public function handleSaveExamTimetable() {
		$arrmixExamSubjects			= $this->getRequestData( [ 'data'] );
		
		switch ( NULL ) {
			default:
				
				if( false == $this->objValidation->valArr( $arrmixExamSubjects ) ) {
					$this->arrstrJsonRespose = [ 'status' => false , 'message'=> 'Unable to save exam details. Invalid details provided.' ];
					break;
				}
				
				if( false == isset( $arrmixExamSubjects['exam_id'] ) || "" == $arrmixExamSubjects['exam_id'] ) {
					$this->arrstrJsonRespose = [ 'status' => false , 'message'=> 'Exam id is required.' ];
					break;
				}
				
				$this->arrobjExamSubjects	= $this->rekeyObjects( 'subject_id', CExamSubjects::getInstance()->fetchExamSubjectsByExamId( $this->objExam->id ) );
				
				if( true == $this->objValidation->valArr( $this->arrobjExamSubjects ) && false == CExamSubjects::getInstance()->delete( [ 'exam_id' => $arrmixExamSubjects['exam_id'] ] ) ) {
					$this->arrstrJsonRespose = [ 'status' => false , 'message'=> 'Unable to update. Please contact administrator.' ];
					break;
				}
				 
				$this->arrobjSubjects	= CSubjects::getInstance()->getInstance()->fetchSubjectsByUnitId( $this->getSessionData( [ 'filter', 'unit_id' ] ) );
				
				foreach ( $this->arrobjSubjects AS $objSubject ) {
					$arrstrSubject = [
						'exam_id'			=> $arrmixExamSubjects['exam_id'],
						'subject_id'		=> $objSubject->id,
						'start_datetime'	=> isset( $arrmixExamSubjects['start_datetime_' . $objSubject->id] ) ? date( 'Y-m-d H:i:s', strtotime( $arrmixExamSubjects['start_datetime_' . $objSubject->id] ) ) : '',
						'end_datetime'		=> isset( $arrmixExamSubjects['end_datetime_' . $objSubject->id] ) ?  date( 'Y-m-d H:i:s', strtotime( $arrmixExamSubjects['end_datetime_' . $objSubject->id] ) ) : '',
						'total_marks'		=> isset( $arrmixExamSubjects['total_marks_' . $objSubject->id] ) ? $arrmixExamSubjects['total_marks_' . $objSubject->id] : ''
					];
					
					if( false == CExamSubjects::getInstance()->insert( $arrstrSubject ) ) {
						$this->arrstrJsonRespose = [ 'status' => false , 'message'=> 'Unable to save exam details.' ];
						break;
					}
					
				}
				
				$this->arrstrJsonRespose = [ 'status' => true , 'message' => 'Successfully updated Exam details.' ];
				
		}
				
		$this->displayJson();
	}
	
	public function handleSaveExamResults() {
		$arrmixExamResults = $this->getRequestData( [ 'data'] );
		
		switch ( NULL ) {
			default:
				if( false == $this->objValidation->valArr( $arrmixExamResults ) ) {
					$this->arrstrJsonRespose = [ 'status' => false, 'message' => 'Unable to save exam results. Invalid results provided.' ];
					break;
				}
				
				if( false == isset( $arrmixExamResults['exam_id'] ) || "" == $arrmixExamResults['exam_id'] ) {
					$this->arrstrJsonRespose = [ 'status' => false , 'message'=> 'Exam id is required.' ];
					break;
				}
				
				$this->arrobjExamResults = CExamResults::getInstance()->fetchExamResultsByExamId( sanitize_text_field( $arrmixExamResults['exam_id'] ) );

				if( true == $this->objValidation->valArr( $this->arrobjExamResults ) && false == CExamResults::getInstance()->delete( [ 'exam_id'	=> $arrmixExamResults['exam_id'] ] ) ) {
					$this->arrstrJsonRespose = [ 'status' => false , 'message'=> 'Unable to update. Please contact administrator.' ];
					break;
				}
				
				$this->arrobjSubjects	= CSubjects::getInstance()->getInstance()->fetchSubjectsByUnitId( $this->getSessionData( [ 'filter', 'unit_id' ] ) );
				$this->arrobjTrainees	= CStudents::getInstance()->fetchStudentsByUnitId( $this->getSessionData( [ 'filter', 'unit_id' ] ) );
				
				foreach( $this->arrobjTrainees AS $objTrainee ) {
					foreach( $this->arrobjSubjects AS $objSubject ) {
						$arrstrExanResult = [
							'exam_id'			=> sanitize_text_field( $arrmixExamResults['exam_id'] ),
							'subject_id'		=> $objSubject->id,
							'student_id'		=> $objTrainee->sid,
							'obtained_marks'	=> ( true == isset( $arrmixExamResults['marks_' . $objSubject->id . '_' . $objTrainee->sid ] ) ) ? $arrmixExamResults['marks_' . $objSubject->id . '_' . $objTrainee->sid ] : 0
						];
						
						if( false == CExamResults::getInstance()->insert( $arrstrExanResult ) ) {
							$this->arrstrJsonRespose = [ 'status' => false , 'message'=> 'Unable to save exam results.' ];
							break;
						}
					}
				}
				
				$this->arrstrJsonRespose = [ 'status' => true , 'message' => 'Successfully updated Exam results.' ];
			
		}
		
		$this->displayJson();
	}
	
	public function displayViewExams() {
		$this->arrmixTemplateParams['exams']	= $this->arrobjExams;
		
		$this->renderPage( 'exams/view_exams.php' );
	}
	
	public function displayAddExam() {
		$this->renderPage( 'exams/add_exam.php' );
	}
	
	public function displayEditExam() {
		
		$this->arrmixTemplateParams['exam']		= $this->objExam;
		
		$this->renderPage( 'exams/add_exam.php' );
	}
	
	public function displayViewManageExam() {
		
		$this->arrmixTemplateParams['exam']				= $this->objExam;
		$this->arrmixTemplateParams['subjects']			= $this->arrobjSubjects;
		$this->arrmixTemplateParams['trainees']			= $this->arrobjTrainees;
		$this->arrmixTemplateParams['exam_subjects']	= $this->arrobjExamSubjects;
		$this->arrmixTemplateParams['exam_results']		= $this->rekeyObjects( 'student_subject', $this->arrobjExamResults );
		
		$this->renderPage( 'exams/view_manage_exam.php' );
		
	}

}

( new CExamsManager() )->run();
