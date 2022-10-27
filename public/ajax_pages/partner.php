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
            "profile"=>['requred'=>true],
            "password"=>['required'=>true],
            "username"=>['required'=>true]
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
        $password=input::getHash(input::get("password"));
        $username=input::get("username");
        //username check
        $usernamecheck=$database->fetch("SELECT username FROM a_users");
        $i=0;
        foreach($usernamecheck as $key => $h){
            $i++;
            $existusername=$h['username'];
        }
        if ($existusername==$username) {
            echo json_encode(["isOk"=>True,"data"=>"Username was Taken"]);
        }else {
            $query="INSERT INTO a_partner_tb (`name`, `phone`, `tin`, `place`, `email`, `c_profile`, `user_id`) VALUES ('{$name}', '{$phone}', '{$tin}', '{$place}', '{$email}', '{$profile}', '{$userid}')";
            $userquery="INSERT INTO `a_users` (`names`, `username`, `phone`, `secret`, `level`,`status`) VALUES ('{$name}', '{$username}', '{$phone}', '{$password}', 'PARTNER','active')";
            $database->beginTransaction();
            try {
                $isinserted=$database->query($query);
                $userinserted=$database->query($userquery);
                $database->commit();
                echo json_encode(["isOk"=>true,"data"=>"Partner was saved"]);
            } catch (\Throwable $th) {
                $database->rollBack();
                echo json_encode(["isOk"=>false,"data"=>"Partner was not saved".$th->getMessage()]);
            }
        }
        
        // if ($isinserted) {
        //     echo json_encode(["isOk"=>true,"data"=>"Data was Saved"]);
        // }else {
        //     echo json_encode(["isOk"=>false,"data"=>"Data was not Saved"]);
        // }
        
        break;
    
    default:
        # code...
        break;
}

?>