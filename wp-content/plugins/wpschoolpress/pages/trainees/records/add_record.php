<div class="wpsp-card">
	<div class="wpsp-card-head">
		<?php 
		  displaySuccessMsg( $success_messages );
		  displayErrorMsg( $error_messages );
		?>
	</div>
	<div class="wpsp-card-body" id="add_trainee_record">
		<form action="" method="post">
		<div class="wpsp-row">
			<div class="wpsp-col-lg-5 wpsp-col-md-5 wpsp-col-sm-12 wpsp-col-xs-12">
				<div class="line_box">
					<div class="wpsp-form-group">
						<label for="date" class="wpsp-labelMain">Select Date</label>
						<input type="text" class="wpsp-form-control select_date" id="from_date" value="<?php echo ( isset( $edit_trainee_record['from_date'] ) ? $edit_trainee_record['from_date'] : '' )?>" name="from_date" autocomplete="off" />
					</div>
				</div>
			</div>
			<div class="wpsp-row">
				<div class="wpsp-col-md-12" id="trainee_record_check">
									
				</div>
			</div>
			<div class="wpsp-row">
				<div class="wpsp-col-lg-5 wpsp-col-md-5 wpsp-col-sm-12 wpsp-col-xs-12">
					<div class="wpsp-form-group">
						<input type="submit" name="submit" value="submit" id="TraineeRecordSubmit" class="wpsp-btn wpsp-btn-success" />
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
</div>

<script type="text/javascript">


var ajax_url = '<?php echo admin_url('admin-ajax.php') ?>';

function loadTraineeRecord() {

	var unit_id = $('#unit_id').val();
	var checked_on = $('#from_date').val();

	sch.ajaxRequest({
		'page': 'sch-trainee_record',
		'pageAction': 'trainee_record_check_form',
		'selector': '#add_trainee_record',
		data:  { 'unit_id': unit_id, 'checked_on': checked_on },
		success: function( res ) {
			$('#trainee_record_check').html( res );
			$('#TraineeRecordSubmit').show();		
		}
	});
	
}


$( function() {

	$( "#from_date" ).datepicker({
		dateFormat: 'yy-mm-dd',
		showOtherMonths: true,
	    selectOtherMonths: true,
	    showButtonPanel: true,
	    changeMonth: true,
	    changeYear: true
	});
	
	$('#TraineeRecordSubmit').hide();
	
    $('#from_date').change( function() {
    	 loadTraineeRecord();
    });

<?php  if( true == isset( $edit_trainee_record['from_date'] ) ) { ?>
	loadTraineeRecord();
<?php } ?>

});

</script>