<?php

require("../../config/grobals.php");
// include input and validate
require("../../util/input.php");
include("../../util/validate.php");
$action=input::get("action");



switch ($action) {
    case 'ADD_LOGBOOK':
        $val=new validate();
        $val->check($_GET,[
            "lesson"=>["required"=>true],
            "description"=>["required"=>true],
            "challenge"=>['required'=>true],
            "internaship_id"=>['required'=>true],
            "suppervisor_id"=>['required'=>true],
            "partner_id"=>['required'=>true],
            // "sp_comment"=>['required'=>true],
            // "id"=>['required'=>true]
        ]);
            if(!$val->passed()){
                echo json_encode(["isOk"=>false,"data"=>implode(',',$val->errors())]); 
                exit(0);
        }

        $name=input::get("description");
        $c=input::get("challenge");
        $l=input::get("lesson");
        
        $sup=input::get("suppervisor_id");
        $partner=input::get("partner_id");
        $i=input::get("internaship_id");
        $spcomment=input::get("sp_comment");

       $query="INSERT INTO a_student_logbook(name,objective,challenges,student_id,suppervisor_id,internaship_id,partner_id,suppervisior_comment) 
       values('{$name}','{$l}','{$c}',{$_SESSION['ht_userId']},'{$sup}','{$i}','{$partner}','{$spcomment}')";
       
       $updatequery="UPDATE `a_student_logbook` SET `suppervisior_comment` = '{$spcomment}' WHERE `a_student_logbook`.`id` = 2";
    //    echo $query;
    $iscreated=$database->query($query);
       if($iscreated){
        echo json_encode(["isOk"=>true,"data"=>"Data Saved"]); 
        exit(0);
       }
       echo json_encode(["isOk"=>false,"data"=>"Data Not saved"]);
        break;
    


        case 'ADD_COMMENT':
            $val=new validate();
            $val->check($_GET,[
                // "lesson"=>["required"=>true],
                "description"=>["required"=>true],
                // "challenge"=>['required'=>true]
                // "internaship_id"=>['required'=>true],
                // "suppervisor_id"=>['required'=>true],
                // "partner_id"=>['required'=>true],
                 "sp_comment"=>['required'=>true],
                // "id"=>['required'=>true]
            ]);
                if(!$val->passed()){
                    echo json_encode(["isOk"=>false,"data"=>implode(',',$val->errors())]); 
                    exit(0);
            }
    
            $name=input::get("description");
            // $c=input::get("challenge");
            // $l=input::get("lesson");
            
            // $sup=input::get("suppervisor_id");
            // $partner=input::get("partner_id");
            $i=input::get("row_id");
            $spcomment=input::get("sp_comment");
    
          
           $updatequery="UPDATE `a_student_logbook` SET `suppervisior_comment` = '{$spcomment}' WHERE `id` = '{$i}'";
           $iscommented=$database->query($updatequery);
           if($iscommented){
            echo json_encode(["isOk"=>true,"data"=>"Data Saved"]); 
            exit(0);
           }
           echo json_encode(["isOk"=>false,"data"=>"Data Not saved"]);
           break;

    default:
     echo " action Not found";
        break;
}

/*
switch ($action) {
    case 'ADD_LOGBOOK':
        $val=new validate();
        $val->check($_GET,[
         "lesson"=>["required"=>true],
         "description"=>["required"=>true],
         "challenge"=>['required'=>true]]);
         if(!$val->passed()){
             echo json_encode(["isOk"=>false,"data"=>implode(',',$val->errors())]); 
             exit();
         }
        //  echo json_encode(["isOk"=>true,"data"=>$_REQUEST]);
     $formData=[
         "name"=>$_GET['description'],
         "objective"=>$_GET['lesson'],
         "challenges"=>$database->escape_value($_GET['challenge']),
         "student_id"=>$_SESSION['ht_userId'],
         "suppervisor_id"-=>1,
         "internaship_id"=>1,
         "partner_id"=>1
     ];
     $isUserInserted=$database->insert("a_student_logbook",$formData);
     if($isUserInserted){
         echo json_encode(["isOk"=>true,"data"=>"Message here"); 
     }else{
         echo json_encode(["isOk"=>false,"data"=>"Message here"]);
     }

        break;
    
    default:
        # code...
        break;
}
 */