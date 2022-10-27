<?php 
require("../../config/grobals.php");
// include input and validate
require("../../util/input.php");
include("../../util/validate.php");
$action=input::get("action");
if(!isset($_SESSION)){
    session_start();
}
switch ($action) {
    case 'GET_PARTNER_FOR_MAJOR_IN':
        $userID=$_SESSION['ht_userId'];
        $intern=input::get("inter");
        $major=input::get("major");
        // get all partners whose requested major and number
        $allP=$database->fetch("SELECT request_student_number,partner_id,given_student_number FROM a_partner_student_request WHERE internaship_id=$intern AND major_in='$major' GROUP BY partner_id");
        $partnerIds=[];
        foreach ($allP as $key => $p) {
            if($p["request_student_number"]>$p["given_student_number"]){
                $partnerIds=array_merge($partnerIds,[$p["partner_id"]]);
            }
        }
        // get parteners
        $lists=[];
        if(count($partnerIds)>0){
            $ids=implode(",",$partnerIds);
            $lists=$database->fetch("SELECT * from a_partner_tb where id IN($ids)");
        }
        echo json_encode(["data"=>$lists]);
        break;
    case 'PARTNER_REQUEST_STUDENT':
        try {
        $major=rtrim(input::get("major"),",");
        $major_value=rtrim(input::get("major_value"),",");
        $major=explode(",",$major);
        $major_value=explode(",",$major_value);
        $userID=$_SESSION['ht_userId'];
        $intern=input::get("inter");
         // remove all previsious recourd
        $database->query("DELETE  FROM a_partner_student_request where internaship_id= $intern AND partner_id= $userID");
        $allStudent=0;
        $today=date('Y-m-d');
        $counts=count($major);
        $sql='';
        for ($i=0; $i <$counts; $i++) { 
            $allStudent+=$major_value[$i];
            $sql.="({$major_value[$i]},'{$major[$i]}',$userID,$intern,'$today'),";
        }
        $sql=trim($sql,",");
        $sqlQuery="INSERT INTO a_partner_student_request(request_student_number,major_in,partner_id,internaship_id,created_at) VALUES $sql";
        // echo json_encode(["status"=>$sqlQuery]);
         // update requested student
         $database->query("DELETE from a_partner_student_request_totals WHERE internaship_id=$intern AND partner_id =$userID");
         $database->insert("a_partner_student_request_totals",["requested_student"=>$allStudent,"internaship_id"=>$intern,"partner_id"=>$userID]);
        if($database->query($sqlQuery)){
            echo json_encode(["status"=>"ok"]);
        }else{
        echo json_encode(["status"=>"Unable to request students"]);
        }
            } catch (\Throwable $e) {
                echo json_encode(["status"=>"Error |".$e->getMessage()]);
            }
 break;
 case 'SEND_EMAIL':
    case 'CONTACT':
        $message = input::sanitize("message");
        $names = input::sanitize("names");
        $to = 'contact@thegreatlakeseye.com';
        $from = input::sanitize("email");
        $subject = input::sanitize("subject");
        $headers = "From: $from";
        $message .= "\n Written by $names";
        mail($to,$subject,$message,$headers);
        // header('Content-Type: application/json');
        echo json_encode(['status' => 'success']);
        break;
    default:
        echo json_encode(["isOk"=>false,"data"=>"action".$action.'  not found']);
        break;
}
?>