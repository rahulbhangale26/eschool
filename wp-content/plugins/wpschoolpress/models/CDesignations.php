<?php

class CDesignations extends CModel {
    
    const PRINCIPAL     = 1;
    const CLERK         = 2;
    const INSTRUCTOR    = 3;
    const OTHER         = 4;
    
    public $arrstrDesignations = [
        1       => 'Principal',
        2       => 'Clerk',
        3       => 'Instructor',
        4       => 'Other'
    ];
    
}

