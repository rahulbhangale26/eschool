<div class="wpsp-card" id="view_trainee_attendances">
	<div class="wpsp-card-head">
		<form method="post">
			Select Start Date <input type="text" name="filter[start_date]" value="<?php echo $start_date; ?>" id="start_date"/>
			Select End Date <input type="text" name="filter[end_date]" value="<?php echo $end_date; ?>" id="end_date"/>
			<input id="filter-submit" type="submit" name="filter[filter]" value="Filter" class="wpsp-btn wpsp-btn-success" />
		</form>
	</div>
	<div class="wpsp-card-body">
		<div class="subject-head">
			<div id="message"></div>
			<table id="trainee_record_list_table" class="wpsp-table" cellspacing="0" width="100%" style="width:100%">
				<thead>
					<tr role="row">
						<th>Attendance Date</th>
						<th>Unit Name</th>
						<th>Trade Name</th>
						<th>Batch Name</th>
						<th>Instructor Name</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php foreach( $trainee_attendances as $trainee_attendance) { ?>
						<tr>
							<td><?php echo date( 'Y-m-d', strtotime( $trainee_attendance->attendance_date ) ); ?></td>
							<td><?php echo $units[$filter['unit_id']]->unit_name; ?></td>
							<td><?php echo $trades[$trainee_attendance->trade_id]->name; ?></td>
							<td><?php echo $batches[$trainee_attendance->batch_id]->name; ?></td>
							<td><?php echo $instructors[$trainee_attendance->instructor_id]->first_name . ' ' . $instructors[$trainee_attendance->instructor_id]->last_name; ?></td>
							<td>
								<a href="admin.php?page=sch-trainee_attendance&page_action=add_trainee_attendance&batch_id=<?php echo $trainee_attendance->batch_id; ?>&attendance_date=<?php echo date( 'Y-m-d', strtotime( $trainee_attendance->attendance_date ) ); ?>&unit_id=<?php echo $trainee_attendance->unit_id; ?>&trade_id=<?php echo $trainee_attendance->trade_id;?>">
									<span class="dashicons dashicons-edit"></span>
								</a>
								<a title="Delete Attendance" href="javascript:;"  class="wpsp-popclick" data-attendance_date="<?php echo date( 'Y-m-d', strtotime( $trainee_attendance->attendance_date ) ); ?>" data-pop="DeleteModal"><span class="dashicons dashicons-trash" style="color: red;"></span></a>
							</td>
						</tr>
					<?php } ?>
				</tbody>
			 </table>
		</div>
	</div>


<script>
$(function(){

	$( "#start_date" ).datepicker({
		dateFormat: 'yy-mm-dd',
		showOtherMonths: true,
	    selectOtherMonths: true,
	    showButtonPanel: true,
	    changeMonth: true,
	    changeYear: true
	});

	$( "#end_date" ).datepicker({
		dateFormat: 'yy-mm-dd',
		showOtherMonths: true,
	    selectOtherMonths: true,
	    showButtonPanel: true,
	    changeMonth: true,
	    changeYear: true
	});
	
	 handleDatatables();
	 
	 $(document).on('click', '.wpsp-popclick', function(e) {
		$("#DeleteModal").css("display", "block");
		$("#DeleteModal").attr('data-single-delete', true);
		$("#DeleteModal").attr( 'data-id', $( this ).attr( 'data-attendance_date') );
	});

	$('.ClassDeleteBt').unbind();
	$('.ClassDeleteBt').click( function(e) {
		$("body").removeClass("wpsp-bodyFixed");
		$("#DeleteModal").css("display", "none");
		sch.ajaxRequest({
			'page': 'sch-trainee_attendance',
			'pageAction': 'delete_trainee_attendance',
			'selector': '#view_trainee_attendances',
			data:  { 'attendance_date': $("#DeleteModal").attr( 'data-id' ) },
			success: function( res ) {
				if( 'error' == res ) {
					$('#message').html('<div class="error_msg_div"><span class="error_msg_div">Problem occurred while deleting Job.</span></div>');
				} else {
					$('#view_trainee_attendances').replaceWith(res);
					$('#message').html('<div class="success_msg_div"><span class="success_msg_span">Job Deleted Successfully.</span></div>');				
					
				}
			}
		});
	});
});
</script>
</div>