<?php
class CSkillAssessmentManager extends CFactory {

	protected $objAssessment;
	
	protected $arrobjTrainees;
	protected $arrobjAssessments;
	protected $arrobjParentAssessments;
	protected $arrmixStudentAssessments;
	
	public function __construct() {
		
	}
	
	public function initalize() {
		parent::initalize();
	}
	
	public function execute() {
		
		switch( $this->getPageAction() ) {
			case NULL:
				$this->handleViewAssessments();
				break;
				
			case 'add_skill_assessment':
				$this->handleAddSkillAssessment();
				break;
				
			case 'edit_assessment_skill':
				$this->handleEditAssessmentSkill();
				break;
				
			case 'view_assess_students':
				$this->handleViewAssessStudents();
				break;
		}
		
	}
	
	public function handleViewAssessments() {
		
		$this->arrobjAssessments 		= CAssessments::getInstance()->fetchAllAssessments();
		$this->arrobjParentAssessments	= $this->rekeyObjects( 'id', CAssessments::getInstance()->fetchParentAssessments() );
		$this->displayViewAssessments();
	}
	
	public function handleAddSkillAssessment() {
		
		if( "" != $this->getRequestData( [ 'add_assessment' ] ) ) {
			switch( NULL ) {
				default:
					if( "" == $this->getRequestData( [ 'name' ] ) ) {
						$this->addErrorMessage( 'Assessment Name is required.' );
						break;
					}
					
					if( "" == $this->getRequestData( [ 'maximum_marks' ] ) ) {
						$this->addErrorMessage( 'Maximum marks is blanks.' );
					}
					
					if( 0 != $this->getRequestData( [ 'assessment_id' ] ) ) {
						$arrobjSiblingAssessments 	= CAssessments::getInstance()->fetchSiblingAssessments( sanitize_text_field( $this->getRequestData( [ 'parent_assessment_id' ] ) ) );
						$objParentAssessment		= CAssessments::getInstance()->fetchAssessmentById( sanitize_text_field( $this->getRequestData( [ 'parent_assessment_id' ] ) ) );
						$intTotalMarks				= $this->getRequestData( [ 'maximum_marks' ] );
						if( true == is_array( $arrobjSiblingAssessments ) ) {
							foreach( $arrobjSiblingAssessments AS $objAssessment ) {
								$intTotalMarks += $objAssessment->maximum_marks;
							}
						}
						
						if( $intTotalMarks > $objParentAssessment->maximum_marks ) {
							$this->addErrorMessage( 'Maximum marks are above total marks.' );
							break;
						}
					}
					
					$arrmixAssessment = [
						'assessment_id'			=> sanitize_text_field( $this->getRequestData( [ 'parent_assessment_id' ] ) ),
						'name'					=> sanitize_text_field( $this->getRequestData( [ 'name' ] ) ),
						'maximum_marks'			=> sanitize_text_field( $this->getRequestData( [ 'maximum_marks' ] ) )
					];

					if( false == CAssessments::getInstance()->insert( $arrmixAssessment ) ) {
						$this->addErrorMessage( 'Unable to save Assessment. Please contact administrator.' );
						break;
					}
					
					$this->addSuccessMessage( 'Assessment Added Successfully.' );
			}
			
		}
		
		
		$this->arrobjParentAssessments = CAssessments::getInstance()->fetchParentAssessments();
		
		$this->displayAddSkillAssessment();
	}
	
