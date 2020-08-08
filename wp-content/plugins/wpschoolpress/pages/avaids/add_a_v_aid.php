<div class="wpsp-card" id='add_av_aid'>
	<div class="wpsp-card-head">
		<h3 class="wpsp-card-title"></h3>
	</div>
	
	<div class="wpsp-card-head" id="message">
		<?php 
		  displaySuccessMsg( $success_messages );
		  displayErrorMsg( $error_messages );
		?>
	</div>
	
	<div class="wpsp-card-body">
		<div class="wpsp-row">
			<form id="add_a_v_aid" method="post">
				<div class="wpsp-col-md-12 line_box">
					<div class="wpsp-row">
						<div class="wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Link <span></span></label>
								<input type="text" class="wpsp-form-control" id="link" placeholder="Enter Youtube link." name="link" autocomplete="off" value="" />
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Title <span></span></label>
								<input type="text" class="wpsp-form-control" id="title" placeholder="Title." name="title" autocomplete="off" value="" />
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<label class="wpsp-labelMain">Description <span></span></label>
								<textarea rows="4" cols="3" class="wpsp-form-control" id="description" placeholder="Description." name="description"></textarea>
							</div>
						</div>
					</div>
					<div class="wpsp-row">
						<div class="wpsp-col-md-6 wpsp-col-sm-6 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<img alt="" src="" id="preive_url_img" width="120" height="90" />
							</div>
						</div>
					</div>	
					<div class="wpsp-row">
						<div class="wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
							<div class="wpsp-form-group">
								<input type="hidden" id="embed_url" name="embed_url" value="" />
								<input type="hidden" id="preview_url" name="preview_url" value="" />
								<input type="submit" name="add_av_aid" value="Add Aid" class="wpsp-btn wpsp-btn-success" />
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	$('#link').change(function(e) {
		sch.ajaxRequest({
			'page': 'sch-avaids',
			'pageAction': 'get_link_details',
			'selector': '#add_av_aid',
			data:  {'link': $('#link').val()},
			success: function( res ) {
				response = $.parseJSON(res);
				if( true == response.status ) {
					$('#title').val(response.title );
					$('#description').text(response.description );
					$('#embed_url').val(response.embed_url );
					$('#preview_url').val(response.preview_url );
					$('#preive_url_img').attr( 'src', response.preview_url );
					
				} else {
					$('#message').html('<div class="error_msg_div"><span class="error_msg_span">' + response.message + '</span></div>');			
				}
			}
		});
	});
</script>