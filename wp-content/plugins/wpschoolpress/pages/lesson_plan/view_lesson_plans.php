<div class="wpsp-card" id="view_lesson_plan">
	<div class="wpsp-card-head">
		<div class="lesson-plan-inner wpsp-left wpsp-class-filter" id="lesson-plan-filter">
					<?php 
		              displaySuccessMsg( $success_messages );
		              displayErrorMsg( $error_messages );
		              ?>
		</div>
	</div>
	
	<div class="wpsp-card-body">
		<div class="lesson-plan-head">
			<table id="lesson_plan_table" class="wpsp-table" cellspacing="0" width="100%" style="width:100%">
				<thead>
					<tr role="row">
						<th>Number</th>
						<th>Format Type</th>
						<th>Lesson Plan</th>
						<th>Instructor </th>
						<th>Created On</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php foreach( $lesson_plans AS $lesson_plan ) { ?>
						<tr>
							<td><?php echo $lesson_plan->number; ?></td>
							<td><?php echo $lesson_plan->format_type; ?></td>
							<td><?php echo $lesson_plan->name; ?></td>
							<td><?php echo ( true == isset( $instructors[$lesson_plan->instructor_id] ) ? $instructors[$lesson_plan->instructor_id]->first_name . ' ' . $instructors[$lesson_plan->instructor_id]->last_name : '' ); ?>
							<td><?php echo date( 'Y-m-d', strtotime( $lesson_plan->created_on ) ); ?></td>
							<td>
								<a title="Edit Job" href="<?php echo site_url( '/wp-admin/admin.php?page=sch-lesson_plan&page_action=edit_lesson_plan&lesson_plan_id=' . $lesson_plan->id ); ?>"><span class="dashicons dashicons-edit" style="color: orange;"></span></a>
								<a title="View Lesson Plan" href="<?php echo site_url( '/wp-admin/admin.php?page=sch-lesson_plan&page_action=view_lesson_plan&lesson_plan_id=' . $lesson_plan->id ); ?>"><span class="dashicons dashicons-welcome-view-site"></span></a>
								<a href="javascript:;" id="trash-lesson-plan" class="wpsp-popclick" data-id="<?php echo $lesson_plan->id; ?>" data-pop="DeleteModal"><span class="dashicons dashicons-trash" style="color: red;"></span></a>
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