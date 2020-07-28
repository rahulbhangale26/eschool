<div class="wpsp-card" id='question_bank_upload_form'>
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
			<form id="question_bank_upload" method="post" enctype="multipart/form-data">
				<div class="wpsp-col-md-12 line_box">
					<div class="wpsp-row">
						<div class="wpsp-col-lg-3 wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Question Bank Name<span></span></label>
								<input type="text" class="wpsp-form-control" id="question_bank_name" placeholder="Question Bank Name" name="question_bank_name">
							</div>
						</div>
					</div>					
					<div class="wpsp-row">
						<div class="wpsp-col-lg-3 wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Subject</label>
								<select name="subject_id" id="subject_id" class="wpsp-form-control">
									<option value="">Select Subject</option>
									<?php foreach ( $subjects as $subject ) { ?>
										<option value="<?php echo $subject->id; ?>" ><?php echo $subject->sub_name; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-lg-3 wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Question Bank File<span></span></label>
								<input type="file" class="wpsp-form-control" id="question_bank_file" placeholder="" name="question_bank_file">
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-lg-3 wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<input type="submit" name="upload_question_bank" value="Upload Question Bank" class="wpsp-btn wpsp-btn-success" />
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
	
});
</script>