<?php 
require("../../../config/grobals.php");
// include input and validate
require("../../../util/input.php");
include("../../../util/validate.php");
$action=input::enc_dec("d",input::get("faction"));
if(!isset($_SESSION)){
    session_start();
}
switch ($action) {
case 'EDIT_USER_INFO':
            // get hote code,Ymd
            if(!isset($_SESSION['ht_userId'])){
                echo json_encode(["isOk"=>false,"data"=>"Access denied"]); 
                exit();
            }
            // check if it is system,manager
            if(!in_array($_SESSION['ht_level'],['ADMIN','INST_ADMIN']) ){
                echo json_encode(["isOk"=>false,"data"=>"Access denied; please contact  admin"]); 
                exit(); 
            }
            $val=new validate();
            $val->check($_POST,[
             "names"=>['required'=>true,"max"=>50],
             "user_level"=>['required'=>true],
             "user_status"=>['required'=>true],
             "phone"=>['required'=>true,"number"=>true,"max"=>16],
             ]);
             if(!$val->passed()){
                 echo json_encode(["isOk"=>false,"data"=>implode(',',$val->errors())]); 
                 exit();
             }
             $login_level=$_SESSION['ht_level'];
             // $instId=in_array($login_level,['ADMIN','INST_ADMIN'])?$_SESSION['ht_hotel']:input::get("institition");
             $userData=[
             "names"=>$database->escape_value($_POST['names']),
             "level"=>$_POST['user_level'],
             "status"=>$_POST['user_status'],
             "phone"=>$_POST['phone']
         ];
         if(in_array($_POST['user_level'],['INST_ADMIN','BEN_ADMIN'])){
            // check if insti was selected
            if(!isset($_POST['institition']) || empty($_POST['institition'])){
                echo json_encode(["isOk"=>false,"data"=>'Please select institition or beneficiary']); 
                exit();
            }
            $userData['institition_id']=$_POST['user_level']=="INST_ADMIN"?$_POST['institition']:$_SESSION['ht_hotel'];
            $userData['ben_id']=$_POST['user_level']=="BEN_ADMIN"?$_POST['institition']:0;
            if($login_level=="ADMIN" && $_POST['user_level']=="BEN_ADMIN"){
                $userData['ben_id']=$_POST['beneficiary'];
                $userData['institition_id']=$_POST['institition'];
            }
        }else{
            $userData['institition_id']= $_SESSION['ht_hotel'];
        }
        $userId=input::get("user_id");
        $isUserInserted=$database->update("a_users","id=$userId",$userData);
        if($isUserInserted){
            echo json_encode(["isOk"=>true,"data"=>input::get("names") ." Account has been changed"]); 
        }else{
            echo json_encode(["isOk"=>false,"data"=>input::get("names") ." Failed to be changed please try again"]);
        }
    break;
    case 'CREATE_NEW_USER':
        // get hote code,Ymd
        if(!isset($_SESSION['ht_userId'])){
            echo json_encode(["isOk"=>false,"data"=>"Access denied"]); 
            exit();
        }
        // check if it is system,manager
        if(!in_array($_SESSION['ht_level'],['ADMIN','INST_ADMIN']) ){
            echo json_encode(["isOk"=>false,"data"=>"Access denied; please contact  admin"]); 
            exit(); 
        }
        $val=new validate();
       $val->check($_POST,[
        "user_name"=>["required"=>true,"max"=>30,"unique"=>["table"=>"a_users","column"=>'username']],
        "names"=>['required'=>true,"max"=>50],
        "pswd"=>['required'=>true,"min"=>4],
        "user_level"=>['required'=>true],
        "user_status"=>['required'=>true],
        "phone"=>['required'=>true,"number"=>true,"max"=>16],
        ]);
        if(!$val->passed()){
            echo json_encode(["isOk"=>false,"data"=>implode(',',$val->errors())]); 
            exit();
        }
        $login_level=$_SESSION['ht_level'];
        // $instId=in_array($login_level,['ADMIN','INST_ADMIN'])?$_SESSION['ht_hotel']:input::get("institition");
        $userData=[
        "names"=>$database->escape_value($_POST['names']),
        "username"=>$database->escape_value($_POST['user_name']),
        "level"=>$_POST['user_level'],
        "secret"=>input::getHash($_POST['pswd']),
        "status"=>$_POST['user_status'],
        "phone"=>$_POST['phone']
    ];
    if(in_array($_POST['user_level'],['INST_ADMIN','BEN_ADMIN'])){
        // check if insti was selected
        if(!isset($_POST['institition']) || empty($_POST['institition'])){
            echo json_encode(["isOk"=>false,"data"=>'Please select institition or beneficiary']); 
            exit();
        }
        $userData['institition_id']=$_POST['user_level']=="INST_ADMIN"?$_POST['institition']:$_SESSION['ht_hotel'];
        $userData['ben_id']=$_POST['user_level']=="BEN_ADMIN"?$_POST['institition']:0;
        if($login_level=="ADMIN" && $_POST['user_level']=="BEN_ADMIN"){
            $userData['ben_id']=$_POST['beneficiary'];
            $userData['institition_id']=$_POST['institition'];
        }
    }else{
        $userData['institition_id']= $_SESSION['ht_hotel'];
    }

    $isUserInserted=$database->insert("a_users",$userData);
    if($isUserInserted){
        echo json_encode(["isOk"=>true,"data"=>input::get("names") ." Account has been created"]); 
    }else{
        echo json_encode(["isOk"=>false,"data"=>input::get("names") ." Failed to be created please try again"]);
    }
       
        break;
    default:
        echo json_encode(["isOk"=>false,"data"=>"action".$action.'  not found']);
        break;
}
?>