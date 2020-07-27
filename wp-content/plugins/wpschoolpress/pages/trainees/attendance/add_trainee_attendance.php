<div class="wpsp-card">
	<div class="wpsp-card-head" id="message">
		<?php 
		  displaySuccessMsg( $success_messages );
		  displayErrorMsg( $error_messages );
		?>
	</div>
	<div class="wpsp-card-body" id="add_trainee_attendance">
		<form action="" method="post">
		<div class="wpsp-row">
			<div class="wpsp-col-lg-5 wpsp-col-md-5 wpsp-col-sm-12 wpsp-col-xs-12">
				<div class="line_box">
					<div class="wpsp-form-group">
						<label for="date" class="wpsp-labelMain">Select Date</label>
						<input type="text" class="wpsp-form-control select_date" id="attendance_date" value="<?php echo ( isset( $edit_attendance['attendance_date'] ) ? $edit_attendance['attendance_date'] : '' )?>" name="attendance_date">
					</div>
				
				</div>
			</div>
			<div class="wpsp-row">
				<div class="wpsp-col-md-12" id="trainee_attendance">
									
				</div>
			</div>
			<div class="wpsp-row">
				<div class="wpsp-col-lg-5 wpsp-col-md-5 wpsp-col-sm-12 wpsp-col-xs-12">
					<div class="wpsp-form-group">
						<input type="submit" name="submit" value="submit" id="TraineeAttendanceSubmit" class="wpsp-btn wpsp-btn-success" />
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
</div>

<script>

var ajax_url = '<?php echo admin_url('admin-ajax.php') ?>';

function loadAttendance() {
	sch.ajaxRequest({
		'page': 'sch-trainee_attendance',
		'pageAction': 'trainee_attendance_form',
		'selector': '#add_trainee_attendance',
		data: { 'attendance_date': $('#attendance_date').val() },
		success: function( res ) {
			$('#trainee_attendance').html(res);
			$('#TraineeAttendanceSubmit').show();
		}
	});
}

$( function() {

	$( "#attendance_date" ).datepicker({
		dateFormat: 'yy-mm-dd',
		showOtherMonths: true,
	    selectOtherMonths: true,
	    showButtonPanel: true,
	    changeMonth: true,
	    changeYear: true
	});
	
	$('#TraineeAttendanceSubmit').hide();
	
    $('#attendance_date').change( function() {
    	loadAttendance();
     });
	
	<?php  if( true == isset( $edit_attendance['attendance_date'] ) ) { ?>
		loadAttendance();
    <?php } ?>

});
</script>