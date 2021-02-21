<div class="wpsp-card" id='question_bank_upload_form'>
	<div class="wpsp-card-head">
		<h3 class="wpsp-card-title"></h3>
	</div>
	
	<div class="wpsp-card-body">
		<div class="wpsp-row">
			<div id="tabs">
  				<ul>
                    <li><a href="#tabs-1">General</a></li>
                    <li><a href="#tabs-2">Questions & Answers</a></li>
  				</ul>
  				<div id="tabs-1">
    				<?php include_once 'add_question_bank.php'; ?>
  				</div>
  				<div id="tabs-2">
  					<?php include_once 'view_add_question_answers.php'; ?>
  				</div>
  			</div>
		</div>
	</div>
</div>
<script>
$(function(){
	$( "#tabs" ).tabs();
});
</script>