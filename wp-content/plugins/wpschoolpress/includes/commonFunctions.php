<?php 
function rekeyObjects( $strKey, $arrObjects ) {
	$arrobjReKeyedObjects = [];
	foreach ( $arrObjects AS $obj ) {
		$arrobjReKeyedObjects[$obj->$strKey] = $obj;
	}
	
	return $arrobjReKeyedObjects;
}

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

class CValidations {
    
    function valObj( $objObject, $strClassName ) {
        if( false == isset( $objObject ) ) return false;
        if( false == is_object( $objObject ) ) return false;
        if( get_class($objObject) != $strClassName ) return false;
        
        return true;
    }
    
    function valArr( $arrmixValues ) {
        if( true == is_array( $arrmixValues ) && 0 < count( $arrmixValues ) ) return true;
        
        return false;
    }
    
    function valId( $intId ) {
        if( false == is_numeric( $intId ) ) return false;
        
        if( 0 >= $intId || false == filter_var( $intId, FILTER_VALIDATE_INT ) ) return false;
        
        return true;
    }
    
}
