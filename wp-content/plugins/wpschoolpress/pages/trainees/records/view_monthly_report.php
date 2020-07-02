<div class="wpsp-card">
	<div class="wpsp-card-head">

	</div>
	<div class="wpsp-card-body" id="view_monthly_report">
		<div class="subject-head">
			
		</div>
		
		<div class="wpsp-row">
			<div class="wpsp-col-lg-5 wpsp-col-md-5 wpsp-col-sm-12 wpsp-col-xs-12">
				<div class="line_box">
					<div class="wpsp-form-group">
						<label for="date" class="wpsp-labelMain">Select Month</label>
						<input type="text" class="wpsp-form-control select_date" id="report_month" value="" name="report_month">
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
	</div>
</div>

<div class="wpsp-card" id="monthly_report" style="display: none;">
	<div class="wpsp-card-head">
		<div style="padding:20px 30px">
			<button  style="padding: 10px 30px !important;font-size: large;"onclick="printDiv();" name="print_report" class="wpsp-btn wpsp-btn-success">Print</button>
		</div>
	</div>
	<div class="wpsp-card-body" id="trainee_record_report">
	</div>
</div>

<script type="text/javascript">

/* 
function printDiv() { 
    var divContents = document.getElementById("trainee_record_report").innerHTML; 
    var a = window.open(''); 
    a.document.write('<html>'); 
    a.document.write('<body > <h1>Div contents are <br>'); 
    a.document.write(divContents); 
    a.document.write('</body></html>'); 
    a.document.close(); 
    a.print(); 
} 
 */

 function printDiv() {
    var divToPrint = document.getElementById('trainee_record_report');
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


function bindUnitEvents() {
	$('#unit_id').change(function(){

		var unit_id 		= $('#unit_id').val();
		var trade_id		= $('#trade_id').val();
		var batch_id		= $('#batch_id').val();
		var report_month	= $('#report_month').val();
		
		sch.ajaxRequest({
			'page': 'sch-trainee_record',
			'pageAction': 'view_monthly_report_details',
			'selector': '#view_monthly_report',
			data:  { 'unit_id': unit_id, 'trade_id': trade_id, 'batch_id': batch_id, 'report_month': report_month},
			success: function( res ) {
				$('#monthly_report').show();
				$('#trainee_record_report').html(res);
			}
		});
	});
	

}

$(function(){

	$( "#report_month" ).datepicker({
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

	$('#report_month').change(function(){
		$('#batch_id').prop('disabled', false );
	});

	$('#batch_id').change(function(){
		$('#trade_id').prop('disabled', false );
	});

	$('#trade_id').change(function(){
		var trade_id = $("#trade_id").val();
		var batch_id = $("#batch_id").val();

		sch.ajaxRequest({
			'page': 'sch-trades',
			'pageAction': 'get_trade_unit_lists',
			'selector': '#view_monthly_report',
			data:  { 'TradeId': trade_id, 'BatchId': batch_id },
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

					$('#view_monthly_report #unit_id').replaceWith( strHTML );
					bindUnitEvents();
				}	
			}
		});
	});
});
</script>