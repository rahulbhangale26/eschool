<div id="accordion">
	<?php foreach( $students as $student ) { ?>
		<h3 data-StudentId="<?php echo $student->sid;?>" ><?php echo $student->s_fname . ' ' . $student->s_lname;?></h3>
		<div id="job_marks_form_<?php echo $student->sid; ?>">
			Loading...
		</div>
	<?php } ?>
</div>

 <script type="text/javascript">

function loadStudentJobMarksForm( intStudentId ) {
	sch.ajaxRequest({
		'page': 'sch-jobs',
		'pageAction': 'student_job_marks_form',
		'selector': '#add_job_marks',
		data:  { 'student_id': intStudentId, 'job_id': $( '#add_job_marks' ).attr( 'data-JobId' ) },
		success: function( res ) {
			$('#job_marks_form_' + intStudentId).html( res );
		}
 	});
}
 
 $(function(){
	$( "#accordion" ).accordion({
		heightStyle: 'content',
		collapsible: true,
		active: false,
		beforeActivate: function( event, ui ) {
			var intStudentId = $( ui.newHeader ).attr( 'data-StudentId' );
			$( ui.oldPanel ).html( 'Loading...' );
			loadStudentJobMarksForm( intStudentId )
		}
	});
});


 </script>