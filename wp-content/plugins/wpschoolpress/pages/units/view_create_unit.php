<div class="wpsp-card" id='unit_create_form'>
	<div class="wpsp-card-head">
		<h3 class="wpsp-card-title">New Unit</h3>
	</div>
	
	<div class="wpsp-card-head">
		<?php 
		  displaySuccessMsg( $success_messages );
		  displayErrorMsg( $error_messages );
		?>
	</div>
	
	<div class="wpsp-card-body">
		<div class="wpsp-row">
			<form id="unit_create" method="post" action="admin.php?page=sch-units&page_action=insert_or_update_unit">
				<div class="wpsp-col-md-12 line_box">
					<div class="wpsp-row">
						<div class="wpsp-col-lg-3 wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
							<div class="wpsp-form-group">
									<label class="wpsp-labelMain">Trade</label>
									<select name="unit[trade_id]" id="trade_id" class="wpsp-form-control">
										<option value="">Select Trade</option>
										<?php foreach ( $trades as $trade ) { ?>
											<option value="<?php echo $trade->id; ?>" <?php echo ( $trade->id == $unit['trade_id']) ? 'selected="selected"': ''; ?>><?php echo $trade->name; ?></option>
										<?php } ?>
									</select>
							</div>
						</div>
						<?php if( true == isset( $unit['trade_id'] ) && true == isset( $trades[$unit['trade_id']] ) ) { ?>
							<div class="wpsp-col-lg-3 wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">Select <?php echo $trades[$unit['trade_id']]->trade_pattern; ?></label>
									<select name="unit[year_or_semester_no]" id="year_or_semester_no" class="wpsp-form-control">
										<option value="">Select <?php echo $trades[$unit['trade_id']]->trade_pattern; ?></option>
										<?php for( $i=1; $i<= $trades[$unit['trade_id']]->duration; $i++) { ?>
											<option value="<?php echo $i; ?>" <?php echo ( $i == $unit['year_or_semester_no'] ) ? 'selected="selected"' : ''; ?> ><?php echo ordinal( $i ); ?> <?php echo $trades[$unit['trade_id']]->trade_pattern; ?></option>
										<?php }?>
									</select>
								</div>
							</div>
						<?php } ?>
					</div>
					
					
					<?php if( true == isset( $unit['trade_id'] ) && true == isset( $trades[$unit['trade_id']] ) ) { ?>
						<div class="wpsp-row">
							<div class="wpsp-col-lg-3 wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">Instructor InCharge<span></span></label>
									<select name='unit[instructor_incharge_id]' id='instrunctor_id' class="wpsp-form-control">
										<option value="">Select Instructor</option>
										<?php foreach ( $instructors as $instructor ) { ?>
											<option value="<?php echo $instructor->tid?>" <?php echo ($unit['instrunctor_id'] == $instructor->tid ) ? 'selected="selected"' : ''; ?>><?php echo $instructor->first_name . ' ' . $instructor->last_name; ?> </option>
										<?php }?>
									</select>
								</div>
							</div>
							<div class="wpsp-col-lg-3 wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
								<div class="wpsp-form-group">
									<label class="wpsp-labelMain">Unit Name<span></span></label>
									<input type="text" class="wpsp-form-control" id="unit_name" placeholder="Unit Name" name="unit[name]">
								</div>
							</div>
						</div>
					<?php } ?>
					<?php if( true == isset( $unit['year_or_semester_no'] ) ) { ?>
					
						<?php foreach ( $subjects as $subject ) { ?>
							<div class="wpsp-row">
								<div class="wpsp-col-lg-3 wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
									<div class="wpsp-form-group">
										<label class="wpsp-labelMain"><span></span></label>
										<input class="wpsp-form-control disabled" type="text" disabled="disabled" value="<?php echo $subject->sub_name?>">
									</div>
								</div>
								<div class="wpsp-col-lg-3 wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
									<div class="wpsp-form-group">
										<label class="wpsp-labelMain">Subject Instructor<span></span></label>
										<select name='unit[instructor][<?php echo $subject->id; ?>]' id='subject_instrunctor_id_<?php echo $subject->id; ?>' class="wpsp-form-control">
										<option value="">Select Instructor</option>
										<?php foreach ( $instructors as $instructor ) { ?>
											<option value="<?php echo $instructor->tid?>" <?php echo ($unit['instrunctor_id'] == $instructor->tid ) ? 'selected="selected"' : ''; ?>><?php echo $instructor->first_name . ' ' . $instructor->last_name; ?> </option>
										<?php }?>
									</select>
									</div>
								</div>
							</div>
						<?php } ?>
					<?php } ?>
					
					<?php if( true == isset( $unit['trade_id'] ) && true == isset( $unit['year_or_semester_no'] ) ) { ?>
						<div class="wpsp-row">
							<div class="wpsp-col-lg-3 wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
								<div class="wpsp-form-group">
									<button type="submit" class="wpsp-btn wpsp-btn-success" id="submit_subject">Add and Create</button>
									<a href="admin.php?page=sch-units" class="wpsp-btn wpsp-dark-btn">Back</a>
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
	var objUnit = new Units();
	objUnit.bindEssentials();
});
</script>