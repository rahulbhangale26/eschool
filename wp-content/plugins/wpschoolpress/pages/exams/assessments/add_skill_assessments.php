<div class="wpsp-card" id='add_assessment'>
	<div class="wpsp-card-head">
		<h3 class="wpsp-card-title">Add Assessment Breakup.</h3>
	</div>
	
	<div class="wpsp-card-head">
		<?php 
		  displaySuccessMsg( $success_messages );
		  displayErrorMsg( $error_messages );
		?>
	</div>
	
	<div class="wpsp-card-body">
		<div class="wpsp-row">
			<form id="add_assessment_form" method="post">
				<div class="wpsp-col-md-12 line_box">
					<div class="wpsp-row">
						<div class="wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Parent Assessment<span></span></label>
								<select class="wpsp-form-control" name="parent_assessment_id">
									<option value="0">Select Parent Assessment</option> 
									<?php foreach( $parent_assessments AS $parent_assessment ) { ?>
										<option <?php echo ( true == isset( $assessment ) && $parent_assessment->id == $assessment->assessment_id ) ? 'selected="selected"' : ''; ?> value="<?php echo $parent_assessment->id; ?>"><?php echo $parent_assessment->name; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
					</div>				
					<div class="wpsp-row">
						<div class="wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Assessment Name<span></span></label>
								<input type="text" class="wpsp-form-control" id="assessment_name" placeholder="Assessment Name" name="name" autocomplete="off" value="<?php echo ( true == isset( $assessment ) ? $assessment->name : '' ); ?>" />
								
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Marks<span></span></label>
								<input type="number" class="wpsp-form-control" id="maximum_marks" placeholder="" name="maximum_marks" autocomplete="off" value="<?php echo ( true == isset( $assessment ) ? $assessment->maximum_marks : '' ); ?>" />
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<?php if( true == isset( $assessment ) ) { ?>
									<input type="submit" id="add_assessment_btn" name="edit_assessment" value="Update Skill Assessment" class="wpsp-btn wpsp-btn-success" />
									<input type="hidden" id="id" name="id" value="<?php echo $assessment->id; ?>" />
								<?php } else { ?>
									<input type="submit" id="add_assessment_btn" name="add_assessment" value="Add Skill Assessment" class="wpsp-btn wpsp-btn-success" />
								<?php } ?>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
$(function() {

	$( '#add_assessment_btn').click( function(){
		$('#add_assessment').append( '<div class="loaderOverlay"></div><div class="loader"></div>');
	});

});
</script>