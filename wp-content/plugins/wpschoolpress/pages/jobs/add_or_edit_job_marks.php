<div class="wpsp-card">
	<div class="wpsp-card-head" id="message">
		
	</div>
	
	<div class="wpsp-card-head">
		<h3> Add Student Marks </h3>
		<h4>Job Title: <?php echo $job-> title; ?> | Job No: <?php echo $job->number; ?></h4>
	</div>
	<div class="wpsp-card-body" id="add_job_marks" data-JobId="<?php echo $job->id; ?>" >
		<div class="wpsp-row">
			<div class="wpsp-col-lg-5 wpsp-col-md-5 wpsp-col-sm-12 wpsp-col-xs-12">
				<div class="line_box">

				</div>
			</div>
		</div>
		<div class="wpsp-row">
			<div class="wpsp-col-md-12" id="student_job_marks_list">
								<!-------------- Students list will loaded here. -->
			</div>
		</div>
		</div>
	</div>
</div>
 <script type="text/javascript">
var ajax_url = '<?php echo admin_url('admin-ajax.php') ?>';
function loadJobMarkStudentList() {
	var unit_id = $('#unit_id').val();
 	sch.ajaxRequest({
		'page': 'sch-jobs',
		'pageAction': 'students_job_marks_list',
		'selector': '#add_job_marks',
		data:  { 'unit_id': unit_id },
		success: function( res ) {
			$('#student_job_marks_list').html( res );
		}
 	});
}
	
$(function(){
	loadJobMarkStudentList();
});
 </script>