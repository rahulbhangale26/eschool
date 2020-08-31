<script src="<?php echo WPSP_PLUGIN_URL . 'js/libraries/ckeditor/ckeditor.js'?>"></script>
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
								<input type="text" class="wpsp-form-control" id="lesson_plan_name" placeholder="Lesson Plan Name" name="lesson_plan_name" value="<?php echo ( true == isset( $lesson_plan['lesson_plan_name'] ) ) ? $lesson_plan['lesson_plan_name'] : '' ?>">
							</div>
						</div>
					</div>	
					<div class="wpsp-row">
						<div class="wpsp-col-lg-3 wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Lesson Plan Format Type<span></span></label>
								<select class="wpsp-form-control" id="lesson_plan_type" name="lesson_plan_type">
									<option value="">Select Lesson Plan Type</option>
									<option <?php echo ( true == isset($lesson_plan['lesson_plan_type'] ) && 'pdf' == $lesson_plan['lesson_plan_type'] ) ? 'selected="selected"' : '' ?> value="pdf">Pdf Files</option>
									<option <?php echo ( true == isset($lesson_plan['lesson_plan_type'] ) && 'image' == $lesson_plan['lesson_plan_type'] ) ? 'selected="selected"' : '' ?> value="image">Image Files</option>
									<option <?php echo ( true == isset($lesson_plan['lesson_plan_type'] ) && 'custom' == $lesson_plan['lesson_plan_type'] ) ? 'selected="selected"' : '' ?> value="custom">Custom Design</option>
								</select>
							</div>
						</div>
					</div>

					<div id="lesson_plan_file_container">
					</div>			

					<div id="lesson_plan_custom_container">
								
					<?php
					   if( true == isset($lesson_plan['lesson_plan_type'] ) && 'custom' == $lesson_plan['lesson_plan_type'] ) {
					       foreach( $lesson_plan AS $key => $val ) {
					           if( false !== strpos( $key, 'lesson_plan_custom_' ) ) {
					               $custom_lesson_plans[$key] = $val;
					           }
					       }
					   
					       $indexCustom = 0;
    					   foreach ( $custom_lesson_plans AS $custom_lesson_plan ) {
    					       $indexCustom++;
    					       ?>
    					       <div class="wpsp-row" >
    						       <div class="wpsp-col-lg-10 wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
    									<div class="wpsp-form-group">
    										<textarea class="ckeditor" name="lesson_plan_custom_<?php echo $indexCustom; ?>" id="lesson_plan_custom_<?php echo $indexCustom; ?>" rows="30" cols="80">
    	        	        					<?php 
    	        	        					    echo stripslashes( $custom_lesson_plan );
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
					
					<div class="wpsp-row" id="add_custom_btn" style="display: none;">
						<div class="wpsp-col-lg-3 wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<button name="template_counts" value="" class="wpsp-btn wpsp-btn-success" id="add_custom_lesson_plan_template" ><span class="dashicons dashicons-plus"></span>Add Template</button> 
							</div>
						</div>
					</div>
					
					<div class="wpsp-row" id="add_file_btn" style="display: none;">
						<div class="wpsp-col-lg-3 wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<button name="file_counts"  value="1" class="wpsp-btn wpsp-btn-success" id="add_file" ><span class="dashicons dashicons-plus"></span>Add File</button> 
							</div>
						</div>
					</div>
					
					<div class="wpsp-row">
						<div class="wpsp-col-lg-3 wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
							<div class="wpsp-form-group">
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

function addPdfFileSelectionBox() {
	html = `
		<div class="wpsp-row" id="lesson_plan_file_div">
			<div class="wpsp-col-lg-3 wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
				<div class="wpsp-form-group">
					<label class="wpsp-labelMain">Lesson Plan File: <span></span></label>
					<input type="file" class="wpsp-form-control" id="lesson_plan_file_` + indexFileSelection + `" placeholder="" name="lesson_plan_file_` + indexFileSelection + `">
				</div>
			</div>
		</div>
	`;
	
	$('#lesson_plan_file_container').append(html);

}

function addImageFileSelectionBox() {
	indexFileSelection++;
	html = `
		<div class="wpsp-row" id="lesson_plan_file_div">
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
					<div class="wpsp-row" >
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
	
	<?php if( true == isset($lesson_plan['lesson_plan_type'] ) && ( 'pdf' == $lesson_plan['lesson_plan_type'] || 'image' == $lesson_plan['lesson_plan_type'] ) ) { ?>
		$('#lesson_plan_type').trigger('change');
	<?php } else if( true == isset($lesson_plan['lesson_plan_type'] ) && 'custom' == $lesson_plan['lesson_plan_type'] ) { ?>
		$('#add_custom_btn').show();
	<?php } ?>

});
</script>