	public function handleEditAssessmentSkill() {
		
		if( "" != $this->getRequestData( [ 'edit_assessment' ] ) ) {
			switch( NULL ) {
				default:
					if( "" == $this->getRequestData( [ 'name' ] ) ) {
						$this->addErrorMessage( 'Assessment Name is required.' );
						break;
					}
					
					if( "" == $this->getRequestData( [ 'maximum_marks' ] ) ) {
						$this->addErrorMessage( 'Maximum marks is blanks.' );
					}
					
					if( 0 != $this->getRequestData( [ 'assessment_id' ] ) ) {
						$arrobjSiblingAssessments 	= CAssessments::getInstance()->fetchSiblingAssessments( sanitize_text_field( $this->getRequestData( [ 'parent_assessment_id' ] ) ) );
						$objParentAssessment		= CAssessments::getInstance()->fetchAssessmentById( sanitize_text_field( $this->getRequestData( [ 'parent_assessment_id' ] ) ) );
						$intTotalMarks				= $this->getRequestData( [ 'maximum_marks' ] );
						if( true == is_array( $arrobjSiblingAssessments ) ) {
							foreach( $arrobjSiblingAssessments AS $objAssessment ) {
								$intTotalMarks += $objAssessment->maximum_marks;
							}
						}
						
						if( $intTotalMarks > $objParentAssessment->maximum_marks ) {
							$this->addErrorMessage( 'Maximum marks are above total marks.' );
							break;
						}
					}
					
					$arrmixAssessment = [
							'assessment_id'			=> sanitize_text_field( $this->getRequestData( [ 'parent_assessment_id' ] ) ),
							'name'					=> sanitize_text_field( $this->getRequestData( [ 'name' ] ) ),
							'maximum_marks'			=> sanitize_text_field( $this->getRequestData( [ 'maximum_marks' ] ) )
					];
					
					if( false == CAssessments::getInstance()->update( $arrmixAssessment, [ 'id' => sanitize_text_field( $this->getRequestData( [ 'id' ] ) ) ] ) ) {
						$this->addErrorMessage( 'Unable to save Assessment. Please contact administrator.' );
						break;
					}
					
					$this->addSuccessMessage( 'Assessment Updated Successfully.' );
			}
		}
		
		$this->objAssessment 				= CAssessments::getInstance()->fetchAssessmentById( $this->getRequestData( [ 'assessment_id' ] ) );
		$this->arrobjParentAssessments		= CAssessments::getInstance()->fetchParentAssessments();
		$this->displayEditAssessmentSkill();
	}
	
	public function handleViewAssessStudents() {
		
		$this->arrobjTrainees 		= $this->rekeyObjects( 'sid', CStudents::getInstance()->fetchStudentsByUnitId( $this->getSessionData( [ 'filter', 'unit_id' ] ) ) );
		$this->arrobjAssessments	= CAssessments::getInstance()->fetchAllAssessments();

		if("" != $this->getRequestData( [ 'save' ] ) ) {
		    $objUpdatableTrainee      = $this->arrobjTrainees[$this->getRequestData( [ 'trainee_id' ] )];
		    $arrobjStudentAssessments = CStudentAssessments::getInstance()->fetchStudentIdsByStudentIds( [ $objUpdatableTrainee->sid ] );
			
		    CStudentAssessments::getInstance()->delete( [ 'student_id' => $objUpdatableTrainee->sid ] );
			
			foreach ( $this->arrobjAssessments AS $objAssessment ) {
				$arrmixStudentAssessment = [
				    'student_id'		=> $objUpdatableTrainee->sid,
					'assessment_id'		=> $objAssessment->id,
				    'obtained_marks'	=> sanitize_text_field( $this->getRequestData( ['marks_' . $objUpdatableTrainee->sid . '_' . $objAssessment->id ] ) )
				];
					
				CStudentAssessments::getInstance()->insert( $arrmixStudentAssessment );
			}
		}
		
		$arrobjStudentAssessments = CStudentAssessments::getInstance()->fetchStudentAssessmentsByStudentIds( array_keys( $this->arrobjTrainees ) );
		
		foreach( $arrobjStudentAssessments AS $objStudentAssessment ) {
			$this->arrmixStudentAssessments['marks_' . $objStudentAssessment->student_id . '_' . $objStudentAssessment->assessment_id] = $objStudentAssessment->obtained_marks;
		}
		
		
		$this->displayViewAssessStudents();
	}
	
	public function displayViewAssessments() {
		
		$this->arrmixTemplateParams['parent_assessments']	= $this->arrobjParentAssessments;
		$this->arrmixTemplateParams['assessments']			= $this->arrobjAssessments;
		
		$this->renderPage( 'exams/assessments/view_assessments.php' );
	}
	
	public function displayAddSkillAssessment() {

		$this->arrmixTemplateParams['parent_assessments']		= $this->arrobjParentAssessments;
		
		$this->renderPage( 'exams/assessments/add_skill_assessments.php' );
		
	}
	
	public function displayEditAssessmentSkill() {
		$this->arrmixTemplateParams['assessment']			= $this->objAssessment;
		$this->arrmixTemplateParams['parent_assessments']	= $this->arrobjParentAssessments;
		
		$this->renderPage( 'exams/assessments/add_skill_assessments.php' );
	}
	
	public function displayViewAssessStudents() {
		$this->arrmixTemplateParams['trainees']				= $this->arrobjTrainees;
		$this->arrmixTemplateParams['assessments']			= $this->arrobjAssessments;
		$this->arrmixTemplateParams['student_assessments']	= $this->arrmixStudentAssessments;
		
		$this->renderPage( 'exams/assessments/view_assess_students.php');
	}
	
}

( new CSkillAssessmentManager() )->run();