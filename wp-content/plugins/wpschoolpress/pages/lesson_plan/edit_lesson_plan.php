<script src="<?php echo WPSP_PLUGIN_URL . 'js/libraries/ckeditor/ckeditor.js'?>"></script>
<style>
    .row-separators {
        padding: 10px;
        margin: 10px;
        border: 1px solid #00bdda;
    }
</style>
<div class="wpsp-card" id='lesson_plan_upload_form'>
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
			<form id="lesson_plan_upload" method="post" enctype="multipart/form-data">
				<div class="wpsp-col-md-12 line_box">
					<div class="wpsp-row">
						<div class="wpsp-col-lg-3 wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Lesson Plan Name<span></span></label>
								<input type="text" class="wpsp-form-control" id="lesson_plan_name" placeholder="Lesson Plan Name" name="lesson_plan_name" value="<?php echo $lesson_plan->name; ?>">
							</div>
						</div>
					</div>	
					<div class="wpsp-row">
						<div class="wpsp-col-lg-3 wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Lesson Plan Format Type<span></span></label>
								<input type="hidden" name="lesson_plan_type" value="<?php echo $lesson_plan->format_type?>" />
								<select class="wpsp-form-control" id="lesson_plan_type" name="lesson_plan_type_select" disabled="disabled">
									<option value="">Select Lesson Plan Type</option>
									<option <?php echo ( 'pdf' == $lesson_plan->format_type ) ? 'selected="selected"' : '' ?> value="pdf">Pdf Files</option>
									<option <?php echo ( 'image' == $lesson_plan->format_type ) ? 'selected="selected"' : '' ?> value="image">Image Files</option>
									<option <?php echo ( 'custom' == $lesson_plan->format_type ) ? 'selected="selected"' : '' ?> value="custom">Custom Design</option>
								</select>
							</div>
						</div>
					</div>

					<div id="lesson_plan_file_container">
						<?php 
						if( 'pdf' == $lesson_plan->format_type ) {
						    foreach( $lesson_plan_files AS $file ) {
						        ?>
						        <div class="wpsp-row row-separators" >
    						       <div class="wpsp-col-lg-3 wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
    									<div class="wpsp-form-group">
    										<?php echo $file->file_name; ?>
    									</div>
    								</div>
    								<div class="wpsp-col-lg-1 wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
										<span class="dashicons dashicons-no" id="remove-pdf-<?php echo $file->id ?>" data-FileId="<?php echo $file->id ?>" style="color: red; cursor: pointer;"></span>
									</div>
									<script>
    					       			$(function(){
    					       				$('#remove-pdf-<?php echo $file->id; ?>' ).click( function( e ) {
    					       					removeFile( $(this).attr('data-FileId') ); 
                        						$(this).parent().parent().remove();
                        						addPdfFileSelectionBox();
                        					});
    					       			});
    					       		</script>
    							</div>
						        <?php 
						    }

						} else if( 'image' == $lesson_plan->format_type ) {
						    foreach( $lesson_plan_files AS $file ) {
						        ?>
						        <div class="wpsp-row row-separators" >
    						       <div class="wpsp-col-lg-3 wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
    									<div class="wpsp-form-group">
    										<img id="lesson_plan_image_<?php echo $file->id ?>" src="<?php echo WP_CONTENT_URL . $file->file_path . $file->file_name; ?>" style="width: 200px; height: 200px;"/>
    									</div>
    								</div>
    								<div class="wpsp-col-lg-1 wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
										<span class="dashicons dashicons-no" id="remove-image-<?php echo $file->id ?>" data-FileId="<?php echo $file->id ?>" style="color: red; cursor: pointer;"></span>
									</div>
									<script>
    					       			$(function(){
    					       				$('#remove-image-<?php echo $file->id; ?>' ).click( function( e ) {
                        						removeFile( $(this).attr('data-FileId') );
                        						$(this).parent().parent().remove();
                        					});
    					       			});
    					       		</script>
    							</div>
						        <?php 
						    }
						}
						?>
					
					</div>			

					<div id="lesson_plan_custom_container">
								
					<?php
					if( 'custom' == $lesson_plan->format_type ) {
					    $indexCustom = 0;
					    foreach ( $lesson_plan_files AS $file  ) {
					        $indexCustom++;
					        ?>
    					       <div class="wpsp-row row-separators" >
    						       <div class="wpsp-col-lg-10 wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
    									<div class="wpsp-form-group">
    										<textarea class="ckeditor" name="lesson_plan_custom_<?php echo $indexCustom; ?>" id="lesson_plan_custom_<?php echo $indexCustom; ?>" rows="30" cols="80">
    	        	        					<?php 
    	        	        					echo stripslashes( file_get_contents( WP_CONTENT_DIR. $file->file_path . $file->file_name ) );
        	                	                ?>
    	            						</textarea>
    									</div>
    								</div>
    								
    								<div class="wpsp-col-lg-1 wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
										<span class="dashicons dashicons-no remove-template" id="remove-custom-<?php echo $indexCustom ?>" style="color: red; cursor: pointer;"></span>
									</div>
    					       </div>
    					       <script>
    					       		$(function(){
    					       			CKEDITOR.replace( 'lesson_plan_custom_<?php echo $indexCustom; ?>' );
                        				$('#remove-custom-<?php echo $indexCustom; ?>' ).click( function( e ) {
                        					CKEDITOR.instances[$(this).parent().prev().find('.ckeditor').attr('name')].destroy();
                        					$(this).parent().parent().remove();
                        				});
    					       		});
    					       </script>
    					       <?php
					    }
					}
					?>
					</div>
					
					<div class="wpsp-row" id="add_custom_btn" <?php echo ( 'custom' == $lesson_plan->format_type ) ? '' : 'style="display: none;"'; ?>>
						<div class="wpsp-col-lg-3 wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<button name="template_counts" value="" class="wpsp-btn wpsp-btn-success" id="add_custom_lesson_plan_template" ><span class="dashicons dashicons-plus"></span>Add Template</button> 
							</div>
						</div>
					</div>
					
					<div class="wpsp-row" id="add_file_btn" <?php echo ( 'image' == $lesson_plan->format_type ) ? '' : 'style="display: none;"'; ?>>
						<div class="wpsp-col-lg-3 wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<button name="file_counts"  value="1" class="wpsp-btn wpsp-btn-success" id="add_file" ><span class="dashicons dashicons-plus"></span>Add File</button> 
							</div>
						</div>
					</div>
					
					<div class="wpsp-row">
						<div class="wpsp-col-lg-3 wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<input type="hidden" name="lesson_plan_id" id="lesson_plan_id" value="<?php echo $lesson_plan->id; ?>">
								<input type="submit" name="upload_lesson_plan" value="Save Lesson Plan" class="wpsp-btn wpsp-btn-success" />
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
var indexCustom 		= <?php echo isset( $indexCustom ) ? $indexCustom : 0 ?>;
var indexFileSelection	= 0;

