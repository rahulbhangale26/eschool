<?php 

if( 'Monday' == date( 'l', strtotime( $filter['start_date'] ) ) ) {
	$start_date = date( 'Y-m-d', strtotime( $filter['start_date'] ) );
} else {
	$start_date = date( 'Y-m-d', strtotime( 'last monday', strtotime( $filter['start_date'] ) ) );
}

if( 7 <= ( int ) date( 'm', strtotime( $start_date ) ) ) {
	$year_start_date = date( 'Y', strtotime( $start_date ) ) . '-08-01';
} else {
	$year_start_date = ( date( 'Y', strtotime( $start_date ) ) - 1 ) . '-08-01';
}

$start_week_no 		= round( ( strtotime( $start_date ) - strtotime( $year_start_date ) ) / ( 60 * 60 * 24 * 7 ) );
$end_week_no		= round( ( strtotime( $filter['end_date'] ) - strtotime( $year_start_date ) ) / ( 60 * 60 * 24 * 7 ) );
$current_week_no	= $start_week_no;
?>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">

	.border-no {
		border: none !important;
	}
	
	.number {
		width: 30px !important;
		text-align: center !important;
    	vertical-align: middle !important;
	}
	
	.day_date {
    	width: 90px !important;
    	text-align: center !important;
    	vertical-align: middle !important;
	}
	
	.note {
		width: 450px;
    	text-align: center !important;
    	vertical-align: middle !important;
	}
	
	.note-right {
		width: 600px;
    	text-align: center !important;
    	vertical-align: middle !important;
	}

	.t-center {
		text-align: center !important;
	}
	
	@media print {
 		.bage-break {page-break-after: always;}
	}
.ritz .waffle a { color: inherit; }.ritz .waffle .s6{border-right: none;background-color:#ffffff;}.ritz .waffle .s0{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:center;font-weight:bold;color:#000000;font-family:'docs-Calibri',Arial;font-size:12pt;vertical-align:bottom;white-space:normal;overflow:hidden;word-wrap:break-word;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s7{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:left;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s1{border-right:1px SOLID #000000;background-color:#ffffff;}.ritz .waffle .s4{border-left: none;border-bottom:1px SOLID #000000;background-color:#ffffff;text-align:center;font-weight:bold;color:#000000;font-family:'docs-Calibri',Arial;font-size:12pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s3{border-right: none;border-bottom:1px SOLID #000000;background-color:#ffffff;text-align:center;font-weight:bold;color:#000000;font-family:'docs-Calibri',Arial;font-size:12pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s5{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:center;font-weight:bold;color:#000000;font-family:'docs-Calibri',Arial;font-size:12pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s2{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:center;font-weight:bold;color:#000000;font-family:'docs-docs-Calibri',Arial;font-size:12pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}</style>

<?php 
while( $current_week_no <= $end_week_no ) {
?>

<div class="ritz grid-container" dir="ltr">
   <table class="waffle" cellspacing="0" cellpadding="0">
      <tbody>
         <tr style='height:20px;'>
            <td class="s0" dir="ltr" colspan="6"><?php echo $iti_name; ?> </td>
            <td style="width: 200px" class="border-no" colspan="3"></td>
            <td class="s2" dir="ltr" colspan="5">Daily Diary</td>
         </tr>
         <tr style='height:20px;'>

            <td class="s0" dir="ltr" colspan="2">Week No : <?php echo $current_week_no; ?></td>
            <td class="s0" dir="ltr" colspan="2">Trade : <?php echo $trades[$units[$filter['unit_id']]->trade_id]->name; ?></td>
            <td class="s0" dir="ltr" colspan="2">Batch : <?php echo $batches[$units[$filter['unit_id']]->batch_id]->name; ?></td>
            <td style="width: 200px" class="border-no" colspan="3"></td>
            <td class="s0" dir="ltr"><?php echo $units[$filter['unit_id']]->unit_name; ?></td>
            <td class="s0" colspan="3">Instructor Name : <?php echo $instructor->first_name . ' ' . $instructor->last_name; ?></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s3 day_date" dir="ltr">Day / Date</td>
            <td class="s5 number" dir="ltr">Lesson No.</td>
            <td class="s5 note" dir="ltr" colspan="4">Name of Lesson</td>
			<td style="width: 200px" class="border-no" colspan="3"></td>
            <td class="s5 number" dir="ltr">Practical No.</td>
            <td class="s5 note-right" dir="ltr" colspan="4">Name of Practical</td>
         </tr>
         <?php while( 'Sunday' != date( 'l', strtotime( $start_date ) ) ) { ?>
         <tr style='height:79px;'>
            <td class="s7 day_date">
            	<?php echo date( 'l', strtotime( $start_date ) ); ?>
            	<br/>
            	<?php echo date( 'Y-m-d', strtotime( $start_date ) ); ?>
            </td>
            <td class="s7 number">
            	<?php echo ( true == isset( $lesson_notes[$start_date] ) ? $lesson_notes[$start_date]->number : '' ); ?>
            </td>
            <td class="s7 note" colspan="4">
            	<?php echo ( true == isset( $lesson_notes[$start_date] ) ? $lesson_notes[$start_date]->note : '' ); ?>
            </td>
            <td style="width: 200px" class="border-no" colspan="3"></td>
            <td class="s7 number">
            	<?php echo ( true == isset( $practical_notes[$start_date] ) ? $practical_notes[$start_date]->number : '' ); ?>
            </td>
            <td class="s7 note-right" colspan="4">
            	<?php echo ( true == isset( $practical_notes[$start_date] ) ? $practical_notes[$start_date]->note : '' ); ?>
            </td>
         </tr>
         <?php $start_date = date( 'Y-m-d', strtotime( 'tomorrow', strtotime( $start_date ) ) ); } ?>
         <tr style='height:79px;'>
            <td class="s7 t-center" colspan="6">Instructor Sign</td>
            <td style="width: 200px" class="border-no" colspan="3"></td>
            <td class="s7 t-center" colspan="5">G.I. Sign</td>
         </tr>
      </tbody>
   </table>
</div>
<div class="bage-break " style="height: 30px;"></div>
<?php 
$start_date = date( 'Y-m-d', strtotime( 'tomorrow', strtotime( $start_date ) ) );
$current_week_no++;
} ?>

<script>
setTimeout( function(){
	window.print();
}, 1000)
</script>
