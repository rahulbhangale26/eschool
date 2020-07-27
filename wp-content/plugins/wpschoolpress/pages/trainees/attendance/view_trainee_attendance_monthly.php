<div class="wpsp-card">
	<div class="wpsp-card-head">
		
	</div>
	<div class="wpsp-card-body" id="trainee_attendance_monthly">
		<div class="wpsp-col-lg-5 wpsp-col-md-5 wpsp-col-sm-12 wpsp-col-xs-12">
				<div class="line_box">
					<div class="wpsp-form-group">
						<label for="date" class="wpsp-labelMain">Select Month</label>
						<input type="text" class="wpsp-form-control select_date" id="attendance_date" value="" name="attendance_date" autocomplete="off">
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

	var unit_id  = $('.wpsp-breadcrumb #unit_id').val();	
	var attendance_date = $('#attendance_date').val()

	sch.ajaxRequest({
		'page': 'sch-trainee_attendance_monthly',
		'pageAction': 'view_muster_report',
		'selector': '#trainee_attendance_monthly',
		data:  { 'attendance_date': attendance_date, 'unit_id': unit_id  },
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
	
    $('#attendance_date').change( function() {
    	loadTraineeAttendanceMonthly();
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
