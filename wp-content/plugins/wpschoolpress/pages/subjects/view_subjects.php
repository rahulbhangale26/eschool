<div class="wpsp-card" id="view_subjects">
	<div class="wpsp-card-head">
		<div class="subject-inner wpsp-left wpsp-class-filter" id="subject-filter">
			<?php include_once( 'view_filter.php' );?>
		</div>
	</div>
	
	<div class="wpsp-card-body">
		<div class="subject-head">
			<table id="units_table" class="wpsp-table" cellspacing="0" width="100%" style="width:100%">
				<thead>
					<tr role="row">
						<th>Id.</th>
						<th>Subject Code</th>
						<th>Subject Name</th>
						<th>Trade</th>
						<th>Year/Semester</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php foreach( $subjects as $subject ) {?>
					<tr>
						<td><?php echo $subject->id; ?></td>
						<td><?php echo $subject->sub_code; ?></td>
						<td><?php echo $subject->sub_name; ?></td>
						<td><?php echo $trades[$subject->trade_id]->name; ?></td>
						<td><?php echo ordinal( $subject->year_or_semester_no); ?> <?php echo $trades[$subject->trade_id]->trade_pattern; ?></td>
						<td></td>
					</tr>
					<?php }?>
				</tbody>
			 </table>
		</div>
	</div>
</div>

<script>
$(function() {
	var objSubject = new Subject();
	objSubject.bindFilter();
});
</script>