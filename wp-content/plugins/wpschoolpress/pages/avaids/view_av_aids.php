<div class="wpsp-card" id="view_aids">
		<style>
		.avaid-container {
			margin: 10px 0px 0px;
			width: 100%;
			height: auto;
			background: #eee;
    		padding: 10px;
		}
	
		.avaid-preview {
			width: 100%;
    		cursor: pointer;
		}
	
		.avaid-preview img {
			width: 100%;
		} 
	
		.avaid-title {
		    padding: 10px;
    		cursor: pointer;
    	}
    
    	.avaid-container:hover {
			background: #aaa;
   		}
    
    	.avaid-ops {
    		width: 100%;
    		padding: 10px 0px;
    		text-align: center;
    		background-color: #eee;
    	}
	
	</style>
	<div class="wpsp-card-head">
		<div class="aids-inner wpsp-left wpsp-class-filter" id="aids-filter">
			
		</div>
	</div>
	
	<div class="wpsp-card-body">
		<div class="aids-head">
			<div class="wpsp-col-md-12 line_box">
				<?php foreach( $avaids AS $avaid ) { ?>
					<div class="wpsp-col-md-3 wpsp-col-sm-3 wpsp-col-xs-12">
						<div class="avaid-container" onclick="viewVideo( <?php echo $avaid->id; ?> )" >
							<div class="avaid-preview">
								<img src="<?php echo $avaid->preview_url ?>" />
							</div>
							<div class="avaid-title">
								<?php 
									if ( strlen(  $avaid->title ) <=50) {
										echo  $avaid->title;
									} else {
										echo substr(  $avaid->title, 0, 50 ) . '...';
									}
								?>
							</div>
						</div>
						<div class="avaid-ops">
								<a href="<?php echo site_url( '/wp-admin/admin.php?page=sch-avaids&page_action=edit_aid&avaid_id=' . $avaid->id ); ?>"><span class="dashicons dashicons-edit" style="color: orange;"></span></a>
								<a title="Delete Aid" href="javascript:;"  id="trash-aid" class="wpsp-popclick" data-id="<?php echo $avaid->id; ?>" data-pop="DeleteModal"><span class="dashicons dashicons-trash" style="color: red;"></span></a>
						</div>
					</div>
				<?php }?>
			</div>
		</div>
	</div>
</div>
<?php if( false == $is_ajax_request ) { ?>
<script type="text/javascript">
	function viewVideo( intAidId ) {
		window.location.href = '<?php echo site_url( '/wp-admin/admin.php?page=sch-avaids&page_action=view_aid&avaid_id=' ); ?>' + intAidId;
	};
	
	
	$( function(){
		$(document).on('click', '.wpsp-popclick', function(e) {
			$("#DeleteModal").css("display", "block");
			$("#DeleteModal").attr('data-single-delete', true);
			$("#DeleteModal").attr( 'data-id', $( this ).attr( 'data-id') );
		});
	
		$('.ClassDeleteBt').unbind();
		$('.ClassDeleteBt').click( function(e) {
			$("body").removeClass("wpsp-bodyFixed"), 
			$(".wpsp-popupMain").removeClass("wpsp-popVisible");
			sch.ajaxRequest({
				'page': 'sch-avaids',
				'pageAction': 'delete_aid',
				'selector': '#view_aids',
				data:  { 'avaid_id': $("#DeleteModal").attr( 'data-id' ) },
				success: function( res ) {
					if( 'error' == res ) {
						$('#aids-filter').html('<div class="error_msg_div"><span class="error_msg_div">Problem occurred while deleting Aid.</span></div>');
					} else {
						$('#view_aids').html( res );
						$('#aids-filter').html('<div class="success_msg_div"><span class="success_msg_span">Aid Deleted Successfully.</span></div>');				
					}
				}
			});
		});
	
	});
	
</script>
<?php } ?>