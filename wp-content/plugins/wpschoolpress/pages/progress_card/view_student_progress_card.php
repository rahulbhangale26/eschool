<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">

.ritz .waffle a { color: inherit; }.ritz .waffle .s1{border-bottom:1px SOLID #CCC;border-right:1px SOLID ##CCC;background-color:#ffffff;text-align:center;font-weight:bold;color:#000;font-family:'Arial';font-size:12pt;vertical-align:bottom;white-space:normal;overflow:hidden;word-wrap:break-word;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s0{border-bottom:1px SOLID #CCC;background-color:#ffffff;text-align:center;font-weight:bold;color:#000;font-family:'Arial';font-size:12pt;vertical-align:bottom;white-space:normal;overflow:hidden;word-wrap:break-word;direction:ltr;padding:2px 3px 2px 3px;}
.appendex {
	font-size: 18px !important;
}
.short-heading {
	font-size: 18px !important;
	font-weight: bolder !important;
}
.main-heading {
	color: #000;
	font-size: 36px !important;
	font-weight: bolder !important;
}
.sub-main-heading {
		font-size: 24px !important;
	font-weight: bolder !important;
    color: #000;
}
.no-border {
	border: none !important;
}
.s2 {
	width: 130px;
	padding: 10px;
}
.text-center {
text-align: center !important;
}
.text-left {
text-align: left !important;
}

.s3 {
    border: thin SOLID #CCC;
    padding: 10px 5px;
    font-weight: 500;
    color: #000;
}
.main-container {
	padding: 20px;
	margin: 0 auto;
    border: 3px dotted #CCC;
}

.no-left-border {
	border-left: none !important;
}

.no-right-border {
	border-right: none !important;
}

@media print {
  td {page-break-after: avoid;}
}
</style>
<div class="ritz grid-container" dir="ltr">
   <table class="waffle main-container" cellspacing="0" cellpadding="0">
      <tbody>
      	 <tr style="height: 20px;">
      	 	<td class="main-heading text-center" colspan="15"><?php echo $iti_name; ?></td>
      	 </tr>
         <tr style='height:20px;'>
            <td class="s0 appendex no-border" colspan="15">APPENDIX "A"</td>
         </tr>
         <tr style='height:20px;'>
            <td class="s0 short-heading no-border" colspan="15">CRAFTSMEN TRAINING SCHEME</td>
         </tr>
         <tr style='height:20px;'>
            <td class="s1 sub-main-heading no-border" dir="ltr" colspan="15">PROGRESS CARD</td>
         </tr>
         <tr style='height:20px;'>
            <td class="s1 text-left no-border" dir="ltr" colspan="15">Trainee Name : <?php echo $student->s_fname . ' ' . $student->s_lname; ?></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s1 text-left no-border" dir="ltr" colspan="7">Roll No : <?php echo $student->s_rollno; ?></td>
            <td class="s1 text-left no-border" colspan="8">Unit: <?php echo ( true == isset( $units[$filter['unit_id']] ) ? $units[$filter['unit_id']]->unit_name : '-' ) ?></td>
            
         </tr>
         <tr style='height:20px;'>
            <td class="s1 text-left no-border" dir="ltr" colspan="7">Batch : <?php echo ( true == isset( $batches[$student->batch_id] ) ? $batches[$student->batch_id]->name : '-' ) ?></td>
            <td class="s1 text-left no-border" dir="ltr" colspan="8">Trade : <?php echo ( true == isset( $trades[$student->trade_id] ) ? $trades[$student->trade_id]->name : '-' ) ?></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s1 text-left no-border" dir="ltr" colspan="7">Addmission Date : </td>
            <td class="s1 text-left no-border" dir="ltr" colspan="8">Date Of Leaving: </td>
         </tr>
         <tr style="height: 20px">
         	<td class="s3 no-left-border" style="max-width: 60px;" colspan="1">Sr No</td>
         	<td class="s3" style="min-width: 500px;" colspan="6">Exercises Done During the Week</td>
         	<td class="s3" style="min-width: 110px;" colspan="2">Within Date</td>
         	<td class="s3" style="max-width: 60px;" colspan="2">Grades</td>
         	<td class="s3" style="max-width: 60px;" colspan="2">I. Initial</td>
         	<td class="s3 no-right-border" colspan="2">G. I Initials</td>
         </tr>
         <?php 
         	$index = 1;
         foreach( $jobs AS $job ) { ?>
         <tr style="height: 20px">
         	<td class="s3 no-left-border" colspan="1"><?php echo $index; $index++; ?></td>
         	<td class="s3" colspan="6"><?php echo $job->title; ?></td>
         	<td class="s3" colspan="2"><?php echo date( 'd M', strtotime( $job->start_date )  ) . ' - ' . date( 'd M', strtotime( $job->end_date )  ); ?></td>
         	<td class="s3" colspan="2">
         	<?php      		
         		if( true == isset( $job_progress[$job->id] ) ) {
         			if( 80 <= $job_progress[$job->id]->total_marks ) {
         					echo 'A <br> ';
         			} else if( 70 <= $job_progress[$job->id]->total_marks ) {
         					echo 'B <br> ';
         			} else if( 60 <= $job_progress[$job->id]->total_marks ) {
         					echo 'C <br> ';
         			} else {
         				echo 'D <br> ';
         			}
         		}
         		?>
         	</td>
         	<td class="s3" style="padding: 0;" colspan="2"></td>
         	<td class="s3 no-right-border" colspan="2"></td>
         </tr>
         <tr></tr>
         <?php } ?>
         <tr style="height: 20px; padding:10px;">
         	<td colspan="15" > <span style="float: right;">A = 79% Above<br>8 = 70 To 79%<br>C = 60 To 69%<br>D = 59% Below</span></td>
         <tr>
         
      </tbody>
   </table>
</div>