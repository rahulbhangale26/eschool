<?php 
?>
<form name="StudentClass" id="subject_form" method="post" action="">
	<label class="wpsp-labelMain">Trade</label>
	<select name="subject[trade_id]" id="trade_id" class="wpsp-form-control">
		<option value="">Select Trade</option>
		<?php foreach ( $trades as $trade ) { ?>
			<option value="<?php echo $trade->id; ?>" <?php echo ( $trade->id == $subject_filter['trade_id']) ? 'selected="selected"': ''; ?>><?php echo $trade->name; ?></option>
		<?php } ?>
	</select>
	<?php if( true == isset( $subject_filter['trade_id'] ) && true == isset( $trades[$subject_filter['trade_id']] ) ) { ?>
		<label class="wpsp-labelMain">Select <?php echo $trades[$subject_filter['trade_id']]->trade_pattern; ?></label>
		<select name="year_or_semester_no" id="year_or_semester_no" class="wpsp-form-control" >
			<option value="">Select <?php echo $trades[$subject_filter['trade_id']]->trade_pattern; ?></option>
			<?php for( $i=1; $i<= $trades[$subject_filter['trade_id']]->duration; $i++) { ?>
				<option value="<?php echo $i; ?>" <?php echo (  $i == $subject_filter['year_or_semester_no'] ) ? 'selected="selected"' : ''; ?> ><?php echo ordinal( $i ); ?> <?php echo $trades[$subject_filter['trade_id']]->trade_pattern; ?></option>
			<?php }?>
		</select>
	<?php } ?>
</form>
