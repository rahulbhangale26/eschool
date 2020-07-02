<?php 
    $strCheckIcon = '<img src="' . WPSP_PLUGIN_URL . 'img/correct.png" width="20" height="20" />';
    $strWrongIcon = '<img src="' . WPSP_PLUGIN_URL . 'img/wrong.png" width="20" height="20" />';
?>

<?php 

if( 0 == count( $trainee_records ) ) { 
    echo 'There are no trainee records to show for this filter.';
} else {

?>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">

.correct {
    color: green;
}

.wrong {
    color: red
}

.text-center {
text-align: center !important;
}
.border-top {
border-top: 1px solid #000;
}
.font-bold {
font-weight: 800;
}

.v-center {
vertical-align: middle !important;
}

.ritz .waffle a { color: inherit; }.ritz .waffle .s0{border-bottom:1px SOLID #000000;background-color:#ffffff;}.ritz .waffle .s2{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:center;font-weight:bold;color:#54667a;font-family:'Arial';font-size:12pt;vertical-align:middle;white-space:normal;overflow:hidden;word-wrap:break-word;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s5{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:left;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s1{border-right:1px SOLID #000000;background-color:#ffffff;}.ritz .waffle .s4{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:center;font-weight:bold;color:#54667a;font-family:'docs-Rubik',Arial;font-size:8pt;vertical-align:middle;white-space:normal;overflow:hidden;word-wrap:break-word;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s3{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:center;font-weight:bold;color:#54667a;font-family:'Arial';font-size:8pt;vertical-align:middle;white-space:normal;overflow:hidden;word-wrap:break-word;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s6{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:right;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}</style>
<div class="ritz grid-container" dir="ltr">
   <table class="waffle" cellspacing="0" cellpadding="0" style="border-left: 1px solid #000;">
      <tbody>
         <tr class="" style='height:20px;'>
            <td class="s2 border-top" dir="ltr" colspan="13"><?php echo $iti_name; ?></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s2" dir="ltr" colspan="13">Trainee Record Monthly Report </td>
         </tr>
         <tr style='height:20px;'>
            <td class="s2" dir="ltr" colspan="4">Instructor Name: <?php echo $teacher->first_name . ' ' . $teacher->last_name; ?></td>
            <td class="s2" dir="ltr" colspan="3">Trade: <?php echo $trade->name; ?></td>
            <td class="s2" dir="ltr" colspan="4">Batch: <?php echo $batch->name; ?></td>
            <td class="s2" dir="ltr" colspan="2"><?php echo $unit->unit_name; ?></td>
         </tr>
         <tr style='height:20px;'>
            <th class="s3 font-bold" dir="ltr">Student Name</td>
            <th class="s3 font-bold" dir="ltr">Date</td>
            <?php 
            foreach( $trainee_record_types AS $trainee_record_type ) {
                echo '<th class="s4 font-bold" dir="ltr">' . $trainee_record_type-> name . '</td>';
            }
            ?>
            <th class="s3 font-bold" dir="ltr">Checked Ratio</td>
         </tr>
         <?php foreach( $students as $student ) { ?>
         
         <?php 
                $is_first_row = true;
            foreach( $trainee_records[$student->sid] AS $strDate => $trainee_record ) {
                ?>
                <tr style='height:20px;'>
            <?php 
                if( true == $is_first_row ) {
                    echo '<td class="s5 v-center" dir="ltr"  rowspan="' . count( $trainee_records[$student->sid] ) . '">' . $student->s_fname . ' ' . $student->s_lname . '</td>';
                }
                
                $intCheckCount      = 0;
                $intUnCheckedCount  = 0;
                $intUnCheckedCount  += ( ( true == isset( $trainee_record[CTraineeRecordTypes::DAILY_DIARY] ) && true == $trainee_record[CTraineeRecordTypes::DAILY_DIARY]->is_checked ) ? 0 : 1 );
                $intUnCheckedCount  += ( ( true == isset( $trainee_record[CTraineeRecordTypes::DRAFTING_BOOK] ) && true == $trainee_record[CTraineeRecordTypes::DRAFTING_BOOK]->is_checked ) ? 0 : 1 );
                $intUnCheckedCount  += ( ( true == isset( $trainee_record[CTraineeRecordTypes::THEORY_FILE] ) && true == $trainee_record[CTraineeRecordTypes::THEORY_FILE]->is_checked ) ? 0 : 1 );
                $intUnCheckedCount  += ( ( true == isset( $trainee_record[CTraineeRecordTypes::JOB_SHEET_BOOK] ) && true == $trainee_record[CTraineeRecordTypes::JOB_SHEET_BOOK]->is_checked ) ? 0 : 1 );
                $intUnCheckedCount  += ( ( true == isset( $trainee_record[CTraineeRecordTypes::ASSIGNMENT_BOOK] ) && true == $trainee_record[CTraineeRecordTypes::ASSIGNMENT_BOOK]->is_checked ) ? 0 : 1 );
                $intUnCheckedCount  += ( ( true == isset( $trainee_record[CTraineeRecordTypes::PRACTICLE_BOOK] ) && true == $trainee_record[CTraineeRecordTypes::PRACTICLE_BOOK]->is_checked ) ? 0 : 1 );
                $intUnCheckedCount  += ( ( true == isset( $trainee_record[CTraineeRecordTypes::DRAWING_BOOK] ) && true == $trainee_record[CTraineeRecordTypes::DRAWING_BOOK]->is_checked ) ? 0 : 1 );
                $intUnCheckedCount  += ( ( true == isset( $trainee_record[CTraineeRecordTypes::WSC_NOTEBOOK] ) && true == $trainee_record[CTraineeRecordTypes::WSC_NOTEBOOK]->is_checked ) ? 0 : 1 );
                $intUnCheckedCount  += ( ( true == isset( $trainee_record[CTraineeRecordTypes::WSC_ASSIGNMENT] ) && true == $trainee_record[CTraineeRecordTypes::WSC_ASSIGNMENT]->is_checked ) ? 0 : 1 );
                
                $intCheckCount      += ( ( true == isset( $trainee_record[CTraineeRecordTypes::DAILY_DIARY] ) && true == $trainee_record[CTraineeRecordTypes::DAILY_DIARY]->is_checked ) ? 1 : 0 );
                $intCheckCount      += ( ( true == isset( $trainee_record[CTraineeRecordTypes::DRAFTING_BOOK] ) && true == $trainee_record[CTraineeRecordTypes::DRAFTING_BOOK]->is_checked ) ? 1 : 0 );
                $intCheckCount      += ( ( true == isset( $trainee_record[CTraineeRecordTypes::THEORY_FILE] ) && true == $trainee_record[CTraineeRecordTypes::THEORY_FILE]->is_checked ) ? 1 : 0 );
                $intCheckCount      += ( ( true == isset( $trainee_record[CTraineeRecordTypes::JOB_SHEET_BOOK] ) && true == $trainee_record[CTraineeRecordTypes::JOB_SHEET_BOOK]->is_checked ) ? 1 : 0 );
                $intCheckCount      += ( ( true == isset( $trainee_record[CTraineeRecordTypes::ASSIGNMENT_BOOK] ) && true == $trainee_record[CTraineeRecordTypes::ASSIGNMENT_BOOK]->is_checked ) ? 1 : 0 );
                $intCheckCount      += ( ( true == isset( $trainee_record[CTraineeRecordTypes::PRACTICLE_BOOK] ) && true == $trainee_record[CTraineeRecordTypes::PRACTICLE_BOOK]->is_checked ) ? 1 : 0 );
                $intCheckCount      += ( ( true == isset( $trainee_record[CTraineeRecordTypes::DRAWING_BOOK] ) && true == $trainee_record[CTraineeRecordTypes::DRAWING_BOOK]->is_checked ) ? 1 : 0 );
                $intCheckCount      += ( ( true == isset( $trainee_record[CTraineeRecordTypes::WSC_NOTEBOOK] ) && true == $trainee_record[CTraineeRecordTypes::WSC_NOTEBOOK]->is_checked ) ? 1 : 0 );
                $intCheckCount      += ( ( true == isset( $trainee_record[CTraineeRecordTypes::WSC_ASSIGNMENT] ) && true == $trainee_record[CTraineeRecordTypes::WSC_ASSIGNMENT]->is_checked ) ? 1 : 0 );
                
                
                echo '<td class="s6" dir="ltr"> ' . date( 'Y-m-d',  strtotime( $strDate ) ) . ' </td>';
                echo '<td class="s6 text-center" dir="ltr">' . ( ( true == isset( $trainee_record[CTraineeRecordTypes::DAILY_DIARY] ) && true == $trainee_record[CTraineeRecordTypes::DAILY_DIARY]->is_checked ) ? $strCheckIcon : $strWrongIcon ) . '</td>';
                echo '<td class="s6 text-center" dir="ltr">' . ( ( true == isset( $trainee_record[CTraineeRecordTypes::DRAFTING_BOOK] ) && true == $trainee_record[CTraineeRecordTypes::DRAFTING_BOOK]->is_checked ) ? $strCheckIcon : $strWrongIcon ) . '</td>';
                echo '<td class="s6 text-center" dir="ltr">' . ( ( true == isset( $trainee_record[CTraineeRecordTypes::THEORY_FILE] ) && true == $trainee_record[CTraineeRecordTypes::THEORY_FILE]->is_checked ) ? $strCheckIcon : $strWrongIcon ) . '</td>';
                echo '<td class="s6 text-center" dir="ltr">' . ( ( true == isset( $trainee_record[CTraineeRecordTypes::JOB_SHEET_BOOK] ) && true == $trainee_record[CTraineeRecordTypes::JOB_SHEET_BOOK]->is_checked ) ? $strCheckIcon : $strWrongIcon ) . '</td>';
                echo '<td class="s6 text-center" dir="ltr">' . ( ( true == isset( $trainee_record[CTraineeRecordTypes::ASSIGNMENT_BOOK] ) && true == $trainee_record[CTraineeRecordTypes::ASSIGNMENT_BOOK]->is_checked ) ? $strCheckIcon : $strWrongIcon ) . '</td>';
                echo '<td class="s6 text-center" dir="ltr">' . ( ( true == isset( $trainee_record[CTraineeRecordTypes::PRACTICLE_BOOK] ) && true == $trainee_record[CTraineeRecordTypes::PRACTICLE_BOOK]->is_checked ) ? $strCheckIcon : $strWrongIcon ) . '</td>';
                echo '<td class="s6 text-center" dir="ltr">' . ( ( true == isset( $trainee_record[CTraineeRecordTypes::DRAWING_BOOK] ) && true == $trainee_record[CTraineeRecordTypes::DRAWING_BOOK]->is_checked ) ? $strCheckIcon : $strWrongIcon ) . '</td>';
                echo '<td class="s6 text-center" dir="ltr">' . ( ( true == isset( $trainee_record[CTraineeRecordTypes::WSC_NOTEBOOK] ) && true == $trainee_record[CTraineeRecordTypes::WSC_NOTEBOOK]->is_checked ) ? $strCheckIcon : $strWrongIcon ) . '</td>';
                echo '<td class="s6 text-center" dir="ltr">' . ( ( true == isset( $trainee_record[CTraineeRecordTypes::WSC_ASSIGNMENT] ) && true == $trainee_record[CTraineeRecordTypes::WSC_ASSIGNMENT]->is_checked ) ? $strCheckIcon : $strWrongIcon ) . '</td>';
                echo '<td class="s6 text-center" dir="ltr">' . ( ( true == isset( $trainee_record[CTraineeRecordTypes::PROGRESS] ) && "" != $trainee_record[CTraineeRecordTypes::PROGRESS]->progress ) ? $trainee_record[CTraineeRecordTypes::PROGRESS]->progress : 'N/A'  ) . '</td>';
                echo '<td class="s6 text-center" dir="ltr">' . ( $intCheckCount ) . '/' . ( $intUnCheckedCount + $intCheckCount ); 
                
                echo '</tr>';
                $is_first_row = false;
            }
            ?>

         <?php } ?>
      </tbody>
   </table>
</div>
<script type='text/javascript' nonce='ZsoHTifWzNQ29ZT2BCvXRQ'>
   function posObj(sheet, id, row, col, x, y) {
     var rtl = false;
     var sheetElement = document.getElementById(sheet);
     if (!sheetElement) {
       sheetElement = document.getElementById(sheet + '-grid-container');
     }
     if (sheetElement) {
       rtl = sheetElement.getAttribute('dir') == 'rtl';
     }
     var r = document.getElementById(sheet+'R'+row);
     var c = document.getElementById(sheet+'C'+col);
     if (r && c) {
       var objElement = document.getElementById(id);
       var s = objElement.style;
       var t = y;
       while (r && r != sheetElement) {
         t += r.offsetTop;
         r = r.offsetParent;
       }
       var offsetX = x;
       while (c && c != sheetElement) {
         offsetX += c.offsetLeft;
         c = c.offsetParent;
       }
       if (rtl) {
         offsetX -= objElement.offsetWidth;
       }
       s.left = offsetX + 'px';
       s.top = t + 'px';
       s.display = 'block';
       s.border = '1px solid #000000';
     }
   };
   function posObjs() {
   };
   posObjs();
</script>

<?php  } ?>