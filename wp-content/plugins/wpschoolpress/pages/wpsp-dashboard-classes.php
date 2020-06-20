<?php 
    global $objUser;
?>

<div class="wpsp-card-body">
				<table class="wpsp-table" id="class_table" cellspacing="0" width="100%" style="width:100%">
					<thead>
					<tr>
						<th>Class Name</th>
						<th>Online Class Room</th>
					</tr>
					</thead>
					<tbody>
									<?php
									$ctable=$wpdb->prefix."wpsp_class";
									$stable=$wpdb->prefix."wpsp_student";
									if( CRole::STUDENT == $objUser->getRole() ) {
									       $wpsp_classes = ( new CClasses() )->fetchClassesByStudentUserId( $objUser->getUserId() );  
									} else {
		                                  $wpsp_classes = ( new CClasses() )->fetchClassesByUserId( $objUser->getUserId() );
									}
									$sno=1;
									$teacher_table=	$wpdb->prefix."wpsp_teacher";
									$teacher_data = $wpdb->get_results("select wp_usr_id,CONCAT_WS(' ', first_name, middle_name, last_name ) AS full_name from $teacher_table order by tid");
									$teacherlist	=	array();
									if( !empty( $teacher_data ) ) {
										foreach( $teacher_data  as $value )
											$teacherlist[$value->wp_usr_id] = $value->full_name;
									}

									foreach ($wpsp_classes as $wpsp_class) {
										$cid=intval($wpsp_class->cid);


										$studentlists	=	$wpdb->get_results("select class_id, sid from $stable");
										$stl = [];
										foreach ($studentlists as $stu) {
											if(is_numeric($stu->class_id) ){
												if($stu->class_id == $cid){
												 $stl[] = $stu->sid;
											 }
											}
											else{
												 $class_id_array = unserialize( $stu->class_id );
												// print_r($class_id_array);
												 if(!empty($class_id_array)){
												 if(in_array($cid, $class_id_array)){
													 $stl[] = $stu->sid;
												 }
												}
											}
										}
										$class_students_count = count($stl);

										$teach_id= intval($wpsp_class->teacher_id);
										$teachername	=	'';
									?>
										<tr id="<?php echo intval($wpsp_class->cid);?>" class="pointer">
											<td><?php echo $wpsp_class->c_name;?></td>
											<td>
												<a target='__blank' href="<?php echo ESCHOOL_CLASS_ROOM_BASE_URL . preg_replace('/[^A-Za-z0-9\-]/', '', str_replace('-', '', $wpsp_class->c_name ) . $wpsp_class->cid ); ?>" class="wpsp-btn wpsp-btn-success">
													<?php if( CRole::STUDENT == $objUser->getRole() ) {
													    echo 'Join';
													} else {?>
														Begin
													<?php }?>
												</a>
											</td>									
										</tr>
									<?php
										$sno++;
									}
									?>
								</tbody>
				</table>
			</div>