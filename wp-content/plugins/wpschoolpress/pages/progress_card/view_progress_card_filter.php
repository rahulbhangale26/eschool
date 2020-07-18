<div class="wpsp-col-xs-12 line_box filter-container">
	<div class="wpsp-row">
		<div class="wpsp-col-md-4 wpsp-col-md-12">
			<div class="wpsp-form-group">
				Select Unit<br>
				<select id="unit_id" class="wpsp-form-control" name="unit_id">
					<option value="">Select Unit</option>
					<?php foreach( $batches AS $batch ) { ?>
						<optgroup class="batch-optgroup" label="<?php echo $batch->name; ?>">
						<?php foreach( $trades AS $trade ) { ?>								
								<?php foreach( $units AS $unit ) {
									if( $batch->id == $unit->batch_id && $trade->id == $unit->trade_id ) {
										echo '<option ' . ( $filter['unit_id'] == $unit->id ? 'selected="selected"' : '' ) . ' value="' . $unit->id . '"> ' . $trade->name . ' - ' . $unit->unit_name . '</option>';
									}
								}?>
						<?php } ?>
						</optgroup>
					<?php }?>
				</select>
			</div>
		</div>
		<div class="wpsp-col-md-4 wpsp-col-md-12">
			<div class="wpsp-form-group">
				Select Student<br>
				<select <?php echo ( true == isset( $students ) ? '' : 'disabled' ); ?> id="student_id" class="wpsp-form-control" name="student_id">
					<option value="">Select Student</option>
					<?php foreach ( $students AS $student ) { ?>
						<option value="<?php echo $student->sid; ?>"><?php echo $student->s_fname . ' ' . $student->s_lname; ?></option>
					<?php } ?>
				</select>
			</div>
		</div>
		<div class="wpsp-col-md-3 wpsp-col-xs-12">
			<div class="wpsp-form-group">
				<br>
				<input type="button" name="show" value="Show Progress Card" id="show_progress_card" class="wpsp-btn wpsp-btn-success" />
			</div>
		</div>
		<div class="wpsp-col-md-1 wpsp-col-xs-12">
			<div class="wpsp-form-group">
				<br>
				<input type="button" name="print" value="Print" id="print_btn" onclick="printDiv();" class="wpsp-btn wpsp-btn-success" />
			</div>
		</div>
	</div>
</div>
<script>

function printDiv() {

	var divToPrint = $('.progress-card').html();
    var htmlToPrint = '';
    htmlToPrint += divToPrint;
    newWin = window.open("");
    newWin.document.write('<html><head></head><body>' + htmlToPrint + '</body></html>');

    setTimeout(function(){
    	newWin.print();
    }, 1000 );
} 

$( function(){
	$('#unit_id').unbind();
	$('#unit_id').change(function(){

		sch.ajaxRequest({
			'page': 'sch-progress_card',
			'pageAction': 'view_progress_card_filter',
			'selector': '.filter-container',
			data:  { 'unit_id': $("#unit_id").val() },
			success: function( res ) {
				$('.filter-container').replaceWith( res );
			}
		}); 
	});

	$('#show_progress_card').unbind();
	$('#show_progress_card').click( function(){
		sch.ajaxRequest({
			'page': 'sch-progress_card',
			'pageAction': 'view_student_progress_card',
			'selector': '.filter-container',
			data:  { 'unit_id': $("#unit_id").val(), 'student_id': $('#student_id').val() },
			success: function( res ) {
				$('.progress-card').html( res );
			}
		}); 
	});
});
</script>