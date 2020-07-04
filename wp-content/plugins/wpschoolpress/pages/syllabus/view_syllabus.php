
<div class="wpsp-card" id="view_subjects">
	<div class="wpsp-card-head">
		<div class="subject-inner wpsp-left wpsp-class-filter" id="subject-filter">
			
		</div>
	</div>
	
	<div class="wpsp-card-body">
		<div class="subject-head">
			<table id="syllabus_table" class="wpsp-table" cellspacing="0" width="100%" style="width:100%">
				<thead>
					<tr role="row">
						<th>Id.</th>
						<th>Syllabus Name</th>
						<th>Trade Name</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php foreach( $syllabus AS $s ) {?>
						<tr>
							<td><?php echo $s->id; ?></td>
							<td><?php echo $s->name; ?></td>
							<td><?php echo $trades[$s->trade_id]->name; ?></td>
							<td>
								<a href="<?php echo site_url( '/wp-admin/admin.php?page=sch-syllabus&page_action=read_syllabus&syllabus_id=' . $s->id ); ?>"><span class="dashicons dashicons-welcome-view-site"></span></a>
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