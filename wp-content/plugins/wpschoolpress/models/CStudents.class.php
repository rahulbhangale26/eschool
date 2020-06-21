<?php

class CStudents extends CModel {
    
    public $strTableName;
    
    public function __construct() {
        parent::__construct();
        $this->strTableName = $this->strTablePrefix . 'wpsp_student';
    }
    
    public function fetchAllStudents() {
        return $this->objDatabase->get_results( 'SELECT * FROM ' . $this->strTableName );
    }
    
    public function fetchStudentsByBatchId( $intBatchId ) {
         $strSql = 'SELECT 
                        s.*,
                        u.user_email
                    FROM ' .$this->strTableName . ' s
                        JOIN ' . $this->strTablePrefix . 'users u ON u.id = s.wp_usr_id
                    WHERE 1 = 1';
        
        $strSubWhere = '';
        
        if( false == is_null( $intBatchId ) && false != $intBatchId ) {
            $strSubWhere = ' AND batch_id = ' . ( int ) $intBatchId;
        }
        
        return $this->objDatabase->get_results( $strSql . $strSubWhere );
    }
    
    public function fetchStudentsByUserIdByBatchId( $intUserId, $intBatchId ) {
       $strSql = 'SELECT
                       DISTINCT s.*, u.user_email
                    FROM ' . $this->strTableName . ' s
                        JOIN ' . $this->strTablePrefix . 'wpsp_subject sb ON s.class_id LIKE CONCAT( \'%\', sb.class_id , \'%\' )
                        JOIN ' . $this->strTablePrefix . 'users u ON u.id = s.wp_usr_id
                    WHERE
                        sb.sub_teach_id = ' . ( int ) $intUserId . '';
       
       $strSubWhere = '';
       
       if( false == is_null( $intBatchId ) && false != $intBatchId  ) {
           $strSubWhere = ' AND s.batch_id = ' . ( int ) $intBatchId;
       }

       return $this->objDatabase->get_results( $strSql . $strSubWhere );
                
    }
    
    public function fetchStudentsByClassId( $intClassId ) {
        $strSql = 'SELECT
                        s.*
                    FROM ' . $this->strTableName . ' s
                    WHERE
                        s.class_id LIKE CONCAT ( \'%\', \'' . ( int ) $intClassId . '\', \'%\' )';
        
        return $this->objDatabase->get_results( $strSql );
    }
    
    public function fetchStudentByFilters( $arrmixFilters ) {
        global $objUser;
        if( true == isset( $arrmixFilters['role'] ) ) {
            switch ( $arrmixFilters['role'] ) {
                case CRole::TEACHER:
                    
                    if( CDesignations::CLERK == $objUser->getTeacher()->designation_id  || CDesignations::PRINCIPAL == $objUser->getTeacher()->designation_id  ) {
                        return $this->fetchStudentsByBatchId( $arrmixFilters[ 'batch_id' ] );
                    }
                    
                    return $this->fetchStudentsByUserIdByBatchId($arrmixFilters[ 'user_id' ] , $arrmixFilters[ 'batch_id' ] );
                    break;
                    
                case CRole::ADMIN:
                   return $this->fetchStudentsByBatchId( $arrmixFilters[ 'batch_id' ] );
                    break;
            }
        }
    }
}

