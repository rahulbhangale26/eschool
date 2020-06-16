<div class=" <?php echo ( true == isset( $error_msgs ) || true == isset( $success_msg ) ) ? 'show' : 'hide' ?> ">
    <?php
        foreach ( ( array ) $error_msgs AS $error_msg ) {
            if( true == isset( $error_msg ) ) echo '<p class="padding-10 notice notice-error">' . $error_msg . '</p>';
        }
    ?>
    <?php
        foreach ( ( array ) $success_msgs AS $success_msg ) {
            if( true == isset( $success_msg ) ) echo '<p class="padding-10 notice notice-success">' . $success_msg . '</p>';
        }
    ?>
</div>