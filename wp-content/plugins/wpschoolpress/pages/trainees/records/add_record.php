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
						<input type="text" class="wpsp-form-control select_date" id="from_date" value="" name="from_date">
					</div>
<!-- 					<div class="wpsp-form-group">
						<label for="date" class="wpsp-labelMain">To Date</label>
						<input type="text" class="wpsp-form-control select_date" id="to_date" value="" name="to_date">
					</div>
 -->
					<div class="wpsp-form-group">
						<label for="trade" class="wpsp-labelMain">Select Trade</label>
						<select class="wpsp-form-control" name="trade_id" id="trade_id">
							<option value="" disabled selected>Select Trade</option>
							<?php foreach( $trades as $trade ) { ?>
								<option value="<?php echo $trade->id?>"><?php echo $trade->name; ?></option>
							<?php } ?>
						</select>
					</div>
					<div class="wpsp-form-group">
						<label for="trade" class="wpsp-labelMain">Select Unit</label>
						<select class="wpsp-form-control" disabled name="unit_id" id="unit_id">
							<option value="" disabled selected >Select Unit</option>
							<?php foreach( $units as $unit ) { ?>
								<option value="<?php echo $unit->id?>"><?php echo $unit->unit_name; ?></option>
							<?php } ?>
						</select>
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

<script>

function bindUnitEvents() {
	$('#unit_id').change(function(){
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
	});
}

$( function() {
	$('#TraineeRecordSubmit').hide();
	// $('#to_date').prop( 'disabled', true );
	$('#trade_id').prop( 'disabled', true );
	
	 $('#from_date').datepicker({
		autoclose: true,
	    dateFormat: 'yy-mm-dd',
	    todayHighlight: true,
	    changeMonth: true,
	    changeYear: true,
	    maxDate:  0
	});

    /*  $('#to_date').datepicker({
        maxDate: 0,
 		autoclose: !0,
 		dateFormat: 'Y-m-d',
 		todayHighlight: !0,
 		changeMonth: !0,
 		changeYear: !0,
     }); */

     $('#from_date').change( function() {
    	 $('#trade_id').prop( 'disabled', false );
    	 // $('#to_date').prop( 'disabled', false );
     });

/*      $('#to_date').change( function() {
    	 $('#trade_id').prop( 'disabled', false );
     }); */
     

	$("#trade_id").change(function( e ){
		var trade_id = $("#trade_id").val();

		sch.ajaxRequest({
			'page': 'sch-trades',
			'pageAction': 'get_trade_unit_lists',
			'selector': '#add_trainee_record',
			data:  { 'TradeId': trade_id },
			success: function( res ) {
				
				if( '' != res ) {
					var units = $.parseJSON( res );
					strOption = '';
					$(units).each( function( index, unit ){
						strOption += '<option value="' + unit.id + '">' + unit.unit_name+ '</option>';
					});
					strHTML = '<select name="unit_id" id = "unit_id" class="wpsp-form-control">' +
								'<option value="" disabled selected>Select Unit</option>' +
								strOption +
							'</select>';

					$('#add_trainee_record #unit_id').replaceWith( strHTML );
					bindUnitEvents();
				}	
			}
		});
	});

});
</script>