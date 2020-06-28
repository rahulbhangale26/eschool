<?php
if (!defined( 'ABSPATH' ) )exit('No Such File');

global $objUser;

if(  CRole::ADMIN == $objUser->getRole() || ( CRole::TEACHER == $objUser->getRole() && true == in_array( $objUser->getTeacher()->designation_id, [ CDesignations::PRINCIPAL, CDesignations::CLERK ] ) ) ) {
    $trades= CTrade::getInstance()->fetchAllTrades();
} else {
    $trades = CTrade::getInstance()->fetchTradesByInstructorId( $objUser->getTeacher()->tid );
}

$intTradeId = $_REQUEST['TradeId'];
$intUnitId  = $_REQUEST['UnitId'];
if( true == isset( $_REQUEST['report' ] ) ) {  
    $intViewTradeId = $_REQUEST['ViewTradeId'];
    $units = CUnits::getInstance()->fetchUnitByUserByTradeId( $objUser, $intViewTradeId );
} else {
    $units = CUnits::getInstance()->fetchUnitByUserByTradeId( $objUser, $intTradeId );
}

$intViewUnitId  = $_REQUEST['ViewUnitId'];




wpsp_header();
	if( is_user_logged_in() ) {
		global $current_user, $wpdb;
		$current_user_role=$current_user->roles[0];
		if($current_user_role=='administrator' || $current_user_role=='teacher')
		{
			wpsp_topbar();
			wpsp_sidebar();
			wpsp_body_start();
		?>
		
		<script>
			function validateAndUncheckAttend( intUserId, idCheck ) {
				if( $('#' + idCheck + '-' + intUserId ).is(':checked') ) {
					$('.attend-' + intUserId ).prop( 'checked', false );
					$('#' + idCheck + '-' + intUserId ).prop( 'checked', true );
				} else {
					$('.attend-' + intUserId ).prop( 'checked', false );
				}
			}
		</script>
		
		
		
		<div class="wpsp-card attendance-page" data-attendancePageUrl="<?php echo site_url( 'wp-admin/admin.php?page=sch-attendance' );?>">
						<div class="wpsp-card-head">
							<h3 class="wpsp-card-title"><?php echo apply_filters( 'wpsp_student_attendance_heading_detail', esc_html__( 'Attendance Report', 'WPSchoolPress' )); ?></h3>
							<hr>
						</div>
						<div class="wpsp-card-body text-black">
							<div class="wpsp-row">
								<?php
								$item =  apply_filters( 'wpsp_student_attendance_title_item',esc_html("Attendance","WPSchoolPress"));
								?>
							<div class="wpsp-col-lg-5 wpsp-col-md-5 wpsp-col-sm-12 wpsp-col-xs-12" id="AttendanceEnterForm">
							<h3 class="wpsp-card-title">Attendance</h3>
							<div class="line_box">
									<div class="wpsp-form-group">
										<label class="wpsp-labelMain">Select Trade</label>
										<select name="TradeId" id = "TradeId" class="wpsp-form-control">
											<option value="" disabled selected>Select Trade</option>
											<?php 
											foreach ( $trades AS $trade ) {
											    echo '<option value="' . $trade->id . '" ' . ( $trade->id == $intTradeId ? 'selected="selected"' : '' ) . '>' . $trade->name . '</option>';
					                        }
					                       ?>
										</select>
										<span class="clsbatch wpsp-text-red" style="display: none;    ">Please select Trade.</span>
									</div>							
									<div class="wpsp-form-group">
										<label class="wpsp-labelMain">Select Unit</label>
										
										<select <?php echo (true == isset( $intTradeId ) ? '' : 'disabled' ); ?> name="UnitId" id = "UnitId" class="wpsp-form-control">
											<option value="" disabled selected>Select Unit</option>
											<?php 
											foreach ( $units AS $unit ) {
											    echo '<option value="' . $unit->id . '" ' . ( $unit->id == $intUnitId ? 'selected="selected"' : '' ) . '>' . $unit->unit_name . '</option>';
					                        }
					                       ?>
										</select>
										<span class="clsbatch wpsp-text-red" style="display: none;    ">Please select Unit.</span>
									</div>
									<div class="wpsp-form-group">
										<label for="date" class="wpsp-labelMain">	<?php if( isset($item['entry_date'])){
														echo esc_html($item['entry_date'],"WPSchoolPress");
											}else{
													echo esc_html('Date',"WPSchoolPress");
											}
											?></label>
										<input type="text" class="wpsp-form-control select_date" id="AttendanceDate" value="<?php if(isset($_POST['entry_date'])) { echo $_POST['entry_date']; } else { echo date('m/d/Y'); }?>" name="entry_date">
										<span class="clsdate">Please select Date</span>
									</div>
									<div class="wpsp-row wpsp-text-center">
										<div class="wpsp-col-sm-12">
											<div class="wpsp-form-group">
												<button id="AttendanceEnter" name="attendance" class="wpsp-btn wpsp-btn-success">Add</button>
												<button id="AttendanceEdit" name="attendance" class="wpsp-btn wpsp-btn-success">Edit</button>
												<!--  <button id="Attendanceview" name="attendanceview" class="wpsp-btn wpsp-btn-primary">Quick View</button> -->
											</div>
										</div>
									</div>
									<div class="wpsp-row">
										<div class="wpsp-col-lg-12 wpsp-col-md-12 wpsp-col-sm-12 wpsp-form-group wpsp-text-red" id="wpsp-error-msg" style="margin-top:0px;">
										</div>
									</div>
								</div>
							</div>
							<div class="wpsp-col-lg-6 wpsp-col-lg-offset-1 wpsp-col-md-5 wpsp-col-md-offset-1 wpsp-col-sm-12 wpsp-col-xs-12 AttendanceView">
								<?php
									$c_stcount	=	$attendance	=	array();
									$student_table		=	$wpdb->prefix."wpsp_student";
									$attendance_table	=	$wpdb->prefix."wpsp_attendance";
									global $objUser;
								?>
								
								<?php 
								
								$intMonthNumber = ( int ) $_GET['month'];
								$intYear = ( int ) $_GET['year'];
								$intUnitId = ( int ) $intViewUnitId;
								?>
								
								<div class="wpsp-col-sm-12">
									<h3 class="wpsp-card-title">View Attendance Monthly Report</h3>
									<div class="line_box">
										<div class="box-body">
										
											<div class="wpsp-form-group">
												<label class="wpsp-labelMain">Select Trade</label>
												<select name="ViewTradeId" id = "ViewTradeId" class="wpsp-form-control">
													<option value="" disabled selected>Select Trade</option>
													<?php 
					               					   foreach ( $trades AS $trade ) {
									           		      echo '<option value="' . $trade->id . '" ' . ( $trade->id == $intViewTradeId ? 'selected="selected"' : '' ) . '>' . $trade->name . '</option>';
					                                   }
					                               ?>
												</select>
												<span class="clsbatch wpsp-text-red" style="display: none;    ">Please select Trade.</span>
											</div>	
											<div class="wpsp-form-group">
												<label class="wpsp-labelMain">Select Unit</label>
													<select name="ViewUnitId" id = "attendance_report_unit" class="wpsp-form-control" <?php echo ( true == isset( $intViewTradeId ) ? '' : 'disabled' ); ?>>
														<option value="" disabled selected>Select Unit</option>
															<?php 
                    											foreach ( $units AS $unit ) {
                    											    echo '<option value="' . $unit->id . '" ' . ( $unit->id == $intUnitId ? 'selected="selected"' : '' ) . '>' . $unit->unit_name . '</option>';
					                                            }
					                                       ?>
													</select>
													<span class="clsbatch wpsp-text-red" style="display: none;    ">Please select Unit</span>
											</div>
											<div class="wpsp-form-group">
												<label class="wpsp-labelMain">Select Month</label>
												<select id="attendance_report_month" name="month" class="wpsp-form-control" >
													<option value="">Select Month</option>
													<option value="1" <?php echo ( 1 == $intMonthNumber ) ? 'selected="selected"' : ""; ?>>Jan</option> 
													<option value="2" <?php echo ( 2 == $intMonthNumber ) ? 'selected="selected"' : ""; ?>>Feb</option> 
													<option value="3" <?php echo ( 3 == $intMonthNumber ) ? 'selected="selected"' : ""; ?>>Mar</option> 
													<option value="4" <?php echo ( 4 == $intMonthNumber ) ? 'selected="selected"' : ""; ?>>Apr</option> 
													<option value="5" <?php echo ( 5 == $intMonthNumber ) ? 'selected="selected"' : ""; ?>>May</option> 
													<option value="6" <?php echo ( 6 == $intMonthNumber ) ? 'selected="selected"' : ""; ?>>Jun</option> 
													<option value="7" <?php echo ( 7 == $intMonthNumber ) ? 'selected="selected"' : ""; ?>>Jul</option> 
													<option value="8" <?php echo ( 8 == $intMonthNumber ) ? 'selected="selected"' : ""; ?>>Aug</option> 
													<option value="9" <?php echo ( 9 == $intMonthNumber ) ? 'selected="selected"' : ""; ?>>Sep</option> 
													<option value="10" <?php echo ( 10 == $intMonthNumber ) ? 'selected="selected"' : ""; ?>>Oct</option> 
													<option value="11" <?php echo ( 11 == $intMonthNumber ) ? 'selected="selected"' : ""; ?>>Nov</option> 
													<option value="12" <?php echo ( 12 == $intMonthNumber ) ? 'selected="selected"' : ""; ?>>Dec</option> 
												</select>
											</div>
											<div class="wpsp-form-group">
												<label class="wpsp-labelMain">Select Year</label>
													<select id="attendance_report_year" name="year" class="wpsp-form-control" >
														<option value="">Select Year</option>
															<?php for( $i=date('Y'); $i>=2019; $i-- ) {?>
																<option value="<?php echo $i;?>" <?php echo ( $i == $intYear ) ? 'selected="selected"' : ""; ?>><?php echo $i;?></option> 
															<?php }?>
													</select>
											</div>
											<br>
											<span id="error_message" class="wpsp-text-red"></span>
											<br>
											<button id="monthly_muster" name="monthly_muster" class="wpsp-btn wpsp-btn-success" data-reportUrl="<?php echo site_url( 'wp-admin/admin.php?page=sch-attendance&report=monthly_muster' );?>">View Monthly Muster</button>
										</div>
									</div>
								</div>
						</div>
					</div>
		<div class="modal modal-wide" id="AddModal" tabindex="-1" role="dialog" aria-labelledby="AddModal" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content" id="AddModalContent">
				</div>
			</div>
		</div>
	</div>
</div>

<script>
function printDiv() {
    var divToPrint = document.getElementById('muster-print');
    var htmlToPrint = '' +
        '<style type="text/css">' +
        'table th, table td {' +
        'border:1px solid #555; !important' +
        'padding:0.5em;' +
        '}' +
        '</style>';
    htmlToPrint += divToPrint.outerHTML;
    newWin = window.open("");
    newWin.document.write('<html><head></head><body>' + htmlToPrint + '</body></html>');
}
</script>
<?php 
								 if( true == isset( $_GET['report'] ) && 'monthly_muster' == $_GET['report'] ) { ?>
	<div id="attendance_report" class="wpsp-card">
			<div style="padding:20px 30px"><button  style="padding: 10px 30px !important;font-size: large;"onclick="printDiv();" name="print_report" class="wpsp-btn wpsp-btn-success">Print</button></div>
			<div class="wpsp-card-body">
			<section id="muster-print" class="content">
	<?php 

        					   $filename	=	WPSP_PLUGIN_PATH .'includes/monthly-muster.php';
        					   include_once($filename); ?>
			</section>
        					   
</div>
	</div> 
	 	<?php }
			wpsp_body_end();
			wpsp_footer();
		}
		else if($current_user_role=='parent')
		{
			wpsp_topbar();
			wpsp_sidebar();
			wpsp_body_start();
			$parent_id=$current_user->ID;

			$student_table=$wpdb->prefix."wpsp_student";
			$class_table=$wpdb->prefix."wpsp_class";
			$att_table=$wpdb->prefix."wpsp_attendance";
			$students=$wpdb->get_results("select wp_usr_id, class_id, s_fname, s_mname, s_lname, sid from $student_table where parent_wp_usr_id='$parent_id'");
			$child=array();
			foreach($students as $childinfo){
				$child[]=array('student_id'=>$childinfo->wp_usr_id,'s_fname'=>$childinfo->s_fname,'class_id'=>$childinfo->class_id, 's_mname'=>$childinfo->s_mname, 's_lname'=>$childinfo->s_lname, 'sid'=>$childinfo->sid);
			}
			?>
			<div class="wpsp-card">
			<div class="wpsp-card-body">

					<div class="tabSec wpsp-nav-tabs-custom" id="verticalTab">
						<div class="tabList">
							<ul class="wpsp-resp-tabs-list">
						<?php $i=0; foreach($child as $ch) {
						if(base64_decode($_GET['sid']) == $ch['sid']){ ?>
							<li class="wpsp-tabing <?php echo ($i==0)?'wpsp-resp-tab-active':''?>">
								<?php echo $ch['s_fname'].' '.$ch['s_mname'].' '. $ch['s_lname'];?></li>
							<?php }$i++; } ?>
					</ul>
					</div>
					<section class="content">
				<?php

					global $wpdb;
					$id = $_GET['cid'];
					$class_id = base64_decode($id);
					$st_id = base64_decode($_GET['sid']);
					$stl =[];
					$att_table = $wpdb->prefix . "wpsp_attendance";
					$st_table = $wpdb->prefix . "wpsp_student";
					$class_table = $wpdb->prefix . "wpsp_class";
					$ser = '%' . $st_id . '%';
					$stinfo = $wpdb->get_row("select st.class_id, st.s_rollno, st.wp_usr_id, CONCAT_WS(' ', st.s_fname, st.s_mname, st.s_lname ) AS full_name, c.c_name, c.c_sdate, c.c_edate from $st_table st LEFT JOIN $class_table c ON c.cid='$class_id' where st.sid='$st_id'");
					if(is_numeric($stinfo->class_id) ){
						if($stinfo->class_id == $class_id){
						 $stl[] = $st->sid;
					 }
					}else{
						 $class_id_array = unserialize($stinfo->class_id);
						 if(in_array($class_id, $class_id_array)){
							 $stl[] = $class_id;
						 }
					}
					$att_info = $wpdb->get_row("select count(*) as count from $att_table WHERE absents LIKE '$ser'");
					$stinfo->c_edate = wpsp_ViewDate($stinfo->c_edate);
					$stinfo->c_sdate = wpsp_ViewDate($stinfo->c_sdate);
					$loc_avatar = get_user_meta($stinfo->wp_usr_id, 'simple_local_avatar', true);
					$img_url = $loc_avatar ? $loc_avatar['full'] : WPSP_PLUGIN_URL . 'img/avatar.png';
					$attendance_days = $wpdb->get_results("select * from $att_table where class_id=$class_id");
					$present_days = 0;
					$classid_array = unserialize($stinfo->class_id);
					$classname_array = [];
					foreach ($classid_array as $id ) {
						$clasname = $wpdb->get_var("SELECT c_name FROM $class_table where cid=$class_id");
						$classname_array[] = $clasname;
					}
					foreach($attendance_days as $days => $attendance)
					{
						if ($attendance->absents == 'Nil')
						{
							$present_days++;
						}
						else
						{
							$absents = json_decode($attendance->absents, true);
							if (array_search($stinfo->wp_usr_id, array_column($absents, 'sid')) !== False)
							{
							}
							else
							{
								$present_days++;
							}
						}
					}
					$working_days = $present_days + $att_info->count;
					$content = "<div class='wpsp-panel-body'>
					<div class='wpsp-userpic'style='margin-top: 0;'>
						 <img src='$img_url' height='150px' width='150px' class='img img-circle'/>
					</div>
					<div class='wpsp-userDetails'>
						<table class='wpsp-table' >
							<tbody>
								<tr>
									<td colspan='2'><strong>Name: </strong>$stinfo->full_name</td>
								</tr>
								<tr>
									<td><strong>Class: </strong>$stinfo->c_name</td>
									<td><strong>Roll No. : </strong>$stinfo->s_rollno</td>
								</tr>
								<tr>
									<td><strong>Class Start: </strong> $stinfo->c_sdate </td>
									<td><strong>Class End : </strong>$stinfo->c_edate</td>
								</tr>
								<tr>
									<td><strong>Number of Absent days: </strong>$att_info->count</td>
									<td><strong>Number of Present days: </strong>$present_days</td>
								</tr>
								<tr>
									<td colspan='2'><strong>Number of Attendance days: </strong>$working_days</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>";
	echo $content;
				?>
			</section>
</div>
</div>
</div>
			<?php
			wpsp_body_end();
			wpsp_footer();
		}else if($current_user_role=='student'){
			wpsp_topbar();
			wpsp_sidebar();
			wpsp_body_start();
			$st_id=$current_user->ID;
			?>
<div class="wpsp-card">
			<div class="wpsp-card-body">
			<section class="content">
				<?php
					global $wpdb;
					$id = $_GET['cid'];
					$class_id = base64_decode($id);
					$stl =[];
					$att_table = $wpdb->prefix . "wpsp_attendance";
					$st_table = $wpdb->prefix . "wpsp_student";
					$class_table = $wpdb->prefix . "wpsp_class";
					$ser = '%' . $st_id . '%';
					$stinfo = $wpdb->get_row("select st.class_id, st.s_rollno , CONCAT_WS(' ', st.s_fname, st.s_mname, st.s_lname ) AS full_name, c.c_name, c.c_sdate, c.c_edate from $st_table st LEFT JOIN $class_table c ON c.cid='$class_id' where st.wp_usr_id='$st_id'");

					if(is_numeric($stinfo->class_id) ){
						if($stinfo->class_id == $class_id){
						 $stl[] = $st->sid;
					 }
					}else{
						 $class_id_array = unserialize($stinfo->class_id);
						 if(in_array($class_id, $class_id_array)){
							 $stl[] = $class_id;
						 }
					}
					$att_info = $wpdb->get_row("select count(*) as count from $att_table WHERE absents LIKE '$ser'");
					$stinfo->c_edate = wpsp_ViewDate($stinfo->c_edate);
					$stinfo->c_sdate = wpsp_ViewDate($stinfo->c_sdate);
					$loc_avatar = get_user_meta($st_id, 'simple_local_avatar', true);
					$img_url = $loc_avatar ? $loc_avatar['full'] : WPSP_PLUGIN_URL . 'img/avatar.png';
					$attendance_days = $wpdb->get_results("select * from $att_table where class_id=$class_id");
					$present_days = 0;
					$classid_array = unserialize($stinfo->class_id);
					$classname_array = [];
					foreach ($classid_array as $id ) {
						$clasname = $wpdb->get_var("SELECT c_name FROM $class_table where cid=$class_id");
						$classname_array[] = $clasname;
					}
					foreach($attendance_days as $days => $attendance)
					{
						if ($attendance->absents == 'Nil')
						{
							$present_days++;
						}
						else
						{
							$absents = json_decode($attendance->absents, true);
							if (array_search($st_id, array_column($absents, 'sid')) !== False)
							{
							}
							else
							{
								$present_days++;
							}
						}
					}
					$working_days = $present_days + $att_info->count;
					$content = "<div class='wpsp-panel-body'>
					<div class='wpsp-userpic'style='margin-top: 0;'>
						 <img src='$img_url' height='150px' width='150px' class='img img-circle'/>
					</div>
					<div class='wpsp-userDetails'>
						<table class='wpsp-table'>
							<tbody>
								<tr>
									<td colspan='2'><strong>Name: </strong>$stinfo->full_name</td>
								</tr>
								<tr>
									<td><strong>Class: </strong>$stinfo->c_name</td>
									<td><strong>Roll No. : </strong>$stinfo->s_rollno</td>
								</tr>
								<tr>
									<td><strong>Class Start: </strong> $stinfo->c_sdate </td>
									<td><strong>Class End : </strong>$stinfo->c_edate</td>
								</tr>
								<tr>
									<td><strong>Number of Absent days: </strong>$att_info->count</td>
									<td><strong>Number of Present days: </strong>$present_days</td>
								</tr>
								<tr>
									<td colspan='2'><strong>Number of Attendance days: </strong>$working_days</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>";
	echo $content;
				?>
			</section>
</div>
</div>
			<?php
			wpsp_body_end();
			wpsp_footer();
		}
	}else{
		include_once( WPSP_PLUGIN_PATH .'/includes/wpsp-login.php');
	}
?>
