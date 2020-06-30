<?php
$processed_attendanced = [];
foreach ( $trainee_attendances as $trainee_attendance ) {
    $processed_attendanced[$trainee_attendance->student_id][$trainee_attendance->attendance_day] = $trainee_attendance;
}

$ptas = [];
foreach ( $trainee_attendance_summary as $tas) {
    $ptas[$tas->student_id] = $tas;
}

$lptas = [];
foreach ( $last_month_summary as $tas) {
    $lptas[$tas->student_id] = $tas;
}

$intLastMonth = $month - 1;
if( $intLastMonth == 0 ) {
    $intLastMonth = 12;
}

$arrobjLastAttendances = ( new CAttendance() )->fetchAttendanceByMonthByYearByUnitId( $intLastMonth, $year, $intUnitId );
$arrmixProcessedLastAttendance = [];
foreach ( $arrobjLastAttendances AS $objAttendance ) {
    $arrintLastDates = explode( ',', $objAttendance->dates );
    $arrintLastAttendences = explode( ',', $objAttendance->attendances_by_dates );
    foreach ( $arrintLastDates AS $intIndex => $intDate ) {
        $arrmixProcessedLastAttendance[$objAttendance->s_rollno][$intDate] = $arrintLastAttendences[$intIndex];
    }
}

?>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
.text-center {
    text-align: center !important;
}
.padding10{
    padding-bottom: 10px !important;
}
.textRotate {
    font-size: 10px;
    font-weight: bold;
    margin: 10px 0px;
/* FF3.5+ */
  -moz-transform: rotate(-90.0deg);
  /* Opera 10.5 */
  -o-transform: rotate(-90.0deg);
  /* Saf3.1+, Chrome */
  -webkit-transform: rotate(-90.0deg);
  /* IE6,IE7 */
  filter: progid: DXImageTransform.Microsoft.BasicImage(rotation=0.083);
  /* IE8 */
  -ms-filter: "progid:DXImageTransform.Microsoft.BasicImage(rotation=0.083)";
  /* Standard */
  transform: rotate(-90.0deg);
}

.head-font {
    font-size: 10px !important;
    font-weight: bold;
}

.border-left {
    border-left:1px SOLID #000000;
}

td.print-weekoff {
        background-color:#faada0 !important;
        -webkit-print-color-adjust: exact; 
}

@media print {
    .print-weekoff {
        background-color:#faada0 !important;
        -webkit-print-color-adjust: exact; 
    }
}


