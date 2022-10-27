<?php
require("../../config/grobals.php");
// include input and validate
require("../../util/input.php");
include("../../util/validate.php");
$action=input::get("action");

switch ($action) {
    case 'ADD_PARTNER':
        //validating
        $val=new validate();
        $val->check($_GET, [
            "name"=>['requred'=>true],
            "email"=>['requred'=>true],
            "place"=>['requred'=>true],
            "phone"=>['requred'=>true],
            "tin"=>['requred'=>true],
            "profile"=>['requred'=>true]
        ]);

        if(!$val->passed()){
            echo json_encode(["isOk"=>false,"data"=>implode(',',$val->errors())]);
            exit(0);
        }
        $userid=$_SESSION['ht_userId'];
        $name=input::get("name");
        $email=input::get("email");
        $place=input::get("place");
        $phone=input::get("phone");
        $tin=input::get("tin");
        $profile=input::get("profile");
        $query="INSERT INTO a_partner_tb (`name`, `phone`, `tin`, `place`, `email`, `c_profile`, `user_id`) VALUES ('{$name}', '{$phone}', '{$tin}', '{$place}', '{$email}', '{$profile}', '{$userid}')";
        
        
        $isinserted=$database->query($query);
        if ($isinserted) {
            echo json_encode(["isOk"=>true,"data"=>"Data was Saved"]);
        }else {
            echo json_encode(["isOk"=>false,"data"=>"Data was not Saved"]);
        }
        
        break;
    
    default:
        # code...
        break;
}

?>