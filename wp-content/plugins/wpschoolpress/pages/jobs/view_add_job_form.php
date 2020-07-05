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
						<div class="wpsp-col-md-6 wpsp-col-md-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Job Title<span></span></label>
								<input type="text" class="wpsp-form-control" id="title" placeholder="Job Title" name="title" />
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-6 wpsp-col-md-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Job Description<span></span></label>
								<textarea class="wpsp-form-control" name="description" id="desc"></textarea>
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-6 wpsp-col-md-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Time Given<span></span></label>
								<input type="number" class="wpsp-form-control" id="time_given" placeholder="" name="time_given" />
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-6 wpsp-col-md-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Start Date<span></span></label>
								<input type="text" class="wpsp-form-control" id="start_date" placeholder="" name="start_date" />
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-6 wpsp-col-md-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">End Date<span></span></label>
								<input type="text" class="wpsp-form-control" id="end_date" placeholder="" name="end_date" />
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-6 wpsp-col-md-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Job Diagram File<span></span></label>
								<input type="file" class="wpsp-form-control" id="job_diagram_file" placeholder="" name="job_diagram_file">
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-6 wpsp-col-md-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Tolerance<span></span></label>
								<input type="text" class="wpsp-form-control" id="tolerance" placeholder="" name="tolerance" />
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-6 wpsp-col-md-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Material<span></span></label>
								<input type="text" class="wpsp-form-control" id="material" placeholder="" name="material" />
							</div>
						</div>
					</div>
					</div>
					<div class="wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-md-12">
						<div class="wpsp-row">
							<div class="wpsp-col-md-5 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain"> 1st Skill Name<span></span></label>
									<input type="text" class="wpsp-form-control" id="skill_1" placeholder="Skill Name" name="skill_name[1]" />
								</div>
							</div> 
							<div class="wpsp-col-md-2 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">Marks<span></span></label>
									<input type="number" class="wpsp-form-control" id="marks_1" placeholder="" name="marks[1]" />
								</div>
							</div>
						</div>
						<div class="wpsp-row">
							<div class="wpsp-col-md-5 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">2nd Skill Name<span></span></label>
									<input type="text" class="wpsp-form-control" id="skill_2" placeholder="Skill Name" name="skill_name[2]" />
								</div>
							</div> 
							<div class="wpsp-col-md-2 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">Marks<span></span></label>
									<input type="number" class="wpsp-form-control" id="marks_2" placeholder="" name="marks[2]" />
								</div>
							</div>
						</div>
						<div class="wpsp-row">
							<div class="wpsp-col-md-5 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">3rd Skill Name<span></span></label>
									<input type="text" class="wpsp-form-control" id="skill_3" placeholder="Skill Name" name="skill_name[3]" />
								</div>
							</div> 
							<div class="wpsp-col-md-2 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">Marks<span></span></label>
									<input type="number" class="wpsp-form-control" id="marks_3" placeholder="" name="marks[3]" />
								</div>
							</div>
						</div>
						<div class="wpsp-row">
							<div class="wpsp-col-md-5 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">4th Skill Name<span></span></label>
									<input type="text" class="wpsp-form-control" id="skill_4" placeholder="Skill Name" name="skill_name[4]" />
								</div>
							</div> 
							<div class="wpsp-col-md-2 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">Marks<span></span></label>
									<input type="number" class="wpsp-form-control" id="marks_4" placeholder="" name="marks[4]" />
								</div>
							</div>
						</div>
						<div class="wpsp-row">
							<div class="wpsp-col-md-5 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">5th Skill Name<span></span></label>
									<input type="text" class="wpsp-form-control" id="skill_5" placeholder="Skill Name" name="skill_name[5]" />
								</div>
							</div> 
							<div class="wpsp-col-md-2 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">Marks<span></span></label>
									<input type="number" class="wpsp-form-control" id="marks_5" placeholder="" name="marks[5]" />
								</div>
							</div>
						</div>
						<div class="wpsp-row">
							<div class="wpsp-col-md-5 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">6th Skill Name<span></span></label>
									<input type="text" class="wpsp-form-control" id="skill_6" placeholder="Skill Name" name="skill_name[6]" />
								</div>
							</div> 
							<div class="wpsp-col-md-2 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">Marks<span></span></label>
									<input type="number" class="wpsp-form-control" id="marks_6" placeholder="" name="marks[6]" />
								</div>
							</div>
						</div>
						<div class="wpsp-row">
							<div class="wpsp-col-md-5 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">7th Skill Name<span></span></label>
									<input type="text" class="wpsp-form-control" id="skill_7" placeholder="Skill Name" name="skill_name[7]" />
								</div>
							</div> 
							<div class="wpsp-col-md-2 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">Marks<span></span></label>
									<input type="number" class="wpsp-form-control" id="marks_7" placeholder="" name="marks[7]" />
								</div>
							</div>
						</div>
						<div class="wpsp-row">
							<div class="wpsp-col-md-5 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">8th Skill Name<span></span></label>
									<input type="text" class="wpsp-form-control" id="skill_8" placeholder="Skill Name" name="skill_name[8]" />
								</div>
							</div> 
							<div class="wpsp-col-md-2 wpsp-col-md-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">Marks<span></span></label>
									<input type="number" class="wpsp-form-control" id="marks_8" placeholder="" name="marks[8]" />
								</div>
							</div>
						</div>
					</div>
					<div class="wpsp-row"></div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-6 wpsp-col-md-12">
							<div class="wpsp-form-group pull-right">
								<input type="submit" name="add_job" value="Add Job And Skills" class="wpsp-btn wpsp-btn-success" />
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
	
});
</script>