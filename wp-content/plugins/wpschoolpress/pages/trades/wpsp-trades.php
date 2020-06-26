<div class="wpsp-card">
	<div class="wpsp-card-head">
		<h3 class="wpsp-card-title">Trade List</h3>
	</div>
	
	<div class="wpsp-card-body">
		<table class="wpsp-table" id="class_table" cellspacing="0" width="100%" style="width:100%">
			<thead>
				<tr>
					<th class="nosort">Sr. No.</th>
					<th>Trade Name</th>
					<th>Duration</th>
					<th>Activate</th>
				</tr>
			</thead>
			
			<tbody>
				<?php foreach ( $trades as $trade ) { ?>
					<tr>
						<td><?php echo $trade->id; ?></td>
						<td><?php echo $trade->name; ?></td>
						<td><?php echo $trade->duration; ?> <?php echo $trade->trade_pattern; ?></td>
						<td><?php echo ( false== is_null( $trade->published_on  ) ? '<span style="color: green"><strong>Active</strong></span>' : '<span style="color:red"><strong>Deactive</strong></span>' ); ?></td>
					</tr>
				<?php } ?>
			</tbody>
		</table>
	</div>
</div>
