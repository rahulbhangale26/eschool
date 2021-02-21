<div id="accordion">
</div>

<div class="wpsp-row" id="add_custom_btn">
	<div class="wpsp-col-lg-3 wpsp-col-md-12 wpsp-col-sm-12 wpsp-col-xs-12">
		<div class="wpsp-form-group">
			<button name="" value="" class="wpsp-btn wpsp-btn-success" id="add_question" ><span class="dashicons dashicons-plus"></span>Add Question</button> 
		</div>
	</div>
</div>

<script type="text/javascript">
	$( function(){  	
    	$( '#add_question' ).click(function( e ){
    		console.log('clicked');
    		e.preventDefault();
    		var questionHtml = '<div><h3 class="">First header</h3><div>First content panel</div></div>'
    		$('#accordion').append( questionHtml );
    		$( "#accordion div" ).accordion({});
    	});
	});
</script>