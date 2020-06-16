<div class="wpmobi">
    <div class="container">
        <h1>Build & Publish</h1>
        <div class="pane">
            <?php require_once WP_MOBI_PATH . 'admin_panel/views/messages.php' ?>

                <?php
                    if( true == is_null( $wp_mobi_option->getBuildRequestedOn() ) && true == is_null( $wp_mobi_option->getBuildCompletedOn() ) ) {
                        ?>
                            <div class="welcome-panel horizontal-center">
                                <h2>Welcome to WpAndro App Builder.</h2>
                                <p class="about-description">We build and publish app for you.</p>
                                <div class="welcome-panel-row">
                                    <h2>Get Started.</h2>
                                    <a href="<?php echo $links['request_build']; ?>" class="button button-primary button-hero load-customize hide-if-no-customize">Start Building App</a>
                                </div>
                            </div>
                        <?php
                    } else if( false == is_null( $wp_mobi_option->getBuildRequestedOn() ) && true == is_null( $wp_mobi_option->getBuildCompletedOn() ) ) {
                        ?>
                            <div class="welcome-panel horizontal-center">
                                <h2>Welcome to WpAndro App Builder.</h2>
                                <p class="about-description">We build and publish app for you.</p>
                                <div class="welcome-panel-row">
                                     <h2>Build Requested.</h2>
                                     <div class="loader-center">
                                         <div class="loader"></div>
                                     </div>
                                     <p class="about-description">We are building your app may take 24 hours to process. We will be informing you using email.</p>
                                </div>
                            </div>
                        <?php
                    } else if( false == is_null( $wp_mobi_option->getBuildRequestedOn() ) && false == is_null( $wp_mobi_option->getBuildCompletedOn() ) ) {
                        ?>
                            <div class="welcome-panel">
                                <div class="welcome-panel-row">
                                    <div class="build-download">
                                        <h2>Build Completed.</h2>
                                        <div class="padding-10">
                                            <a href="<?php echo esc_url( $wp_mobi_option->getDownloadLink() ) ?>" class="buttonDownload">Download</a>
                                        </div>
                                        <p class="about-description">You can download a app and upload into your android device to test it.</p>
                                    </div>
                                    <div class="build-publish">
                                        <div id="accordion">
                                            <h3>Free Publish</h3>
                                            <div>
                                                <p>
                                                    You can publish the app using shortcode [wp_mobi]. Just add this shortcode in your pages and widgets and your users can download your app.
                                                </p>
                                            </div>
                                            <h3>Paid Publish</h3>
                                            <div>
                                                <p>
                                                    We will publish your app on the Google Play store at a minimal cost of 30 USD. Please drop us a email at <a href="mailto:contact@wpandro.com">contact@wpandro.com</a>.
                                                    <br><br><i>We are working on automated process. Appologies for the inconvinence caused.</i>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <?php
                    }
                ?>
        </div>
    </div>
</div>
<script>
    var wpmobiIcons = {
        header: "wpmobi-plus",
        activeHeader: "wpmobi-minus"
    }

    jQuery( function() {
        jQuery( ".wpmobi #accordion" ).accordion( { icons: wpmobiIcons } );
    } );
</script>