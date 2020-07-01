<div class="wpsp-card">
	<div class="wpsp-card-head">
		
	</div>
	<div class="wpsp-card-body" id="trainee_attendance_monthly">
		<div class="wpsp-col-lg-5 wpsp-col-md-5 wpsp-col-sm-12 wpsp-col-xs-12">
				<div class="line_box">
					<div class="wpsp-form-group">
						<label for="date" class="wpsp-labelMain">Select Month</label>
						<input type="text" class="wpsp-form-control select_date" id="attendance_date" value="" name="attendance_date">
					</div>

					<div class="wpsp-form-group">
						<label for="trade" class="wpsp-labelMain">Select Batch</label>
						<select class="wpsp-form-control" name="batch_id" id="batch_id">
							<option value="" disabled selected>Select Batch</option>
							<?php foreach( $batches as $batch ) { ?>
								<option 
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
									value="<?php echo $trade->id?>"><?php echo $trade->name; ?></option>
							<?php } ?>
						</select>
					</div>
					
					<div class="wpsp-form-group">
						<label for="trade" class="wpsp-labelMain">Select Unit</label>
						<select class="wpsp-form-control" disabled name="unit_id" id="unit_id">
							<option value="" disabled selected >Select Unit</option>
							<?php foreach( $units as $unit ) { ?>
								<option s
									value="<?php echo $unit->id?>"><?php echo $unit->unit_name; ?></option>
							<?php } ?>
						</select>
					</div>
					
				</div>
			</div>
	</div>
</div>

<div class="wpsp-card" id="monthly_report" style="display: none;">
	<div class="wpsp-card-head">
		<div style="padding:20px 30px">
			<button  style="padding: 10px 30px !important;font-size: large;"onclick="printDiv();" name="print_report" class="wpsp-btn wpsp-btn-success">Print</button>
			<button  style="display: none; padding: 10px 30px !important;font-size: large;" id="download_report"  name="download_report" class="wpsp-btn wpsp-btn-success">Download</button>
		</div>
	</div>
	<div class="wpsp-card-body" id="muster_report">
	</div>
</div>
<script type="text/javascript">


function printDiv() {
    var divToPrint = document.getElementById('muster_report');
    var htmlToPrint = '' +
        '<style type="text/css">' +
        'table th, table td {' +
        'border:1px solid #555; !important' +
        'padding:0.5em;' +
        '}' +
        '</style>';
    htmlToPrint += divToPrint.outerHTML;
    newWin = window.open("");
    newWin.document.write('<html><head></head><body>' + htmlToPrint + '</body></html>');
}

function loadTraineeAttendanceMonthly() {

	var trade_id = $('#trade_id').val();
	var batch_id = $('#batch_id').val();
	var unit_id  = $('#unit_id').val();	
	var attendance_date = $('#attendance_date').val()

	sch.ajaxRequest({
		'page': 'sch-trainee_attendance_monthly',
		'pageAction': 'view_muster_report',
		'selector': '#trainee_attendance_monthly',
		data:  { 'trade_id': trade_id, 'batch_id': batch_id, 'attendance_date': attendance_date, 'unit_id': unit_id  },
		success: function( res ) {
			$('#monthly_report').show();
			$('#muster_report').html(res);
		} 
			
	});
}

$(function(){

	$( "#attendance_date" ).datepicker({
		dateFormat: 'yy-mm',
		showOtherMonths: true,
	    selectOtherMonths: true,
	    showButtonPanel: true,
	    changeMonth: true,
	    changeYear: true
	});
	
	$('#batch_id').prop('disabled', true );
	$('#trade_id').prop('disabled', true );
	$('#unit_id').prop('disabled', true );	
	
    $('#attendance_date').change( function() {
   	 	$('#batch_id').prop( 'disabled', false );
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
			'selector': '#trainee_attendance_monthly',
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

					$('#trainee_attendance_monthly #unit_id').replaceWith( strHTML );

					$('#trainee_attendance_monthly #unit_id').change( function(e) {
						loadTraineeAttendanceMonthly();
					});
				}	
			}
		});
		
	});

/*  Code for download as pdf
	var doc = new jsPDF();
	var specialElementHandlers = {
	    '#editor': function (element, renderer) {
	        return true;
	    }
	};

	$('#download_report').click(function () {
	    doc.fromHTML($('#muster_report').html(), 15, 15, {
	        'width': 170,
	            'elementHandlers': specialElementHandlers
	    });
	    doc.save('sample-file.pdf');
	}); */
	
});
</script>
