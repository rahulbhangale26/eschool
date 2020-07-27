<?php
// Exit if accessed directly
if ( !defined( 'ABSPATH' ) ) exit;
global $objUser;

/* This function used in wpsp_header() call this function */
function wpsp_customcss(){
  global $current_user, $wp_roles, $current_user_name;
  $current_user_role=$current_user->roles[0];
  if($current_user_role=='administrator'){
  echo "<style>
    .owncls { display:none !important;}
    .content-wrapper, .right-side, .main-footer{margin-left:0px;}
    #wpfooter{position: relative !important;}
    #adminmenumain{display:none !important;}
    #wpadminbar{display:none !important;}
    </style>";
  }else {
    echo "<style>
    .update-nag {display:none !important;}
    #wpadminbar{display:none !important;}
    #adminmenumain{display:none !important;}
    #wpcontent, #wpfooter{margin-left: 0;}
    #wpcontent{padding-left:0px;}
    #wpfooter{position: relative !important;}
    </style>";
  }
}
/* This function used Header print custom css. */
function wpsp_header(){
  echo "<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src='https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js'></script>
  <script src='https://oss.maxcdn.com/respond/1.4.2/respond.min.js'></script>
  <![endif]-->";
  echo "</head>";
  wpsp_customcss();
}
/* This function used for Topbar Return School Quote,Sologan,Number of Messages,Notification,User Photo, User basic settings. */
function wpsp_topbar(){
  global $current_user, $wpdb, $wpsp_settings_data,$post,$current_user_name;
  $loc_avatar = get_user_meta( $current_user->ID,'simple_local_avatar',true);
  $role   = isset( $current_user->roles[0] ) ? $current_user->roles[0] : '';
  $url = site_url()."/wp-content/plugins/wpschoolpress/img/wpschoolpresslogo.jpg";
  $img_url  = $loc_avatar ? $loc_avatar['full'] : WPSP_PLUGIN_URL.'img/avatar.png';
  $schoolname = isset( $wpsp_settings_data['sch_name'] ) && !empty( $wpsp_settings_data['sch_name'] ) ? $wpsp_settings_data['sch_name'] : __( 'ESchool','WPSchoolPress' );
  $imglogo  = isset( $wpsp_settings_data['sch_logo'] ) ? $wpsp_settings_data['sch_logo'] : $url;
  $schoolyear = isset( $wpsp_settings_data['sch_wrkingyear'] ) ? $wpsp_settings_data['sch_wrkingyear'] : '';
  $postname = isset( $post->post_name ) ? $post->post_name :'';
  $roles    = $current_user->roles;
  $query      = '';
  $current_user_name  = $current_user->user_login;
  if( in_array( 'teacher', $roles ) ) {
    $table  = $wpdb->prefix."wpsp_teacher";
    $query  = "SELECT CONCAT_WS(' ', first_name, middle_name, last_name ) AS full_name FROM $table WHERE wp_usr_id=$current_user->ID";
  } else if( in_array( 'student', $roles ) ) {
    $table  =   $wpdb->prefix."wpsp_student";
    $query  = "SELECT CONCAT_WS(' ', s_fname, s_mname, s_lname ) AS full_name FROM $table WHERE wp_usr_id=$current_user->ID";
  } else if( in_array( 'parent', $roles ) ) {
    $table  =   $wpdb->prefix."wpsp_student";
    $query  = "SELECT CONCAT_WS(' ', p_fname, p_mname, p_lname ) AS full_name FROM $table WHERE parent_wp_usr_id=$current_user->ID";
  }
  if( !empty( $query ) ) {
    $full_name = $wpdb->get_var( $query );
    $current_user_name  = !empty( $full_name ) ? $full_name : $current_user_name;
  }
  ?>
  <div class="wpsp-body <?php if($roles[0]=='administrator') {echo "mainadmin";}?><?php echo $postname;?>">
    <?php /*<div class="wpsp-loader"><img class="wpsp-loader-img" id="img_preview1" src="<?php echo plugins_url( 'img/wpsp-loading.png', __FILE__  ); ?>"></div>*/?>
    <div class="wpsp-preLoading">
      <div class="wpsp-bookshelf_wrapper">
        <ul class="wpsp-books_list">
          <li class="wpsp-book_item wpsp-first"></li>
          <li class="wpsp-book_item wpsp-second"></li>
          <li class="wpsp-book_item wpsp-third"></li>
          <li class="wpsp-book_item wpsp-fourth"></li>
          <li class="wpsp-book_item wpsp-fifth"></li>
          <li class="wpsp-book_item wpsp-sixth"></li>
        </ul>
        <div class="wpsp-shelf"></div>
      </div>
    </div>
    <header class='wpsp-header'>
      <a href='<?php echo site_url(); ?>' class='wpsp-logo'>
        <span class='wpsp-logo-mini'>
          <img src="<?php echo  $imglogo; ?>" class="img wpsp-school-logo" width="45px" height="40px">
        </span>
        <span class='wpsp-schoolname'><?php echo stripslashes($schoolname);?></span>
      </a>
      <div class="wpsp-head">
      <div class="wpsp-menuIcon"><span></span></div>
      <div class="wpsp-customeMsg"></div>

      <div class="wpsp-righthead">
        <div class="wpsp-head-action"></div>
        <div class="wpsp-userMain wpsp-dropdownmain ">
          <div class="wpsp-profile-pic wpsp-dropdown-toggle">
            <img src='<?php echo $img_url; ?>' class='wpsp-userPic' alt='User Image' />
            <span class="wpsp-username"><?php echo $current_user_name;?></span>
          </div>
          <div class="wpsp-dropdown">
            <ul>
              <?php if($roles[0]=='administrator') {?> <li class='wpsp-back-wp'><a href='<?php echo admin_url(); ?>'>Back to wp-admin</a></li><?php }?>
              <?php if($roles[0]!='administrator') {?><?php echo "<li class='wpsp-back-wp-editprofile'><a href='".site_url('wp-admin/admin.php?page=sch-editprofile')."'>".__('Edit Profile','WPSchoolPress')."</a></li>"; }

              echo "<li class='wpsp-back-wp-changepassword'><a href='".site_url('wp-admin/admin.php?page=sch-changepassword')."'>".__('Change Password','WPSchoolPress')."</a></li>"; ?>
              <li><a href='<?php echo wp_logout_url( site_url() );?>'>Sign out</a></li>
              <?php if ( !empty($schoolyear ) ) { ?>
                <button class="btn">Academic year <span class="badge"> <?php echo $schoolyear; ?></span></button>
              <?php } ?>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </header>
<?php
}
/* This function used for Left-Sidebar */
function wpsp_sidebar(){
	
	global $objUser;
	if(  CRole::ADMIN == $objUser->getRole() || ( CRole::TEACHER == $objUser->getRole() && true == in_array( $objUser->getTeacher()->designation_id, [ CDesignations::PRINCIPAL, CDesignations::CLERK ] ) ) ) {
		$trades 	= rekeyObjects( 'id', CTrade::getInstance()->fetchAllTrades() );
		$units		= rekeyObjects( 'id', CUnits::getInstance()->fetchAllUnits() );
		$batches	= rekeyObjects( 'id', CBatches::getInstance()->fetchAllBatches() );
	} else {
		$trades 	= rekeyObjects( 'id', CTrade::getInstance()->fetchTradesByInstructorId( $objUser->getTeacher()->tid ) );
		$units		= rekeyObjects( 'id', CUnits::getInstance()->fetchUnitByUser( $objUser ) );
		$batches	= rekeyObjects( 'id', CBatches::getInstance()->fetchBatchesByInstructorId( $objUser->getTeacher()->tid ) );
	}

	if( false == isset( $_SESSION['filter'] ) || ( false == is_numeric( $_SESSION['filter']['unit_id'] ) ) ) {
		print_r( current( $units ) );
		$objCurrentUnit = current( $units );
	}
	
	if(  true == isset( $_REQUEST['filter'] ) || true == isset( $_REQUEST['filter']['unit_id'] ) ) {
		$objCurrentUnit = $units[$_REQUEST['filter']['unit_id']];
	}
	
	if( true == is_object( $objCurrentUnit ) ) {
		$_SESSION['filter'] = [
				'unit_id' 	=> $objCurrentUnit->id,
				'batch_id'	=> $objCurrentUnit->batch_id,
				'trade_id'	=> $objCurrentUnit->trade_id ];
	}

	$filter = $_SESSION['filter'];
	
    require_once WPSP_PLUGIN_PATH . 'pages/wpsp-header.php';
}
/* This function used for Header Breadcrumb */
function wpsp_body_start() {
}
/* This function used for footer copyright section */
function wpsp_body_end()
{
  echo "<footer class='wpsp-footer'>
        </footer>
    <!-- Control Sidebar -->
    </section><!-- /.wpsp-container -->
  </div><!-- /.wpsp-wrapper -->
</div><!-- ./wrapper -->";
}
/* This function used for return footer script */
function wpsp_footer()
{
   echo "<script>
      jQuery(function($) {
        ajax_url ='".admin_url( 'admin-ajax.php' )."';
        date_format='mm/dd/yy';
        $('.content-wrapper').on('click',function(){
          $('.control-sidebar').removeClass('control-sidebar-open');
        });
        $('body').addClass('wpschoolpress');
    $('html').removeClass('wp-toolbar');
      });
    </script>";
      do_action( 'wpsp_footer_script' );
      require_once (WPSP_PLUGIN_PATH . 'includes/wpsp-popup.php');
      echo "</div>
        <div id='overlay'>
        </div>
    </body>
    </html>";
}
/* This function used for print Admin URL */
function wpsp_admin_url(){
 $admin_link = site_url('wp-admin/admin.php?page=');
    return $admin_link;
}
?>
