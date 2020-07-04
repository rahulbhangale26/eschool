
<div class="wpsp-card" id="view_subjects">
	<div class="wpsp-card-head">
		<?php 
		  displaySuccessMsg( $success_messages );
		  displayErrorMsg( $error_messages );
		?>
		<?php if( CRole::TEACHER == $user->getRole() && true == in_array( $user->getTeacher()->designation_id, [ CDesignations::CLERK, CDesignations::PRINCIPAL ] ) || CRole::ADMIN == $user->getRole() ) {?>
		
		<div class="wpsp-left wpsp-class-filter" id="time-table">
			<form id="syllabus_upload" method="post" enctype="multipart/form-data">
				<div class="wpsp-form-group">
					<label class="wpsp-labelMain">Time Table<span></span></label>
					<input type="file" class="wpsp-form-control" id="time_table" placeholder="" name="time_table">
					<input type="submit" name="upload_timetable" value="Upload Timetable" class="wpsp-btn wpsp-btn-success" />
				</div>
			</form>
		</div>
		<?php } ?>
	</div>
	
	<style>
	   .reader {
	       width: 100%;
	       height: 600px;
	   }
	</style>
	
	<div class="wpsp-card-body">
		<?php if( true == isset( $time_table['url'] ) ) { ?>
		<div class="">
			<object class="reader" data="<?php echo WP_CONTENT_URL . $time_table['url'] ?>" type="application/pdf">
    			View Time Table : <a target="_blank" href="<?php echo WP_CONTENT_URL . $time_table['url'] ?>"><?php echo $time_table['name']; ?></a>
			</object>
		</div>
		<?php } else {
		    echo '<h3>Time table is not available.</h3>';
		}?>
		
	</div>
</div>

<script>
</script>