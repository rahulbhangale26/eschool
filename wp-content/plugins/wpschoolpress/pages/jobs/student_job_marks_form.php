<form id="student_job_marks">
<div class="wpsp-row">
	<div id="messag_job_markse">
	</div>

	<?php foreach( $job_op_skill AS $skill ) { ?>
		<?php if( "" != $skill->name ) { ?>
			<div class="wpsp-col-md-2 wpsp-col-md-12">
				<label for="batch" class="wpsp-labelMain"><?php echo $skill->name?></label>
				<input type="number" class="wpsp-form-control" name="ops_skill_<?php echo $skill->id?>" value="<?php echo ( isset( $skill_job_marks[$skill->id] ) ? $skill_job_marks[$skill->id]->obtained_marks : 0 );?>" />
			</div>
		<?php } ?>
	<?php } ?>
	
	<div class="wpsp-col-md-2 wpsp-col-md-12">
		<label for="batch" class="wpsp-labelMain">Grade Marks</label>
		<input type="number" class="wpsp-form-control" name="grade" value="<?php echo ( true == is_object( $grade_job_marks ) ? $grade_job_marks->obtained_marks : 0 ); ?>" />
	</div>
	<div class="wpsp-col-md-2 wpsp-col-md-12">
		<label for="batch" class="wpsp-labelMain">Deduction For Extra Time</label>
		<input type="number" class="wpsp-form-control" name="extra_time_deduction" value="<?php echo ( true == is_object( $deduction_job_marks ) ? $deduction_job_marks->obtained_marks : 0 ); ?>" />
	</div>
</div>
<div class="wpsp-row pull-right">
	<input type="hidden" id="job_id" name="job_id" value="<?php echo $job->id; ?>" />
	<input type="hidden" id="student_id" name="student_id" value="<?php echo $student->sid; ?>" />
	<input type="button" name="save_marks" value="Save Marks" class="wpsp-btn wpsp-btn-success" onclick="save_job_marks();"/>
</div>
</form>
<script type="text/javascript">
	function save_job_marks() {	
		sch.ajaxRequest({
			'page': 'sch-jobs',
			'pageAction': 'save_job_marks',
			'selector': '#add_job_marks',
			data:  { 'marks': sch.formJsonSerialize( $('#student_job_marks') ), 'student_id': $('#student_id').val(), 'job_id': $('#job_id').val() },
			success: function( res ) {
				response = $.parseJSON(res);

				if( true == response.status ) {
					$('#messag_job_marks').html('<div class="success_msg_div"><span class="success_msg_span">' + response.message +  '</span></div>')
				} else {
					$('#messag_job_marks').html('<div class="error_msg_div"><span class="error_msg_span">' + response.message +  '</span></div>')
				}
			}
	 	});
	 }
</script>