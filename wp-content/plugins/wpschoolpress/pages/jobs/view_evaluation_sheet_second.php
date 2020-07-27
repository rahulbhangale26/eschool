<div class="wpsp-card">
	<div class="wpsp-card-head">
		<a href="<?php echo site_url( '/wp-admin/admin.php?page=sch-jobs&page_action=view_evaluation_sheet&job_id=' . $job->id ); ?>" class="wpsp-btn wpsp-btn-success <?php echo $page_action == 'view_evaluation_sheet' ? 'button-active' : ''; ?>">Job Evaluation 1</a>
		<a href="<?php echo site_url( '/wp-admin/admin.php?page=sch-jobs&page_action=view_evaluation_sheet_second&job_id=' . $job->id ); ?>" class="wpsp-btn wpsp-btn-success <?php echo $page_action == 'view_evaluation_sheet_second' ? 'button-active' : ''; ?>">Job Evaluation 2</a>
	</div>

	<div class="wpsp-card-body" id="job_evaluation_sheet_second" data-JobId="<?php echo $job->id; ?>">
		<div class="wpsp-row">
			<div class="wpsp-col-lg-5 wpsp-col-md-5 wpsp-col-sm-12 wpsp-col-xs-12">
				<div class="line_box">
					
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
var ajax_url = '<?php echo admin_url('admin-ajax.php') ?>';
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

		var job_id		= $( '#job_evaluation_sheet_second' ).attr( 'data-JobId' );
		
		sch.ajaxRequest({
			'page': 'sch-jobs',
			'pageAction': 'view_evaluation_sheet_second_details',
			'selector': '#job_evaluation_sheet_second',
			data:  { 'job_id': job_id },
			success: function( res ) {
				$('#job_evaluation_details').html( res );
				$('#print_report').show();
			}
 		});
}

$(function(){
	loadJobEvaluationReportSecond();
});
</script>