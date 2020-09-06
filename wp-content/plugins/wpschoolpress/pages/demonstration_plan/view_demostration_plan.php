<div class="wpsp-card" id="view_demostration_plan">
			
	<?php if( 'pdf' != $dp->format_type ) { ?>
		<div style="padding: 20px;"><input type="button" name="print" value="Print" id="print" class="wpsp-btn wpsp-btn-success" onclick="printDiv();" /></div>
	<?php }?>
	<div id="print_view">
	<style>
	   @media print {
        footer {page-break-after: always;}
        }
	</style>
	<div class="wpsp-card-head">
		<div class="lesson-plan-inner wpsp-left wpsp-class-filter" id="lesson-plan-filter">
		</div>
	</div>
	
	<div class="wpsp-card-body">
		<div class="lesson-plan-container">
			<?php 
			if( 'pdf' == $dp->format_type ) {
			    foreach( $dp_files AS $file ) {
			        ?>
			        	<div>
    						<object data="<?php echo WP_CONTENT_URL . $file->file_path . $file->file_name; ?>" type="application/pdf" style="width: 100%; height: 100%; min-height: 600px;" >
        						alt : <a href="<?php echo WP_CONTENT_URL . $file->file_path . $file->file_name; ?>"><?php echo $file->file_name; ?></a>
    						</object>
						</div>
			        <?php 
			    }
			}
			?>
			
			<?php 
			if( 'image' == $dp->format_type ) {
			    foreach( $dp_files AS $file ) {
			        ?>
			        	<div>
    						<img src="<?php echo WP_CONTENT_URL . $file->file_path . $file->file_name; ?>" style="padding: 20px; margin: 10px; width: 100%; height: 100%; min-height: 600px;" />
						</div>
						<footer></footer>
			        <?php 
			    }
			}
			?>
			
			<?php 
			if( 'custom' == $dp->format_type ) {
			    foreach( $dp_files AS $file ) {
			        ?>
			        	<div style="padding: 10px; margin: 10px;">
    						<?php echo stripslashes( file_get_contents( WP_CONTENT_DIR . $file->file_path . $file->file_name ) ); ?>
						</div>
						<footer></footer>
			        <?php 
			    }
			}
			?>
			
		</div>
	</div>
	</div>
</div>
<script type="text/javascript">
function printDiv() {
	var divToPrint = $('#print_view').html();
	var htmlToPrint = ''
	htmlToPrint += divToPrint;
	newWin = window.open("");
	newWin.document.write('<html><head></head><body>' + htmlToPrint + '</body></html>');
	setTimeout(function(){
    	newWin.print();
    }, 1000 );
} 
</script>
