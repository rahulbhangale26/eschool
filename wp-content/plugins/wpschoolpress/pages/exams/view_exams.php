<div class="wpsp-card" id="view_exams">
	<div class="wpsp-card-head">
		<div class="view_exams-inner wpsp-left wpsp-class-filter" id="exam-filter">
			
		</div>
	</div>
	
	<div class="wpsp-card-body">
		<div class="exams-head">
			<table id="exam_table" class="wpsp-table" cellspacing="0" width="100%" style="width:100%">
				<thead>
					<tr role="row">
						<th>Id.</th>
						<th>Exam Name</th>
						<th>Unit Name</th>
						<th>Start Date</th>
						<th>End Date</th>						
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php foreach ( $exams AS $exam ) { ?>
						<tr>
							<td><?php echo $exam->id; ?></td>
							<td><?php echo $exam->name; ?></td>
							<td><?php echo $units[$filter['unit_id']]->unit_name; ?></td>
							<td><?php echo date( 'Y-m-d', strtotime( $exam->start_date ) ); ?></td>
							<td><?php echo date( 'Y-m-d', strtotime( $exam->end_date ) ); ?></td>
							<td>
								<a href="<?php echo site_url( '/wp-admin/admin.php?page=sch-exam&page_action=edit_exam&exam_id=' . $exam->id ); ?>" title="Edit Exam"><span class="dashicons dashicons-edit"></span></a>
								<a href="<?php echo site_url( 'wp-admin/admin.php?page=sch-exam&page_action=view_manage_exam&exam_id=' . $exam->id ); ?>" title="Manage Exam TimeTable and Results."><span class="dashicons dashicons-plus"></span></a>
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
});
</script>