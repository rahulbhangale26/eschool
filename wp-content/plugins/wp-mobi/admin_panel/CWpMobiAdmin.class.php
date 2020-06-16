<?php
class CWpMobiAdmin extends CCore {
    protected $objWpMobiOption;

    public function __construct() {

        parent::__construct();
        add_action( 'admin_init', [ $this, 'run' ] );
        add_action( 'admin_menu', [ $this, 'addSettingPage' ] );
        add_action( 'admin_enqueue_scripts', [ $this, 'enqueueStylesheets' ] );

        $this->strSelectedTab = $this->getRequestData( [ 'tab' ] );
        if( false == isset( $this->strSelectedTab ) ) {
            $this->strSelectedTab = 'general_settings';
        }
    }

    public function initialize() {
        $this->objWpMobiOption = new CWpMobiOption();
    }

    public function enqueueStylesheets() {

        if( 'wp_mobi' != sanitize_text_field( $_GET['page'] ) ) return false;

        wp_enqueue_script('jquery-ui-accordion');
        wp_register_style( 'wpmobi_admin_style', WP_MOBI_URL . 'admin_panel/assets/wpmobi_admin_styles.css' );
        wp_register_style( 'wpmobi_jquery_style', WP_MOBI_URL . 'admin_panel/assets/libs/jquery-ui.min.css' );
        wp_enqueue_style( 'wpmobi_jquery_style' );
        wp_enqueue_style( 'wpmobi_admin_style' );
    }

    public function execute() {

    }

    public function loadLinks() {
        $this->arrstrLinks['wp_mobi']           = WP_MOBI_ADMIN_URL;
        $this->arrstrLinks['general_settings']  = WP_MOBI_ADMIN_URL . '&tab=general_settings';
        $this->arrstrLinks['view_build_and_publish']  = WP_MOBI_ADMIN_URL . '&tab=view_build_and_publish';
    }

    public function loadTabs() {
        $this->arrstrTabs['general_settings'] = 'General';

        if( true == $this->objWpMobiOption->getIsOptionExists() ) {
            $this->arrstrTabs['view_build_and_publish'] = 'Build & Publish';
        }
    }

    public function setRenderTemplate($strTemplatePath, $arrmixTemplateVars, $boolIsNavInclude = false ) {
        parent::setRenderTemplate($strTemplatePath, $arrmixTemplateVars, $boolIsNavInclude);

        $this->objTemplate->setNavPath( 'admin_panel/views/nav_tabs.php' );
    }

    public function addSettingPage() {
        add_menu_page('Wp Mobi Settings', 'Wp Mobi', 'administrator', 'wp_mobi', [ $this, 'renderTemplate' ] );
    }


}