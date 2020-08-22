<div class="wpsp-card" id="view_assessments">
	<div class="wpsp-card-head">
		<div class="wpsp-row" style="margin-bottom: 10px;">
			<div id="message"></div>
		</div>
		<div class="wpsp-row">
			<a class="wpsp-btn wpsp-btn-success" href="<?php echo site_url( '/wp-admin/admin.php?page=' . CModules::SKILL_ASSESSMENT['slug'] . '&page_action=view_assess_students' ); ?>" >Assess Students</a>
		</div>
	</div>

	
	<div class="wpsp-card-body">
		<div class="note-head">
			<table id="assessment_table" class="wpsp-table" cellspacing="0" width="100%" style="width:100%">
				<thead>
					<tr role="row">
						<th>Id.</th>
						<th>Assessment Parameters</th>
						<th>Component Name</th>
						<th>Maximum Marks</th>
						<th class="">Action</th>
					</tr>
				</thead>
				<tbody>
					<?php foreach( $assessments AS $assessment ) {?>
						<tr>
							<td><?php echo $assessment->id; ?></td>
							<td><?php echo ( true == isset( $parent_assessments[$assessment->assessment_id] ) ? $parent_assessments[$assessment->assessment_id]->name : '-' ); ?></td>
							<td><?php echo $assessment->name ?></td>
							<td><?php echo $assessment->maximum_marks; ?></td>
							<td class="">
								<a href="<?php echo site_url( '/wp-admin/admin.php?page=' . CModules::SKILL_ASSESSMENT['slug'] . '&page_action=edit_assessment_skill&assessment_id=' . $assessment->id ); ?>"><span class="dashicons dashicons-edit"></span></a>
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