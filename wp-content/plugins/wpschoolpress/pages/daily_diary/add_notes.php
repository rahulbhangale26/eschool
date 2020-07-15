<div class="wpsp-card" id='add_notes'>
	<div class="wpsp-card-head">
		<h3 class="wpsp-card-title"></h3>
	</div>
	
	<div class="wpsp-card-head">
		<?php 
		  displaySuccessMsg( $success_messages );
		  displayErrorMsg( $error_messages );
		?>
	</div>
	
	<div class="wpsp-card-body">
		<div class="wpsp-row">
			<form id="add_notes_form" method="post">
				<div class="wpsp-col-md-12 line_box">
					
					<div class="wpsp-row">
						<div class="wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label for="trade" class="wpsp-labelMain">Select Batch</label>
								<select class="wpsp-form-control" name="batch_id" id="batch_id">
									<option disabled selected value="">Select Batch</option>
									<?php foreach( $batches as $batch ) { ?>
										<option
											<?php echo ( true == isset( $note ) && $note->batch_id == $batch->id ) ? 'selected="selected"' : ''; ?>
											value="<?php echo $batch->id?>"><?php echo $batch->name; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
					</div>

					<div class="wpsp-row">
						<div class="wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label for="trade" class="wpsp-labelMain">Select Trade</label>
								<select class="wpsp-form-control" <?php echo ( true == isset( $note ) ? '' : 'disabled' ); ?> name="trade_id" id="trade_id">
									<option disabled selected value="">Select Trade</option>
									<?php foreach( $trades as $trade ) { ?>
										<option 
											<?php echo ( true == isset( $note ) && $note->trade_id == $trade->id ) ? 'selected="selected"' : ''; ?>
											value="<?php echo $trade->id?>"><?php echo $trade->name; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
					</div>
					
					<div class="wpsp-row">
						<div class="wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label for="trade" class="wpsp-labelMain">Select Unit</label>
								<select class="wpsp-form-control" <?php echo ( true == isset( $note ) ? '' : 'disabled' ); ?> name="unit_id" id="unit_id">
									<option disabled selected value="">Select Unit</option>
									<?php foreach( $units as $unit ) { ?>
										<option
											<?php echo ( true == isset( $note ) && $note->unit_id == $unit->id ) ? 'selected="selected"' : ''; ?>
											value="<?php echo $unit->id?>"><?php echo $unit->unit_name; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
					</div>
				
					<div class="wpsp-row">
						<div class="wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Note Date<span></span></label>
								<input type="text" class="wpsp-form-control" id="note_date" placeholder="" name="note_date" autocomplete="off" value="<?php echo ( true == isset( $note ) ) ? date( 'Y-m-d', strtotime( $note->created_on ) ) : '';  ?>" />
							</div>
						</div>
					</div>				
					<div class="wpsp-row">
						<div class="wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Note Type<span></span></label>
								<select class="wpsp-form-control" id="note_type_id" name="note_type_id">
									<option value="">Select Note Type</option>
									<?php foreach( $note_types AS $note_type ) { ?>
										<option value="<?php echo $note_type->id; ?>" <?php echo ( true == isset( $note ) && $note->note_type_id == $note_type->id ) ? 'selected="selected"' : '';  ?>><?php echo $note_type->name; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Number<span></span></label>
								<input type="text" class="wpsp-form-control" id="note_type_number" placeholder="" name="note_type_number" autocomplete="off" value="<?php echo ( true == isset( $note ) ) ? $note->number : '';  ?>" />
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Notes<span></span></label>
								<textarea class="wpsp-form-control" name="note"><?php echo ( true == isset( $note ) ) ? $note->note : '';  ?></textarea>
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<input type="submit" name="add_note" value="<?php echo ( true == isset( $note ) ? 'Update Note' : 'Add Note' )?>" class="wpsp-btn wpsp-btn-success" />
								<?php if( true == isset( $note ) ) { ?>
									<input type="hidden" name="note_id" value="<?php echo $note->id?>" />
								<?php }?>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
$(function() {

	$( '#batch_id' ).change(function(){
		$('#trade_id').prop( 'disabled', false );
		$('#trade_id').val( '' );
	});

	$('#trade_id').change( function(e) {

		sch.loadUnitFilter( {
			'trade_id': $('#trade_id').val(),
			'batch_id': $('#batch_id').val(),
			'selector': '#add_notes',
			'unit_selector': '#unit_id',
			'onChange': function() {
				console.log('Unit Change');
			}
		});
		
	});
	
	$( "#note_date" ).datepicker({
		dateFormat: 'yy-mm-dd',
		showOtherMonths: true,
	    selectOtherMonths: true,
	    showButtonPanel: true,
	    changeMonth: true,
	    changeYear: true
	});
});
</script>