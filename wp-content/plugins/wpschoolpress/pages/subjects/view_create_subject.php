<div class="wpsp-card" id='subject_create_form'>
	<div class="wpsp-card-head">
		<h3 class="wpsp-card-title">New Subject Entry</h3>
	</div>
	
	<div class="wpsp-card-head">
		<?php 
		  displaySuccessMsg( $success_messages );
		  displayErrorMsg( $error_messages );
		?>
	</div>
	
	<div class="wpsp-card-body">
		<div class="wpsp-row">
			<form id="subject_create">
				<div class="wpsp-col-md-12 line_box">
					<div class="wpsp-row">
						<div class="wpsp-col-lg-3 wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
							<div class="wpsp-form-group">
									<label class="wpsp-labelMain">Trade</label>
									<select name="subject[trade_id]" id="trade_id" class="wpsp-form-control">
										<option value="">Select Trade</option>
										<?php foreach ( $trades as $trade ) { ?>
											<option value="<?php echo $trade->id; ?>" <?php echo ( $trade->id == $subject['trade_id']) ? 'selected="selected"': ''; ?>><?php echo $trade->name; ?></option>
										<?php } ?>
									</select>
							</div>
						</div>
						<?php if( true == isset( $subject['trade_id'] ) && true == isset( $trades[$subject['trade_id']] ) ) { ?>
							<div class="wpsp-col-lg-3 wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">Select <?php echo $trades[$subject['trade_id']]->trade_pattern; ?></label>
									<select name="subject[year_or_semester_no]" id="year_or_semester_no" class="wpsp-form-control">
										<option value="">Select <?php echo $trades[$subject['trade_id']]->trade_pattern; ?></option>
										<?php for( $i=1; $i<= $trades[$subject['trade_id']]->duration; $i++) { ?>
											<option value="<?php echo $i; ?>" <?php echo ( $i == $subject['year_or_semester_no'] ) ? 'selected="selected"' : ''; ?> ><?php echo ordinal( $i ); ?> <?php echo $trades[$subject['trade_id']]->trade_pattern; ?></option>
										<?php }?>
									</select>
								</div>
							</div>
						<?php } ?>
					</div>
					
					
					<?php if( true == isset( $subject['trade_id'] ) && true == isset( $trades[$subject['trade_id']] ) ) { ?>
						<div class="wpsp-row">
							<div class="wpsp-col-lg-3 wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">Subject Name<span></span></label>
									<input type="text" class="wpsp-form-control" id="subject_name" placeholder="Subject Name" name="subject_name">
								</div>
							</div>
							<div class="wpsp-col-lg-3 wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">Subject Code<span></span></label>
									<input type="text" class="wpsp-form-control" id="subject_code" placeholder="Subject Code" name="subject_code">
								</div>
							</div>
							
						</div>
						<div class="wpsp-row">
							<div class="wpsp-col-lg-3 wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
								<div class="wpsp-form-group">
									<button type="button" class="wpsp-btn wpsp-btn-success" id="submit_subject">Add and Create</button>
									<a href="admin.php?page=sch-subjects-new" class="wpsp-btn wpsp-dark-btn">back</a>
								</div>
							</div>
						</div>
						
					<?php } ?>
					
				</div>
			</form>
		</div>
	</div>
</div>
<script>
$(function() {
	var objSubject = new Subject();
	objSubject.bindviewCreateSubjects();
});
</script>