<style type="text/css">
    .ritz .waffle a { color: inherit; }.ritz .waffle .s4{background-color:#ffffff;text-align:left;font-weight:bold;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s5{border-bottom:1px SOLID #000000;background-color:#ffffff;text-align:left;font-weight:bold;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s8{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:left;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s2{background-color:#ffffff;text-align:center;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:middle;white-space:normal;overflow:hidden;word-wrap:break-word;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s0{background-color:#ffffff;text-align:center;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:middle;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s6{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:center;font-weight:bold;color:#000000;font-family:'Arial';font-size:18pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s7{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:center;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:middle;white-space:normal;overflow:hidden;word-wrap:break-word;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s3{background-color:#ffffff;}.ritz .waffle .s1{background-color:#ffffff;text-align:center;font-weight:bold;color:#000000;font-family:'Arial';font-size:18pt;vertical-align:middle;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}
    .border-left {
        border-left: 1px solid #000;
    }
    .max-width-60 {
        max-width: 60px;
    } 
     .max-width-40 {
        max-width: 40px;
    } 
    .div-center {
        margin: 0 auto;
    }
    .text-left {
        text-align: left !important;
    }
    .text-center {
        text-align: center !important;
    }
    .card-border {
        padding: 20px;
        border: dashed 2px #000;
    }
    .sub-table {
        width: 100%;
    }
    
    .sub-table-td {
        padding: 0px !important;
        margin: 0px !important;
    }
    
    .st0 {
        margin: -1px;
    }
    .bottom-border {
        border-bottom: 1px solid #000;
    }
</style>
<div class="ritz grid-container " dir="ltr">
   <table class="waffle div-center card-border" cellspacing="0" cellpadding="0">
      <tbody>
         <tr style='height:20px;'>
            <td class="text-left s0" dir="ltr" colspan="4" rowspan="2">APPENDIX V/VI ( PARA 32)<br><span style="font-weight:bold;">Craftsmen Training Scheme</span></td>
            <td class="s1" dir="ltr" colspan="6" rowspan="2">PROGRESS CARD</td>
            <td class="s2" dir="ltr" colspan="3" rowspan="2">( For Eng. and Non Eng. Trades Only)</td>
         </tr>
         <tr style='height:20px;'>
         </tr>
         <tr style='height:20px;'>
            <td class="s3" colspan="13"></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s4" dir="ltr" colspan="6">Name of Trainee: </td>
            <td class="s4" dir="ltr" colspan="7">ITI: </td>
         </tr>
         <tr style='height:20px;'>
            <td class="s4" dir="ltr" colspan="6">Roll No:</td>
            <td class="s4" dir="ltr" colspan="7">Trade: </td>
         </tr>
         <tr style='height:20px;'>
            <td class="s4" dir="ltr" colspan="6">Data of Admission:</td>
            <td class="s4" dir="ltr" colspan="7">Data of Leaving:</td>
         </tr>
         <tr style='height:20px;'>
            <td class="s5" dir="ltr" colspan="13">Edu. Qualification:</td>
         </tr>
         <tr style='height:20px;'>
            <td class="s6 border-left" dir="ltr" colspan="13">Monthly Test</td>
         </tr>
         <tr style='height:20px;'>
            <td class="s7  border-left" dir="ltr" colspan="3">No. of Mothly Tests</td>
            <?php foreach( $subjects AS $subject ) { ?>
	            <td class="s7 max-width-60" dir="ltr"><?php echo $subject->sub_name; ?></td>
            <?php } ?>
            <td class="s7 max-width-60" dir="ltr">T. I. Initials</td>
            <td class="s7 max-width-60" dir="ltr">Drg. I. Initials</td>
            <td class="s7 max-width-60" dir="ltr">Math I. Initials</td>
            <td class="s7 max-width-60" dir="ltr">G.I. Initials</td>
            <td class="s7 max-width-60" dir="ltr">Remark</td>
         </tr>
         <?php 
            $i = 0;
            foreach( $exams AS $exam ) { 
            $i++;   
         ?>
         	<tr style='height:20px;'>
         	   <td class="s8 border-left" dir="ltr" colspan="3">Monthly Test <?php echo numberToRoman( $i ); ?> (<?php echo $exam->name; ?>) </td>
         	   <?php foreach( $subjects AS $subject ) { ?>
	         	   <td class="s8 text-center"><?php  echo ( isset( $exam_results[$exam->id] ) && isset( $exam_results[$exam->id][$subject->id] ) ? $exam_results[$exam->id][$subject->id] : '' ); ?></td>
	       		<?php } ?>
         	   <td class="s8"></td>
         	   <td class="s8"></td>
         	   <td class="s8"></td>
         	   <td class="s8"></td>
         	   <td class="s8"></td>
         	</tr>
         <?php } ?>
         <tr>
         	<td class="s7 border-left sub-table-td" colspan="13">
         		<table class="waffle sub-table" cellspacing="0" cellpadding="0">
         			<tr style="height: 20px;">
         				<td class="st0 bottom-border" colspan="8">Quarterly Assessment:</td>
            			<td class="st0 border-left bottom-border" colspan="8" >Sessional Marks: </td>
         			</tr>
         			<tr>
         				<td class="s7 max-width-40" colspan="1" rowspan="2"> No. of Qrs.</td>
         				<td class="s7" colspan="3"> Attendance during the quarter</td>
         				<td class="s7 max-width-40" colspan="1" rowspan="2">Loss of Trg. If Any</td>
         				<td class="s7 max-width-40" colspan="1" rowspan="2">Extra hrs suggested to make up</td>
         				<td class="s7 max-width-40" colspan="1" rowspan="2">Progress of Loss of Trg.</td>
         				<td class="s7 max-width-40" colspan="1" rowspan="2"> No. of Qrs.</td>
         				 <?php foreach( $subjects AS $subject ) { ?>
         				 	<td class="s7 max-width-40" colspan="1" rowspan="2"><?php echo $subject->sub_name; ?></td>
         				 <?php }?>
         				<td class="s7 max-width-40" colspan="1" rowspan="2"> Total 150</td>
         				<td class="s7 max-width-40" colspan="1" rowspan="2"> Conduct</td>
         				<td class="s7 max-width-40" colspan="1" rowspan="2"> Principal Initials</td>
         			</tr>
         			<tr>
         				<td class="s7 max-width-40">Actucal</td>
         				<td class="s7 max-width-40">Possible</td>
         				<td class="s7 max-width-40">%</td>
         			</tr>
         			<tr>
         				<td class="s7"><?php echo numberToRoman( 1 ); ?></td>
         				<td class="s7"><?php echo ( isset( $attendance[1] ) ? $attendance[1]->present_counts : '' ) ?></td>
         				<td class="s7"><?php echo ( isset( $attendance[1] ) ? $attendance[1]->possible_days : '' ) ?></td>
         				<td class="s7"><?php echo ( isset( $attendance[1] ) ? round( $attendance[1]->present_counts /$attendance[1]->possible_days*100, 2 ): '' ) ?></td>
         				<td class="s7"></td>
         				<td class="s7"></td>
         				<td class="s7"></td>
         				<td class="s7"><?php echo numberToRoman( 1 ); ?></td>
         				
         				<?php 
             				$intQuarterlyTotal = 0;
         				   foreach( $subjects AS $subject ) { ?>
         				 	<td class="s7"><?php echo ( isset($qaurterly_results[1] ) && isset( $qaurterly_results[1][$subject->id] ) ? ceil( $qaurterly_results[1][$subject->id] ) : '' ); ?></td>
         				 <?php 
         				    $intQuarterlyTotal += ( isset($qaurterly_results[1] ) && isset( $qaurterly_results[1][$subject->id] ) ? ceil( $qaurterly_results[1][$subject->id] ) : 0 )
         				 ?>
         				 <?php }?>
         				 <td class="s7"><?php echo $intQuarterlyTotal; ?></td>
         				<td class="s7"></td>
         				<td class="s7"></td>
         			</tr>
         			<tr>
         				<td class="s7"><?php echo numberToRoman( 2 ); ?></td>
         				<td class="s7"><?php echo ( isset( $attendance[2] ) ? $attendance[2]->present_counts : '' ) ?></td>
         				<td class="s7"><?php echo ( isset( $attendance[2] ) ? $attendance[2]->possible_days : '' ) ?></td>
         				<td class="s7"><?php echo ( isset( $attendance[2] ) ? round( $attendance[2]->present_counts /$attendance[2]->possible_days*100, 2 ): '' ) ?></td>
         				<td class="s7"></td>
         				<td class="s7"></td>
         				<td class="s7"></td>
         				<td class="s7"><?php echo numberToRoman( 2 ); ?></td>
         				<?php 
             				$intQuarterlyTotal = 0;
         				   foreach( $subjects AS $subject ) { ?>
         				 	<td class="s7"><?php echo ( isset($qaurterly_results[2] ) && isset( $qaurterly_results[2][$subject->id] ) ? ceil( $qaurterly_results[2][$subject->id] ) : '' ); ?></td>
         				 <?php }
             				 $intQuarterlyTotal += ( isset($qaurterly_results[2] ) && isset( $qaurterly_results[2][$subject->id] ) ? ceil( $qaurterly_results[2][$subject->id] ) : 0 )
         				 ?>
         				 <td class="s7"><?php echo $intQuarterlyTotal; ?></td>
         				<td class="s7"></td>
         				<td class="s7"></td>
         			</tr>
         			<tr>
         				<td class="s7"><?php echo numberToRoman( 3 ); ?></td>
         				<td class="s7"><?php echo ( isset( $attendance[3] ) ? $attendance[3]->present_counts : '' ) ?></td>
         				<td class="s7"><?php echo ( isset( $attendance[3] ) ? $attendance[3]->possible_days : '' ) ?></td>
         				<td class="s7"><?php echo ( isset( $attendance[3] ) ? round( $attendance[3]->present_counts /$attendance[3]->possible_days*100, 2 ) : '' ) ?></td>
         				<td class="s7"></td>
         				<td class="s7"></td>
         				<td class="s7"></td>
         				<td class="s7"><?php echo numberToRoman( 3 ); ?></td>
         				<?php 
         				   $intQuarterlyTotal = 0;
         				   foreach( $subjects AS $subject ) { ?>
         				 	<td class="s7"><?php echo ( isset($qaurterly_results[3] ) && isset( $qaurterly_results[3][$subject->id] ) ? ceil( $qaurterly_results[3][$subject->id] ) : '' ); ?></td>
         				 <?php }
             				 $intQuarterlyTotal += ( isset($qaurterly_results[3] ) && isset( $qaurterly_results[3][$subject->id] ) ? ceil( $qaurterly_results[3][$subject->id] ) : 0 )
         				 ?>
         				 <td class="s7"><?php echo $intQuarterlyTotal; ?></td>
         				<td class="s7"></td>
         				<td class="s7"></td>
         			</tr>
         			<tr>
         				<td class="s7"><?php echo numberToRoman( 4 ); ?></td>
         				<td class="s7"><?php echo ( isset( $attendance[4] ) ? $attendance[4]->present_counts : '' ) ?></td>
         				<td class="s7"><?php echo ( isset( $attendance[1] ) ? $attendance[4]->possible_days : '' ) ?></td>
         				<td class="s7"><?php echo ( isset( $attendance[1] ) ? round( $attendance[4]->present_counts /$attendance[4]->possible_days*100, 2 ) : '' ) ?></td>
         				<td class="s7"></td>
         				<td class="s7"></td>
         				<td class="s7"></td>
         				<td class="s7"><?php echo numberToRoman( 4 ); ?></td>
         				<?php 
         				   $intQuarterlyTotal = 0;
         				   foreach( $subjects AS $subject ) { ?>
         				 	<td class="s7"><?php echo ( isset($qaurterly_results[4] ) && isset( $qaurterly_results[4][$subject->id] ) ? ceil( $qaurterly_results[4][$subject->id] ) : '' ); ?></td>
         				 <?php }
             				 $intQuarterlyTotal += ( isset($qaurterly_results[4] ) && isset( $qaurterly_results[4][$subject->id] ) ? ceil( $qaurterly_results[4][$subject->id] ) : '' );
         				 ?>
         				 <td class="s7"><?php echo $intQuarterlyTotal; ?></td>
         				<td class="s7"></td>
         				<td class="s7"></td>
         			</tr>
         		</table>
         	</td>
         </tr>
      </tbody>
   </table>
</div>