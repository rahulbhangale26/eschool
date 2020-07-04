<div class="wpsp-card" id='syllabys_upload_form'>
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
			<form id="syllabus_upload" method="post" enctype="multipart/form-data">
				<div class="wpsp-col-md-12 line_box">
					<div class="wpsp-row">
						<div class="wpsp-col-lg-3 wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Syllabus Name<span></span></label>
								<input type="text" class="wpsp-form-control" id="syllabus_name" placeholder="Syllabus Name" name="syllabus_name">
							</div>
						</div>
					</div>					
					<div class="wpsp-row">
						<div class="wpsp-col-lg-3 wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Trade</label>
								<select name="trade_id" id="trade_id" class="wpsp-form-control">
									<option value="">Select Trade</option>
									<?php foreach ( $trades as $trade ) { ?>
										<option value="<?php echo $trade->id; ?>" ><?php echo $trade->name; ?></option>
									<?php } ?>
									<option value="0" >Other</option>
								</select>
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-lg-3 wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Syllabus File<span></span></label>
								<input type="file" class="wpsp-form-control" id="syllabus_file" placeholder="" name="syllabus_file">
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-lg-3 wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<input type="submit" name="upload_syllabus" value="Upload Syllabus" class="wpsp-btn wpsp-btn-success" />
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