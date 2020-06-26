<?php 
function ordinal($number) {
    $ends = array('th','st','nd','rd','th','th','th','th','th','th');
    if ((($number % 100) >= 11) && (($number%100) <= 13))
        return $number. 'th';
        else
            return $number. $ends[$number % 10];
}

function displaySuccessMsg( $arrstrSuccessMessage ) {
    if( true == is_array( $arrstrSuccessMessage ) ) { echo '<div class="success_msg_div"><span class="success_msg_span">' . implode(', ', $arrstrSuccessMessage) . '</span></div>'; }
}

function displayErrorMsg( $arrstrErrorMessage ) {
    if( true == is_array( $arrstrErrorMessage ) ) { echo '<div class="error_msg_div"><span class="error_msg_span">' . implode(', ', $arrstrErrorMessage ) . '</span></div>'; }
}