.ritz .waffle a { color: inherit; }.ritz .waffle .s4{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:center;color:#000000;font-family:'docs-Calibri',Arial;font-size:6pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:0px 3px 0px 3px;}.ritz .waffle .s5{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:left;color:#000000;font-family:'docs-Calibri',Arial;font-size:7pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:0px 3px 0px 3px;}
.ritz .waffle .s7{background-color:#ffffff;text-align:left;color:#000000;font-family:'docs-Calibri',Arial;font-size:9pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:0px 3px 0px 3px;
    border: none !important;}
.ritz .waffle .s3{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:center;font-weight:bold;color:#000000;font-family:'docs-Calibri',Arial;font-size:5pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:0px 3px 0px 3px;}.ritz .waffle .s0{border-bottom:1px SOLID #000000;background-color:#ffffff;text-align:center;color:#000000;font-family:'docs-Calibri',Arial;font-size:9pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:0px 3px 0px 3px;}.ritz .waffle .s6{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:right;color:#000000;font-family:'docs-Calibri',Arial;font-size:7pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:0px 3px 0px 3px;}
.ritz .waffle .s8{border-right:1px SOLID #000000;background-color:#ffffff;text-align:left;color:#000000;font-family:'docs-Calibri',Arial;font-size:7pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:0px 3px 0px 3px;
border: none !important;
}.ritz .waffle .s1{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:left;color:#000000;font-family:'docs-Calibri',Arial;font-size:9pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:0px 3px 0px 3px;}.ritz .waffle .s2{border-bottom:1px SOLID #000000;background-color:#ffffff;text-align:left;color:#000000;font-family:'docs-Calibri',Arial;font-size:9pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:0px 3px 0px 3px;}</style>
<div class="ritz grid-container" dir="ltr" id="attendance-mustur-report">
   <table id="printMuster" class="waffle" cellspacing="0" cellpadding="0">
      <tbody>
         <tr style='height:19px;'>
            <td class="s0" colspan="47"><?php echo $iti_name; ?></td>
         </tr>
         <tr style='height:19px;'>
            <td class="s1 border-left" colspan="9">Instructor Name: <?php echo $teacher->first_name . ' ' . $teacher->middle_name . ' '. $teacher->last_name; ?></td>
            <td class="s1" colspan="18">Sub Instructor Name: <?php echo $teacher->first_name . ' ' . $teacher->middle_name . ' '. $teacher->last_name; ?></td>
            <td class="s1" colspan="4">Trade: <?php echo $trade->name; ?></td>
            <td class="s1" colspan="9">Unit: <?php echo $unit->unit_name; ?></td>
            <td class="s1" colspan="7">Batch: <?php echo $batch->name ?></td>
         </tr>
         <tr style='height:19px;'>
            <td class="s1 border-left" colspan="8">Last Month Details</td>
            <td class="s1 " style="text-align: center" colspan="32">Month: <?php echo ( new DateTime )->createFromFormat('!m', $month )->format( 'F' ); ?> <?php echo $year; ?></td>
            <td class="s1" colspan="7">Current Month Details </td>
         </tr>
         <tr style='height:58px;'>
            <td class="s5 softmerge border-left">
               <div class="softmerge-inner textRotate" style="width: 10px; left: -1px;text-align:center;">W Day</div>
            </td>
            <td class="s5 softmerge">
               <div class="softmerge-inner textRotate" style="width: 10px; left: -1px;text-align:center">P Day</div>
            </td>
            <td class="s5 softmerge">
               <div class="softmerge-inner textRotate" style="width: 10px; left: -1px;text-align:center">A Day</div>
            </td>
            <td class="s5 softmerge">
               <div class="softmerge-inner textRotate" style="width: 10px; left: -1px;text-align:center">CL Day</div>
            </td>
            <td class="s5 softmerge">
               <div class="softmerge-inner textRotate" style="width: 10px; left: -1px;text-align:center">SL Day</div>
            </td>
            <td class="s5 softmerge">
               <div class="softmerge-inner textRotate" style="width: 10px; left: -1px;text-align:center">SPL Day</div>
            </td>
            <td class="s4 padding10 head-font" rowspan="1">%</td>
            <td class="s4 padding10 head-font" rowspan="1">No.</td>
            <td class="s4 padding10 head-font" rowspan="1">Trainee Name </td>
            <?php for( $i=1; $i<=date('t', mktime(0, 0, 0, $month, 1, $year ) ); $i++ ) {
                $intDaysInMonth = $i;
            ?>
            	<td class="s6 padding10 head-font" style="text-align:center">&nbsp;<?php echo sprintf( "%02d", $i ); ;?></td>            
            <?php 
                }
                $intDaysInMonth++;
                while( $intDaysInMonth <= 31 ) {
                    echo '<td class="s6 padding10" style="width:23px; text-align:center"></td>';
                    $intDaysInMonth++;
                }
            ?>
            
            <td class="s5 softmerge">
               <div class="softmerge-inner textRotate" style="width: 10px; left: -1px;"><span style=" width:30px; transform: rotate(-90deg);">W Day </span></div>
            </td>
            <td class="s5 softmerge">
               <div class="softmerge-inner textRotate" style="width: 10px; left: -1px;">P Day</div>
            </td>
            <td class="s5 softmerge">
               <div class="softmerge-inner textRotate" style="width: 10px; left: -1px;">A Day</div>
            </td>
            <td class="s5 softmerge">
               <div class="softmerge-inner textRotate" style="width: 10px; left: -1px;">CL Day</div>
            </td>
            <td class="s5 softmerge">
               <div class="softmerge-inner textRotate" style="width: 10px; left: -1px;">SL Day</div>
            </td>
            <td class="s5 softmerge">
               <div class="softmerge-inner textRotate" style="width: 10px; left: -1px;">SPL Day</div>
            </td>
            <td class="s5  padding10 head-font">%</td>
         </tr>
         <?php foreach( $students as $student ) { ?>
         <tr style='height:16px;'>
            <td class="s5 text-center border-left">
            	<?php echo $lptas[$student->sid]->total_working_day_count; ?>
            </td>
            <td class="s5 text-center"><?php echo $lptas[$student->sid]->present_count; ?></td>
            <td class="s5 text-center"><?php echo $lptas[$student->sid]->absent_count; ?></td>
            <td class="s5 text-center"><?php echo $lptas[$student->sid]->sl_count; ?></td>
            <td class="s5 text-center"><?php echo $lptas[$student->sid]->cl_count; ?></td>
            <td class="s5 text-center"><?php echo $lptas[$student->sid]->spl_count; ?></td>
            <td class="s5 text-center"><?php echo ( 0!= $lptas[$student->sid]->present_count ) ? ceil( $lptas[$student->sid]->present_count / $lptas[$student->sid]->total_working_day_count * 100 ) : 0; ?></td>
            <td class="s6 text-center"><?php echo $student->s_rollno; ?></td>
            <td class="s5"><?php echo $student->s_fname . ' ' . $student->s_mname . ' ' . $student->s_lname; ?></td>
            <?php 
            $intSaturdayCount = 0;
            for( $i=1; $i<=date('t', mktime(0, 0, 0, $month, 1, $year ) ); $i++ ) {
                $intDaysInMonth = $i;
                
                if( 'Sunday' == date( 'l', strtotime( $year . '-' . $month . '-' . $i ) ) ) {
                    echo '<td class="s5 print-weekoff"></td>';
                    continue;
                }
                
                if( 'Saturday' == date( 'l', strtotime( $year . '-' . $month . '-' . $i ) ) ) {
                    $intSaturdayCount++;
                }
                
                if( 0 != $intSaturdayCount && 0 == $intSaturdayCount%2 ) {
                    echo '<td class="s5 print-weekoff"></td>';
                    $intSaturdayCount=0;
                    continue;
                }

                if( true == isset( $processed_attendanced[$student->sid][$i] ) ) {                  
                    echo '<td class="s5" style="text-align:center;">' .  $attendance_types[$processed_attendanced[$student->sid][$i]->attendance_type_id]->code . '</td>';
                } else {
                    echo '<td class="s5" style="text-align:center;">-</td>';
                }
            }
                // Added to add blank cells if day is not exists in month.
                $intDaysInMonth++;
                while( $intDaysInMonth <= 31 ) {
                    echo '<td class="s5" style="text-align:center"></td>';
                    $intDaysInMonth++;
                }
            ?>
            <td class="s5 text-center">
            	<?php echo $ptas[$student->sid]->total_working_day_count; ?>
            </td>
            <td class="s5 text-center"><?php echo $ptas[$student->sid]->present_count; ?></td>
            <td class="s5 text-center"><?php echo $ptas[$student->sid]->absent_count; ?></td>
            <td class="s5 text-center"><?php echo $ptas[$student->sid]->sl_count; ?></td>
            <td class="s5 text-center"><?php echo $ptas[$student->sid]->cl_count; ?></td>
            <td class="s5 text-center"><?php echo $ptas[$student->sid]->spl_count; ?></td>
            <td class="s5"><?php echo ( 0!= $ptas[$student->sid]->present_count ) ? ceil( $ptas[$student->sid]->present_count / $ptas[$student->sid]->total_working_day_count * 100 ) : 0; ?></td>
         </tr>
         <?php } ?>
         <tr style='height:16px;'>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s8"></td>
            <td class="s5 head-font border-left">Present </td>
            

            <?php for( $i=1; $i<=date('t', mktime(0, 0, 0, $month, 1, $year ) ); $i++ ) {
                $intDaysInMonth=$i;
                echo '<td class="s5 text-center">' . ( isset( $daily_trainee_attendance_stats[$i] ) ? $daily_trainee_attendance_stats[$i]->daily_present_count : 0 ). '</td>';
            }
            $intDaysInMonth++;
            while( $intDaysInMonth <= 31 ) {
                echo '<td class="s5"></td>';
                $intDaysInMonth++;
            }
            ?>
           
            <td class="s5  head-font" colspan="5" >Total Present</td>
            <td class="s4" colspan="2" id="MonthPresentCount"></td>
         </tr>
         <tr style='height:16px;'>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s8"></td>
            <td class="s5 head-font border-left">Casual Leave</td>
            <?php for( $i=1; $i<=date('t', mktime(0, 0, 0, $month, 1, $year ) ); $i++ ) {
                $intDaysInMonth=$i;
                echo '<td class="s5 text-center">' . ( isset( $daily_trainee_attendance_stats[$i] ) ? $daily_trainee_attendance_stats[$i]->daily_cl_count : 0 ). '</td>';
            }
            
            $intDaysInMonth++;
            while( $intDaysInMonth <= 31 ) {
                echo '<td class="s5"></td>';
                $intDaysInMonth++;
            }
            
            ?>
            <td class="s5 head-font" colspan="5" >Total Absent </td>
            <td class="s4" colspan="2" id="MonthAbsentCount"></td>
         </tr>
         <tr style='height:16px;'>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s8"></td>
            <td class="s5  head-font border-left">Sick Leave</td>
            <?php for( $i=1; $i<=date('t', mktime(0, 0, 0, $month, 1, $year ) ); $i++ ) {
                $intDaysInMonth=$i;
                echo '<td class="s5 text-center">' . ( isset( $daily_trainee_attendance_stats[$i] ) ? $daily_trainee_attendance_stats[$i]->daily_sl_count : 0 ). '</td>';
            }
            $intDaysInMonth++;
            while( $intDaysInMonth <= 31 ) {
                echo '<td class="s5" ></td>';
                $intDaysInMonth++;
            }
            ?>
            <td class="s5 head-font" colspan="5">Casual Leave </td>
            <td class="s4" colspan="2" id="MonthCasualLeaveCount"></td>
         </tr>
         <tr style='height:16px;'>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s8"></td>
            <td class="s5 head-font border-left">Special Leave</td>
            <?php for( $i=1; $i<=date('t', mktime(0, 0, 0, $month, 1, $year ) ); $i++ ) {
                $intDaysInMonth=$i;
                echo '<td class="s5 text-center">' . ( isset( $daily_trainee_attendance_stats[$i] ) ? $daily_trainee_attendance_stats[$i]->daily_spl_count : 0 ). '</td>';
            }
            
            $intDaysInMonth++;
            while( $intDaysInMonth <= 31 ) {
                echo '<td class="s5" ></td>';
                $intDaysInMonth++;
            }
            ?>
            <td class="s5  head-font" colspan="5">Sick Leave</td>
            <td class="s4" colspan="2" id="MonthSickLeaveCount"></td>
         </tr>
         <tr style='height:16px;'>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s8"></td>
            <td class="s5  head-font border-left">Absent</td>
            <?php for( $i=1; $i<=date('t', mktime(0, 0, 0, $month, 1, $year ) ); $i++ ) {
                $intDaysInMonth=$i;
                echo '<td class="s5 text-center">' . ( isset( $daily_trainee_attendance_stats[$i] ) ? $daily_trainee_attendance_stats[$i]->daily_absent_count : 0 ) . '</td>';
            }
            $intDaysInMonth++;
            while( $intDaysInMonth <= 31 ) {
                echo '<td class="s5" ></td>';
                $intDaysInMonth++;
            }
            ?>
            <td class="s5  head-font `" colspan="5">Special Leave</td>
            <td class="s4" colspan="2" id="MonthSpecialLeaveCount"></td>
         </tr>
         <tr style='height:16px;'>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s8"></td>
            <td class="s5  head-font border-left">Total </td>
            <?php 
            /**
             * @todo 
             * @desc : Avoid use of javascript to show total counts.
             */
            
            $intMonthPresentCount = 0;
            $intMonthAbsentCount = 0;
            $intMonthCasualLeaveCount = 0;
            $intMonthSickLeaveCount = 0;
            $intMonthSpecialCount = 0;
            
            for( $i=1; $i<= date('t', mktime(0, 0, 0, $month, 1, $year ) ); $i++) {
                    $intDaysInMonth = $i;
                    
                    $daily_absent_count     = ( isset( $daily_trainee_attendance_stats[$i] ) ? $daily_trainee_attendance_stats[$i]->daily_absent_count : 0 );
                    $daily_spl_count        = ( isset( $daily_trainee_attendance_stats[$i] ) ? $daily_trainee_attendance_stats[$i]->daily_spl_count : 0 );
                    $daily_sl_count         = ( isset( $daily_trainee_attendance_stats[$i] ) ? $daily_trainee_attendance_stats[$i]->daily_sl_count : 0 );
                    $daily_cl_count         = ( isset( $daily_trainee_attendance_stats[$i] ) ? $daily_trainee_attendance_stats[$i]->daily_cl_count : 0 );
                    $daily_present_count    = ( isset( $daily_trainee_attendance_stats[$i] ) ? $daily_trainee_attendance_stats[$i]->daily_present_count : 0 );
                    
                    echo '<td class="s5 text-center">' . ( $daily_absent_count + $daily_spl_count + $daily_sl_count + $daily_cl_count + $daily_present_count ) . '</td>';
                
                    $intMonthPresentCount       += $daily_present_count;
                    $intMonthAbsentCount        += $daily_absent_count;
                    $intMonthCasualLeaveCount   += $daily_cl_count;
                    $intMonthSickLeaveCount     += $daily_sl_count;
                    $intMonthSpecialCount       += $daily_spl_count;
                
            }
            
            $intDaysInMonth++;
            while( $intDaysInMonth <= 31 ) {
                echo '<td class="s5" ></td>';
                $intDaysInMonth++;
            }
            ?>
            <script>
				document.getElementById('MonthPresentCount').innerHTML = '<?php echo $intMonthPresentCount; ?>';
				document.getElementById('MonthAbsentCount').innerHTML = '<?php echo $intMonthAbsentCount; ?>';
				document.getElementById('MonthCasualLeaveCount').innerHTML = '<?php echo $intMonthCasualLeaveCount; ?>';
				document.getElementById('MonthSickLeaveCount').innerHTML = '<?php echo $intMonthSickLeaveCount; ?>';
				document.getElementById('MonthSpecialLeaveCount').innerHTML = '<?php echo $intMonthSpecialCount; ?>';
					
            </script>
            <td class="s4" colspan="5"></td>
            <td class="s4" colspan="2"></td>
         </tr>
         <tr style='height:16px;'>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s8"></td>
            <td class="s5  head-font border-left">Instructor Sign</td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5  head-font" colspan="5">Instructor Sign</td>
            <td class="s4" colspan="2"></td>
         </tr>
         <tr style='height:16px;'>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s7"></td>
            <td class="s8"></td>
            <td class="s5  head-font border-left">Sub Instructor Sign </td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5"></td>
            <td class="s5  head-font" colspan="5">Sub Instructor Sign </td>
            <td class="s4" colspan="2"></td>
         </tr>
      </tbody>
   </table>
</div>
<script type='text/javascript' nonce='uRwVH/iKaXgBjg40Y2hSFg'>
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