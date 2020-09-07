<div class="wpsp-card" id='sell_form'>
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
			<form id="sell_form" method="post" enctype="multipart/form-data">
				<div class="wpsp-col-md-12 line_box">
					<div class="wpsp-row">
						<div class="wpsp-col-lg-6 wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">ITI Name<span></span></label>
								<input type="text" class="wpsp-form-control" id="customer_iti_name" placeholder="ITI Name" name="customer_iti_name" value="">
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-lg-6 wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Instructor Name<span></span></label>
								<input type="text" class="wpsp-form-control" id="customer_instructor_name" placeholder="Instructor Name" name="customer_instructor_name" value="">
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-lg-3 wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<input type="submit" name="download_demostration_plan" value="Download Demostration Plan" class="wpsp-btn wpsp-btn-success" />
							</div>
						</div>
						<div class="wpsp-col-lg-3 wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<input type="submit" name="download_lesson_plan" value="Download Lesson Plan" class="wpsp-btn wpsp-btn-success" />
							</div>
						</div>
					</div>
				</div>
				<input type="hidden" name="skip_wp" value="1">
			</form>
		</div>
	</div>
</div>
<script>
</script>