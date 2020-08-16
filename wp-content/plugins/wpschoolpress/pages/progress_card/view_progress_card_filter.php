<div class="wpsp-col-lg-12 line_box filter-container">
	<div class="wpsp-row">
		<div class="wpsp-col-md-2 wpsp-col-md-12">
			<div class="wpsp-form-group">
				<select id="student_id" class="wpsp-form-control" name="student_id">
					<option value="">Select Student</option>
					<?php foreach ( $students AS $student ) { ?>
						<option value="<?php echo $student->sid; ?>"><?php echo $student->s_fname . ' ' . $student->s_lname; ?></option>
					<?php } ?>
				</select>
			</div>
		</div>
		<div class="wpsp-col-md-2 wpsp-col-md-12">
			<div class="wpsp-form-group">
				<input type="button" name="show" value="Job Progress Card" id="show_progress_card" class="wpsp-btn wpsp-btn-success" />
			</div>
		</div>
		<div class="wpsp-col-md-2 wpsp-col-md-12">
			<div class="wpsp-form-group">
				<input type="button" name="show" value="Exam Progress Card" id="exam_progress_card" class="wpsp-btn wpsp-btn-success" />
			</div>
		</div>
		<div class="wpsp-col-md-2 wpsp-col-md-12">
			<div class="wpsp-form-group">
				<input type="button" name="print" value="Print" id="print_btn" onclick="printDiv();" class="wpsp-btn wpsp-btn-success" style="width: 160px;"/>
			</div>
		</div>
	</div>
</div>
<script>

function printDiv() {

	var divToPrint = $('.progress-card').html();
    var htmlToPrint = '';
    htmlToPrint += divToPrint;
    newWin = window.open("");
    newWin.document.write('<html><head></head><body>' + htmlToPrint + '</body></html>');

    setTimeout(function(){
    	newWin.print();
    }, 1000 );
} 

$( function(){
	$('#show_progress_card').unbind();
	$('#show_progress_card').click( function(){
		sch.ajaxRequest({
			'page': 'sch-progress_card',
			'pageAction': 'view_student_progress_card',
			'selector': '.filter-container',
			data:  { 'unit_id': $("#unit_id").val(), 'student_id': $('#student_id').val() },
			success: function( res ) {
				$('.progress-card').html( res );
			}
		}); 
	});
	
	$('#exam_progress_card').unbind();
	$('#exam_progress_card').click(function(){
		sch.ajaxRequest({
			'page': 'sch-progress_card',
			'pageAction': 'view_exam_progress_card',
			'selector': '.filter-container',
			data:  { 'student_id': $('#student_id').val() },
			success: function( res ) {
				$('.progress-card').html( res );
			}
		}); 	
	});
});
</script>