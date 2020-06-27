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
						<td > <input type="checkbox" class="check_for_<?php echo $trainee_record_type->id ?>" name="checked_for[<?php echo $trainee_record_type->id ?>][<?php echo $student->sid; ?>]" onclick="unSelectSelectAll( <?php echo $trainee_record_type->id ?> )"/></td>
					<?php } ?>
				</tr>
			<?php } ?>
		</tbody>
	</table>
</div>

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