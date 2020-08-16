<style>
.out_of {
	font-size: small;
	color: #00bdda;
}
.trainee_assess_blocks{
    border: solid 1px #00bdda;
    padding: 10px;
    margin-bottom: 10px;
}
.float-right {
	float: right;
}
</style>
<div class="wpsp-card" id='assess_students'>
	<div class="wpsp-card-head">
		<h3 class="wpsp-card-title">Assess Students.</h3>
	</div>
	
	<div class="wpsp-card-head">
		<?php 
		  displaySuccessMsg( $success_messages );
		  displayErrorMsg( $error_messages );
		?>
	</div>
	
	<div class="wpsp-card-body">
		<div class="wpsp-row">
			<form method="post" id="result-frm">
				<div class="wpsp-col-md-12 line_box">
					<?php foreach ( $trainees AS $trainee ) { ?>
						<div class="wpsp-row trainee_assess_blocks">
 							<div class="wpsp-col-md-2 wpsp-col-sm-3 wpsp-col-xs-12">
  								<div class="wpsp-form-group">
									<strong><?php echo $trainee->s_fname . ' ' . $trainee->s_lname; ?></strong>
								</div>
  							</div>
  							<?php foreach( $assessments AS $assessment ) { ?>		
  							<?php if( $assessment->assessment_id == 0 ) continue; ?>			
  								<div class="wpsp-col-md-2 wpsp-col-sm-2 wpsp-col-xs-12">
  									<div class="wpsp-form-group">
										<label class="wpsp-labelMain"><?php echo $assessment->name; ?>: </label>
	   									<input type="number" name="marks_<?php echo $trainee->sid?>_<?php echo $assessment->id; ?>" class="wpsp-form-control" value="<?php echo ( true == isset( $student_assessments['marks_' . $trainee->sid . '_' . $assessment->id] ) ? $student_assessments['marks_' . $trainee->sid . '_' . $assessment->id] : '' ); ?>" placeholder="" />
	   									<span class="out_of">Out of <?php echo $assessment->maximum_marks; ?></span>
									</div>
  								</div>
  							<?php } ?>
  							<input type="submit" id="save_result" name="save" value="Save" class="wpsp-btn wpsp-btn-success float-right" />
  						</div>
					<?php }?>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
$(function() {

	$( '#save_result').click( function(){
		$('#assess_students').append( '<div class="loaderOverlay"></div><div class="loader"></div>');
	});

});
</script>
