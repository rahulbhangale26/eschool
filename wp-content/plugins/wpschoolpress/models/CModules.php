<?php

class CModules extends CModel {

    const DASHBOARD = [
        'id'                => 1,
        'title'             => 'Dashboad',
        'slug'              => 'sch-dashboard',
        'icon_class'        => 'dashicons dashicons-dashboard icon',
        'parent_module_id'  => 0,
        'has_sub_modules'   => 0,
    ];

    const TRADE = [
        'id'                => 2,
        'title'             => 'Trade Management',
        'slug'              => 'sch-trades',
        'icon_class'        => 'dashicons dashicons-admin-multisite icon',
        'parent_module_id'  => 0,
        'has_sub_modules'   => true,
    ];
    
    const TRADES = [
        'id'                => 42,
        'title'             => 'Trades',
        'slug'              => 'sch-trades',
        'icon_class'        => 'dashicons dashicons-admin-multisite icon',
        'parent_module_id'  => 2,
        'has_sub_modules'   => 0,
    ];
    
    const UNITS = [
        'id'                => 43,
        'title'             => 'Units',
        'slug'              => 'sch-units',
        'icon_class'        => 'dashicons dashicons-admin-home',
        'parent_module_id'  => 0,
        'has_sub_modules'   => 0,
        'create_new'        => 'view_create_unit'
        
    ];
      
    const STAFF = [
        'id'                => 3,
        'title'             => 'Staff Management',
        'slug'              => 'sch-teacher',
        'icon_class'        => 'dashicons dashicons-businessman icon',
        'parent_module_id'  => 0,
        'has_sub_modules'   => 0,
        'create_new'        => 'addteacher'
    ];
    
    const TRAINEES = [
        'id'                => 4,
        'title'             => 'Trainees',
        'slug'              => 'sch-student', // Using old arch for trainees TO DO- Move to new arch.
        'icon_class'        => 'dashicons dashicons dashicons-welcome-widgets-menus icon',
        'parent_module_id'  => 0,
        'has_sub_modules'   => 0,
        'create_new'        => 'addstudent'
    ];
    
    const TRAINEE_RECORD    = [
        'id'                => 5,
        'title'             => 'Trainee Record',
        'slug'              => 'sch-trainee_record',
        'icon_class'        => 'dashicons dashicons-welcome-write-blog icon',
        'parent_module_id'  => 0,
        'has_sub_modules'   => false,
        'create_new'        => 'add_record',
        'create_new_title' => 'Add Record',
        'hide_from'         => [ CDesignations::OTHER ]
    ];

    /* 
    const DAILY_DIARY = [
        'id'                => 6,
        'title'             => 'Daily Diary',
        'slug'              => 'sch-trainee_daily_diary',
        'icon_class'        => '',
        'parent_module_id'  => 5,
        'has_sub_modules'   => 0
    ];
    
    const DRAFTING_BOOK = [
        'id'                => 7,
        'title'             => 'Drafting Book',
        'slug'              => 'sch-underconstruction',
        'icon_class'        => '',
        'parent_module_id'  => 5,
        'has_sub_modules'   => 0
    ];
    
    const THEORY_FILE = [
        'id'                => 7,
        'title'             => 'Therory File',
        'slug'              => 'sch-underconstruction',
        'icon_class'        => '',
        'parent_module_id'  => 5,
        'has_sub_modules'   => 0
    ];
    
    const JOB_SHEETBOOK = [
        'id'                => 8,
        'title'             => 'Job SheetBook',
        'slug'              => 'sch-underconstruction',
        'icon_class'        => '',
        'parent_module_id'  => 5,
        'has_sub_modules'   => 0
    ];
    
    const ASSIGNMENT_BOOK = [
        'id'                => 9,
        'title'             => 'Assignment Book',
        'slug'              => 'sch-underconstruction',
        'icon_class'        => '',
        'parent_module_id'  => 5,
        'has_sub_modules'   => 0
    ];
    
    const PRACTICAL_BOOK = [
        'id'                => 10,
        'title'             => 'Practical Book',
        'slug'              => 'sch-underconstruction',
        'icon_class'        => '',
        'parent_module_id'  => 5,
        'has_sub_modules'   => 0
    ];
    
    const LEAVE_RECORD = [
        'id'                => 11,
        'title'             => 'Leave Record',
        'slug'              => 'sch-underconstruction',
        'icon_class'        => '',
        'parent_module_id'  => 5,
        'has_sub_modules'   => 0
    ]; */
    
