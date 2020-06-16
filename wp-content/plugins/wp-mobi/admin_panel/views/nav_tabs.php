<h2 class="nav-tab-wrapper">
    <?php
        foreach ( $nav_tabs AS $nav_tab => $nav_tab_name) {
            echo '<a href="' . $links[$nav_tab] . '" class="nav-tab ' . ( $nav_tab == $selected_tab ? 'nav_tab_active' : '' ) . '">' . $nav_tab_name . '</a>';
        }
    ?>
</h2>