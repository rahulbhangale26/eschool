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
								<label class="wpsp-labelMain">Note Date<span></span></label>
								<input type="text" class="wpsp-form-control" id="note_date" placeholder="" name="note_date" />
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
										<option value="<?php echo $note_type->id; ?>"><?php echo $note_type->name; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Notes<span></span></label>
								<textarea class="wpsp-form-control" name="note"></textarea>
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<input type="submit" name="add_note" value="Add Note" class="wpsp-btn wpsp-btn-success" />
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