    const INSTRUCTOR_RECORD = [
        'id'                => 12,
        'title'             => 'Instructor Record',
        'slug'              => 'sch-underconstruction',
        'icon_class'        => 'dashicons dashicons-welcome-write-blog icon',
        'parent_module_id'  => 0,
        'has_sub_modules'   => true,
    ];
    
    const SYLLABUS = [
        'id'                => 13,
        'title'             => 'Syllabus',
        'slug'              => 'sch-syllabus',
        'icon_class'        => 'dashicons dashicons-media-spreadsheet',
        'parent_module_id'  => 12,
        'has_sub_modules'   => 0,
        'create_new'        => 'view_upload_syllabus',
        'create_new_title'  => 'Upload Syllabus',
        'hide_from'         => [ CDesignations::INSTRUCTOR, CDesignations::OTHER ]
    ];
    
    const TIME_TABLE =  [
        'id'                => 14,
        'title'             => 'TimeTable',
        'slug'              => 'sch-time-table',
        'icon_class'        => 'dashicons dashicons-calendar-alt',
        'parent_module_id'  => 12,
        'has_sub_modules'   => 0,
    ];
    
    const LESSON_PLAN = [
        'id'                => 15,
        'title'             => 'Lesson Plan',
        'slug'              => 'sch-lesson_plan',
        'icon_class'        => '',
        'parent_module_id'  => 12,
        'has_sub_modules'   => 0,
        'create_new'        => 'view_upload_lesson_plan',
        'create_new_title'  => 'Upload Lesson Plan',
        'hide_from'         => [ CDesignations::OTHER ]
    ];
    
    const DEMONSTRATION_PLAN = [
        'id'                => 16,
        'title'             => 'Demonstration Plan',
        'slug'              => 'sch-demostration_plan',
        'icon_class'        => '',
        'parent_module_id'  => 12,
        'has_sub_modules'   => 0,
        'create_new'        => 'view_upload_demostration_plan',
        'create_new_title'  => 'Upload Demonstration Plan',
        'hide_from'         => [ CDesignations::OTHER ]
    ];
    
    const INSTRUCTOR_DAILY_DIARY  = [
        'id'                => 17,
        'title'             => 'Daily Diary',
        'slug'              => 'sch-daily_diary',
        'icon_class'        => '',
        'parent_module_id'  => 12,
        'has_sub_modules'   => 0,
        'create_new'        => 'add_notes',
        'create_new_title'  => 'Add Daily Entry',
        'hide_from'         => []
    ];
    
    const JOBS  = [
        'id'                => 18,
        'title'             => 'Jobs Evaluation',
        'slug'              => 'sch-jobs',
        'icon_class'        => '',
        'parent_module_id'  => 12,
        'has_sub_modules'   => 0,
        'create_new'        => 'view_add_job_form',
        'create_new_title'  => 'Add Job',
        'hide_from'         => [ CDesignations::OTHER ]
    ];
    
    const PROGRESS_CARD	= [
    	'id'                => 45,
    	'title'             => 'Progress Card',
    	'slug'              => 'sch-progress_card',
    	'icon_class'        => 'dashicons dashicons-welcome-learn-more',
    	'parent_module_id'  => 12,
    	'has_sub_modules'   => 0,
    ];
    
    const SKILL_CHART  = [
        'id'                => 19,
        'title'             => 'Skill Chart',
        'slug'              => 'sch-underconstruction',
        'icon_class'        => '',
        'parent_module_id'  => 12,
        'has_sub_modules'   => 0,
    ];
    
    const PROGRESS_CHART  = [
        'id'                => 20,
        'title'             => 'Progress Chart',
        'slug'              => 'sch-underconstruction',
        'icon_class'        => '',
        'parent_module_id'  => 12,
        'has_sub_modules'   => 0,
    ];
    
