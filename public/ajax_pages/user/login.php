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
    case 'ADMIN_LOGIN':
        // get hote code,Ymd
        $val=new validate();
    $val->check($_POST,[
        "user_name"=>["required"=>true,"max"=>30],
        "password"=>['required'=>true,"min"=>4]
        ]);
        if(!$val->passed()){
            echo json_encode(["isOk"=>false,"data"=>implode(',',$val->errors())]); 
            exit();
        }
        // get hotel 
        $uname=$database->escape_value(input::get('user_name'));
        $pswd=input::get("password");
        $u=$database->get("*","a_users","username='$uname' AND status='active'");
        if(!isset($u->id)){
            echo json_encode(["isOk"=>false,"data"=>'Login failed']); 
            exit();  
        }
        if(!password_verify($pswd,$u->secret)){
            echo json_encode(["isOk"=>false,"data"=>'Login failed']); 
            exit();  
        }
        // check if it is supplier account
        if($u->level=="SUP_ADMIN"){
            $supp=$database->get("is_active","a_partner_tb","id=$u->institition_id");
            
        }
        // store data
        $ip=input::getClientIp();
        $_SESSION['ht_userId']=$u->id;
        $_SESSION['ht_level']=$u->level;
        $_SESSION['ht_hotel']=$u->institition_id;
        $_SESSION['ht_name']=$u->names;
        $_SESSION['ht_ben']=$u->ben_id;
        $_SESSION['ht_ip']=input::getClientIp();
        // update client ip
        $database->update("a_users","id={$u->id}",["a_ip"=>$ip,"updated_at"=>input::getCurrentDateTime()]);
        echo json_encode(["isOk"=>true,"data"=>'success']); 
        break;
    default:
        echo json_encode(["isOk"=>false,"data"=>"action".$action.'  not found']);
        break;
}
?>