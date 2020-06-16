<?php
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
?>