    const QUESTION_BANK  = [
        'id'                => 21,
        'title'             => 'Question Bank',
        'slug'              => 'sch-question_bank',
        'icon_class'        => 'dashicons dashicons-format-aside',
        'parent_module_id'  => 12,
        'has_sub_modules'   => 0,
        'create_new'        => 'add_question_bank',
        'create_new_title'  => 'Add Question Bank',
        'hide_from'         => []
    ];
    
    const HANDTOOL_DISTRIBUTION  = [
        'id'                => 22,
        'title'             => 'Hand Tool Distribution',
        'slug'              => 'sch-underconstruction',
        'icon_class'        => '',
        'parent_module_id'  => 12,
        'has_sub_modules'   => 0,
    ];
    
    const A_V_AIDS  = [
        'id'                => 23,
        'title'             => 'Audio Visual Aids Training',
        'slug'              => 'sch-underconstruction',
        'icon_class'        => '',
        'parent_module_id'  => 12,
        'has_sub_modules'   => 0,
    ];
    
    const PARENTS  = [
        'id'                => 24,
        'title'             => 'Parents',
        'slug'              => 'sch-parent',
        'icon_class'        => 'dashicons dashicons-groups icon',
        'parent_module_id'  => 0,
        'has_sub_modules'   => 0,
    ];
    
    const CLASSES  = [
        'id'                => 25,
        'title'             => 'Classes',
        'slug'              => 'sch-class',
        'icon_class'        => 'dashicons dashicons-welcome-widgets-menus icon',
        'parent_module_id'  => 0,
        'has_sub_modules'   => true,
    ];
    
    const SUB_CLASSES  = [
        'id'                => 26,
        'title'             => 'Classes',
        'slug'              => 'sch-class',
        'icon_class'        => '',
        'parent_module_id'  => 25,
        'has_sub_modules'   => 0,
    ];
    
    const SUBJECTS  = [
        'id'                => 27,
        'title'             => 'Subjects',
        'slug'              => 'sch-subjects-new',
        'icon_class'        => '',
        'parent_module_id'  => 25,
        'has_sub_modules'   => 0,
        'create_new'        => 'view_create_subject'
    ];
    
    const MARKS  = [
        'id'                => 28,
        'title'             => 'Marks',
        'slug'              => 'sch-marks',
        'icon_class'        => '',
        'parent_module_id'  => 25,
        'has_sub_modules'   => 0,
    ];
    
    const EXAMS  = [
        'id'                => 29,
        'title'             => 'Exams',
        'slug'              => 'sch-exams',
        'icon_class'        => '',
        'parent_module_id'  => 25,
        'has_sub_modules'   => 0,
    ];
    
/*     const TIMETABLE  = [
        'id'                => 30,
        'title'             => 'Time Table',
        'slug'              => 'sch-timetable',
        'icon_class'        => '',
        'parent_module_id'  => 25,
        'has_sub_modules'   => 0,
    ]; */
    
    const ATTENDANCE = [
        'id'                => 31,
        'title'             => 'Attendance',
        'slug'              => 'sch-attendance',
        'icon_class'        => 'dashicons dashicons-clipboard icon',
        'parent_module_id'  => 0,
        'has_sub_modules'   => true
    ];
    
    const TRAINEE_ATTENDANCE = [
        'id'                => 32,
        'title'             => 'Trainee Attendance',
        'slug'              => 'sch-trainee_attendance',
        'icon_class'        => '',
        'parent_module_id'  => 31,
        'has_sub_modules'   => 0,
        'create_new'        => 'add_trainee_attendance',
        'create_new_title'  => 'Add Attendance',
        'hide_from'         => [ CDesignations::CLERK ]
    ];
    
    const TRAINEE_ATTENDANCE_MONTHLY = [
        'id'                => 44,
        'title'             => 'Trainee Attendance Monthly',
        'slug'              => 'sch-trainee_attendance_monthly',
        'icon_class'        => '',
        'parent_module_id'  => 31,
        'has_sub_modules'   => 0
    ];
    
