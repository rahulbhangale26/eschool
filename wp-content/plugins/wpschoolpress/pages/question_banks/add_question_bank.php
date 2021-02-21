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
								<input type="text" class="wpsp-form-control" id="question_bank_name" placeholder="Question Bank Name" name="question_bank_name" value="<?php echo ( true == is_object( $question_bank ) ? $question_bank->name : ''); ?>">
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-lg-3 wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Format Type</label>
								<select class="wpsp-form-control" name="format_type" id="format_type" <?php echo ( true == is_object( $question_bank ) ? 'disabled="disable"' : '' ); ?>>
									<option value="">Select Format Type</option>
									<option <?php echo ( true == is_object( $question_bank ) && 'file' == $question_bank->format_type ) ? 'selected="selected"' : '';  ?> value="file">Image Or Pdf</option>
									<option <?php echo ( true == is_object( $question_bank ) && 'custom' == $question_bank->format_type ) ? 'selected="selected"' : '';  ?> value="custom">Custom</option>
								</select>
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
										<option <?php echo ( true == is_object( $question_bank ) && $subject->id == $question_bank->subject_id ) ? 'selected="selected"' : ''; ?> value="<?php echo $subject->id; ?>" ><?php echo $subject->sub_name; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
					</div>
					<div class="wpsp-row" id="file_picker" style="display:none">
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
								<?php if( true == is_object( $question_bank ) ) { ?>
									<input type="hidden" name="question_bank_id" value="<?php echo ( true == is_object( $question_bank ) ? $question_bank->id : '' ); ?>" >
									<input type="hidden" name="format_type" value="<?php echo ( true == is_object( $question_bank ) ? $question_bank->format_type : '' ); ?>" >					
								<?php } ?>
								<input type="submit" name="upload_question_bank" value="Save Question Bank" class="wpsp-btn wpsp-btn-success" />
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
	$('#format_type').change(function(){

		$('#file_picker').hide();

		if( 'file' == $('#format_type').val() ) {
			$('#file_picker').show();
		}
		
		if( 'custom' == $('#format_type').val() ) {
			$('#file_picker').hide();
		}
	});
	
});
</script>