<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">.ritz .waffle a { color: inherit; }.ritz .waffle .s0{border-bottom:1px SOLID #000000;background-color:#ffffff;}.ritz .waffle .s2{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:center;font-weight:bold;color:#54667a;font-family:'Arial';font-size:12pt;vertical-align:middle;white-space:normal;overflow:hidden;word-wrap:break-word;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s5{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:left;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s1{border-right:1px SOLID #000000;background-color:#ffffff;}.ritz .waffle .s4{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:center;font-weight:bold;color:#54667a;font-family:'docs-Rubik',Arial;font-size:8pt;vertical-align:middle;white-space:normal;overflow:hidden;word-wrap:break-word;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s3{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:center;font-weight:bold;color:#54667a;font-family:'Arial';font-size:8pt;vertical-align:middle;white-space:normal;overflow:hidden;word-wrap:break-word;direction:ltr;padding:2px 3px 2px 3px;}.ritz .waffle .s6{border-bottom:1px SOLID #000000;border-right:1px SOLID #000000;background-color:#ffffff;text-align:right;color:#000000;font-family:'Arial';font-size:10pt;vertical-align:bottom;white-space:nowrap;direction:ltr;padding:2px 3px 2px 3px;}</style>
<div class="ritz grid-container" dir="ltr">
   <table class="waffle" cellspacing="0" cellpadding="0">
      <tbody>
         <tr style='height:20px;'>
            <td></td>
            <td></td>
            <td class="s1"></td>
            <td class="s2" dir="ltr" colspan="13">Nutan ITI, Chinawal</td>
         </tr>
         <tr style='height:20px;'>
            <td></td>
            <td></td>
            <td class="s1"></td>
            <td class="s2" dir="ltr" colspan="13">Trainee Record Monthly Report </td>
         </tr>
         <tr style='height:20px;'>
            <td></td>
            <td></td>
            <td class="s1"></td>
            <td class="s2" dir="ltr" colspan="4">Instructor Name: Sandeep Chaudhari</td>
            <td class="s2" dir="ltr" colspan="3">Trade: Fitter</td>
            <td class="s2" dir="ltr" colspan="3">Batch: 2018-2020</td>
            <td class="s2" dir="ltr" colspan="3">Unit 1</td>
         </tr>
         <tr style='height:20px;'>
            <td></td>
            <td></td>
            <td class="s1"></td>
            <td class="s3" dir="ltr">Student Name</td>
            <td class="s3" dir="ltr">Date</td>
            <td class="s4" dir="ltr">Daily Diary</td>
            <td class="s4" dir="ltr">Drafting Book</td>
            <td class="s4" dir="ltr">Theory File</td>
            <td class="s3" dir="ltr">Job Sheet book</td>
            <td class="s3" dir="ltr">Assignment Book</td>
            <td class="s3" dir="ltr">Practi-cal Book</td>
            <td class="s3" dir="ltr">Drawing Book</td>
            <td class="s3" dir="ltr">WSC Note-book</td>
            <td class="s4" dir="ltr">WSC Assignment</td>
            <td class="s4" dir="ltr">Progress</td>
            <td class="s3" dir="ltr">Checked Ratio</td>
         </tr>
         <?php foreach( $students as $student ) { ?>
         <tr style='height:20px;'>
            <td></td>
            <td></td>
            <td class="s1"></td>
            <td class="s5" dir="ltr" rowspan="<?php echo count( $trainee_records[$student->sid] ); ?>"><?php echo $student->s_fname . ' ' . $student->s_lname; ?></td>
            <?php 
            foreach( $trainee_records[$student->sid] AS $strDate => $trainee_record ) {
                echo '<td> ' . date( 'Y-m-d',  strtotime( $strDate ) ) . ' </td>';
                echo '<td>'.print_r( $trainee_record ) .'</td>';
            }
            ?>
            <!--  <td class="s6" dir="ltr">1</td>
            <td class="s6" dir="ltr">1</td>
            <td class="s6" dir="ltr">0</td>
            <td class="s6" dir="ltr">1</td>
            <td class="s6" dir="ltr">0</td>
            <td class="s6" dir="ltr">10</td>
            <td class="s5" dir="ltr">1</td>
            <td class="s6" dir="ltr">0</td>
            <td class="s6" dir="ltr">1</td>
            <td class="s6" dir="ltr">0</td>
            <td class="s5" dir="ltr">Good</td>
            <td class="s6" dir="ltr">2/5</td> -->
         </tr>
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