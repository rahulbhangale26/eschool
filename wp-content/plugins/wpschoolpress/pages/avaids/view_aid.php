	<style>
		.aid-head {
			margin: 0 auto;
		}
		
		.player {
			width: 100%;
		    height: 100%;
   			min-height: 500px;
		}
	</style>
<div class="wpsp-card" id="view_aid">
	<div class="wpsp-card-head">
		<div class="aid-inner wpsp-left wpsp-class-filter" id="aid-filter">
			
		</div>
	</div>
	<div class="wpsp-card-body">
		<div class="aid-head">
			<iframe 
				allowfullscreen="allowfullscreen"
				class="player"
				src="<?php echo $avaid->embed_url; ?>">
			</iframe>
		</div>
	</div>
</div>