    const INSTRUCTOR_ATTENDANCE = [
        'id'                => 33,
        'title'             => 'Instructor Attendance',
        'slug'              => 'sch-teacherattendance',
        'icon_class'        => '',
        'parent_module_id'  => 31,
        'has_sub_modules'   => true
    ];
    
    
    const MEETING_ROOM = [
        'id'                => 34,
        'title'             => 'Meeting Room',
        'slug'              => 'sch-meetingroom',
        'icon_class'        => 'dashicons dashicons-groups icon',
        'parent_module_id'  => 0,
        'has_sub_modules'   => 0
    ];
    
    const EVENTS = [
        'id'                => 35,
        'title'             => 'Events',
        'slug'              => 'sch-events',
        'icon_class'        => 'dashicons dashicons-calendar-alt icon',
        'parent_module_id'  => 0,
        'has_sub_modules'   => 0
    ];
    
    const NOTIFY = [
        'id'                => 36,
        'title'             => 'Notify',
        'slug'              => 'sch-notify',
        'icon_class'        => 'icon wpsp-notify',
        'parent_module_id'  => 0,
        'has_sub_modules'   => 0
    ];
    
    const TRANSPORT = [
        'id'                => 37,
        'title'             => 'Transport',
        'slug'              => 'sch-transport',
        'icon_class'        => 'icon wpsp-school-bus',
        'parent_module_id'  => 0,
        'has_sub_modules'   => 0
    ];
    
    const SETTINGS = [
        'id'                => 38,
        'title'             => 'General Settings',
        'slug'              => 'sch-transport',
        'icon_class'        => 'dashicons dashicons-admin-generic',
        'parent_module_id'  => 0,
        'has_sub_modules'   => true
    ];
    
    const SUB_SETTINGS = [
        'id'                => 39,
        'title'             => 'Settings',
        'slug'              => 'sch-settings',
        'icon'              => '',
        'parent_module_id'  => 38,
        'has_sub_modules'   => 0
    ];
    
    const WORKING_HOURS = [
        'id'                => 40,
        'title'             => 'Working Hours',
        'slug'              => 'sch-settings&sc=WrkHours',
        'icon'              => '',
        'parent_module_id'  => 38,
        'has_sub_modules'   => 0
    ];
    
    const LEAVE_CALENDAR = [
        'id'                => 41,
        'title'             => 'Leave Calendar',
        'slug'              => 'sch-leavecalendar',
        'icon'              => '',
        'parent_module_id'  => 38,
        'has_sub_modules'   => 0
    ];
    
    
    
    protected $arrSlugModules;
    
    public function __construct() {
    
        $this->arrSlugModules = [
            'sch-dashboard'             => self::DASHBOARD,
            'sch-trades'                => self::TRADES,
            'sch-units'                 => self::UNITS,
            'sch-student'               => self::TRAINEES,
            'sch-subjects-new'          => self::SUBJECTS,
            'sch-attendance'            => self::ATTENDANCE,
            'sch-teacher'               => self::STAFF,
            'sch-trainee_record'        => self::TRAINEE_RECORD,
            'sch-trainee_attendance'    => self::TRAINEE_ATTENDANCE,
            'sch-trainee_attendance_monthly'    => self::TRAINEE_ATTENDANCE_MONTHLY,
            'sch-syllabus'                      => self::SYLLABUS,
            'sch-time-table'                    => self::TIME_TABLE,
            'sch-lesson_plan'                   => self::LESSON_PLAN,
            'sch-demostration_plan'             => self::DEMONSTRATION_PLAN,
            'sch-jobs'                          => self::JOBS,
       		'sch-progress_card'					=> self::PROGRESS_CARD,
            'sch-question_bank'                 => self::QUESTION_BANK,
            'sch-daily_diary'                   => self::INSTRUCTOR_DAILY_DIARY,
        ];
    
    }
       
    public function getModules() {
        global $objUser;
        
        switch ( $objUser->getRole() ){
            case CRole::ADMIN:
                return $this->getAdminModules();
                break;
                
            case CRole::TEACHER:
                return $this->getInstructorModules();
                break;
                
            case CRole::STUDENT:
                return $this->getStudentModules();
                break;
                
        } 
    }
    
