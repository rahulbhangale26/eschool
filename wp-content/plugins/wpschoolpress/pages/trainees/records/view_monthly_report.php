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
						<input type="text" class="wpsp-form-control select_date" id="report_month" value="" name="report_month" autocomplete="off" />
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


function loadMonthlyTraineeRecords() {
	var unit_id 		= $('#unit_id').val();
	var report_month	= $('#report_month').val();
	
	sch.ajaxRequest({
		'page': 'sch-trainee_record',
		'pageAction': 'view_monthly_report_details',
		'selector': '#view_monthly_report',
		data:  { 'unit_id': unit_id, 'report_month': report_month},
		success: function( res ) {
			$('#monthly_report').show();
			$('#trainee_record_report').html(res);
		}
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

	$('#report_month').change(function(){
		loadMonthlyTraineeRecords();
	});

});
</script>