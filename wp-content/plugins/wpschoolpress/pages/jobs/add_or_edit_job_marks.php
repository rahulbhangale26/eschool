<div class="wpsp-card">
	<div class="wpsp-card-head" id="message">
	</div>
	<div class="wpsp-card-body" id="add_job_marks" data-JobId="<?php echo $job->id; ?>" >
		<div class="wpsp-row">
			<div class="wpsp-col-lg-5 wpsp-col-md-5 wpsp-col-sm-12 wpsp-col-xs-12">
				<div class="line_box">
					<div class="wpsp-form-group">
						<label for="batch" class="wpsp-labelMain">Select Batch</label>
						<select class="wpsp-form-control" name="batch_id" id="batch_id">
							<option value="" disabled selected>Select Batch</option>
							<?php foreach( $batches as $batch ) { ?>
								<option value="<?php echo $batch->id?>"><?php echo $batch->name; ?></option>
							<?php } ?>
						</select>
					</div>
					
					<div class="wpsp-form-group">
						<label for="trade" class="wpsp-labelMain">Select Trade</label>
						<select class="wpsp-form-control" disabled name="trade_id" id="trade_id">
							<option value="" disabled selected >Select Trade</option>
							<?php foreach( $trades as $trade ) { ?>
								<option value="<?php echo $trade->id?>"><?php echo $trade->name; ?></option>
							<?php } ?>
						</select>
					</div>
					
					<div class="wpsp-form-group">
						<label for="trade" class="wpsp-labelMain">Select Unit</label>
						<select class="wpsp-form-control" disabled name="unit_id" id="unit_id">
							<option value="" disabled selected >Select Unit</option>
							<?php foreach( $units as $unit ) { ?>
								<option value="<?php echo $unit->id?>"><?php echo $unit->unit_name; ?></option>
							<?php } ?>
						</select>
					</div>
				</div>
			</div>
		</div>
		<div class="wpsp-row">
			<div class="wpsp-col-md-12" id="student_job_marks_list">
								<!-------------- Students list will loaded here. -->
			</div>
		</div>
		</div>
	</div>
</div>
 <script type="text/javascript">
 	function loadJobMarkStudentList() {

		var unit_id = $('#unit_id').val();
 	 	
 		sch.ajaxRequest({
			'page': 'sch-jobs',
			'pageAction': 'students_job_marks_list',
			'selector': '#add_job_marks',
			data:  { 'unit_id': unit_id },
			success: function( res ) {
				$('#student_job_marks_list').html( res );
			}
 		});
 	}
	
	$(function(){
		$('#batch_id').change(function(){
			$('#trade_id').prop( 'disabled', false );
		});


		$('#trade_id').change( function(e) {

			$('#unit_id').prop( 'disabled', false );	
			var trade_id = $("#trade_id").val();
			var batch_id = $("#batch_id").val();	

			sch.ajaxRequest({
				'page': 'sch-trades',
				'pageAction': 'get_trade_unit_lists',
				'selector': '#add_job_marks',
				data:  { 'TradeId': trade_id, 'BatchId': batch_id },
				success: function( res ) {
					
					if( '' != res ) {
						var units = $.parseJSON( res );

						if( 0 == units.length ) {
							$('#message').html('<div class="error_msg_div"><span class="error_msg_span">No Unit assigned for this batch.</span></div>');
							$('#unit_id').prop( 'disabled', true );	
							return;
						}

						strOption = '';
						$(units).each( function( index, unit ){
							strOption += '<option value="' + unit.id + '">' + unit.unit_name+ '</option>';
						});
						strHTML = '<select name="unit_id" id = "unit_id" class="wpsp-form-control">' +
									'<option value="" disabled selected>Select Unit</option>' +
									strOption +
								'</select>';

						$('#add_job_marks #unit_id').replaceWith( strHTML );

						$('#add_job_marks #unit_id').change( function(e) {
							loadJobMarkStudentList();
						});
					}	
				}
			});
	});
});
 </script>