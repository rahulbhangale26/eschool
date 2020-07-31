<?php
if (!defined( 'ABSPATH' ) )exit('No Such File');
global $objUser;

$intBatchId = $_SESSION['filter']['batch_id'];
$intTradeId = $_SESSION['filter']['trade_id'];

 $proversion	=	wpsp_check_pro_version();
	  $proclass		=	!$proversion['status'] && isset( $proversion['class'] )? $proversion['class'] : '';
	  $protitle		=	!$proversion['status'] && isset( $proversion['message'] )? $proversion['message']	: '';
	  $prodisable	=	!$proversion['status'] ? 'disabled="disabled"'	: '';
	  $studentFieldList =  array(	's_rollno'			=>	__('Roll Number', 'WPSchoolPress'),
									's_fname'			=>	_t( 'Student First Name' ),
									's_mname'			=>	_t( 'Student Middle Name' ),
									's_lname'			=>	_t( 'Student Last Name' ),
									's_zipcode'			=>	__('Zip Code', 'WPSchoolPress'),
									's_country'			=>	__('Country', 'WPSchoolPress'),
									's_gender'			=>	__('Gender', 'WPSchoolPress'),
									's_address'			=>	__('Current Address', 'WPSchoolPress'),
									's_paddress'		=>	__('Permanent Address', 'WPSchoolPress'),
									'p_fname '			=>	__('Parent First Name', 'WPSchoolPress'),
									's_bloodgrp'		=>	__('Blood Group', 'WPSchoolPress'),
									's_dob'				=>	__('Date Of Birth', 'WPSchoolPress'),
									's_doj'				=>	__('Date Of Join', 'WPSchoolPress'),
									's_phone'			=>	__('Phone Number', 'WPSchoolPress'),
							);
	$teacherId	=	0;
	global $current_user;
	$role		=	 $current_user->roles;
	$cuserId	=	 $current_user->ID;
?>
<?php 
        $proversion1    =    wpsp_check_pro_version('wpsp_addon_version');
        $prodisable1    =    !$proversion1['status'] ? 'notinstalled'    : 'installed';

        $propayment    =    wpsp_check_pro_version('pay_WooCommerce');
        $propayment    =    !$propayment['status'] ? 'notinstalled'    : 'installed';

        $prohistory    =    wpsp_check_pro_version('wpsp_mc_version');
        $prodisablehistory    =    !$prohistory['status'] ? 'notinstalled'    : 'installed';
    
        if( CRole::TEACHER == $objUser->getRole() && CDesignations::PRINCIPAL != $objUser->getTeacher()->designation_id &&  CDesignations::CLERK != $objUser->getTeacher()->designation_id ) {
            $arrobjBatches = ( new CBatches() )->fetchBatchesByInstructorId( $objUser->getTeacher()->tid );
            $arrobjTrades = CTrade::getInstance()->fetchTradesByInstructorId( $objUser->getTeacher()->tid );
        } else {
            $arrobjBatches = ( new CBatches() )->fetchAllBatches();
            $arrobjTrades = CTrade::getInstance()->fetchAllTrades();
        }
       ?>
<div class="wpsp-card">
		<div class="wpsp-card-head">
	<?php /*<h3 class="wpsp-card-title">Student List by class </h3>
			*/



		?>
		<div class="subject-inner wpsp-left wpsp-class-filter">
		</div>
		<div class="wpsp-right wpsp-import-export">
			<div class="wpsp-btn-lists" title="">

				<div class="wpsp-btn-list" wpsp-tooltip="Under construction">

					<div class="wpsp-button-group wpsp-dropdownmain wpsp-left">
						<button type="button" class="wpsp-btn wpsp-btn-success print" id="PrintStudent" title="<?php //echo $protitle;?>">
							<i class="fa fa-print" ></i> <?php _e( 'Print', 'WPSchoolPress'); ?>
						</button>
						<button type="button" class="wpsp-btn wpsp-btn-success wpsp-dropdown-toggle" <?php echo $prodisable;?> title="<?php //echo $protitle;?>">
						<!-- <span class="sr-only"><?php _e( 'Toggle Dropdown', 'WPSchoolPress' );?></span> -->
					</button>
					<div class="wpsp-dropdown wpsp-dropdown-md">
					<ul>
						<li class="wpsp-drop-title wpsp-checkList"><?php _e( 'Select Columns to Print', 'WPSchoolPress' );?> </li>
						<form id="StudentColumnForm" name="StudentColumnForm" method="POST">
							<?php foreach( $studentFieldList as $key=>$value ) { ?>
								<li class="wpsp-checkList" >
									<input type="checkbox" name="StudentColumn[]" value="<?php echo $key; ?>" id="<?php echo $key; ?>" checked="checked">
									<label for="<?php echo $key; ?>"><?php echo $value; ?></label>
								</li>
							<?php } ?>
							<?php $currentSelectClass =	isset($_POST['ClassID']) ? intval($_POST['ClassID']) : '0'; ?>
							<input type="hidden" name="ClassID" value="<?php  echo $currentSelectClass; ?>">
							<input type="hidden" name="exportstudent" value="exportstudent">
						</form>
					</ul>
					</div>
				</div>

			</div>

