<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">

.ritz .waffle a { color: inherit; }.ritz .waffle .s1{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:center;font-weight:bold;color:#54667a;font-family:'Arial';font-size:12pt;vertical-align:bottom;white-space:normal;overflow:hidden;word-wrap:break-word;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s0{border-bottom:1px SOLID #000000;background-color:#ffffff;text-align:center;font-weight:bold;color:#54667a;font-family:'Arial';font-size:12pt;vertical-align:bottom;white-space:normal;overflow:hidden;word-wrap:break-word;direction:ltr;padding:2px 3px 2px 3px;}
.appendex {
	font-size: 18px !important;
}
.short-heading {
	font-size: 18px !important;
	font-weight: bolder !important;
}
.main-heading {
	font-size: 36px !important;
	font-weight: bolder !important;
}
.no-border {
	border: none !important;
}
.s2 {
	width: 130px;
	padding: 10px;
}
.text-left {
text-align: left !important;
}

.s3 {
    border: thin SOLID #000;
    padding: 10px 5px;
    text-align: center;
    font-weight: 500;
    color: #54667a;
}
.main-container {
	padding: 20px;
	margin: 0 auto;
    border: 3px dotted #000;
}

.no-left-border {
	border-left: none !important;
}

.no-right-border {
	border-right: none !important;
}
</style>
<div class="ritz grid-container" dir="ltr">
   <table class="waffle main-container" cellspacing="0" cellpadding="0">
      <tbody>
         <tr style='height:20px;'>
         	<td class="s2" rowspan="2"><?php echo $iti_name; ?></td>
            <td class="s0 appendex no-border" colspan="13">APPENDIX "A"</td>
            <td class="s2" rowspan="2"></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s0 short-heading no-border" colspan="13">CRAFTSMEN TRAINING SCHEME</td>
         </tr>
         <tr style='height:20px;'>
         	<td class="s2"></td>
            <td class="s1 main-heading no-border" dir="ltr" colspan="13">PROGRESS CARD</td>
            <td class="s2"></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s1 text-left no-border" dir="ltr" colspan="15">Trainee Name : <?php echo $student->s_fname . ' ' . $student->s_lname; ?></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s1 text-left no-border" dir="ltr" colspan="15">Roll No : <?php echo $student->s_rollno; ?></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s1 text-left no-border" dir="ltr" colspan="7">Batch : <?php echo ( true == isset( $batches[$student->batch_id] ) ? $batches[$student->batch_id]->name : '-' ) ?></td>
            <td class="s1 text-left no-border" dir="ltr" colspan="8">Trade : <?php echo ( true == isset( $trades[$student->trade_id] ) ? $trades[$student->trade_id]->name : '-' ) ?></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s1 text-left no-border" dir="ltr" colspan="7">Trade : <?php echo ( true == isset( $trades[$student->trade_id] ) ? $trades[$student->trade_id]->name : '-' ) ?></td>
            <td class="s1 text-left no-border" colspan="8">Unit: <?php echo ( true == isset( $units[$student->current_unit_id] ) ? $units[$student->current_unit_id]->unit_name : '-' ) ?></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s1 text-left no-border" dir="ltr" colspan="7">Addmission Date : </td>
            <td class="s1 text-left no-border" dir="ltr" colspan="8">Date Of Leaving: </td>
         </tr>
         <tr style="height: 20px">
         	<td class="s3 no-left-border" colspan="1">Week No</td>
         	<td class="s3" colspan="6">Exercises Done During the Week</td>
         	<td class="s3" colspan="2">Grading</td>
         	<td class="s3" colspan="2">Instructor Check</td>
         	<td class="s3" colspan="2">G. I. Initials</td>
         	<td class="s3 no-right-border" colspan="2">Remarks</td>
         </tr>
         <?php for( $intIndex=1; $intIndex<=52; $intIndex++) { ?>
         <tr style="height: 20px">
         	<td class="s3 no-left-border" colspan="1"><?php echo $intIndex; ?></td>
         	<td class="s3" colspan="6">
         		<?php 
         		if( true == isset( $job_progress[$intIndex] ) ) {
         			foreach( $job_progress[$intIndex] AS $job ) {
         				echo $job->title . ' <br> ';
         			}
         		}
         		?>
         	</td>
         	<td class="s3" colspan="2">
         		<?php 
         		if( true == isset( $job_progress[$intIndex] ) ) {
         			foreach( $job_progress[$intIndex] AS $job ) {
         				
         				if( 80 <= $job->total_marks ) {
         					echo 'A <br> ';
         				} else if( 60 <= $job->total_marks ) {
         					echo 'B <br> ';
         				} else if( 45 <= $job->total_marks ) {
         					echo 'C <br> ';
         				} else {
         					echo 'D <br> ';
         				}
         			}
         		}
         		?>
         	</td>
         	<td class="s3" colspan="2"></td>
         	<td class="s3" colspan="2"></td>
         	<td class="s3 no-right-border" colspan="2">
         	<?php 
         		if( true == isset( $job_progress[$intIndex] ) ) {
         			foreach( $job_progress[$intIndex] AS $job ) {
         				echo $job->remark . ' <br> ';
         			}
         		}
         		?>
         	</td>
         </tr>
         <?php } ?>
      </tbody>
   </table>
</div>