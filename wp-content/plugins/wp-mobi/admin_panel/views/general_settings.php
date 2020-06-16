<div class="wpmobi">
    <div class="container">
        <h1>General Settings</h1>
        <div class="pane">
            <?php require_once WP_MOBI_PATH . 'admin_panel/views/messages.php' ?>
            <div class="wrap">
                <form action="<?php echo $links['save_general_settings']; ?>" method="post" >
                    <table class="form-table">
                        <tr>
                            <th>App Name:</th>
                            <td>
                                <input type="text" name="wp_mobi[app_name]" class="regular-text" value="<?php echo $wp_mobi_option->getAppName(); ?>">
                                <p class="description" id="tagline-description">The name of your android application.</p>
                            </td>
                        </tr>
                        <tr>
                            <th>App Key:</th>
                            <td>
                                <input type="text" name="wp_mobi[app_key]" class="regular-text" value="<?php echo $wp_mobi_option->getAppKey(); ?>">
                                <p class="description" id="tagline-description">App Key obtained from WpAndro.com. <a target="_blank" href="https://wpandro.com/how-to-obtain-app-key-and-secret-key-for-wpmobi/">How to get your own App/Secret Key?</a> </p>
                            </td>
                        </tr>
                        <tr>
                            <th>Secret Key:</th>
                            <td>
                                <input type="text" name="wp_mobi[secret_key]" class="regular-text" value="<?php echo $wp_mobi_option->getSecretKey(); ?>">
                                <p class="description" id="tagline-description">Secret Key obtained from WpAndro.com, Do not share this with anyone else.</p>
                            </td>
                        </tr>
                        <tr>
                        	<th>Launcher Icon:</th>
                        	<td>
                        		<div>
                        			<div>
                        				<img src="<?php echo wp_get_attachment_image_url( $wp_mobi_option->getLauncherIconId(), 'thumbnail', true ); ?>" width="40" height="40" id="launcher_icon_priview" />
                        			</div>
                        			<div>
                        				<input type="hidden" name="wp_mobi[launcher_icon_id]" id="launcher_icon_id" value="<?php echo $wp_mobi_option->getLauncherIconId(); ?>" class="regular-text" />
										<input type='button' class="button-primary" value="Select a Launcher Icon" id="launcher_icon_media_manager"/>
										<p class="description" id="tagline-description">Upload launcher icon with size 512 x 512 for better performance.</p>
                        			</div>
                        		</div>
                        	</td>
                        </tr>
                    </table>
                    <p class="submit"><input type="submit" name="submit" id="submit" class="button button-primary" value="Save Changes"></p>
                </form>
            </div>
        </div>
    </div>
</div>