<div class="wpsp-card" id='view_job_add_form'>
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
			<form id="job_add_form" method="post" enctype="multipart/form-data">
				<div class="wpsp-col-md-12 line_box">
				<div class="wpsp-col-md-6 wpsp-col-md-12">
					<div class="wpsp-row">
						<div class="wpsp-col-md-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Job Title<span></span></label>
								<input type="text" class="wpsp-form-control" id="title" placeholder="Job Title" name="title" value="<?php echo ( true == isset( $job ) ? $job->title : '' );?>" />
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Job Description<span></span></label>
								<textarea class="wpsp-form-control" name="description" id="desc"><?php echo ( true == isset( $job ) ? $job->description : '' ); ?></textarea>
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Time Given<span></span></label>
								<input type="number" class="wpsp-form-control" id="time_given" placeholder="" name="time_given" value="<?php echo ( true == isset( $job ) ? $job->time_given : '' ); ?>"/>
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Start Date<span></span></label>
								<input type="text" class="wpsp-form-control" id="start_date" placeholder="" name="start_date" value="<?php echo ( true == isset( $job ) ? $job->start_date : '' ); ?>" />
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">End Date<span></span></label>
								<input type="text" class="wpsp-form-control" id="end_date" placeholder="" name="end_date"  value="<?php echo ( true == isset( $job ) ? $job->end_date : '' ); ?>" />
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Job Diagram File<span></span></label>
								<?php if( true == isset( $job ) ) { ?>
									<img id="job_img_preview" src="<?php echo WP_CONTENT_URL . $job->file_url; ?>" style="width: 400px;"/>
								<?php } ?>
								<input type="file" class="wpsp-form-control" id="job_diagram_file" placeholder="" name="job_diagram_file">
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Tolerance<span></span></label>
								<input type="text" class="wpsp-form-control" id="tolerance" placeholder="" name="tolerance" value="<?php echo ( true == isset( $job ) ? $job->tolerance : '' ); ?>" />
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Material<span></span></label>
								<input type="text" class="wpsp-form-control" id="material" placeholder="" name="material" value="<?php echo ( true == isset( $job ) ? $job->material : '' ); ?>" />
							</div>
						</div>
					</div>
					</div>
					<div class="wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-md-12">
						<div class="wpsp-row">
							<div class="wpsp-col-md-8 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain"> 1st Skill Name<span></span></label>
									<input type="text" class="wpsp-form-control" id="skill_1" placeholder="Skill Name" name="skill_name[1]" value="<?php echo ( true == isset( $job_ops[0] ) ? $job_ops[0]->name : '' ); ?>" />
									<?php if( true == isset( $job_ops[0] ) ) {
									    echo '<input type="hidden" name="skill_id[1]" value="' . $job_ops[0]->id. '" />';
									}?>
								</div>
							</div> 
							<div class="wpsp-col-md-4 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">Marks<span></span></label>
									<input type="number" class="wpsp-form-control" id="marks_1" placeholder="" name="marks[1]" value="<?php echo ( true == isset( $job_ops[0] ) ? $job_ops[0]->marks : '' ); ?>" />
								</div>
							</div>
						</div>
						<div class="wpsp-row">
							<div class="wpsp-col-md-8 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">2nd Skill Name<span></span></label>
									<input type="text" class="wpsp-form-control" id="skill_2" placeholder="Skill Name" name="skill_name[2]" value="<?php echo ( true == isset( $job_ops[1] ) ? $job_ops[1]->name : '' ); ?>" />
									<?php if( true == isset( $job_ops[1] ) ) {
									    echo '<input type="hidden" name="skill_id[2]" value="' . $job_ops[1]->id. '" />';
									}?>
								</div>
							</div> 
							<div class="wpsp-col-md-4 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">Marks<span></span></label>
									<input type="number" class="wpsp-form-control" id="marks_2" placeholder="" name="marks[2]" value="<?php echo ( true == isset( $job_ops[1] ) ? $job_ops[1]->marks : '' ); ?>"  />
								</div>
							</div>
						</div>
						<div class="wpsp-row">
							<div class="wpsp-col-md-8 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">3rd Skill Name<span></span></label>
									<input type="text" class="wpsp-form-control" id="skill_3" placeholder="Skill Name" name="skill_name[3]" value="<?php echo ( true == isset( $job_ops[2] ) ? $job_ops[2]->name : '' ); ?>" />
									<?php if( true == isset( $job_ops[2] ) ) {
									    echo '<input type="hidden" name="skill_id[3]" value="' . $job_ops[2]->id. '" />';
									}?>
								</div>
							</div> 
							<div class="wpsp-col-md-4 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">Marks<span></span></label>
									<input type="number" class="wpsp-form-control" id="marks_3" placeholder="" name="marks[3]" value="<?php echo ( true == isset( $job_ops[2] ) ? $job_ops[2]->marks : '' ); ?>"  />
								</div>
							</div>
						</div>
						<div class="wpsp-row">
							<div class="wpsp-col-md-8 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">4th Skill Name<span></span></label>
									<input type="text" class="wpsp-form-control" id="skill_4" placeholder="Skill Name" name="skill_name[4]" value="<?php echo ( true == isset( $job_ops[3] ) ? $job_ops[3]->name : '' ); ?>" />
									<?php if( true == isset( $job_ops[3] ) ) {
									    echo '<input type="hidden" name="skill_id[4]" value="' . $job_ops[3]->id. '" />';
									}?>
								</div>
							</div> 
							<div class="wpsp-col-md-4 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">Marks<span></span></label>
									<input type="number" class="wpsp-form-control" id="marks_4" placeholder="" name="marks[4]" value="<?php echo ( true == isset( $job_ops[3] ) ? $job_ops[3]->marks : '' ); ?>" />
								</div>
							</div>
						</div>
						<div class="wpsp-row">
							<div class="wpsp-col-md-8 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">5th Skill Name<span></span></label>
									<input type="text" class="wpsp-form-control" id="skill_5" placeholder="Skill Name" name="skill_name[5]" value="<?php echo ( true == isset( $job_ops[4] ) ? $job_ops[4]->name : '' ); ?>"  />
									<?php if( true == isset( $job_ops[4] ) ) {
									    echo '<input type="hidden" name="skill_id[5]" value="' . $job_ops[4]->id. '" />';
									}?>
								</div>
							</div> 
							<div class="wpsp-col-md-4 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">Marks<span></span></label>
									<input type="number" class="wpsp-form-control" id="marks_5" placeholder="" name="marks[5]" value="<?php echo ( true == isset( $job_ops[4] ) ? $job_ops[4]->marks : '' ); ?>"  />
								</div>
							</div>
						</div>
						<div class="wpsp-row">
							<div class="wpsp-col-md-8 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">6th Skill Name<span></span></label>
									<input type="text" class="wpsp-form-control" id="skill_6" placeholder="Skill Name" name="skill_name[6]" value="<?php echo ( true == isset( $job_ops[5] ) ? $job_ops[5]->name : '' ); ?>"  />
									<?php if( true == isset( $job_ops[5] ) ) {
									    echo '<input type="hidden" name="skill_id[6]" value="' . $job_ops[5]->id. '" />';
									}?>
								</div>
							</div> 
							<div class="wpsp-col-md-4 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">Marks<span></span></label>
									<input type="number" class="wpsp-form-control" id="marks_6" placeholder="" name="marks[6]" value="<?php echo ( true == isset( $job_ops[5] ) ? $job_ops[5]->marks : '' ); ?>"  />
								</div>
							</div>
						</div>
						<div class="wpsp-row">
							<div class="wpsp-col-md-8 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">7th Skill Name<span></span></label>
									<input type="text" class="wpsp-form-control" id="skill_7" placeholder="Skill Name" name="skill_name[7]"  value="<?php echo ( true == isset( $job_ops[6] ) ? $job_ops[6]->name : '' ); ?>" />
									<?php if( true == isset( $job_ops[6] ) ) {
									    echo '<input type="hidden" name="skill_id[7]" value="' . $job_ops[6]->id. '" />';
									}?>
								</div>
							</div> 
							<div class="wpsp-col-md-4 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">Marks<span></span></label>
									<input type="number" class="wpsp-form-control" id="marks_7" placeholder="" name="marks[7]" value="<?php echo ( true == isset( $job_ops[6] ) ? $job_ops[6]->marks : '' ); ?>" />
								</div>
							</div>
						</div>
						<div class="wpsp-row">
							<div class="wpsp-col-md-8 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">8th Skill Name<span></span></label>
									<input type="text" class="wpsp-form-control" id="skill_8" placeholder="Skill Name" name="skill_name[8]" value="<?php echo ( true == isset( $job_ops[7] ) ? $job_ops[7]->name : '' ); ?>"  />
									<?php if( true == isset( $job_ops[7] ) ) {
									    echo '<input type="hidden" name="skill_id[8]" value="' . $job_ops[7]->id. '" />';
									}?>
								</div>
							</div> 
							<div class="wpsp-col-md-4 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">Marks<span></span></label>
									<input type="number" class="wpsp-form-control" id="marks_8" placeholder="" name="marks[8]" value="<?php echo ( true == isset( $job_ops[7] ) ? $job_ops[7]->marks : '' ); ?>"  />
								</div>
							</div>
						</div>
					</div>
					<div class="wpsp-row"></div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-6 wpsp-col-md-12">
							<div class="wpsp-form-group pull-right">
								<?php if( true == isset( $job ) ) { ?>
									<input type="submit" name="edit_job" value="Update Job And Skills" class="wpsp-btn wpsp-btn-success" />
								<?php } else { ?>
									<input type="submit" name="add_job" value="Add Job And Skills" class="wpsp-btn wpsp-btn-success" />
								<?php } ?>
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

	$('#job_diagram_file').change( function( e ) {
		$('#job_img_preview').remove();
	});
	
});
</script>