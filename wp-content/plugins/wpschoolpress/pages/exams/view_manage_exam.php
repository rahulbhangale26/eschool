<div class="wpsp-card" id='view_manage_exam'>
	<div class="wpsp-card-head">
		<h3 class="wpsp-card-title"><?php echo $exam->name; ?></h3>
	</div>
	
	<div class="wpsp-card-body">
		<div class="wpsp-row">
			<div id="tabs">
  				<ul>
    				<li><a href="#tabs-1">Details</a></li>
    				<li><a href="#tabs-2">Results</a></li>
 				</ul>
  				<div id="tabs-1">
  					<div class="wpsp-row">
  						<div id="message"></div>
  					</div>
  					<div class="wpsp-row">
  						<form method="post" id="timetable-frm">
		   					<div class="wpsp-col-md-12 line_box">
		   					<input type="hidden" name="exam_id" value="<?php echo $exam->id; ?>">
   								<?php foreach( $subjects AS $subject ) { ?>
   									<div class="wpsp-row">
   										<div class="wpsp-col-md-3 wpsp-col-sm-3 wpsp-col-xs-12">
   											<div class="wpsp-form-group">
												<strong><?php echo $subject->sub_name; ?></strong>
											</div>
   										</div>
   										<div class="wpsp-col-md-3 wpsp-col-sm-3 wpsp-col-xs-12">
   											<div class="wpsp-form-group">
   												<label class="wpsp-labelMain">Start DateTime:</label>
   												<input type="text" name="start_datetime_<?php echo $subject->id; ?>" class="wpsp-form-control datetime" value="<?php echo true == isset( $exam_subjects[$subject->id] ) ? $exam_subjects[$subject->id]->start_datetime : '' ?>" />
   											</div>
   										</div>
   										<div class="wpsp-col-md-3 wpsp-col-sm-3 wpsp-col-xs-12">
	   										<label class="wpsp-labelMain">End DateTime:</label>
   											<input type="text" name="end_datetime_<?php echo $subject->id; ?>" class="wpsp-form-control datetime" value="<?php echo true == isset( $exam_subjects[$subject->id] ) ? $exam_subjects[$subject->id]->end_datetime : '' ?>" />
   										</div>
   										<div class="wpsp-col-md-3 wpsp-col-sm-3 wpsp-col-xs-12">
   											<label class="wpsp-labelMain">Total Marks:</label>
   											<input type="number" name="total_marks_<?php echo $subject->id; ?>" class="wpsp-form-control" value="<?php echo true == isset( $exam_subjects[$subject->id] ) ? $exam_subjects[$subject->id]->total_marks : '' ?>" />
   										</div>
   									</div>
   								<?php } ?>
   								<div class="wpsp-row">
   									<input type="button" id="save_timetable" name="Save" value="Save" class="wpsp-btn wpsp-btn-success" />
   								</div>
   							</div>
   						</form>
   					</div>
  				</div>
  				<div id="tabs-2">
  					<div class="wpsp-row">
  						<div id="message_results"></div>
  					</div>
  					<div class="wpsp-row">
						<form method="post" id="result-frm">
	  						<div class="wpsp-col-md-12 line_box">
  								<input type="hidden" name="exam_id" value="<?php echo $exam->id; ?>">
  									<?php foreach( $trainees AS $trainee ) { ?>
  										<div class="wpsp-row">
  											<div class="wpsp-col-md-2 wpsp-col-sm-3 wpsp-col-xs-12">
  												<div class="wpsp-form-group">
													<strong><?php echo $trainee->s_fname . ' ' . $trainee->s_lname; ?></strong>
												</div>
  											</div>
  											<?php foreach( $subjects AS $subject ) { ?>
  												<div class="wpsp-col-md-2 wpsp-col-sm-3 wpsp-col-xs-12">
  													<div class="wpsp-form-group">
														<label class="wpsp-labelMain"><?php echo $subject->sub_name; ?> Marks:</label>
   														<input type="number" name="marks_<?php echo $subject->id; ?>_<?php echo $trainee->sid?>" class="wpsp-form-control" value="<?php echo ( true == isset( $exam_results[$trainee->sid . '_' . $subject->id] ) ? $exam_results[$trainee->sid . '_' . $subject->id]->obtained_marks : '' )?>" placeholder="Out of <?php echo true == isset( $exam_subjects[$subject->id] ) ? $exam_subjects[$subject->id]->total_marks : 0 ?>" />
													</div>
  												</div>
  											<?php } ?>
  										</div>
  									<?php } ?>
  								<div class="wpsp-row">
									<input type="button" id="save_result" name="Save" value="Save" class="wpsp-btn wpsp-btn-success" />
  								</div>
  							</div>
  						</form>
  					</div>
  				</div>
			</div>
		</div>
	</div>
</div>
<script>
  $( function() {
    $( "#tabs" ).tabs();
    $('.datetime').datetimepicker();
    
    $('#save_timetable').click(function(e) {
    	sch.ajaxRequest({
			'page': 'sch-exam',
			'pageAction': 'save_exam_timetable',
			'selector': '#view_manage_exam',
			data:  sch.formJsonSerialize( $( '#timetable-frm' ) ),
			success: function( res ) {
				response = $.parseJSON(res);
				if( true == response.status ) {
					$('#message').html('<div class="success_msg_div"><span class="success_msg_span">' + response.message + '</span></div>');
				} else {
					$('#message').html('<div class="error_msg_div"><span class="error_msg_span">' + response.message + '</span></div>');			
				}
			}
		});
    });
    
    $( '#save_result').click(function(e) {
    	sch.ajaxRequest({
			'page': 'sch-exam',
			'pageAction': 'save_exam_results',
			'selector': '#view_manage_exam',
			data:  sch.formJsonSerialize( $( '#result-frm' ) ),
			success: function( res ) {
				response = $.parseJSON(res);
				if( true == response.status ) {
					$('#message_results').html('<div class="success_msg_div"><span class="success_msg_span">' + response.message + '</span></div>');
				} else {
					$('#message_results').html('<div class="error_msg_div"><span class="error_msg_span">' + response.message + '</span></div>');			
				}
			}
		});
    });
  });
</script>