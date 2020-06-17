<?php

function _t( $strText ) {
    $arrmixTranslations = [
        'teacher'   => 'instructor',
        'Teacher'   => 'Instructor',
        'teachers'  => 'instructors',
        'Teachers'  => 'Instructors',
        'Teacher Code'  => 'Instructor Code',
        'Teacher Name'  => 'Instructor Name',
        'All Teachers'  => 'All Instructors',
        'Teacher Incharge'  => 'Instructor Incharge',
        'Teachers Attendance'   => 'Instructors Attendance',
        'Class Teacher Name'    => 'Class Instructor Name',
        'Teacher Email'         => 'Instructor Email',
        'Class Teacher'         => 'Class Instructor',
        'Class Teachers'        => 'Class Instructors',
        'Subject Teacher'       => 'Subject Instructor',
        'Select Teacher'        => 'Select Instructor',
        'Select Teachers'       => 'Select Instructors',
        'Teacher Email'         => 'Instructor Email',
        'Teacher Attendance'    => 'Instructor Attendance',
        'Teacher\'s Details'    => 'Instructor\'s Details',
        'TeacherAttendance'     => 'InstructorAttendance',
        'Teacher Registration Confirmation'     => 'Instructor Registration Confirmation',
        'Teacher not available. Please try again!'  => 'Instructor not available. Please try again!',
        'Internal(Show to teachers only)' => 'Internal(Show to instructors only)',
        'No Child Added, Please contact teacher/admin to add your child' => 'No Child Added, Please contact instructor/admin to add your child'
    ];
    
    return __( $arrmixTranslations[$strText], 'WPSchoolPress' );
}