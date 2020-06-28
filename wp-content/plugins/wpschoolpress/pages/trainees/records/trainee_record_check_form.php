<div class="wpsp-form-group">
	<table class="wpsp-table wpsp-table-bordered" id="trainee_record_table" cellspacing="0" width="100%" style="width:100%; overflow-x:scroll; " >
		<thead>
			<tr>
				<th style="background-color: #c0e9f0;"></th>
				<?php foreach( $trainee_record_types as $trainee_record_type ) { ?>
					<th style="background-color: #c0e9f0;"> <?php echo $trainee_record_type->name; ?></th>
				<?php } ?>
			</tr>
			<tr>
				<th style="background-color: #c0e9f0;">Students</th>
				<?php foreach( $trainee_record_types as $trainee_record_type ) { ?>
					<th style="background-color: #c0e9f0;"><input type="checkbox" class="select_all" data-TraineeRecordTypeId="<?php echo $trainee_record_type->id; ?>" id="select_all_<?php echo $trainee_record_type->id; ?>" /> Select All</th>
				<?php } ?>				
			</tr>
		</thead>
		<tbody>
			<?php foreach( $students as $student ) { ?>
				<tr>
					<td><?php echo $student->s_fname . ' ' . $student->s_lname; ?></td>
					<?php foreach( $trainee_record_types as $trainee_record_type ) { ?>
						<td >
						
							<?php if( $trainee_record_type->id ==  CTraineeRecordTypes::PROGRESS ) { 
							    foreach( $trainee_records AS $trainee_record ) {
							        if( $trainee_record->student_id == $student->sid && $trainee_record->trainee_record_type_id == $trainee_record_type->id && true == isset( $trainee_record->progress ) ) {
							            $strSelected = $trainee_record->progress;
							        }
							    }
							?>
							    <select name=progress[<?php echo $trainee_record_type->id ?>][<?php echo $student->sid; ?>] >
							    	<option value="">Select Progress</option>
							    	<option <?php echo $strSelected == 'Excellent' ? 'selected="selected"' : '' ?> value="Excellent">Excellent</option>
							    	<option <?php echo $strSelected == 'Good' ? 'selected="selected"' : '' ?> value="Good">Good</option>
							    	<option <?php echo $strSelected == 'Bad' ? 'selected="selected"' : '' ?> value="Bad">Bad</option>
							    </select>
							    
							<?php  } else { ?>					 
								<input 
									type="checkbox" 
									class="check_for_<?php echo $trainee_record_type->id ?>" 
									name="checked_for[<?php echo $trainee_record_type->id ?>][<?php echo $student->sid; ?>]" 
									onclick="unSelectSelectAll( <?php echo $trainee_record_type->id ?> )"
								    <?php  foreach( $trainee_records AS $trainee_record ) {
								        if( $trainee_record->student_id == $student->sid && $trainee_record->trainee_record_type_id == $trainee_record_type->id && true == $trainee_record->is_checked ) {
	   							            echo 'checked="checked"';
								        }
								    } ?>
								    />
							<?php } ?>
								</td>
					<?php } ?>
				</tr>
			<?php } ?>
		</tbody>
	</table>
</div>

<input type="hidden" name="is_edit" value="<?php echo( isset( $trainee_records ) && 0 < count($trainee_records ) )?>" />

<script>

function unSelectSelectAll( intTraineeRecordTypeId ) {

	if( $('.check_for_' + intTraineeRecordTypeId ).length == $( 'input:checked.check_for_' + intTraineeRecordTypeId ).length ) {
		$( '#select_all_' + intTraineeRecordTypeId ).prop('checked', true );
	} else {
		$( '#select_all_' + intTraineeRecordTypeId ).prop('checked', false );
	}
	
}

$(function() {

	$('.select_all').click( function( e ) {
		var intTraineeRecordTypeId = $( e.target ).attr('data-TraineeRecordTypeId' );
		console.log( $( e.target ).attr('data-TraineeRecordTypeId' ) )

		if( $( e.target ).is(":checked") ) {
			$( '.check_for_' + intTraineeRecordTypeId ).prop('checked', true );
		} else {
			$( '.check_for_' + intTraineeRecordTypeId ).prop('checked', false );
		}
	}); 
	
});
</script>