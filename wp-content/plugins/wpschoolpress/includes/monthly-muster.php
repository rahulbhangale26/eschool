<?php
    global $objUser;
    $intClassId = ( int ) $_GET['class_id']; 
    $intMonthNumber = ( int ) $_GET['month'];
    $intYear = ( int ) $_GET['year'];
    $objClasses = new CClasses();
    $objClass = $objClasses->fetchClassByClassId( $intClassId );
    $objTeacher = ( new CTeachers() )->fetchTeacherByUserId( $objClass->teacher_id );
    
    $arrobjStudents = ( new CStudents() )->fetchStudentsByClassId( $intClassId );
    $arrobjAttendances = ( new CAttendance() )->fetchAttendanceByMonthByYearByClassId( $intMonthNumber, $intYear, $intClassId );
    $arrmixProcessedAttendance = [];
    foreach ( $arrobjAttendances as $objAttendance ) {
        $arrintDates = explode( ',', $objAttendance->dates );
        $arrintAttendences = explode( ',', $objAttendance->attendances_by_dates );
        foreach ( $arrintDates AS $intIndex => $intDate ) {
            $arrmixProcessedAttendance[$objAttendance->s_rollno][$intDate] = $arrintAttendences[$intIndex];            
        }
    }
    $intLastMonth = $intMonthNumber - 1;
    if( $intLastMonth == 0 ) {
        $intLastMonth = 12; 
    }
    
    $arrobjLastAttendances = ( new CAttendance() )->fetchAttendanceByMonthByYearByClassId( $intLastMonth, $intYear, $intClassId );
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
<link type="text/css" rel="stylesheet" href="resources/sheet.css" >
<style type="text/css">
.text-center {
    text-align: center !important;
}
.padding10{
    padding-bottom: 10px !important;
}
.textRotate {
    margin: 10px;
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

.border-left {
    border-left:1px SOLID #000000;
}

.ritz .waffle a { color: inherit; }.ritz .waffle .s4{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:center;color:#000000;font-family:'docs-Calibri',Arial;font-size:9pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:0px 3px 0px 3px;}.ritz .waffle .s5{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:left;color:#000000;font-family:'docs-Calibri',Arial;font-size:9pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:0px 3px 0px 3px;}
.ritz .waffle .s7{background-color:#ffffff;text-align:left;color:#000000;font-family:'docs-Calibri',Arial;font-size:9pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:0px 3px 0px 3px;
    border: none !important;}
.ritz .waffle .s3{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:center;font-weight:bold;color:#000000;font-family:'docs-Calibri',Arial;font-size:7pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:0px 3px 0px 3px;}.ritz .waffle .s0{border-bottom:1px SOLID #000000;background-color:#ffffff;text-align:center;color:#000000;font-family:'docs-Calibri',Arial;font-size:11pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:0px 3px 0px 3px;}.ritz .waffle .s6{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:right;color:#000000;font-family:'docs-Calibri',Arial;font-size:9pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:0px 3px 0px 3px;}
.ritz .waffle .s8{border-right:1px SOLID #000000;background-color:#ffffff;text-align:left;color:#000000;font-family:'docs-Calibri',Arial;font-size:9pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:0px 3px 0px 3px;
border: none !important;
}.ritz .waffle .s1{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:left;color:#000000;font-family:'docs-Calibri',Arial;font-size:11pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:0px 3px 0px 3px;}.ritz .waffle .s2{border-bottom:1px SOLID #000000;background-color:#ffffff;text-align:left;color:#000000;font-family:'docs-Calibri',Arial;font-size:11pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:0px 3px 0px 3px;}</style>
<div class="ritz grid-container" dir="ltr">
   <table id="printMuster" class="waffle" cellspacing="0" cellpadding="0">
      <tbody>
         <tr style='height:19px;'>
            <td class="s0" colspan="47">औदोगिक प्रशिक्षण संस्था चिनावल</td>
         </tr>
         <tr style='height:19px;'>
            <td class="s1 border-left" colspan="5">निर्देशकाचे नाव </td>
            <td class="s1">:-</td>
            <td class="s1" colspan="3"><?php echo $objTeacher->first_name . ' ' . $objTeacher->middle_name . ' '. $objTeacher->last_name; ?></td>
            <td class="s1" colspan="8">गटनिर्देशकाचे नाव </td>
            <td class="s1">:-</td>
            <td class="s1" colspan="9"><?php echo $objTeacher->first_name . ' ' . $objTeacher->middle_name . ' '. $objTeacher->last_name; ?></td>
            <td class="s1" colspan="4">व्यवसाय -</td>
            <td class="s2" colspan="6"><?php echo $objClass->c_name; ?> Instructor </td>
            <td class="s1"></td>
            <td class="s1" colspan="2">सत्र- </td>
            <td class="s1" colspan="2">पहिले</td>
            <td class="s1" colspan="2">विभाग -</td>
            <td class="s1" colspan="3"><?php echo $objClass->c_name; ?></td>
         </tr>
         <tr style='height:19px;'>
            <td class="s3 border-left" colspan="6">मागील महिन्याचाहजेरीचा तपशील </td>
            <td class="s4 padding10" rowspan="2">टक्केवारी</td>
            <td class="s4 padding10" rowspan="2">अ.न</td>
            <td class="s4 padding10" rowspan="2">प्रशिक्षणार्थी चे नाव </td>
            <td class="s4 " colspan="31">महिना :---  <?php echo ( new DateTime )->createFromFormat('!m', $intMonthNumber )->format( 'F' ); ?> <?php echo $intYear; ?></td>
            <td class="s4" colspan="7">चालू महिन्याचा  हजेरीचा  तपशील </td>
         </tr>
         <tr style='height:58px;'>
            <td class="s5 softmerge border-left">
               <div class="softmerge-inner textRotate" style="width: 19px; left: -1px;">&nbsp;सं.दिवस </div>
            </td>
            <td class="s5 softmerge">
               <div class="softmerge-inner textRotate" style="width: 19px; left: -1px;">ह.दिवस</div>
            </td>
            <td class="s5 softmerge">
               <div class="softmerge-inner textRotate" style="width: 19px; left: -1px;">गै.दिवस</div>
            </td>
            <td class="s5 softmerge">
               <div class="softmerge-inner textRotate" style="width: 19px; left: -1px;">कि.दिवस</div>
            </td>
            <td class="s5 softmerge">
               <div class="softmerge-inner textRotate" style="width: 19px; left: -1px;">आ.दिवस</div>
            </td>
            <td class="s5 softmerge">
               <div class="softmerge-inner textRotate" style="width: 19px; left: -1px;">खा.दिवस</div>
            </td>
            <td class="s6 padding10">01</td>
            <td class="s6 padding10">02</td>
            <td class="s6 padding10">03</td>
            <td class="s6 padding10">04</td>
            <td class="s6 padding10">05</td>
            <td class="s6 padding10">06</td>
            <td class="s6 padding10">07</td>
            <td class="s6 padding10">08</td>
            <td class="s6 padding10">09</td>
            <td class="s6 padding10">10</td>
            <td class="s6 padding10">11</td>
            <td class="s6 padding10">12</td>
            <td class="s6 padding10">13</td>
            <td class="s6 padding10">14</td>
            <td class="s6 padding10">15</td>
            <td class="s6 padding10">16</td>
            <td class="s6 padding10">17</td>
            <td class="s6 padding10">18</td>
            <td class="s6 padding10">19</td>
            <td class="s6 padding10">20</td>
            <td class="s6 padding10">21</td>
            <td class="s6 padding10">22</td>
            <td class="s6 padding10">23</td>
            <td class="s6 padding10">24</td>
            <td class="s6 padding10">25</td>
            <td class="s6 padding10">26</td>
            <td class="s6 padding10">27</td>
            <td class="s6 padding10">28</td>
            <td class="s6 padding10">29</td>
            <td class="s6 padding10">30</td>
            <td class="s6 padding10">31</td>
            <td class="s5 softmerge">
               <div class="softmerge-inner textRotate" style="width: 19px; left: -1px;"><span style=" width:30px; transform: rotate(-90deg);">सं.दिवस </span></div>
            </td>
            <td class="s5 softmerge">
               <div class="softmerge-inner textRotate" style="width: 19px; left: -1px;">ह.दिवस</div>
            </td>
            <td class="s5 softmerge">
               <div class="softmerge-inner textRotate" style="width: 19px; left: -1px;">गै.दिवस</div>
            </td>
            <td class="s5 softmerge">
               <div class="softmerge-inner textRotate" style="width: 20px; left: -1px;">कि.रजा</div>
            </td>
            <td class="s5 softmerge">
               <div class="softmerge-inner textRotate" style="width: 19px; left: -1px;">आ.रजा</div>
            </td>
            <td class="s5 softmerge">
               <div class="softmerge-inner textRotate" style="width: 19px; left: -1px;">खा.रजा </div>
            </td>
            <td class="s5  padding10">शेरा</td>
         </tr>
         <?php foreach( $arrobjStudents as $objStudent ) { ?>
         <tr style='height:16px;'>
         	<?php 
         	if( true == isset( $arrmixProcessedLastAttendance[$objStudent->s_rollno]) ) {        	    
         	  $arrintLastAttendanceCount = array_count_values( $arrmixProcessedLastAttendance[$objStudent->s_rollno] );
         	} else {
         	    $arrintLastAttendanceCount = [
         	          'P'     => 0,
         	          'A'     => 0,
         	          'SL'    => 0,
         	          'CL'    => 0,
         	          'SPL'   => 0
         	    ];
         	}
            ?>
            <td class="s5 border-left text-center">
            <?php
                $intLastWorkingDays = 0;
            	if( true == isset( $arrintLastAttendanceCount['P'] ) ) {
            	    $intLastWorkingDays += $arrintLastAttendanceCount['P'];
            	}
            	
            	if( true == isset( $arrintLastAttendanceCount['A'] ) ) {
            	    $intLastWorkingDays += $arrintLastAttendanceCount['A'];
            	}
            	
            	if( true == isset( $arrintLastAttendanceCount['SL'] ) ) {
            	    $intLastWorkingDays += $arrintLastAttendanceCount['SL'];
            	}
            	
            	if( true == isset( $arrintLastAttendanceCount['CL'] ) ) {
            	    $intLastWorkingDays += $arrintLastAttendanceCount['CL'];
            	}
            	
            	if( true == isset( $arrintLastAttendanceCount['SPL'] ) ) {
            	    $intLastWorkingDays += $arrintLastAttendanceCount['SPL'];
            	}
            	
            	echo $intLastWorkingDays;
            	?>
            </td>
            <td class="s5 text-center"><?php echo ( true == isset( $arrintLastAttendanceCount['P'] ) ? $arrintLastAttendanceCount['P'] : 0 ); ?></td>
            <td class="s5 text-center"><?php echo ( true == isset( $arrintLastAttendanceCount['A'] ) ? $arrintLastAttendanceCount['A'] : 0 ); ?></td>
            <td class="s5 text-center"><?php echo ( true == isset( $arrintLastAttendanceCount['CL'] ) ? $arrintLastAttendanceCount['CL'] : 0 ); ?></td>
            <td class="s5 text-center"><?php echo ( true == isset( $arrintLastAttendanceCount['SL'] ) ? $arrintLastAttendanceCount['SL'] : 0 ); ?></td>
            <td class="s5 text-center"><?php echo ( true == isset( $arrintLastAttendanceCount['SPL'] ) ? $arrintLastAttendanceCount['SPL'] : 0 ); ?></td>
            <td class="s5"><?php echo ( 0 != $intLastWorkingDaysecho ) ? ceil( $arrintLastAttendanceCount['P'] / $intLastWorkingDays * 100 ) : 0; ?></td>
            <td class="s6"><?php echo $objStudent->s_rollno; ?></td>
            <td class="s5"><?php echo $objStudent->s_fname . ' ' . $objStudent->s_mname . ' ' . $objStudent->s_lname; ?></td>
            <?php for( $i=1; $i<=31; $i++ ) {
                if( true == isset( $arrmixProcessedAttendance[$objStudent->s_rollno][$i] ) ) {                  
                    echo '<td class="s5" style="text-align:center;">' .  $arrmixProcessedAttendance[$objStudent->s_rollno][$i] . '</td>';
                } else {
                    echo '<td class="s5" style="text-align:center;">-</td>';
                }
            }?>
            <?php 
                if( true == isset( $arrmixProcessedAttendance[$objStudent->s_rollno] ) ) {
                    $arrintAttendanceCount = array_count_values( $arrmixProcessedAttendance[$objStudent->s_rollno] );
                } else {
                    $arrintLastAttendanceCount = [
                        'P'     => 0,
                        'A'     => 0,
                        'SL'    => 0,
                        'CL'    => 0,
                        'SPL'   => 0
                    ];
                }
            ?>
            <td class="s5 text-center">
            	<?php
            	$intWorkingDays = 0;
            	if( true == isset( $arrintAttendanceCount['P'] ) ) {
            	    $intWorkingDays += $arrintAttendanceCount['P'];
            	}
            	
            	if( true == isset( $arrintAttendanceCount['A'] ) ) {
            	    $intWorkingDays += $arrintAttendanceCount['A'];
            	}
            	
            	if( true == isset( $arrintAttendanceCount['SL'] ) ) {
            	    $intWorkingDays += $arrintAttendanceCount['SL'];
            	}
            	
            	if( true == isset( $arrintAttendanceCount['CL'] ) ) {
            	    $intWorkingDays += $arrintAttendanceCount['CL'];
            	}
            	
            	if( true == isset( $arrintAttendanceCount['SPL'] ) ) {
            	    $intWorkingDays += $arrintAttendanceCount['SPL'];
            	}
            	
            	echo $intWorkingDays;
            	?>
            </td>
            <td class="s5 text-center"><?php echo ( true == isset( $arrintAttendanceCount['P'] ) ? $arrintAttendanceCount['P'] : 0 ); ?></td>
            <td class="s5 text-center"><?php echo ( true == isset( $arrintAttendanceCount['A'] ) ? $arrintAttendanceCount['A'] : 0 ); ?></td>
            <td class="s5 text-center"><?php echo ( true == isset( $arrintAttendanceCount['CL'] ) ? $arrintAttendanceCount['CL'] : 0 ); ?></td>
            <td class="s5 text-center"><?php echo ( true == isset( $arrintAttendanceCount['SL'] ) ? $arrintAttendanceCount['SL'] : 0 ); ?></td>
            <td class="s5 text-center"><?php echo ( true == isset( $arrintAttendanceCount['SPL'] ) ? $arrintAttendanceCount['SPL'] : 0 ); ?></td>
            <td class="s5"><?php echo ( 0 != $intWorkingDays )  ? ceil( $arrintAttendanceCount['P'] / $intWorkingDays * 100 ) : 0; ?></td>
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
            <td class="s5">हजर </td>
            <?php for( $i=1; $i<=31; $i++ ) {
                $intPresentDayCount = 0;
                foreach ( $arrmixProcessedAttendance AS $arrmixStudentAttendance ) {
                    if( $arrmixStudentAttendance[$i] == 'P' ) {
                        $intPresentDayCount++;
                    }
                }
                
                $arrintPresentDayCount[$i] = $intPresentDayCount;
                echo '<td class="s5">' . $intPresentDayCount . '</td>';
            }?>
           
            <td class="s5" colspan="5" >एकूण मा.हजेरी</td>
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
            <td class="s5">कि.रजा</td>
            <?php for( $i=1; $i<=31; $i++ ) {
                $intCausalLeaveCount = 0;
                foreach ( $arrmixProcessedAttendance AS $arrmixStudentAttendance ) {
                    if( $arrmixStudentAttendance[$i] == 'CL' ) {
                        $intCausalLeaveCount++;
                    }
                }
                $arrintCasualLeaveCount[$i] = $intCausalLeaveCount;
                echo '<td class="s5">' . $intCausalLeaveCount . '</td>';
            }?>
            <td class="s5" colspan="5" >एकूण मा गैरहजेरी  </td>
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
            <td class="s5">आ.रजा </td>
            <?php for( $i=1; $i<=31; $i++ ) {
                $intSickLeaveCount = 0;
                foreach ( $arrmixProcessedAttendance AS $arrmixStudentAttendance ) {
                    if( $arrmixStudentAttendance[$i] == 'SL' ) {
                        $intSickLeaveCount++;
                    }
                }
                $arrintSickLeaveCount[$i] = $intSickLeaveCount;
                echo '<td class="s5">' . $intSickLeaveCount . '</td>';
            }?>
            <td class="s5" colspan="5">किरकोळ रजा </td>
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
            <td class="s5">खा.रजा </td>
            <?php for( $i=1; $i<=31; $i++ ) {
                $intSpecialLeaveCount = 0;
                foreach ( $arrmixProcessedAttendance AS $arrmixStudentAttendance ) {
                    if( $arrmixStudentAttendance[$i] == 'SPL' ) {
                        $intSpecialLeaveCount++;
                    }
                }
                $arrintSpecialLeaveCount[$i] = $intSpecialLeaveCount;
                echo '<td class="s5">' . $intSpecialLeaveCount . '</td>';
            }?>
            <td class="s5" colspan="5">आजारी रजा</td>
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
            <td class="s5">गैरहजर</td>
            <?php for( $i=1; $i<=31; $i++ ) {
                $intAbsentCount = 0;
                foreach ( $arrmixProcessedAttendance AS $arrmixStudentAttendance ) {
                    if( $arrmixStudentAttendance[$i] == 'A' ) {
                        $intAbsentCount++;
                    }
                }
                $arrintAbsentCount[$i] = $intAbsentCount;
                echo '<td class="s5">' . $intAbsentCount . '</td>';
            }?>
            <td class="s5" colspan="5">खास रजा</td>
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
            <td class="s5">एकूण </td>
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
            
                for( $i=1; $i<= 31; $i++) {
                echo '<td class="s5">' . ( $arrintPresentDayCount[$i] + $arrintAbsentCount[$i] + $arrintCasualLeaveCount[$i] + $arrintSickLeaveCount[$i] + $arrintSpecialLeaveCount[$i] ) . '</td>';
                
                $intMonthPresentCount += $arrintPresentDayCount[$i];
                $intMonthAbsentCount += $arrintAbsentCount[$i];
                $intMonthCasualLeaveCount += $arrintCasualLeaveCount[$i];
                $intMonthSickLeaveCount += $arrintSickLeaveCount[$i];
                $intMonthSpecialCount += $arrintSpecialLeaveCount[$i];
                
            }?>
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
            <td class="s5">नि.सही</td>
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
            <td class="s5" colspan="5">निर्देशकाची सही</td>
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
            <td class="s5">ग.नि .सही </td>
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
            <td class="s5" colspan="5">गट निर्देशकाची सही </td>
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