<?php
foreach (glob(WPSP_PLUGIN_PATH . "framework/*.php") AS $strFile) {
    require_once $strFile;
}

require_once WPSP_PLUGIN_PATH . 'modules/path.defines.php';
    
if( isset( $_REQUEST['page'] ) && true == isset( $arrstrModules[$_REQUEST['page']] ) ) {
    require_once $arrstrModules[$_REQUEST['page']];
} else {
    echo '404';
    exit;   
}