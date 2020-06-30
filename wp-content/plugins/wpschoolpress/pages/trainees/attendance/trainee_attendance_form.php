<div class="wpsp-form-group" >

	<input type="checkbox" name="all_present" id="all_present" value="all_present" /> All Present 

	<table class="wpsp-table wpsp-table-bordered" id="trainee_attendance_table" cellspacing="0" width="100%" style="width:100%; overflow-x:scroll; " >
		<thead>
			<tr>
				<th colspan="7" style="background-color: #c0e9f0;">
					<span class="wpsp-f500">Trade: <?php echo $trade->name; ?> | <?php echo $unit->unit_name; ?> | Batch: <?php echo $batch->name;?></span>
					<span class="pull-right">Date: <?php echo $attendance_date; ?></span>
				</th>
			</tr>
			<tr>
				<th style="background-color: #c0e9f0;"></th>
				<?php foreach( $attendance_types as $attendance_type ) { ?>
					<th style="background-color: #c0e9f0;"> <?php echo $attendance_type->name; ?></th>
				<?php } ?>
				<th style="background-color: #c0e9f0;"> Reason</th>
			</tr>
			<tr>
				<th style="background-color: #c0e9f0;">Students</th>
				<?php foreach( $attendance_types as $attendance_type ) { ?>
					<th style="background-color: #c0e9f0;"></th>
				<?php } ?>				
				<th style="background-color: #c0e9f0;"></th>
			</tr>
		</thead>
		<tbody>
			<?php foreach( $students as $student ) { ?>
				<tr>
					<td><?php echo $student->s_fname . ' ' . $student->s_lname; ?></td>
					<?php foreach( $attendance_types as $attendance_type ) { ?>
						<td>
							<?php
							$strChecked = '';
							if( true == isset( $trainee_attendances[$student->sid] ) && $trainee_attendances[$student->sid]->attendance_type_id == $attendance_type->id ) {
							    $strChecked = 'checked="checked"';
							}
							?>
						
							<input 
								type="checkbox" 
								    <?php echo $strChecked; ?>
									onclick="processAttendance(<?php echo $attendance_type->id ?>, <?php echo $student->sid; ?>)"
									class="attendance_<?php echo $attendance_type->id ?> attendance_<?php echo $attendance_type->id ?>_<?php echo $student->sid; ?> attendance_sid_<?php echo $student->sid; ?>" 
									name="attendance[<?php echo $attendance_type->id ?>][<?php echo $student->sid; ?>]" 
							/>
						</td>
					<?php } ?>
					<td><input type="text" value="<?php echo true == isset( $trainee_attendances[$student->sid] ) ? $trainee_attendances[$student->sid]->reason : ''; ?>" placeholder="Reason" name="attendance[reason][<?php echo $student->sid?>]" class="wpsp-form-control"></td>
				</tr>
			<?php } ?>
			<input type="hidden" name="is_edit" value="<?php echo( isset( $trainee_attendances ) && 0 < count( $trainee_attendances ) )?>" />
		</tbody>
	</table>
</div>
<script>

function processAttendance( intAttendanceTypeId, intStudentId )  {
	if( $( '.attendance_1' ).lenght != $( 'input:checked.attendance_1'  ).length) {
		$('#all_present').prop( 'checked', false );
	}
	
	$('.attendance_sid_' + intStudentId ).prop( 'checked', false );
	$('.attendance_' + intAttendanceTypeId + '_' + intStudentId ).prop( 'checked', true );
}

$(function() {

	var intPresentAttendanceType = 1;
	
	$('#all_present').click(function( e ) {
		$('.attendance_' + intPresentAttendanceType ).prop( 'checked', true );
	});
});
</script>