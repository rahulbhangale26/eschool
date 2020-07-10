<div class="wpsp-card" id="view_jobs">
	<div class="wpsp-card-head">
		<div class="jobs-inner wpsp-left wpsp-class-filter" id="jobs-filter">
			
		</div>
	</div>
	
	<div class="wpsp-card-body">
		<div class="jobs-head">
			<table id="jobs_table" class="wpsp-table" cellspacing="0" width="100%" style="width:100%">
				<thead>
					<tr role="row">
						<th>Id.</th>
						<th>Title</th>
						<th>Description</th>
						<th>Time Frame</th>
						<th>Tolerance</th>
						<th>Material</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php foreach( $jobs AS $job ) { ?>
						<tr>
							<td><?php echo $job->id; ?></td>
							<td><?php echo '<strong>' . $job->title . '</strong><br>' . $instructors[$job->instructor_id]->first_name . ' ' . $instructors[$job->instructor_id]->last_name; ?></td>
							<td><?php echo $job->description; ?></td>
							<td><?php echo date( 'Y-m-d', strtotime( $job->start_date ) ) . ' - ' . date( 'Y-m-d', strtotime( $job->end_date ) ); ?><br><?php echo 'Time Given: ' . $job->time_given; ?> Hours</td>
							<td><?php echo $job->tolerance; ?></td>
							<td><?php echo $job->material; ?></td>
							<td>
								<!--  <span class="dashicons dashicons-edit" style="color: orange;"></span>  -->
								<a href="<?php echo site_url( '/wp-admin/admin.php?page=sch-jobs&page_action=view_evaluation_sheet&job_id=' . $job->id ); ?>"><span class="dashicons dashicons-media-spreadsheet" style="color: blue;"></span></a>
								<!-- <span class="dashicons dashicons-trash" style="color: red;"></span> -->
							</td>
						</tr>
					<?php } ?>
				</tbody>
			 </table>
		</div>
	</div>
</div>

<script>
$(function () {
	handleDatatables();

	$(document).on('click', '#trash-lesson-plan', function(e) {
		$("#DeleteModal").css("display", "block");
		$("#DeleteModal").attr('data-single-delete', true);
		$("#DeleteModal").attr( 'data-id', $( '#trash-lesson-plan' ).attr( 'data-id') );
	});

	$('.ClassDeleteBt').unbind();
	$('.ClassDeleteBt').click( function(e) {
		$("#DeleteModal").css("display", "none");
		sch.ajaxRequest({
			'page': 'sch-lesson_plan',
			'pageAction': 'delete_lesson_plan',
			'selector': '#view_lesson_plan',
			data:  { 'lesson_plan_id': $("#DeleteModal").attr( 'data-id' ) },
			success: function( res ) {
				if( 'error' == res ) {
					$('#lesson-plan-filter').html('<div class="error_msg_div"><span class="error_msg_div">Problem occurred while deleting lesson plan.</span></div>');
				} else {
					$('#view_lesson_plan').replaceWith( res );
					$('#lesson-plan-filter').html('<div class="success_msg_div"><span class="success_msg_span">Lesson Plan Deleted Successfully.</span></div>');				
				}
			}
		});
	});
	
});
</script>