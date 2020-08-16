<div class="wpsp-card" id="view_demonstration_plan">
	<div class="wpsp-card-head">
		<div class="demostration-plan-inner wpsp-left wpsp-class-filter" id="demonstration-plan-filter">
			
		</div>
	</div>
	
	<div class="wpsp-card-body">
		<div class="demonstration-plan-head">
			<table id="demonstration_plan_table" class="wpsp-table" cellspacing="0" width="100%" style="width:100%">
				<thead>
					<tr role="row">
						<th>Id.</th>
						<th>Demonstration Plan</th>
						<th>Instructor </th>
						<th>Created On</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php foreach( $demonstration_plans AS $dp ) { ?>
						<tr>
							<td><?php echo $dp->id; ?></td>
							<td><?php echo $dp->name; ?></td>
							<td><?php echo ( true == isset( $instructors[$dp->instructor_id] ) ? $instructors[$dp->instructor_id]->first_name . ' ' . $instructors[$dp->instructor_id]->last_name : '' ); ?>
							<td><?php echo date( 'Y-m-d', strtotime( $dp->created_on ) ); ?></td>
							<td>
								<a target="_blank" href="<?php echo WP_CONTENT_URL . $dp->file_url; ?>"><span class="dashicons dashicons-welcome-view-site"></span></a>
								<a href="javascript:;" id="trash-demonstration-plan" class="wpsp-popclick" data-id="<?php echo $dp->id; ?>" data-pop="DeleteModal"><span class="dashicons dashicons-trash" style="color: red;"></span></a>
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
			'page': 'sch-demostration_plan',
			'pageAction': 'delete_demostration_plan',
			'selector': '#view_demonstration_plan',
			data:  { 'demonstration_plan_id': $("#DeleteModal").attr( 'data-id' ) },
			success: function( res ) {
				if( 'error' == res ) {
					$('#demonstration-plan-filter').html('<div class="error_msg_div"><span class="error_msg_div">Problem occurred while deleting Demostration plan.</span></div>')
				} else {
					$('#view_demonstration_plan').replaceWith( res );
					$('#demonstration-plan-filter').html('<div class="success_msg_div"><span class="success_msg_span">Demostration Plan Deleted Successfully.</span></div>');
				}
			}
		});
	});
	
});
</script>