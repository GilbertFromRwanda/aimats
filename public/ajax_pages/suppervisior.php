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
    case 'GET_SUPPERVISIORS_PARTNERS':
        // get hote code,Ymd
        if(!isset($_SESSION['ht_userId'])){
            echo json_encode(["isOk"=>false,"data"=>"Access denied"]); 
            exit();
        }
    echo json_encode(["isOk"=>true,
    "data"=>["suppervisiors"=>$database->fetch("SELECT * from a_suppervisior_tb where status='active'"),
    "partners"=>$database->fetch("SELECT * from a_partner_tb where is_active='yes'")]]); 
    break;
    case 'ASSSIGN_SUPPERVISIOR_PARTNER_TO_STUDENT':
        // get hote code,Ymd
        if(!isset($_SESSION['ht_userId'])){
            echo json_encode(["isOk"=>false,"data"=>"Access denied"]); 
            exit();
        }
        // check if it is system,manager
        if($_SESSION['ht_level']!="ADMIN"){
            echo json_encode(["isOk"=>false,"data"=>"Access denied; please contact system admin"]); 
            exit(); 
        }
        // check internaship date
        $today=date('Y-m-d');
        $iDate=date("Y-m-d",strtotime(input::get("idate")));
        $partner=input::get("p");
        $student=input::get("student");
        $suppervisior=input::get("s");
        if(!is_numeric($partner) || !is_numeric($suppervisior)){
            echo json_encode(["isOk"=>false,"data"=>" partner or suppervisior is invalid"]);
            exit(0);
        }
        if($today>=$iDate){
            echo json_encode(["isOk"=>false,"data"=>"you are not allowed to change partner or suppervisior because internaship date was expired"]);
            exit(0);
        }
        try {
           $isUpdated=$database->update("a_student_tb","id=$student",
           ["partner_id"=>$partner,"suppervisior_id"=>$suppervisior,"updated_at"=>date('Y-m-d h:i:s')]);
           if($isUpdated){
            echo json_encode(["isOk"=>true,"data"=>$isUpdated]);
            exit(0);
           }
           throw new Exception("unable to update please try again", 1);
           
        } catch (\Exception $e) {
            echo json_encode(["isOk"=>false,"data"=>$e->getMessage()]);
        }

        break;
    default:
        echo json_encode(["isOk"=>false,"data"=>"action".$action.'  not found']);
        break;
}
// 
