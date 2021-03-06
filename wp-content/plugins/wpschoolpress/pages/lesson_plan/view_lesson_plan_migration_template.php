<style type="text/css">
    .ritz .waffle a {
        color: inherit;
    }
    .ritz .waffle .s1 {
        border-bottom: 1px SOLID #000000;
        border-right: 1px SOLID #000000;
        background-color: #ffffff;
        text-align: left;
        font-weight: bold;
        color: #000000;
        font-size: 10pt;
        vertical-align: middle;
        direction: ltr;
        padding: 1px 3px 1px 3px;
        min-width: 150px;
        max-width: 150px;
    }
    .ritz .waffle .s6 {
        border-bottom: 1px SOLID #000000;
        border-right: 1px SOLID #000000;
        background-color: #ffffff;
        text-align: center;
        font-weight: bold;
        color: #000000;
        font-size: 10pt;
        vertical-align: bottom;
        direction: ltr;
        padding: 1px 3px 1px 3px;
    }
    .ritz .waffle .s3 {
        border-bottom: 1px SOLID #000000;
        border-right: 1px SOLID #000000;
        background-color: #ffffff;
        text-align: left;
        color: #000000;
        font-size: 10pt;
        vertical-align: top;
        direction: ltr;
        padding: 1px 3px 1px 3px;
    }
    .ritz .waffle .s0 {
        border-bottom: 1px SOLID #000000;
        border-right: 1px SOLID #000000;
        background-color: #ffffff;
        text-align: center;
        font-weight: bold;
        color: #000000;
        font-size: 18pt;
        vertical-align: middle;
        direction: ltr;
        padding: 1px 3px 1px 3px;
    }
    .ritz .waffle .s2 {
        border-bottom: 1px SOLID #000000;
        border-right: 1px SOLID #000000;
        background-color: #ffffff;
        text-align: left;
        font-weight: bold;
        color: #000000;
        font-size: 10pt;
        vertical-align: top;
        direction: ltr;
        padding: 1px 3px 1px 3px;
    }
    .ritz .waffle .s5 {
        border-bottom: 1px SOLID #000000;
        border-right: 1px SOLID #000000;
        background-color: #ffffff;
        text-align: left;
        font-weight: bold;
        color: #000000;
        font-size: 10pt;
        vertical-align: top;
        direction: ltr;
        padding: 1px 3px 1px 3px;
    }
    .ritz .waffle .s4 {
        border-bottom: 1px SOLID #000000;
        border-right: 1px SOLID #000000;
        background-color: #ffffff;
        text-align: center;
        font-weight: bold;
        color: #000000;
        font-size: 10pt;
        vertical-align: middle;
        direction: ltr;
        padding: 1px 3px 1px 3px;
    }
    .text-center {
        text-align: center;
    }
    .main-heading{
        font-size: 18px;
        font-weight: bolder;
    }
    .lesson-plan-cotainer {
        margin:0 auto;
        max-width: 600px !important;
    }
    
    .dark-border {
        border: 2px solid #555 !important; 
    }
    
    .dark-borde-btm {
        border-bottom: 2px solid #555 !important; 
    }
    
    .no-btm-border{
        border-bottom: none !important;
    }
    
    .border-l {
        border-left: 1px solid #000 !important;
    }
    
    .border-r {
        border-right: 1px solid #000 !important;
    }
    
    .border-t {
        border-top: 1px solid #000 !important;    
    }
    
    .border-b {
        border-bottom: 1px solid #000 !important;    
    }
    
    .writable-text {
        font-size: 14px !important;
        font-weight: normal !important;
        line-height: normal !important;
        vertical-align: top !important;
    }
