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

function numberToRoman( $intNum ) {
    // Be sure to convert the given parameter into an integer
    $n = intval( $intNum );
    $result = '';
    
    // Declare a lookup array that we will use to traverse the number:
    $lookup = array(
        'M' => 1000, 'CM' => 900, 'D' => 500, 'CD' => 400,
        'C' => 100, 'XC' => 90, 'L' => 50, 'XL' => 40,
        'X' => 10, 'IX' => 9, 'V' => 5, 'IV' => 4, 'I' => 1
    );
    
    foreach ( $lookup as $roman => $value ) {
        // Look for number of matches
        $matches = intval( $n / $value );
        
        // Concatenate characters
        $result .= str_repeat( $roman, $matches); 
        
        // Substract that from the number
        $n = $n % $value;
    }
    
    return $result;
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
