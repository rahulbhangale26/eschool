<div class="wpsp-card" id="view_subjects">
	<div class="wpsp-card-head">
		<div class="subject-inner wpsp-left wpsp-class-filter" id="note-filter">
			<div class="wpsp-col-md-12 line_box">
				<div class="wpsp-row">
					<div class="wpsp-col-md-5 wpsp-col-xs-12">
						<div class="wpsp-form-group">
							Start Date <input type="text" class="wpsp-form-control" id="start_date" placeholder="" name="start_date" />
						</div>
					</div>
					<div class="wpsp-col-md-5 wpsp-col-xs-12">
						<div class="wpsp-form-group">
							 End Date <input type="text" class="wpsp-form-control" id="start_date" placeholder="" name="start_date" />
						</div>
					</div>
					<div class="wpsp-col-md-1 wpsp-col-xs-12">
						<input type="submit" name="filter" value="Filter" class="wpsp-btn wpsp-btn-success" />
					</div>
					<div class="wpsp-col-md-1 wpsp-col-xs-12">
						<input type="submit" name="filter" value="Print" class="wpsp-btn wpsp-btn-success" />
					</div>
				</div>
			</div>	
		</div>
	</div>
	
	<div class="wpsp-card-body">
		<div class="note-head">
			<table id="note_table" class="wpsp-table" cellspacing="0" width="100%" style="width:100%">
				<thead>
					<tr role="row">
						<th>Id.</th>
						<th>Note Date</th>
						<th>Note Type</th>
						<th>Note</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php foreach( $notes AS $note ) {?>
						<tr>
							<td><?php echo $note->id; ?></td>
							<td><?php echo date( 'Y-m-d', strtotime( $note->created_on ) ); ?></td>
							<td><?php echo ( isset( $note_types[$note->note_type_id] ) ? $note_types[$note->note_type_id]->name : '-' ); ?></td>
							<td><?php echo $note->note; ?></td>
							<td>
								<span class="dashicons dashicons-edit"></span>
								<span class="dashicons dashicons-trash" style="color: red;"></span>
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

	$( "#start_date" ).datepicker({
		dateFormat: 'yy-mm-dd',
		showOtherMonths: true,
	    selectOtherMonths: true,
	    showButtonPanel: true,
	    changeMonth: true,
	    changeYear: true
	});
	
	handleDatatables();
});
</script>