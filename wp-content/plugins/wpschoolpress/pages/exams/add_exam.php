<div class="wpsp-card" id='add_exam'>
	<div class="wpsp-card-head">
		<h3 class="wpsp-card-title"></h3>
	</div>
	
	<div class="wpsp-card-head">
		<?php 
		  displaySuccessMsg( $success_messages );
		  displayErrorMsg( $error_messages );
		?>
	</div>
	
	<div class="wpsp-card-body">
		<div class="wpsp-row">
			<form id="add_exam_form" method="post">
				<div class="wpsp-col-md-12 line_box">
					<div class="wpsp-row">
						<div class="wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Exam Name<span></span></label>
								<input type="text" class="wpsp-form-control" id="exam_name" placeholder="" name="exam_name" autocomplete="off" value="<?php echo ( true == is_object( $exam ) ? $exam->name : '' ); ?>" />
							</div>
						</div>
					</div>				
					<div class="wpsp-row">
						<div class="wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Start Date<span></span></label>
								<input type="text" class="wpsp-form-control" id="start_date" placeholder="" name="start_date" autocomplete="off" value="<?php echo ( true == is_object( $exam ) ? date( 'Y-m-d', strtotime( $exam->start_date ) ) : '' ); ?>" />
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">End Date<span></span></label>
								<input type="text" class="wpsp-form-control" id="end_date" placeholder="" name="end_date" autocomplete="off" value="<?php echo ( true == is_object( $exam ) ? date( 'Y-m-d', strtotime( $exam->end_date ) ) : '' ); ?>" />
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<?php if( true == is_object( $exam ) ) { ?>
									<input type="hidden" name="exam_id" value="<?php echo $exam->id; ?>" />
									<input type="submit" name="edit_exam" value="Update Exam" class="wpsp-btn wpsp-btn-success" />
								<?php } else { ?>
									<input type="submit" name="add_exam" value="Add Exam" class="wpsp-btn wpsp-btn-success" />
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
	$( "#start_date" ).datepicker({
		dateFormat: 'yy-mm-dd',
		showOtherMonths: true,
	    selectOtherMonths: true,
	    showButtonPanel: true,
	    changeMonth: true,
	    changeYear: true
	});
	
	$( "#end_date" ).datepicker({
		dateFormat: 'yy-mm-dd',
		showOtherMonths: true,
	    selectOtherMonths: true,
	    showButtonPanel: true,
	    changeMonth: true,
	    changeYear: true
	});
});
</script>