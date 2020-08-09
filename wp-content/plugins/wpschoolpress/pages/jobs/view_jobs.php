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
						<th>Job No.</th>
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
							<td><?php echo $job->number; ?></td>
							<td><?php echo '<strong>' . $job->title . '</strong><br>' . $instructors[$job->instructor_id]->first_name . ' ' . $instructors[$job->instructor_id]->last_name; ?></td>
							<td><?php echo $job->description; ?></td>
							<td><?php echo date( 'Y-m-d', strtotime( $job->start_date ) ) . ' - ' . date( 'Y-m-d', strtotime( $job->end_date ) ); ?><br><?php echo 'Time Given: ' . $job->time_given; ?> Hours</td>
							<td><?php echo $job->tolerance; ?></td>
							<td><?php echo $job->material; ?></td>
							<td>
								<a title="Edit Job" href="<?php echo site_url( '/wp-admin/admin.php?page=sch-jobs&page_action=edit_job&job_id=' . $job->id ); ?>"><span class="dashicons dashicons-edit" style="color: orange;"></span></a>
								<a title="Submit Student Job Details" href="<?php echo site_url( '/wp-admin/admin.php?page=sch-jobs&page_action=add_or_edit_job_marks&job_id=' . $job->id ); ?>"><span class="dashicons dashicons-plus"></span></a>
								<a href="<?php echo site_url( '/wp-admin/admin.php?page=sch-jobs&page_action=view_evaluation_sheet&job_id=' . $job->id ); ?>"><span class="dashicons dashicons-media-spreadsheet" style="color: blue;"></span></a>
								<a title="Delete Job" href="javascript:;"  id="trash-job" class="wpsp-popclick" data-id="<?php echo $job->id; ?>" data-pop="DeleteModal"><span class="dashicons dashicons-trash" style="color: red;"></span></a>
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

	$(document).on('click', '.wpsp-popclick', function(e) {
		$("#DeleteModal").css("display", "block");
		$("#DeleteModal").attr('data-single-delete', true);
		$("#DeleteModal").attr( 'data-id', $( this ).attr( 'data-id') );
	});

	$('.ClassDeleteBt').unbind();
	$('.ClassDeleteBt').click( function(e) {
		$("body").removeClass("wpsp-bodyFixed");
		$("#DeleteModal").css("display", "none");
		sch.ajaxRequest({
			'page': 'sch-jobs',
			'pageAction': 'delete_job',
			'selector': '#view_jobs',
			data:  { 'job_id': $("#DeleteModal").attr( 'data-id' ) },
			success: function( res ) {
				if( 'error' == res ) {
					$('#jobs-filter').html('<div class="error_msg_div"><span class="error_msg_div">Problem occurred while deleting Job.</span></div>');
				} else {
					$('#view_jobs').replaceWith( res );
					$('#jobs-filter').html('<div class="success_msg_div"><span class="success_msg_span">Job Deleted Successfully.</span></div>');				
				}
			}
		});
	});
	
});
</script>