<div class="wpsp-card" id="view_subjects">
	<div class="wpsp-card-head">
		<div class="subject-inner wpsp-left wpsp-class-filter" id="subject-filter">
			
		</div>
	</div>
	
	<div class="wpsp-card-body">
		<div class="subject-head">
			<table id="units_table" class="wpsp-table" cellspacing="0" width="100%" style="width:100%">
				<thead>
					<tr role="row">
						<th>Id.</th>
						<th>Unit Name</th>
						<th>Trade Name</th>
						<th>Year/Semester</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php foreach( $units as $unit ) { ?>
						<tr>
							<td><?php echo $unit->id; ?></td>
							<td><?php echo $unit->unit_name; ?></td>
							<td><?php echo $trades[$unit->trade_id]->name; ?></td>
							<td><?php echo ordinal( $unit->year_or_semester_no ) . ' ' . $trades[$unit->trade_id]->trade_pattern; ?></td>
							<td></td>
						</tr>
					<?php } ?>
				</tbody>
			 </table>
		</div>
	</div>
</div>

<script>
$(function() {
	var objUnits = new Units();
	objUnits.bindEssentials();
});
</script>