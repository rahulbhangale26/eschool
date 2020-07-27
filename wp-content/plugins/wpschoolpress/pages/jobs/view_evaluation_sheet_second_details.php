<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
.border-top {
    border-top: 1px solid #000;
}

.border-left {
    border-left: 1px solid #000;
}
.border-right {
    border-right: 1px solid #000;
}
.ritz .waffle a { color: inherit; }.ritz .waffle .s0{border-bottom:1px SOLID #000000;background-color:#ffffff;}.ritz .waffle .s7{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:center;font-weight:bold;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s5{background-color:#ffffff;text-align:center;font-weight:bold;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s6{border-right:1px SOLID #000000;background-color:#ffffff;text-align:center;font-weight:bold;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s9{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:center;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s14{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:center;font-weight:bold;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:middle;white-space:normal;overflow:hidden;word-wrap:break-word;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s11{background-color:#ffffff;text-align:left;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:normal;overflow:hidden;word-wrap:break-word;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s8{border-right:1px SOLID #000000;background-color:#ffffff;text-align:center;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s13{border-right:1px SOLID #000000;background-color:#ffffff;text-align:center;font-weight:bold;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:middle;white-space:normal;overflow:hidden;word-wrap:break-word;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s15{background-color:#ffffff;text-align:center;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s1{background-color:#ffffff;text-align:left;font-weight:bold;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s3{border-bottom:1px SOLID #000000;background-color:#ffffff;text-align:left;font-weight:bold;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s10{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:left;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s4{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:left;font-weight:bold;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s12{background-color:#ffffff;text-align:center;font-weight:bold;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:middle;white-space:normal;overflow:hidden;word-wrap:break-word;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s2{border-right:1px SOLID #000000;background-color:#ffffff;text-align:left;font-weight:bold;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s16{border-bottom:1px SOLID #000000;background-color:#ffffff;text-align:center;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}</style>
<div class="ritz grid-container" style="margin: 0 auto;" dir="ltr">
   <table class="waffle" cellspacing="0" cellpadding="0" width="700" height="400" style="margin: 0 auto;">
      <tbody>
         <tr style='height:20px;' >
            <td class="s3 border-top border-left" dir="ltr" colspan="3">TRADE : <?php echo $trade->name; ?></td>
            <td class="s3 border-top border-left" dir="ltr" colspan="8">INSTITUE NAME : <?php echo $iti_name; ?></td>
            <td class="s4 border-top border-left" dir="ltr" colspan="4">INSTRUCTOR NAME : <?php echo true == isset( $instructors[$job->instructor_id] ) ? $instructors[$job->instructor_id]->first_name . ' ' . $instructors[$job->instructor_id]->last_name : '-'; ?></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s3 border-left" dir="ltr" colspan="5">BATCH : <?php echo $batch->name; ?></td>
            <td class="s4 border-left" dir="ltr" colspan="10">Unit : <?php echo $unit->unit_name; ?></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s7 border-left" dir="ltr" colspan="15">JOB EVALUATION 2</td>
         </tr>
         <tr style='height:20px;'>
            <td class="s4 border-left" dir="ltr">JOB NO :</td>
            <td class="s9" dir="ltr" colspan="4"><?php echo $job->number; ?></td>
            <td class="s4 softmerge" dir="ltr" colspan="10">
               <div class="softmerge-inner" >TITLE : <?php echo $job->title;?></div>
            </td>
         </tr>
         <tr style='height:20px;'>
            <td class="s14 border-left" dir="ltr">ROLL NO</td>
            <td class="s14" dir="ltr">TRAINEE NAME</td>
            <?php foreach ( $job_ops_skills AS $skill ) { 
                if( "" == $skill->name ) { continue; }
            ?>
            	<td class="s14" dir="ltr"><?php echo "" != $skill->name ? $skill->name : '-'; ?></td>
            <?php } ?>
            <td class="s14" dir="ltr">TOTAL [A] OUT OF 80</td>
            <td class="s14" dir="ltr">GRADE MARKS [B] OUT OF 20</td>
            <td class="s14" dir="ltr">DEDUCTION FOR EXTRA TIME [C]</td>
            <td class="s14" dir="ltr">TOTAL [A+B-C] OUT OF 100</td>
            <td class="s14" dir="ltr">REMARK IF ANY</td>
         </tr>
         <tr style='height:20px;'>
            <td class="s9 border-left"></td>
            <td class="s14" dir="ltr">MAX MARKS</td>
            <?php foreach ( $job_ops_skills AS $skill ) {
                if( "" == $skill->name ) { continue; }
            ?>
            	<td class="s14" dir="ltr"><?php echo "" != $skill->marks ? $skill->marks: '-'; ?></td>
            <?php } ?>
            <td class="s14" dir="ltr">80</td>
            <td class="s14" dir="ltr">20</td>
            <td class="s9"></td>
            <td class="s14" dir="ltr">100</td>
            <td class="s9"></td>
         </tr>
         <?php foreach( $students AS $student ) { ?>
          <tr style='height:20px;'>
            <td class="s9 border-left" dir="ltr"><?php echo $student->s_rollno; ?></td>
            <td class="s9" dir="ltr"><?php echo $student->s_fname . ' ' . $student->s_lname; ?></td>
            <?php
                $intTotalMarks = 0;
                foreach ( $job_ops_skills AS $skill ) {
                   if( "" == $skill->name ) { continue; }
                   $skill_marks = $student->skill_marks;
                   $intTotalMarks += ( true == isset( $skill_marks[$skill->id] ) ? $skill_marks[$skill->id]->obtained_marks : '0' );    
            ?>
            	<td class="s9" dir="ltr"><?php echo ( true == isset( $skill_marks[$skill->id] ) ? $skill_marks[$skill->id]->obtained_marks : '0' ); ?>
            <?php } ?>
            <td class="s9"><?php  echo $intTotalMarks; ?></td>
            <td class="s9"><?php echo ( "" != $student->grade_marks->obtained_marks ? $student->grade_marks->obtained_marks : '0' ); ?></td>
            <td class="s9"><?php echo ( "" != $student->deduction_marks->obtained_marks ? $student->deduction_marks->obtained_marks : '0' ); ?></td>
            <td class="s9" dir="ltr"><?php echo $intTotalMarks +  ( "" != $student->grade_marks->obtained_marks ? $student->grade_marks->obtained_marks : 0 ) - ( "" != $student->deduction_marks->obtained_marks ? $student->deduction_marks->obtained_marks : 0 ) ?></td>
            <td class="s9"><?php echo ( true == is_object( $student->remark ) ? $student->remark->remark : '' ); ?></td>
         </tr>
         <?php } ?>
         <tr style='height:60px;'>
            <td class="s16 border-left" dir="ltr" colspan="10" rowspan="2">INSTRUCTOR SIGN</td>
            <td class="s9" dir="ltr" colspan="5" rowspan="2">G.I.SIGN</td>
         </tr>
      </tbody>
   </table>
</div>