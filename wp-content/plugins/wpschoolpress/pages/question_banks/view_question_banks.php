<div class="wpsp-card" id="view_question_banks">
	<div class="wpsp-card-head">
		<div class="question_bank-inner wpsp-left wpsp-class-filter" id="question_bank-filter">
			
		</div>
	</div>
	
	<div class="wpsp-card-body">
		<div class="question_bank-head">
			<table id="question_bank_table" class="wpsp-table" cellspacing="0" width="100%" style="width:100%">
				<thead>
					<tr role="row">
						<th>Id.</th>
						<th>Question Bank Name</th>
						<th>Trade Name</th>
						
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php foreach( $question_banks AS $question_bank ) {?>
						<tr>
							<td><?php echo $question_bank->id; ?></td>
							<td><?php echo $question_bank->name; ?></td>
							<td><?php echo ( isset( $trades[$question_bank->trade_id] ) ? $trades[$question_bank->trade_id]->name : '-' ); ?></td>
							<td>
								<a target="_blank" href="<?php echo WP_CONTENT_URL . $question_bank->file_url; ?>"><span class="dashicons dashicons-welcome-view-site"></span></a>
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