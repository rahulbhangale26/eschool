<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src='https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js'></script>
  <script src='https://oss.maxcdn.com/respond/1.4.2/respond.min.js'></script>
  <![endif]-->
</head>

<?php
$objModules     = new CModules();
global $objUser;

/** No need for new arch */
if( false == isset( $slug_module ) ) {
    $slug_module = $_REQUEST['page'];
}

$arrstrCurrentModule = $objModules->getCurrentModule( $slug_module );

function ewpsp_customcss(){
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

    ewpsp_customcss();
    wpsp_topbar();
    //wpsp_sidebar();
    // wpsp_body_start();
    
    
?>

<div class='wpsp-overlay'></div>
<aside class='wpsp-sidebar ifnotadmin'>
	<div class='sidebarScroll'>
		<ul class='wpsp-navigation'>
			<?php foreach ( $objModules->getModules() AS $arrstrModule ) { ?>
    			<li class='<?php echo ( $slug_module == $arrstrModule['slug'] || $arrstrModule['id'] == $arrstrCurrentModule['parent_module_id'] ? 'active' : '' ); ?> <?php echo ( true == $arrstrModule['has_sub_modules'] ) ? 'has-submenu' : ''; ?>'>
    				<?php echo ( true == $arrstrModule['has_sub_modules'] ) ? '<span class="wpsp-droparrow"></span>' : ''; ?>
        			<a href='<?php echo site_url( '/wp-admin/admin.php?page=' . $arrstrModule['slug'] ); ?>'>
        	  			<i class='<?php echo $arrstrModule['icon_class']; ?>'></i>
        	  			<span><?php echo $arrstrModule['title']; ?></span>
        	  		</a>
        	  		<?php if( true == $arrstrModule['has_sub_modules'] ) {      	  		    
        	  		       $arrsubModules = $objModules->getSubModules( $arrstrModule['id'] );
        	  		       echo '<ul class="sub-menu">';
        	  		       foreach( $arrsubModules AS $arrstrSubModule ) {
                                ?>
                                <li class="<?php echo ( $slug_module == $arrstrSubModule['slug'] || $arrstrSubModule['id'] == $arrstrCurrentModule['parent_module_id'] ? 'active' : '' ); ?>" >
                                    <a href="<?php echo site_url( '/wp-admin/admin.php?page=' . $arrstrSubModule['slug'] ); ?>"><?php echo $arrstrSubModule['title']; ?></a>
                                </li>
                                <?php 
                           }
        	  		    echo '</ul>'; 
        	  		} ?>
        	  	</li>
			<?php } ?>
		</ul>
	</div>
</aside>

<div class="wpsp-wrapper">
	<section class="wpsp-container">
    	<div class="wpsp-pageHead">
        	<h1 class="wpsp-pagetitle"><?php echo $arrstrCurrentModule['title'] ?></h1>
        	<div class="wpsp-right">
          		<ol class="wpsp-breadcrumb"> 
          			<div class=""></div>
          			<li>
          				<a href="<?php echo site_url( '/wp-admin/admin.php?page=dashboard' ); ?>">Dashboard</a>
          			</li>
          			<?php 
              			if( true == isset( $arrstrCurrentModule['id'] ) && 1 != $arrstrCurrentModule['id'] ) { 
              		?>
          				<li>
          					<a href="<?php echo site_url( '/wp-admin/admin.php?page=' . $arrstrCurrentModule['slug'] ); ?>">
          						<span class="active"><?php echo $arrstrCurrentModule['title']; ?></span>
          					</a>
          				</li>
          			<?php } ?>
          		</ol>
          		<?php if( true == isset( $arrstrCurrentModule['create_new' ] ) && (  true == isset( $arrstrCurrentModule['hide_from'] ) && false == in_array( $objUser->getTeacher()->designation_id, $arrstrCurrentModule['hide_from'] ) && CRole::TEACHER == $objUser->getRole() )  ) { ?>
          			<a class="wpsp-btn" href="<?php echo site_url( 'wp-admin/admin.php?page=' . $arrstrCurrentModule['slug']. '&page_action=' .  $arrstrCurrentModule['create_new'] ); ?>" >
          				<?php echo ( true == isset( $arrstrCurrentModule['create_new_title'] ) ? $arrstrCurrentModule['create_new_title'] : 'Create New' ); ?>
          			</a>
          		<?php } ?>
          	</div>
      	</div>