<div class="wpsp-card">
	<div class="wpsp-card-head">
		
	</div>
	<div class="wpsp-card-body">
		<div class="subject-head">
			<table id="trainee_record_table" class="wpsp-table" cellspacing="0" width="100%" style="width:100%">
				<thead>
					<tr role="row">
						<th>Submitted On.</th>
						<th>Unit Name</th>
						<th>Trade Name</th>
						<th>Instructor Name</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php foreach( $trainee_records_summary as $trainee_record_summary ) { ?>
						<tr>
							<td><?php echo date( 'Y-m-d', strtotime( $trainee_record_summary->checked_on ) ); ?></td>
							<td><?php echo $units[$trainee_record_summary->unit_id]->unit_name; ?></td>
							<td><?php echo $trades[$trainee_record_summary->trade_id]->name; ?></td>
							<td><?php echo $instructors[$trainee_record_summary->instructor_id]->first_name . ' ' . $instructors[$trainee_record_summary->instructor_id]->last_name; ?></td>
							<td></td>
						</tr>
					<?php } ?>
				</tbody>
			 </table>
		</div>
	</div>
</div>

<script>
$(function(){
	handleDatatables();
});
</script>