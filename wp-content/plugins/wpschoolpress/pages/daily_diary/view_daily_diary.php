<div class="wpsp-card" id="view_notes">
	<div class="wpsp-card-head">
		<div class="wpsp-row" style="margin-bottom: 10px;">
			<div id="message"></div>
		</div>
		<div class="subject-inner wpsp-left wpsp-class-filter" id="note-filter">
			<form method="post" name="daily_diary_filter">
			<div class="wpsp-col-md-12 line_box">
				<div class="wpsp-row">
					<div class="wpsp-col-md-5 wpsp-col-xs-12">
						<div class="wpsp-form-group">
							Start Date <input type="text" class="wpsp-form-control" id="start_date" placeholder="" name="filter[start_date]"  autocomplete="off" value="<?php echo $filter['start_date']; ?>" />
						</div>
					</div>
					<div class="wpsp-col-md-5 wpsp-col-xs-12">
						<div class="wpsp-form-group">
							 End Date <input type="text" class="wpsp-form-control" id="end_date" placeholder="" name="filter[end_date]"  autocomplete="off" value="<?php echo $filter['end_date']; ?>"/>
						</div>
					</div>
					<div class="wpsp-col-md-1 wpsp-col-xs-12">
						<input type="submit" name="filter[filter]" value="Filter" class="wpsp-btn wpsp-btn-success" />
					</div>
					<div class="wpsp-col-md-1 wpsp-col-xs-12">
						<input type="button" onclick="printDiv();" name="print" value="Print" class="wpsp-btn wpsp-btn-success" />
					</div>
				</div>
			</div>
			</form>
		</div>	
	</div>

	
	<div class="wpsp-card-body">
		<div class="note-head">
			<table id="note_table" class="wpsp-table" cellspacing="0" width="100%" style="width:100%">
				<thead>
					<tr role="row">
						<th>Id.</th>
						<th>Note Date</th>
						<th>Instructor</th>
						<th>Note Type</th>
						<th>Note</th>
						<th class="print-hide">Action</th>
					</tr>
				</thead>
				<tbody>
					<?php foreach( $notes AS $note ) {?>
						<tr>
							<td><?php echo $note->id; ?></td>
							<td><?php echo date( 'Y-m-d', strtotime( $note->created_on ) ); ?></td>
							<td><?php echo ( true == isset( $instructors[$note->instructor_id] ) ? $instructors[$note->instructor_id]->first_name . ' ' . $instructors[$note->instructor_id]->last_name : ''  )?></td>
							<td><?php echo ( isset( $note_types[$note->note_type_id] ) ? $note_types[$note->note_type_id]->name : '-' ); ?></td>
							<td><?php echo $note->note; ?></td>
							<td class="print-hide">
								<?php if( $user->getRole() == CRole::TEACHER ) { ?><a href="<?php echo site_url( '/wp-admin/admin.php?page=sch-daily_diary&page_action=edit_note&note_id=' . $note->id ); ?>"><span class="dashicons dashicons-edit"></span></a> <?php } ?>
								<?php if( $user->getRole() == CRole::TEACHER ) { ?>
									<a href="javascript:;" id="trash-note" class="wpsp-popclick" data-id="<?php echo $note->id; ?>" data-pop="DeleteModal"><span class="dashicons dashicons-trash" style="color: red;"></span></a>
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

function printDiv() {
    var divToPrint = document.getElementById('note_table');
    var htmlToPrint = '' +
        '<style type="text/css">' +
        'table th, table td {' +
        'border:1px solid #555; !important' +
        'padding:0.5em;' +
        '} .print-hide{display:none;}' +
        '</style>';
    htmlToPrint += divToPrint.outerHTML;
    newWin = window.open("");
    newWin.document.write('<html><head></head><body>' + htmlToPrint + '</body></html>');
} 

$(function () {

	$( "#start_date" ).datepicker({
		dateFormat: 'yy-mm-dd',
		showOtherMonths: true,
	    selectOtherMonths: true,
	    showButtonPanel: true,
	    changeMonth: true,
	    changeYear: true
	});
	
	$( "#end_date" ).datepicker({
		dateFormat: 'yy-mm-dd',
		showOtherMonths: true,
	    selectOtherMonths: true,
	    showButtonPanel: true,
	    changeMonth: true,
	    changeYear: true
	});

	$(document).on('click', '.wpsp-popclick', function(e) {
		$("#DeleteModal").css("display", "block");
		$("#DeleteModal").attr('data-single-delete', true);
		$("#DeleteModal").attr( 'data-id', $( this ).attr( 'data-id') );
	});

	$('.ClassDeleteBt').unbind();
	$('.ClassDeleteBt').click( function(e) {
		$("#DeleteModal").css("display", "none");
		sch.ajaxRequest({
			'page': 'sch-daily_diary',
			'pageAction': 'delete_note',
			'selector': '#view_notes',
			data:  { 'note_id': $("#DeleteModal").attr( 'data-id' ) },
			success: function( res ) {
				if( 'error' == res ) {
					$('#message').html('<div class="error_msg_div"><span class="error_msg_div">Problem occurred while deleting daily diary note.</span></div>')
				} else {
					$('#view_notes').replaceWith( res );
					$('#message').html('<div class="success_msg_div"><span class="success_msg_span">Daily Diary Note Deleted Successfully.</span></div>');
				}
			}
		}); 
	});

	handleDatatables();
});
</script>