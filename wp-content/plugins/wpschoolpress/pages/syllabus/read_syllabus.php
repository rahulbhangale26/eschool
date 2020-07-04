
<style>
    .reader{
        min-height: 700px;
        width: 100%;
    }
</style>
<div class="wpsp-card" id="view_syllabus">

	<div style="overflow: hidden; margin:0px; background-color: rgb(82, 86, 89);">
		<embed src= "<?php echo WP_CONTENT_URL . $syllabus->file_url; ?>" class="reader">

<!-- <embed name="93EA105C0BFDAAC83E08BA7E3C08826B" style="position:absolute; left: 0; top: 0;" width="100%" height="100%" src="" type="application/pdf" internalid="93EA105C0BFDAAC83E08BA7E3C08826B">  -->		
	</div>

<!-- <object class="reader-height" style="width: 100%"; height="100%" data=" type="application/pdf">
    	alt : <a href="<?php echo WP_CONTENT_URL . $syllabus->file_url; ?>"><?php echo $syllabus->file_name; ?></a>
	</object> -->   	
</div>