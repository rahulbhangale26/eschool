<div class="wpsp-card">
	<div class="wpsp-card-head">
		<a href="<?php echo site_url( '/wp-admin/admin.php?page=sch-jobs&page_action=view_evaluation_sheet&job_id=' . $job->id ); ?>" class="wpsp-btn wpsp-btn-success <?php echo $page_action == 'view_evaluation_sheet' ? 'button-active' : ''; ?>">Job Evaluation 1</a>
		<a href="<?php echo site_url( '/wp-admin/admin.php?page=sch-jobs&page_action=view_evaluation_sheet_second&job_id=' . $job->id ); ?>" class="wpsp-btn wpsp-btn-success <?php echo $page_action == 'view_evaluation_sheet_second' ? 'button-active' : ''; ?>">Job Evaluation 2</a>
	</div>

	<div class="wpsp-card-body" id="job_evaluation_sheet_second" data-JobId="<?php echo $job->id; ?>">
		<div class="wpsp-row">
			<div class="wpsp-col-lg-5 wpsp-col-md-5 wpsp-col-sm-12 wpsp-col-xs-12">
				<div class="line_box">
					<div class="wpsp-form-group">
						<label for="batch" class="wpsp-labelMain">Select Batch</label>
						<select class="wpsp-form-control" name="batch_id" id="batch_id">
							<option value="" disabled selected>Select Batch</option>
							<?php foreach( $batches as $batch ) { ?>
								<option value="<?php echo $batch->id?>"><?php echo $batch->name; ?></option>
							<?php } ?>
						</select>
					</div>
					
					<div class="wpsp-form-group">
						<label for="trade" class="wpsp-labelMain">Select Trade</label>
						<select class="wpsp-form-control" disabled name="trade_id" id="trade_id">
							<option value="" disabled selected >Select Trade</option>
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
		<div class="wpsp-row">
			<button style="padding: 10px 30px !important;font-size: large; display: none;"onclick="printDiv();" name="print_report" class="wpsp-btn wpsp-btn-success" id="print_report" >Print</button>
		</div>
		<div class="wpsp-row x-scroll" id="job_evaluation_details">
			<!--  Report Loads here -->
		</div>
	</div>
</div>

<script type="text/javascript">

function printDiv() {
    var divToPrint = document.getElementById('job_evaluation_details');
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

function loadJobEvaluationReportSecond() {

		var unit_id = $(' #unit_id' ).val();
		var batch_id = $( '#batch_id' ).val();
		var trade_id = $( '#trade_id' ).val();
		var job_id		= $( '#job_evaluation_sheet_second' ).attr( 'data-JobId' );
		
		sch.ajaxRequest({
			'page': 'sch-jobs',
			'pageAction': 'view_evaluation_sheet_second_details',
			'selector': '#job_evaluation_sheet_second',
			data:  { 'unit_id': unit_id, 'batch_id': batch_id, 'trade_id': trade_id, 'job_id': job_id },
			success: function( res ) {
				$('#job_evaluation_details').html( res );
				$('#print_report').show();
			}
 		});
}

$(function(){
	$('#batch_id').change(function(){
		$('#trade_id').prop( 'disabled', false );
	});


	$('#trade_id').change( function(e) {

		$('#unit_id').prop( 'disabled', false );	
		var trade_id = $("#trade_id").val();
		var batch_id = $("#batch_id").val();	

		sch.ajaxRequest({
			'page': 'sch-trades',
			'pageAction': 'get_trade_unit_lists',
			'selector': '#job_evaluation_sheet_second',
			data:  { 'TradeId': trade_id, 'BatchId': batch_id },
			success: function( res ) {
				
				if( '' != res ) {
					var units = $.parseJSON( res );

					if( 0 == units.length ) {
						$('#message').html('<div class="error_msg_div"><span class="error_msg_span">No Unit assigned for this batch.</span></div>');
						$('#unit_id').prop( 'disabled', true );	
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

					$('#job_evaluation_sheet_second #unit_id').replaceWith( strHTML );

					$('#job_evaluation_sheet_second #unit_id').change( function(e) {
						loadJobEvaluationReportSecond();
					});
				}	
			}
		});
	});
});
</script>