function removeFile( fileId ) {
	sch.ajaxRequest({
		'page': 'sch-lesson_plan',
		'pageAction': 'remove_lesson_plan_file',
		'selector': '#lesson_plan_upload_form',
		data:  { 'file_id': fileId, 'lesson_plan_id': $('#lesson_plan_id').val() },
		success: function( res ) {
	
		}
	});
}

function addPdfFileSelectionBox() {
	html = `
		<div class="wpsp-row row-separators" id="lesson_plan_file_div">
			<div class="wpsp-col-lg-3 wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
				<div class="wpsp-form-group">
					<label class="wpsp-labelMain">Lesson Plan File: <span></span></label>
					<input type="file" class="wpsp-form-control" id="lesson_plan_file_1" placeholder="" name="lesson_plan_file_1">
				</div>
			</div>
		</div>
	`;
	
	$('#lesson_plan_file_container').append(html);

}

function addImageFileSelectionBox() {
	indexFileSelection++;
	html = `
		<div class="wpsp-row row-separators" id="lesson_plan_file_div">
			<div class="wpsp-col-lg-3 wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
				<div class="wpsp-form-group">
					<label class="wpsp-labelMain">Lesson Plan File: <span></span></label>
					<input type="file" class="wpsp-form-control" id="lesson_plan_file_` + indexFileSelection + `" placeholder="" name="lesson_plan_file_` + indexFileSelection + `">
				</div>
			</div>
			<div class="wpsp-col-lg-1 wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
				<span class="dashicons dashicons-no remove-file" id="remove-file-` + indexFileSelection + `" style="color: red; cursor: pointer;"></span>
			</div>
		</div>
	`;
		
	$('#lesson_plan_file_container').append(html);
	$('#remove-file-' + indexFileSelection ).click(function(e) {
		$( this ).parent().parent().remove();
	});
}

function loadTemplate() {
	sch.ajaxRequest({
			'page': 'sch-lesson_plan',
			'pageAction': 'view_lesson_plan_template',
			'selector': '#lesson_plan_upload_form',
			data:  {},
			success: function( res ) {
				indexCustom++;
				var html = `
					<div class="wpsp-row row-separators" >
						<div class="wpsp-col-lg-10 wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<textarea class="ckeditor" id="lesson_plan_custom_` + indexCustom + `" name="lesson_plan_custom_` + indexCustom + `">
	                			    ` + res + `
	            				</textarea>
							</div>
						</div>
						<div class="wpsp-col-lg-1 wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
							<span class="dashicons dashicons-no remove-template" id="remove-custom-` + indexCustom + `" style="color: red; cursor: pointer;"></span>
						</div>
					</div>
				`;
				
				$('#lesson_plan_custom_container').append(html);
				CKEDITOR.replace( 'lesson_plan_custom_' + indexCustom );
				
				$('#remove-custom-' + indexCustom ).click( function( e ) {
					CKEDITOR.instances[$(this).parent().prev().find('.ckeditor').attr('name')].destroy();
					$(this).parent().parent().remove();
				});
			}
		});
}

$(function() {

	$('#lesson_plan_type').change( function( e ) {
		
		indexCustom 		= 0;
		indexFileSelection	= 0;
		
		$.each( CKEDITOR.instances, function( key, instance ) {
			instance.destroy();
		});
		
		$('#lesson_plan_file_container').html('');
		$('#lesson_plan_custom_container').html('');
		
		switch( $('#lesson_plan_type').val() ) {
			case 'pdf':
				$('#add_custom_btn').hide();
				$('#add_file_btn').hide();
				addPdfFileSelectionBox();
				break;
				
			case 'image':
				$('#add_file_btn').show();
				$('#add_custom_btn').hide();
				addImageFileSelectionBox();
				break;
				
			case 'custom':
				$('#add_custom_btn').show();
				$('#add_file_btn').hide();
				loadTemplate();
				break;
				
		}
		
	});
	
	
	$('#add_custom_lesson_plan_template').click(function(e) {
		e.preventDefault();
		loadTemplate();
	});
	
	$('#add_file').click(function(e) {
		e.preventDefault();
		addImageFileSelectionBox();
	});
	
	$('.remove-template').click( function(){
		$(this).parent().parent().remove();
	});
	
	$('.remove-file').click( function(){
		$(this).parent().parent().remove();
	});
	
	<?php if( 'pdf' == $lesson_plan->format_type && 0 == count( $lesson_plan_files ) ) { ?>
		addPdfFileSelectionBox();	
	<?php } ?>
	
});
</script>