</style>
<div class="ritz grid-container" dir="ltr">
    <table class="waffle lesson-plan-cotainer dark-border" cellspacing="0" cellpadding="0">
        <tbody>
            <tr style="height: 20px;">
                <td class="s0 text-center main-heading dark-borde-btm" dir="ltr" colspan="4" rowspan="2">LESSON PLAN</td>
            </tr>
            <tr style="height: 20px;">
            </tr>
            <tr style="height: 20px;">
                <td class="s1 border-r border-b" dir="ltr" colspan="2"><ITINAME><?php echo $arrstrLessonPlan[1]; ?></ITINAME></td>
                <td class="s1  border-r border-b" dir="ltr"><?php echo $arrstrLessonPlan[2]; ?></td>
                <td class="s1 border-b" dir="ltr"><?php echo $arrstrLessonPlan[3]; ?></td>
            </tr>
            <tr style="height: 20px;">
                <td class="s1" dir="ltr"><?php echo $arrstrLessonPlan[4]; ?></td>
                <td class="s1" dir="ltr"><?php echo $arrstrLessonPlan[5]; ?></td>
                <td class="s1" dir="ltr"><?php echo $arrstrLessonPlan[6]; ?></td>
                <td class="s1" dir="ltr"><?php echo $arrstrLessonPlan[7]; ?></td>
            </tr>
            <tr>
                <td style="height: 30px;" class="s2" dir="ltr">REF. BOOKS &amp; PAGE NO.</td>
                <td class="s1 writable-text" colspan="3"><?php echo $arrstrLessonPlan[9]; ?></td>
            </tr>
            <tr>
                <td style="height: 30px;" class="s2" dir="ltr">NAME OF TOPIC</td>
                <td class="s1 writable-text" colspan="3"><?php echo $arrstrLessonPlan[11]; ?></td>
            </tr>
            <tr>
                <td style="height: 100px;" class="s2" dir="ltr">OBJECTIVE:</td>
                <td class="s1 writable-text" colspan="3"><?php echo $arrstrLessonPlan[13]; ?></td>
            </tr>
            <tr>
                <td style="height: 30px;" class="s2" dir="ltr">TEACHING AIDS:-</td>
                <td class="s3 writable-text"  colspan="3"><?php echo $arrstrLessonPlan[15]; ?></td>
            </tr>
            <tr>
                <td style="height: 30px;" class="s2" dir="ltr">REVIEW:</td>
                <td class="s3 writable-text" colspan="3"><?php echo $arrstrLessonPlan[17]; ?></td>
            </tr>
            <tr>
                <td style="height: 30px;" class="s2" dir="ltr">MOTIVATION:</td>
                <td class="s3 writable-text" colspan="3"><?php echo $arrstrLessonPlan[19]; ?></td>
            </tr>
            <tr style="height: 20px;">
                <td class="s4" dir="ltr">TOPIC</td>
                <td class="s4" dir="ltr" colspan="2">INFORMATION POINT</td>
                <td class="s4" dir="ltr">SPOT HINTS</td>
            </tr>
            <tr>
                <td style="height: 95px;" class="s3 writable-text"><?php echo $arrstrLessonPlan[23]; ?></td>
                <td class="s3 writable-text" colspan="2"><?php echo $arrstrLessonPlan[24]; ?></td>
                <td class="s3 writable-text"><?php echo $arrstrLessonPlan[25]; ?></td>
            </tr>
            <tr>
                <td style="height: 95px;" class="s3 writable-text"><?php echo $arrstrLessonPlan[26]; ?></td>
                <td class="s3 writable-text" colspan="2"><?php echo $arrstrLessonPlan[27]; ?></td>
                <td class="s3 writable-text"><?php echo $arrstrLessonPlan[28]; ?></td>
            </tr>
            <tr>
                <td style="height: 95px;" class="s3 writable-text"><?php echo $arrstrLessonPlan[29]; ?></td>
                <td class="s3 writable-text" colspan="2"><?php echo $arrstrLessonPlan[30]; ?></td>
                <td class="s3 writable-text"><?php echo $arrstrLessonPlan[31]; ?></td>
            </tr>
            <tr>
                <td class="s3 writable-text" style="height: 95px;"><?php echo $arrstrLessonPlan[32]; ?></td>
                <td class="s3 writable-text" colspan="2"><?php echo $arrstrLessonPlan[33]; ?></td>
                <td class="s3 writable-text"><?php echo $arrstrLessonPlan[34]; ?></td>
            </tr>
            <tr>
                <td class="s2" dir="ltr" style="height: 60px;">QUESTIONS:</td>
                <td class="s3 no-btm-border writable-text" colspan="3"><?php echo $arrstrLessonPlan[36]; ?></td>
            </tr>
            <tr>
                <td class="s2" dir="ltr" style="height: 30px;">SUMMARY:</td>
                <td class="s3 no-btm-border writable-text" colspan="3"><?php echo $arrstrLessonPlan[38]; ?></td>
            </tr>
            <tr>
                <td style="height: 30px;" class="s2" dir="ltr">ASSIGNMENT:</td>
                <td class="s3 no-btm-border writable-text" colspan="3"><?php echo $arrstrLessonPlan[40]; ?></td>
            </tr>
            <tr>
                <td style="height: 30px;" class="s5" dir="ltr">NEXT LESSON:</td>
                <td class="s3 writable-text" colspan="3"><?php echo $arrstrLessonPlan[42]; ?></td>
            </tr>
            <tr style="border-top: 1px solid #000">
                <td style="height: 60px;" class="s6" dir="ltr"><INAME><?php echo $arrstrLessonPlan[43]; ?></INAME></td>
                <td class="s6" dir="ltr">GROUP INSTRUCTOR</td>
                <td class="s6" dir="ltr" colspan="2">VICE PRINCIPAL/ PRINCIPAL</td>
            </tr>
        </tbody>
    </table>
</div>
