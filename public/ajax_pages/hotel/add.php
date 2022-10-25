<?php 
require("../../../config/grobals.php");
// include input and validate
require("../../../util/input.php");
include("../../../util/validate.php");
$action=input::enc_dec("d",input::get("faction"));
switch ($action) {
    case 'CREATE_HOTEL':
        // get hote code,Ymd
        $val=new validate();
    $val->check($_POST,[
        "user_name"=>["required"=>true,"max"=>30,"unique"=>["table"=>"a_users","column"=>'username']],
        "admin_names"=>['required'=>true,"max"=>50],
        "pswd"=>['required'=>true,"min"=>4],
        "hotel_name"=>['required'=>true],
        "hotel_location"=>['required'=>true],
        "contact_names"=>['required'=>true],
        'contact_phone'=>['required'=>true],
        "hotel_trial"=>["required"=>true,"max"=>90,"number"=>true,"min"=>1]
        ]);
        if(!$val->passed()){
            echo json_encode(["isOk"=>false,"data"=>implode(',',$val->errors())]); 
            exit();
        }
        // get hotel code
        $lastCode=$database->get("h_id","a_hotels","1 ORDER BY id DESC");
        $lc=isset($lastCode->h_id)?$lastCode->h_id:0;
        $nextCode=$database->getNextCode($lc);
        $token=$nextCode.'__'.input::add_days_to_date(date('Y-m-d h:i:s'),$_POST['hotel_trial']);
        $formData=[
        "h_id"=>$nextCode,
        "h_name"=>$database->escape_value($_POST['hotel_name']),
        "h_location"=>$database->escape_value($_POST['hotel_location']),
        "h_contact"=>$database->escape_value($_POST['contact_names']),
        "h_phone"=>$database->escape_value($_POST['contact_phone']),
        "h_user_id"=>1,
        "h_token"=>input::enc_dec("e",$token),
        "h_status"=>$_POST['hotel_status']
    ];
    $userData=[
        "names"=>$database->escape_value($_POST['admin_names']),
        "username"=>$database->escape_value($_POST['user_name']),
        "level"=>"MANAGER",
        "secret"=>input::getHash($_POST['pswd']),
        "status"=>$_POST['hotel_status'],
    ];
    try {
        $isInserted=$database->insert("a_hotels",$formData);
        if($isInserted){
          $userData["hotel_code"]=$isInserted;
          $isUserInserted=$database->insert("a_users",$userData);
          if($isUserInserted){
              echo json_encode(["isOk"=>true,"data"=>input::get("hotel_name") ." registered successfully"]); 
          }else{
              // remove registered hotel
              $database->query("DELETE FROM a_hotels where id=$isInserted");
              echo json_encode(["isOk"=>false,"data"=>input::get("hotel_name") ." Failed to be registered please try again"]);
          }
        }else{
          echo json_encode(["isOk"=>false,"data"=>input::get("hotel_name") ." Failed to be registered please try again"]);
        }
    } catch (\Throwable $e) {
        echo json_encode(["isOk"=>false,"data"=>$e->getMessage()]);
    }

       
        break;
    default:
        echo json_encode(["isOk"=>false,"data"=>"action".$action.'  not found']);
        break;
}
?>