<?php if ( in_array( 'administrator', $role ) ) {?>
			<div class="wpsp-btn-list" >
				<button id="ImportStudent" class="wpsp-btn wpsp-dark-btn wpsp-popclick impt" title="<?php //echo $protitle;?>" data-pop="ImportModal"><i class="fa fa-upload"></i> Import </button></div>
					<?php }?>
			<div class="wpsp-btn-list"  wpsp-tooltip="Under construction" >
				<div class="wpsp-dropdownmain wpsp-button-group">
					<button type="button" class="wpsp-btn print" id="ExportStudents" title="<?php //echo $protitle;?>"><i class="fa fa-download"></i> <?php _e( 'Export', 'WPSchoolPress'); ?> </button>
					<button type="button" class="wpsp-btn wpsp-btn-blue wpsp-dropdown-toggle" title="<?php //echo $protitle;?>">
						<!-- <span class="sr-only"><?php _e( 'Toggle Dropdown', 'WPSchoolPress' );?></span> -->
					</button>
					 <div id="exportcontainer" style="display:none;"></div>
					<div class="wpsp-dropdown wpsp-dropdown-md wpsp-dropdown-right">
						<ul>
							<li class="wpsp-drop-title wpsp-checkList"><?php _e( 'Select Columns to Export', 'WPSchoolPress' );?> </li>
							<form id="ExportColumnForm" name="ExportStudentColumn" method="POST">
								<?php foreach( $studentFieldList as $key=>$value ) {?>
								<li class="wpsp-checkList">
									<input type="checkbox" name="StudentColumn[]" value="<?php echo $key; ?>" id="<?php echo $key; ?>" checked="checked">
									<label class="wpsp-label" for="<?php echo $key; ?>"><?php echo $value; ?></label>
								</li>
								<?php }?>
								<input type="hidden" name="ClassID" value="<?php  echo $currentSelectClass; ?>">
								<input type="hidden" name="exportstudent" value="exportstudent">
							</form>
						</ul>
					</div>
				</div>
			</div>

		</div>
		</div>
	</div>
	<div class="wpsp-card-body">
						<div class="subject-head">
					<?php if ( in_array( 'administrator', $role ) ) { ?>
							<div class="wpsp-bulkaction">
								<select name="bulkaction" class="wpsp-form-control" id="bulkaction">
									<option value="">Select Action</option>
									<option value="bulkUsersDelete">Delete</option>
								</select>
							</div>
						<?php } ?>
						<table id="student_table" class="wpsp-table" cellspacing="0" width="100%" style="width:100%">
						<thead>
							<tr>
								
								<?php if ( in_array( 'administrator', $role ) ) { ?>
								<th class="nosort">
									<input type="checkbox" id="selectall" name="selectall" class="ccheckbox">
								</th>
								<?php } ?>

								<th><?php echo apply_filters( 'wpsp_student_table_rollno_heading',esc_html__('Roll No.','WPSchoolPress'));?></th>
								<th><?php echo apply_filters( 'wpsp_student_table_fullname_heading',esc_html__('Full Name','WPSchoolPress'));?></th>
								<th>Unit</th>
								<th>Qualification</th>
								<th>Category</th>
								<th>Address</th>
								<?php  if($propayment =='installed'){?>
								<th><?php echo apply_filters( 'wpsp_student_table_paymentstatus_heading',esc_html__('Payment Status','WPSchoolPress'));?></th>
							<?php } ?>
								<?php  if($proversion1['status']){?>
										 <th><?php echo apply_filters( 'wpsp_student_table_class_status_heading',esc_html__('Class Status','WPSchoolPress'));?></th>
									<?php } ?>
								<th><?php echo apply_filters( 'wpsp_student_table_phone_heading',esc_html__('Phone','WPSchoolPress'));?></th>
								<th>Email</th>
								<th align="center" class="nosort"><?php echo apply_filters( 'wpsp_student_table_action_heading',esc_html__('Action','WPSchoolPress'));?></th>
							</tr>
						</thead>
						<tbody>
							<?php
							    $units = CUnits::getInstance()->fetchAllUnits();
							    foreach( $units AS $unit ) {
							        $tempUnits[$unit->id] = $unit;
							    }
							    $units = $tempUnits;
							    
								$studentlists	= ( new CStudents() )->fetchStudentByFilters( [ 
								        'batch_id' => $intBatchId, 
								        'trade_id'  => $intTradeId
								] ); 
								
								foreach ( $studentlists as $stinfo ) {
							?>

									<tr>
										<?php if ( in_array( 'administrator', $role ) ) { ?>
											<td>
												<input type="checkbox" class="ccheckbox strowselect" name="UID[]" value="<?php echo $stinfo->wp_usr_id;?>">						
											</td>
										<?php } ?>
										<td><?php echo $stinfo->s_rollno;?></td>
										<td>
											<?php
		  							             $loc_avatar = get_user_meta($stinfo->wp_usr_id, 'simple_local_avatar', true);
									             $img_url = isset($loc_avatar['full']) && !empty($loc_avatar['full']) ? $loc_avatar['full'] : WPSP_PLUGIN_URL . 'img/avatar.png';
									             echo "<img src='$img_url' height='50px' width='50px' class='wpsp-userPic'/>";
										         $mname = $stinfo->s_mname;
							                     $lname = $stinfo->s_lname;
									             echo $stinfo->s_fname .' '. $mname .' '.  $lname . '';
									       ?>
										</td>
										<td><?php echo $units[$_SESSION['filter']['unit_id']]->unit_name; ?></td>
										<td><?php echo $stinfo->qualification; ?></td>
										<td><?php echo $stinfo->category; ?></td>
										<td>
										<?php
    									   $country = !empty( $stinfo->s_country ) ? ", ".$stinfo->s_country : '';
	   								        $city    = !empty( $stinfo->s_city ) ? ", <br>".$stinfo->s_city : '';
									       $zipcode    = !empty( $stinfo->s_zipcode ) ? ", ".$stinfo->s_zipcode : '';
									       echo $stinfo->s_address.' '.$city. ' ' . $country.' '.$zipcode;
									   ?></td>
										<?php  if($propayment == 'installed'){?>
										<td><?php echo $paid; ?>
											<a href="<?php echo wpsp_admin_url();?>sch-payment&id=<?php echo base64_encode($stinfo->wp_usr_id);?>" class="wpsp-popclick1" title="View"><i class="icon dashicons dashicons-visibility wpsp-view-icon"></i></a>
										</td>
									
									<?php } ?>
									<?php  if($proversion1['status']){?>
										<td></td>
									<?php } ?>
										<td><?php echo $stinfo->s_phone;?></td>
										<td><?php echo $stinfo->user_email;?></td>
										<td align="center">
										<div class="wpsp-action-col">
											<a href="javascript:;" class="ViewStudent wpsp-popclick" data-pop="ViewModal" data-id="<?php echo $stinfo->wp_usr_id;?>" title="View"><i class="icon dashicons dashicons-visibility wpsp-view-icon"></i></a>

											<a href="<?php echo "?id=".$stinfo->wp_usr_id;?>javascript:;" data-id="<?php echo $stinfo->wp_usr_id;?>"  data-pop="ViewModal" class="viewAttendance wpsp-popclick" title="Attendance">
												<i class="icon dashicons dashicons-admin-users wpsp-attendance-icon"></i>
											</a>
												<a href="<?php echo wpsp_admin_url();?>sch-student&id=<?php echo $stinfo->wp_usr_id.'&edit=true';?>" title="Edit"><i class="icon dashicons dashicons-edit wpsp-edit-icon"></i>
												</a>
												<?php if ( in_array( 'administrator', $role ) || ( !empty( $teacherId ) && $teacherId==$cuserId ) ) { ?>
											<a href="javascript:;" id="d_teacher" class="wpsp-popclick" data-pop="DeleteModal" title="Delete" data-id="<?php echo $stinfo->sid;?>" >
	                                				<i class="icon dashicons dashicons-trash wpsp-delete-icon" data-id="<?php echo $stinfo->sid;?>"></i>
	                                				</a>
											<?php }

											  if($prodisablehistory == "installed"){?>
												<a href="<?php echo wpsp_admin_url();?>sch-history&id=<?php echo base64_encode($stinfo->wp_usr_id);?>" title="History">
	                                				<i class="icon dashicons dashicons-image-rotate wpsp-view-icon" data-id="<?php echo $stinfo->sid;?>"></i>
	                                				</a>

	                                			<?php } ?>

										</div>
									</td>
								</tr>
							<?php
							}
							?>
						</tbody>
					  </table>
					  </div>
					</div><!-- /.box-body -->
				</div>
