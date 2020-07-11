<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
.text-center {
    text-align: center !important;
}
.border-t {
    border-top: 1px solid #000 !important;
}
.border-l {
    border-left: 1px solid #000 !important;
}
.ritz .waffle a { color: inherit; }.ritz .waffle .s3{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:left;font-weight:bold;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:middle;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s6{border-bottom:1px SOLID #000000;background-color:#ffffff;}.ritz .waffle .s7{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:center;font-weight:bold;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s4{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:left;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s2{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:center;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s10{border-left: none;border-bottom:1px SOLID #000000;background-color:#ffffff;text-align:left;font-weight:bold;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s5{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:center;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:middle;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s0{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:left;font-weight:bold;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s1{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#a4c2f4;text-align:center;font-weight:bold;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s8{border-right: none;border-bottom:1px SOLID #000000;background-color:#ffffff;text-align:left;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s11{border-bottom:1px SOLID #000000;background-color:#ffffff;text-align:center;font-weight:bold;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s9{border-left: none;border-bottom:1px SOLID #000000;background-color:#ffffff;text-align:left;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}</style>
<div class="wpsp-card">
	<div class="wpsp-card-head">
		<a href="<?php echo site_url( '/wp-admin/admin.php?page=sch-jobs&page_action=view_evaluation_sheet&job_id=' . $job->id ); ?>" class="wpsp-btn wpsp-btn-success <?php echo $page_action == 'view_evaluation_sheet' ? 'button-active' : ''; ?>">Job Evaluation 1</a>
		<a href="<?php echo site_url( '/wp-admin/admin.php?page=sch-jobs&page_action=view_evaluation_sheet_second&job_id=' . $job->id ); ?>" class="wpsp-btn wpsp-btn-success <?php echo $page_action == 'view_evaluation_sheet_second' ? 'button-active' : ''; ?>">Job Evaluation 2</a>
	</div>

	<div class="wpsp-card-body" id="job_evaluation_sheet">

	<div class="ritz grid-container" dir="ltr">
   		<table class="waffle horizontal-center" cellspacing="0" cellpadding="0">
      		<thead>
	      	</thead>
      		<tbody>
         		<tr style='height:20px;' class="">
		            <td class="s0 text-center border-t border-l" dir="ltr" colspan="5">JOB EVALUATION SHEET</td>
        		 </tr>
         		<tr style='height:20px;'>
           			<td class="s1 border-l" dir="ltr" colspan="5">JOB DETAILS</td>
         		</tr>
         		<tr style='height:20px;'>
		            <td class="s0 border-l" dir="ltr">JOB NO</td>
        		    <td class="s2" dir="ltr"><?php echo $job->id; ?></td>
            <td class="s3" dir="ltr" rowspan="2">WEEK NO</td>
            <td class="s4" colspan="2" rowspan="2"></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s0 border-l" dir="ltr">TITLE</td>
            <td class="s2" dir="ltr"><?php echo $job->title; ?></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s5 border-l" dir="ltr" colspan="2" rowspan="14"><img src="<?php echo WP_CONTENT_URL . $job->file_url; ?>" style="width: 400px;"/></td>
            <td class="s0" dir="ltr">START DATE</td>
            <td class="s4" dir="ltr" colspan="2"><?php echo date( 'Y-m-d', strtotime( $job->start_date ) ); ?></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s0 border-l" dir="ltr">END DATE</td>
            <td class="s4" dir="ltr" colspan="2"><?php echo date( 'Y-m-d', strtotime( $job->end_date ) ); ?></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s0 border-l" dir="ltr">TIME GIVEN</td>
            <td class="s4" dir="ltr" colspan="2"><?php echo $job->time_given; ?> HOURS</td>
         </tr>
         <tr style='height:20px;'>
            <td class="s0 border-l" dir="ltr">TOLERANCE</td>
            <td class="s4" dir="ltr" colspan="2"><?php echo $job->tolerance; ?></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s4 border-l" colspan="3"></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s7 border-l" dir="ltr">SR NO</td>
            <td class="s0 softmerge" dir="ltr">
               <div class="softmerge-inner" style="width: 221px; left: -1px;">Operational Skills</div>
            </td>
            <td class="s7" dir="ltr">MARKS</td>
         </tr>
         <tr style='height:20px;'>
            <td class="s2 border-l" dir="ltr">1</td>
            <td class="s4" dir="ltr"><?php echo true == isset( $job_ops[0] ) ? $job_ops[0]->name : '-'; ?></td>
            <td class="s2" dir="ltr"><?php echo true == isset( $job_ops[0] ) ? $job_ops[0]->marks : '-'; ?></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s2 border-l" dir="ltr">2</td>
            <td class="s4" dir="ltr"><?php echo true == isset( $job_ops[1] ) ? $job_ops[1]->name : '-'; ?></td>
            <td class="s2" dir="ltr"><?php echo true == isset( $job_ops[1] ) ? $job_ops[1]->marks : '-'; ?></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s2 border-l" dir="ltr">3</td>
            <td class="s4" dir="ltr"><?php echo true == isset( $job_ops[2] ) ? $job_ops[2]->name : '-'; ?></td>
            <td class="s2" dir="ltr"><?php echo true == isset( $job_ops[2] ) ? $job_ops[2]->marks : '-'; ?></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s2 border-l" dir="ltr">4</td>
            <td class="s4" dir="ltr"><?php echo true == isset( $job_ops[3] ) ? $job_ops[3]->name : '-'; ?></td>
            <td class="s2" dir="ltr"><?php echo true == isset( $job_ops[3] ) ? $job_ops[3]->marks : '-'; ?></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s2 border-l" dir="ltr">5</td>
            <td class="s4" dir="ltr"><?php echo true == isset( $job_ops[4] ) ? $job_ops[4]->name : '-'; ?></td>
            <td class="s2" dir="ltr"><?php echo true == isset( $job_ops[4] ) ? $job_ops[4]->marks : '-'; ?></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s2 border-l" dir="ltr">6</td>
            <td class="s4" dir="ltr"><?php echo true == isset( $job_ops[5] ) ? $job_ops[5]->name : '-'; ?></td>
            <td class="s2" dir="ltr"><?php echo true == isset( $job_ops[5] ) ? $job_ops[5]->marks : '-'; ?></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s2 border-l" dir="ltr">7</td>
            <td class="s4" dir="ltr"><?php echo true == isset( $job_ops[6] ) ? $job_ops[6]->name : '-'; ?></td>
            <td class="s2" dir="ltr"><?php echo true == isset( $job_ops[6] ) ? $job_ops[6]->marks : '-'; ?></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s2 border-l" dir="ltr">8</td>
            <td class="s4" dir="ltr"><?php echo true == isset( $job_ops[7] ) ? $job_ops[7]->name : '-'; ?></td>
            <td class="s2" dir="ltr"><?php echo true == isset( $job_ops[7] ) ? $job_ops[7]->marks : '-'; ?></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s0 border-l" dir="ltr">MATERIAL</td>
            <td class="s8 softmerge" dir="ltr">
               <div class="softmerge-inner" style="width: 252px; left: -1px;"><?php echo $job->material; ?></div>
            </td>
            <td class="s9"></td>
            <td class="s10" dir="ltr">TOTAL</td>
            <td class="s2" dir="ltr"><?php echo $total_marks; ?></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s4 border-l" colspan="5" rowspan="5"></td>
         </tr>
         <tr style='height:20px;' >
            <td class=""></td>
         </tr>
         <tr style='height:20px;' >
            <td class=""></td>
         </tr>
         <tr style='height:20px;'>
            <td class=""></td>
         </tr>
         <tr style='height:20px;'>
            <td class=""></td>
         </tr>
         <tr style='height:20px;'>
            <td class="s11 border-l" dir="ltr" colspan="2">INSTRUCTOR SIGN</td>
            <td class="s7" dir="ltr" colspan="3">G.I.SIGN</td>
         </tr>
      </tbody>
   </table>
</div>

	</div>
</div>


<script type='text/javascript' nonce='xhXRh7Ahdbh/Aj4fwP117A'>
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