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
								<?php if( $user->getRole() == CRole::TEACHER ) { ?>
									<a href="javascript:;" id="trash-question-bank" class="wpsp-popclick" data-id="<?php echo $question_bank->id; ?>" data-pop="DeleteModal"><span class="dashicons dashicons-trash" style="color: red;"></span></a>
								<?php } ?>
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

	$(document).on('click', '#trash-question-bank', function(e) {
		$("#DeleteModal").css("display", "block");
		$("#DeleteModal").attr('data-single-delete', true);
		$("#DeleteModal").attr( 'data-id', $( '#trash-question-bank' ).attr( 'data-id') );
	});

	$('.ClassDeleteBt').unbind();
	$('.ClassDeleteBt').click( function(e) {
		$("#DeleteModal").css("display", "none");
		sch.ajaxRequest({
			'page': 'sch-question_bank',
			'pageAction': 'delete_question_bank',
			'selector': '#view_question_banks',
			data:  { 'question_bank_id': $("#DeleteModal").attr( 'data-id' ) },
			success: function( res ) {
				if( 'error' == res ) {
					$('#question_bank-filter').html('<div class="error_msg_div"><span class="error_msg_div">Problem occurred while deleting Demostration plan.</span></div>')
				} else {
					$('#view_question_banks').replaceWith( res );
					$('#question_bank-filter').html('<div class="success_msg_div"><span class="success_msg_span">Demostration Plan Deleted Successfully.</span></div>');
				}
			}
		});
	});
	
});
</script>