    public function getSubModules( $intParentId ) {
        global $objUser;
              
        switch ( $objUser->getRole() ){
            case CRole::ADMIN:
                return $this->getAdminSubModules( $intParentId );
                break;
                
            case CRole::TEACHER:
                return $this->getInstructorSubModules( $intParentId );
                break;
                
        }
    }
    
    public function getCurrentModule( $strSlug ) {
        return ( true == isset( $this->arrSlugModules[$strSlug] ) ? $this->arrSlugModules[$strSlug] : false );
    }
 
    private function getAdminSubModules( $intParentId ) {
        $arrmixModule = [];
               
        switch ( $intParentId ) {
                
            case self::TRADE['id']:
                $arrmixModule[self::TRADES['id']]           = self::TRADES;
                $arrmixModule[self::SUBJECTS['id']]         = self::SUBJECTS;
                break;
                
            case self::INSTRUCTOR_RECORD['id']:
                $arrmixModule[self::SYLLABUS['id']]                     = self::SYLLABUS;
                $arrmixModule[self::TIME_TABLE['id']]                   = self::TIME_TABLE;
                $arrmixModule[self::LESSON_PLAN['id']]                  = self::LESSON_PLAN;
                $arrmixModule[self::DEMONSTRATION_PLAN['id']]           = self::DEMONSTRATION_PLAN;
                $arrmixModule[self::INSTRUCTOR_DAILY_DIARY['id']]       = self::INSTRUCTOR_DAILY_DIARY;
                $arrmixModule[self::JOBS['id']]                         = self::JOBS;
                $arrmixModule[self::PROGRESS_CARD]						= self::PROGRESS_CARD;
                $arrmixModule[self::SKILL_CHART['id']]                  = self::SKILL_CHART;
                $arrmixModule[self::PROGRESS_CHART['id']]               = self::PROGRESS_CHART;
                $arrmixModule[self::QUESTION_BANK['id']]                = self::QUESTION_BANK;
                $arrmixModule[self::HANDTOOL_DISTRIBUTION['id']]        = self::HANDTOOL_DISTRIBUTION;
                $arrmixModule[self::A_V_AIDS['id']]                     = self::A_V_AIDS;
                break;
                
             case self::CLASSES['id']:
                 $arrmixModule[self::SUB_CLASSES['id']]     = self::SUB_CLASSES;
                 $arrmixModule[self::SUBJECTS['id']]        = self::SUBJECTS;
                 $arrmixModule[self::MARKS['id']]           = self::MARKS;
                 $arrmixModule[self::EXAMS['id']]           = self::EXAMS;
                 $arrmixModule[self::TIMETABLE['id']]       = self::TIMETABLE;
                 break;
                 
             case self::ATTENDANCE['id']:
                 $arrmixModule[self::TRAINEE_ATTENDANCE['id']]      = self::TRAINEE_ATTENDANCE;
                 $arrmixModule[self::TRAINEE_ATTENDANCE_MONTHLY['id']]      = self::TRAINEE_ATTENDANCE_MONTHLY;
                 break;
                 
             case self::SETTINGS['id']:
                 $arrmixModule[self::SUB_SETTINGS['id']]      = self::SUB_SETTINGS;
                 $arrmixModule[self::WORKING_HOURS['id']]      = self::WORKING_HOURS;
                 $arrmixModule[self::LEAVE_CALENDAR['id']]      = self::LEAVE_CALENDAR;
                 break;
                
        }
        
        return $arrmixModule;
    }
    
