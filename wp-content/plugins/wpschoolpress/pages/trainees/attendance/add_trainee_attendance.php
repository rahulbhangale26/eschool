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

					<div class="wpsp-form-group">
						<label for="trade" class="wpsp-labelMain">Select Batch</label>
						<select class="wpsp-form-control" name="batch_id" id="batch_id">
							<option value="" disabled selected>Select Batch</option>
							<?php foreach( $batches as $batch ) { ?>
								<option 
								<?php echo ( isset( $edit_attendance['batch_id'] ) && $edit_attendance['batch_id'] == $batch->id? 'selected="selected"' : '' )?>
									value="<?php echo $batch->id?>"><?php echo $batch->name; ?></option>
							<?php } ?>
						</select>
					</div>
					
					<div class="wpsp-form-group">
						<label for="trade" class="wpsp-labelMain">Select Trade</label>
						<select class="wpsp-form-control" disabled name="trade_id" id="trade_id">
							<option value="" disabled selected >Select Trade</option>
							<?php foreach( $trades as $trade ) { ?>
								<option
									<?php echo ( isset( $edit_attendance['trade_id'] ) && $edit_attendance['trade_id'] == $trade->id? 'selected="selected"' : '' )?>
									value="<?php echo $trade->id?>"><?php echo $trade->name; ?></option>
							<?php } ?>
						</select>
					</div>
					
					<div class="wpsp-form-group">
						<label for="trade" class="wpsp-labelMain">Select Unit</label>
						<select class="wpsp-form-control" disabled name="unit_id" id="unit_id">
							<option value="" disabled selected >Select Unit</option>
							<?php foreach( $units as $unit ) { ?>
								<option 
									<?php echo ( isset( $edit_attendance['unit_id'] ) && $edit_attendance['unit_id'] == $unit->id? 'selected="selected"' : '' )?>
									value="<?php echo $unit->id?>"><?php echo $unit->unit_name; ?></option>
							<?php } ?>
						</select>
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
		data: {'trade_id': $('#trade_id').val(), 'batch_id': $('#batch_id').val(), 'unit_id': $('#unit_id').val(), 'attendance_date': $('#attendance_date').val() },
		success: function( res ) {
			$('#trainee_attendance').html(res);
			$('#TraineeAttendanceSubmit').show();
		}
	});
}

function loadEditForm() {
	loadAttendance();
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

	$('#batch_id').prop( 'disabled', true );
	$('#trade_id').prop( 'disabled', true );
	
    $('#attendance_date').change( function() {
    	 $('#batch_id').prop( 'disabled', false );
    	$('#batch_id').val('');
    	$('#trade_id').val('');
    	$('#unit_id').val('');	
     });

	$("#batch_id").change(function( e ){
		 $('#trade_id').prop( 'disabled', false );		 
	});

	$('#trade_id').change( function(e) {

		$('#unit_id').prop( 'disabled', false );	
		var trade_id = $("#trade_id").val();
		var batch_id = $("#batch_id").val();	

		sch.ajaxRequest({
			'page': 'sch-trades',
			'pageAction': 'get_trade_unit_lists',
			'selector': '#add_trainee_attendance',
			data:  { 'TradeId': trade_id, 'BatchId': batch_id },
			success: function( res ) {
				
				if( '' != res ) {
					var units = $.parseJSON( res );

					if( 0 == units.length ) {
						$('#message').html('<div class="error_msg_div"><span class="error_msg_span">NO Unit assigned for this batch.</span></div>');
						return;
					}

					strOption = '';
					$(units).each( function( index, unit ){
						strOption += '<option value="' + unit.id + '">' + unit.unit_name+ '</option>';
					});
					strHTML = '<select name="unit_id" id = "unit_id" class="wpsp-form-control">' +
								'<option value="" disabled selected>Select Unit</option>' +
								strOption +
							'</select>';

					$('#add_trainee_attendance #unit_id').replaceWith( strHTML );

					$('#add_trainee_attendance #unit_id').change( function(e) {
						loadAttendance();
					});
				}	
			}
		});
		
	});

	<?php  if( true == isset( $edit_attendance['attendance_date'] ) ) { ?>
		loadAttendance();
    <?php } ?>

});
</script>