    private function getInstructorSubModules( $intParentId ) {
        $arrmixModule = [];
        switch ( $intParentId ) {
                    
            case self::INSTRUCTOR_RECORD['id']:
                $arrmixModule[self::SYLLABUS['id']]                     = self::SYLLABUS;
                $arrmixModule[self::TIME_TABLE['id']]                   = self::TIME_TABLE;
                $arrmixModule[self::LESSON_PLAN['id']]                  = self::LESSON_PLAN;
                $arrmixModule[self::DEMONSTRATION_PLAN['id']]           = self::DEMONSTRATION_PLAN;
                $arrmixModule[self::INSTRUCTOR_DAILY_DIARY['id']]       = self::INSTRUCTOR_DAILY_DIARY;
                $arrmixModule[self::JOBS['id']]                         = self::JOBS;
                $arrmixModule[self::PROGRESS_CARD['id']]				= self::PROGRESS_CARD;
                $arrmixModule[self::SKILL_CHART['id']]                  = self::SKILL_CHART;
                $arrmixModule[self::PROGRESS_CHART['id']]               = self::PROGRESS_CHART;
                $arrmixModule[self::QUESTION_BANK['id']]                = self::QUESTION_BANK;
                $arrmixModule[self::HANDTOOL_DISTRIBUTION['id']]        = self::HANDTOOL_DISTRIBUTION;
                $arrmixModule[self::A_V_AIDS['id']]                     = self::A_V_AIDS;
                break;
                
            case self::TRADE['id']:
                $arrmixModule[self::TRADES['id']]           = self::TRADES;
                $arrmixModule[self::SUBJECTS['id']]         = self::SUBJECTS;
                break;
                
            case self::ATTENDANCE['id']:
                $arrmixModule[self::TRAINEE_ATTENDANCE['id']]              = self::TRAINEE_ATTENDANCE;
                $arrmixModule[self::TRAINEE_ATTENDANCE_MONTHLY['id']]      = self::TRAINEE_ATTENDANCE_MONTHLY;
                break;
                
            case self::SETTINGS['id']:
                $arrmixModule[self::SUB_SETTINGS['id']]      = self::SUB_SETTINGS;
                $arrmixModule[self::WORKING_HOURS['id']]      = self::WORKING_HOURS;
                $arrmixModule[self::LEAVE_CALENDAR['id']]      = self::LEAVE_CALENDAR;
                break;
                    
        }
        
        return $arrmixModule;
    }
    
    private function getAdminModules() {
        $arrmixModule = [
            self::DASHBOARD['id']           => self::DASHBOARD,
            self::TRADE['id']               => self::TRADE,
            self::UNITS['id']               => self::UNITS,
            self::STAFF['id']               => self::STAFF,
            self::TRAINEES['id']            => self::TRAINEES,
            self::TRAINEE_RECORD['id']      => self::TRAINEE_RECORD,
            self::INSTRUCTOR_RECORD['id']   => self::INSTRUCTOR_RECORD,
            self::ATTENDANCE['id']          => self::ATTENDANCE,
            self::MEETING_ROOM['id']        => self::MEETING_ROOM,
            self::EVENTS['id']              => self::EVENTS,
            self::NOTIFY['id']              => self::NOTIFY,
            self::TRANSPORT['id']           => self::TRANSPORT,
            self::PARENTS['id']             => self::PARENTS,
            self::SETTINGS['id']            => self::SETTINGS,
        ];
        
        return $arrmixModule;
    }
    
    private function getInstructorModules() {
        $arrmixModule = [
            self::DASHBOARD['id']           => self::DASHBOARD,
            self::TRAINEES['id']            => self::TRAINEES,
            self::ATTENDANCE['id']          => self::ATTENDANCE,
            self::TRAINEE_RECORD['id']      => self::TRAINEE_RECORD,
            self::INSTRUCTOR_RECORD['id']   => self::INSTRUCTOR_RECORD,
            self::STAFF['id']               => self::STAFF,
            self::MEETING_ROOM['id']        => self::MEETING_ROOM,
            self::EVENTS['id']              => self::EVENTS,
            self::NOTIFY['id']              => self::NOTIFY,
            self::TRANSPORT['id']           => self::TRANSPORT,
            self::TRADE['id']               => self::TRADE,
            self::UNITS['id']               => self::UNITS,
            self::PARENTS['id']             => self::PARENTS,
            self::SETTINGS['id']            => self::SETTINGS,
        ];
        
        return $arrmixModule;
    } 
    
    private function getStudentModules() {
        $arrmixModule = [
            self::DASHBOARD['id']           => self::DASHBOARD,
            self::SYLLABUS['id']            => self::SYLLABUS,
            self::QUESTION_BANK['id']       => self::QUESTION_BANK,
            self::TIME_TABLE['id']          => self::TIME_TABLE,
            self::EVENTS['id']              => self::EVENTS,
            self::PARENTS['id']             => self::PARENTS,
        ];
        
        return $arrmixModule;
    }
        
}

