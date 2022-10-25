<?php 
require("../../config/grobals.php");
// include input and validate
require("../../util/input.php");
include("../../util/validate.php");
$action=input::get("action");
if(!isset($_SESSION)){
    session_start();
}
function displayData($table='',$q='',$page="/",$k=''){
    global $database;
   $rows=$database->fetch("SELECT id,name from $table WHERE name like '%$q%' limit 5");
   foreach ($rows as $key => $r) {
    echo "<li> <a href='$page?d={$r['id']}'>{$k}:{$r['name']}</a></li>";
   }
}
switch ($action) {
    case 'CHECK_NOTIFICATION':
        $level=$_SESSION['ht_level'];
        $levelId=$level!="BEN_ADMIN"?$_SESSION['ht_hotel']:$_SESSION['ht_ben'];
        $hasNotification=$database->count_all("notifications_tb WHERE level_id=$levelId AND level='$level'");
        if($hasNotification){
          $rows=$database->fetch("SELECT * FROM notifications_tb WHERE level_id=$levelId AND level='$level' order by id desc limit 5 ");
          foreach ($rows as $key => $row) { 
            $row['id']=input::enc_dec("e",$row['id']);
            ?>
        <li>
          <div class="timeline-panel" onclick="window.location.href='<?=$row['link']?>&n=<?=$row['id']?>'">
            <div class="media me-2 media-danger">NT</div>
            <div class="media-body">
              <h6 class="mb-1"><?=$row['message'] ?></h6>
              <small class="d-block"><?=input::timeAgo($row['created_at'])?></small>
            </div>
          </div>
        </li>
          <?php
         }
        }else{
            echo "none";
        }
        break;
    case 'DELIVERY_CONFIRMATION':
        $code=input::get("c");
        $user=$_SESSION['ht_userId'];
        $sup_id=input::get('sup');
        $isUpdated=$database->update("inst_requests","r_code='$code'",["has_deliveried"=>'yes']);
        if($isUpdated){
            $msg="Risa confirmed your delivery  #$code";
            $notifyQuery="INSERT INTO notifications_tb(message,link,level,level_id,done_by) value('$msg','home?d=$code','SUP_ADMIN',$sup_id,$user)"; 
            $database->query($notifyQuery);
            echo json_encode(["isOk"=>true,"data"=>'success']);
            exit(0);
        }else{
            echo json_encode(["isOk"=>false,"data"=>'Failed to deliver'.$code]);
        }
        break;
    case 'MAKE_DELIVER_REQUEST':
        $code=input::get("code");
        $user=$_SESSION['ht_userId'];
        $isUpdated=$database->update("supplier_application","request_code='$code'",["has_sent"=>'yes']);
        if($isUpdated){
            $msg="The Delivery confirmation request code #$code";
            $notifyQuery="INSERT INTO notifications_tb(message,link,level,level_id,done_by) value('$msg','requested?d=$code','ADMIN',1,$user)"; 
            $database->query($notifyQuery);
            echo json_encode(["isOk"=>true,"data"=>'success']);
            exit(0);
        }else{
            echo json_encode(["isOk"=>false,"data"=>'Failed to deliver']);
        }
        break;
    case 'CONFIRM_TENDER_APPLICATION':
        $ta=input::get("ta");
        $code=input::get("code");
        $user=$_SESSION['ht_userId'];
        // check tender if not given
        $tData=$database->get("*","supplier_application","id=$ta and request_code='$code'");
        if(!isset($tData->id)){
            echo json_encode(["isOk"=>false,"data"=>'Application not found']);
            exit(0);
        }
        if($tData->winner_id>0){
            echo json_encode(["isOk"=>false,"data"=>"Tender # $code has been taken"]);
            exit(0);
        }
        // set winner
        $isUpdated=$database->update("supplier_application",
        "request_code='$code'",["winner_id"=>$tData->sup_id,
        "updated_at"=>input::getCurrentDateTime()]);
        if($isUpdated){
            // update all winner 
            // update inst_admin
            $database->update("inst_requests","r_code='$code'",['sup_id'=>$tData->sup_id]);
            echo json_encode(["isOk"=>true,"data"=>'success']);   
        }else{
            echo json_encode(["isOk"=>false,"data"=>'Application not found']);
            exit(0);  
        }
        break;
    case 'CANCEL_APPLICATION':
        $code=input::get('code');
        $sup_id=$_SESSION['ht_hotel'];
        if($database->query("DELETE from supplier_application where request_code='$code' AND sup_id=$sup_id limit 1")){
            echo json_encode(["isOk"=>true,"data"=>'success']);  
        }else{
            echo json_encode(["isOk"=>false,"data"=>'Unable to cancel application']);  
            exit(0);   
        }
        break;
    case 'SEND_TENDER_APPLICATION':
        if(!input::required(array('delivery_time','price'))){
            echo json_encode(["isOk"=>false,"data"=>'Please delivery time and price are required']);  
            exit(0);    
        }
        $code=input::get('code');
        $sup_id=$_SESSION['ht_hotel'];
        $user=$_SESSION['ht_userId'];
        $today=date('Y-m-d');
        $dtime=input::get('delivery_time');
        $endG=input::reformatDate($today,"+ $dtime day",'Y-m-d');
        // check if tender was submited
        $hasPosted=$database->count_all("supplier_application where request_code='$code' AND sup_id=$sup_id");
        if($hasPosted!=0){
            echo json_encode(["isOk"=>false,"data"=>'Already you applied this tender']);  
            exit(0);
        }
        $sa=["request_code"=>$code,"sup_id"=>$sup_id,
        "delivery_time"=>$endG,
        "guarante"=>input::get("guarante"),
        "price"=>input::get('price'),
        "special_offer"=>$database->escape_value($_POST['special_offer'])];
        $isInserted=$database->insert("supplier_application",$sa);
        if($isInserted){
            $msg="The new tender application #$code";
            $notifyQuery="INSERT INTO notifications_tb(message,link,level,level_id,done_by) value('$msg','tenders?c=$isInserted','ADMIN',1,$user)"; 
            $database->query($notifyQuery);
            echo json_encode(["isOk"=>true,"data"=>'success']);  
        }else{
            echo json_encode(["isOk"=>false,"data"=>'Unable to apply tender please try again']);  
            exit(0);   
        }
        break;
    case 'PUBLISH_TENDER':
        $code=input::get('c');
        $user=$_SESSION['ht_userId'];
        $isUpdated=$database->update("inst_requests","r_code='$code'",
        ["has_published"=>"yes","updated_at"=>date('Y-m-d H:i:s')]);
        if($isUpdated){
            // get suppliers
            $sups=$database->fetch("select id from a_partner_tb where is_active='yes'");
            $deviceSql="";
            $msg="New tender from risa #{$code}";
        foreach ($sups as $key => $sup) {
            $sup_id=$sup["id"];
         $deviceSql.="('{$msg}','home?d=$code','SUP_ADMIN',$sup_id,$user),";
            }
            if(!empty($deviceSql)){
            $deviceSql=trim($deviceSql,",");
            $notifyQuery="INSERT INTO notifications_tb(message,link,level,level_id,done_by) value $deviceSql"; 
            $database->query($notifyQuery);    
        }
            echo json_encode(["isOk"=>true,"data"=>'success']); 
            exit(0);
        }
        echo json_encode(["isOk"=>false,"data"=>'Unable to post new tender' .$code]); 
        break;
    case 'MAIN_SEARCH':
        if(!input::required(array('q'))){
            echo '';
            exit();
        }
        $q=$database->escape_value($_GET['q']);
        $level=$_SESSION['ht_level'];
        if($level=="ADMIN"){
            /*1.inst 2.ben 3.supplier 4.device*/ 
            displayData('device_requests',$q,"requested","DEV");
            displayData('beneficiary_tb',$q,"benificiary","BEN");
            displayData('a_partner_tb',$q,"supplier","SUP");
            displayData('institition_tb',$q,"institition","INS");
        }elseif($level=="INST_ADMIN"){
            /*1. device 2. ben*/
            displayData('device_requests',$q,"requested","DEV");
            displayData('beneficiary_tb',$q,"benificiary","BEN");
        }
        else{
            displayData('device_requests',$q,"requested","DEV");
        }
        break;
    case 'REGISTER_SUPPLIER_DIVICE':
        if(!isset($_SESSION['ht_userId'])){
            echo json_encode(["isOk"=>false,"data"=>"Access denied"]); exit();
        }
        if($_SESSION['ht_level']!="ADMIN"){
            echo json_encode(["isOk"=>false,"data"=>"Access denied; please contact  admin"]);exit(); 
        }
        $val=new validate();
        $val->check($_POST,[
         "manufacturer"=>["required"=>true],
         "guarantee"=>['required'=>true,"min"=>0,"number"=>true],
         ]);
         if(!$val->passed()){
             echo json_encode(["isOk"=>false,"data"=>implode(',',$val->errors())]); 
             exit();
         }
        $dCount=input::get("dNumber");
        $guarante=input::get("guarantee");
        $man=input::get("manufacturer");
        $code=input::get("code");
        $today=date('Y-m-d');
        $endG=input::reformatDate($today,"+ $guarante months",'Y-m-d');
        $statusDate=$endG;
        $id=input::get("dId");
        $sql='';
        // check if all requested devices has value
        for ($i=1; $i <=$dCount ; $i++) { 
            if(!isset($_POST['serial_'.$i]) || empty($_POST['serial_'.$i])){
                echo json_encode(["isOk"=>false,"data"=>'serial number '.$i .' is required']); exit();
            }
            $ser=$_POST['serial_'.$i];
            $sql.="('{$man}',{$guarante},'{$ser}',{$id},'{$code}','{$endG}','{$statusDate}'),";
        }
        $sql=trim($sql,",");
        $requestQuery="INSERT INTO supplied_devices(manufacturer,guarantee,serial_number,device_id,request_code,end_guarantee,status_date) value $sql";
        $tot=$dCount+(int)input::get("dPurchase");
        $isUpdated1=$database->update("device_requests","id=$id",["purchased"=>$tot]);
        if($isUpdated1){
            if($database->query($requestQuery)){
                echo json_encode(["isOk"=>true,"data"=>$_REQUEST]);
            }else{
                echo json_encode(["isOk"=>false,"data"=>"Operation failed try again"]);
            }
        }else{
            echo json_encode(["isOk"=>false,"data"=>"Operation failed to update device request try again"]);   
        }
        
        break;
    case 'ASSIGN_SUPPLIER':
        if(!isset($_SESSION['ht_userId'])){
            echo json_encode(["isOk"=>false,"data"=>"Access denied"]); exit();
        }
        if($_SESSION['ht_level']!="ADMIN"){
            echo json_encode(["isOk"=>false,"data"=>"Access denied; please contact  admin"]);exit(); 
        }
                $code=input::get("code");
                $sup=input::get("supplier");
            $isUpdated=$database->update("inst_requests","r_code='$code'",["sup_id"=>$sup]);
            if($isUpdated){
                echo json_encode(["isOk"=>true,"data"=>$_REQUEST]); 
            }else{
                echo json_encode(["isOk"=>false,"data"=>"Operation failed"]); 
            }
            

        break;
    case 'CHANGE_REQUEST_STATUS':
        if(!isset($_SESSION['ht_userId'])){
            echo json_encode(["isOk"=>false,"data"=>"Access denied"]); 
            exit();
        }
        $s=input::get("s");
        $c=input::get("c");
        $i=input::get("i");
        $b=input::get("b"); 
        $userID=$_SESSION['ht_userId'];
        // check if there are some devices were registered
        if($s=="instToConfirm"){
            $count=$database->count_all("device_requests where request_code='$c' AND purchased=0");
            if($count>0){
                echo json_encode(["isOk"=>false,"data"=>"Operations failed because some requested devices not registered yet"]); 
                exit(); 
            }
        }
        $formData=[ "status"=>$s,"updated_at"=>date('Y-m-d H:i:s'),"updated_by"=>$_SESSION['ht_userId']];
        if($s=="instToConfirm"){
            $formData["has_registered"]="yes";
        }
        $isUpdated=$database->update("inst_requests","r_code='$c'",$formData);
        if($isUpdated){
            // send nofications
            if($s=="instToAdmin"){
                $msg="New Institition request computing devices #".$c;
                $notifyQuery="INSERT INTO notifications_tb(message,link,level,level_id,done_by) value('$msg','requested?c=$c','ADMIN',1,$userID)"; 
            } else if($s=="adminToInst"){
                $msg="The Instititions has been approved the supplied devices #".$c;
                $notifyQuery="INSERT INTO notifications_tb(message,link,level,level_id,done_by) value('$msg','requested?c=$c','ADMIN',1,$userID)"; 
            }else if($s=="instToBen"){   
                $msg="Computing devices with  #".$c .' have been recieved by beneficiary';
                $notifyQuery="INSERT INTO notifications_tb(message,link,level,level_id,done_by) value('$msg','requested?c=$c','INST_ADMIN',$i,$userID)"; 
            } else if($s=="instToConfirm"){
                $msg="Risa send your computing devices  <br/> please confirm the requests #".$c;
                $cf=input::enc_dec("e",$c);
                $notifyQuery="INSERT INTO notifications_tb(message,link,level,level_id,done_by) value('$msg','requested?c=$c&cf=$cf','INST_ADMIN',$i,$userID)"; 
            }
            else if($s=="benToConfirm"){
                $msg="The institition send your requested computing devices please check and approve #".$c;
                $cf=input::enc_dec("e",$c);
                $notifyQuery="INSERT INTO notifications_tb(message,link,level,level_id,done_by) value('$msg','requested?c=$c&cf=$cf','BEN_ADMIN',$b,$userID)"; 
            }
            $database->query($notifyQuery);
            echo json_encode(["isOk"=>true,"data"=>$c]); 
        }else{
            echo json_encode(["isOk"=>false,"data"=>"Operation failed"]); 
        }
        break;
    case 'MAKE_DEVICE_REQUEST':
        if(!isset($_SESSION['ht_userId'])){
            echo json_encode(["isOk"=>false,"data"=>"Access denied"]); 
            exit();
        }
        // if($_SESSION['ht_level']!="BEN_ADMIN"){
        //     echo json_encode(["isOk"=>false,"data"=>"Access denied; please contact  admin"]); 
        //     exit(); 
        // }
        $val=new validate();
        $val->check($_POST,[
         "keys"=>["required"=>true],
         "devices"=>['required'=>true],
         ]);
         if(!$val->passed()){
             echo json_encode(["isOk"=>false,"data"=>implode(',',$val->errors())]); 
             exit();
         }
         $nextCode=$database->get("r_code","inst_requests"," 1 order by id desc");
         $code=0;
         if(isset($nextCode->r_code)){
            $code=$database->getNextCode($nextCode->r_code);
         }else{
            $code=$database->getNextCode(0);
         }
         $inst=$_SESSION['ht_hotel'];
         $ben_id=$_SESSION['ht_ben'];
         $deviceSql="";
         $keys=json_decode($_POST['keys'],true);
         $devices=json_decode($_POST['devices']);
         $userID=$_SESSION['ht_userId'];
         $len=count($keys);
         $toto=0;
         for ($i=0; $i <$len ; $i++) { 
            $lists=$devices->{$keys[$i]};
            foreach ($lists as $key => $l) {
            //    echo json_encode($l->name);
            $number=input::extractNumbers($l->size);
            $toto+=$number;
               $deviceSql.="('{$l->name}',{$number},'{$l->size}',$inst,$ben_id,'{$code}',$userID,'{$l->spec}'),";
            }
         }
         $deviceSql=trim($deviceSql,",");
         $rYear=date('Y');
         $level="benToInst";
         if($_SESSION['ht_level']=="INST_ADMIN"){
            $level="instToAdmin";
         }
         $requestQuery="INSERT INTO device_requests(name,numbers,m_unit,institition_id,ben_id,request_code,user_id,specifications) value $deviceSql";
         $instQuery="INSERT INTO inst_requests(r_code,inst_id,ben_id,tot_requests,status,request_year,updated_by) value('$code',$inst,$ben_id,$toto,'$level',$rYear,$userID)";
         $msg="New computing devices request #".$code;
         $notifyQuery="INSERT INTO notifications_tb(message,link,level,level_id,done_by) value('$msg','requested?c=$code','INST_ADMIN',$inst,$userID)";
         $isOk=false;
         if($database->query($instQuery)){
            $iId=$database->inset_id();
            if($database->query($requestQuery)){
                $rId=$database->inset_id();
             if($_SESSION['ht_level']=="BEN_ADMIN"){
                if($database->query($notifyQuery)){
                    $isOk=true;
                }else{
                    // remove query 1 and 2
                    $database->query("DELETE FROM device_requests where id=$rId");
                    $database->query("delete from inst_requests where id=$iId");
                }
            }else{
                $msg="New Institition request computing devices #".$code;
                $notifyQuery="INSERT INTO notifications_tb(message,link,level,level_id,done_by) value('$msg','requested?c=$code','ADMIN',1,$userID)"; 
                $database->query($notifyQuery);
                $isOk=true;
            }
            }else{
                // remove q1
                $database->query("delete from inst_requests where id=$iId");
            }
         }
         if($isOk){
            echo json_encode(["isOk"=>true,"data"=>$code]); 
        }else{
            echo json_encode(["isOk"=>false,"data"=>"Failed"]);
        }
 
        break;
    case 'CREATE_NEW_BEN':
        // get hote code,Ymd
        if(!isset($_SESSION['ht_userId'])){
            echo json_encode(["isOk"=>false,"data"=>"Access denied"]); 
            exit();
        }
        // check if it is system,manager
        if($_SESSION['ht_level']!="ADMIN"){
            echo json_encode(["isOk"=>false,"data"=>"Access denied; please contact  admin"]); 
            exit(); 
        }
        $val=new validate();
       $val->check($_POST,[
        "name"=>["required"=>true,"max"=>30,"unique"=>["table"=>"beneficiary_tb","column"=>'name']],
        "phone"=>['required'=>true,"min"=>10],
        "email"=>['required'=>true,"max"=>100]
        ]);
        if(!$val->passed()){
            echo json_encode(["isOk"=>false,"data"=>implode(',',$val->errors())]); 
            exit();
        }
        if(!input::valid_email($_POST['email'])){
            echo json_encode(["isOk"=>false,"data"=>"Invalide Email"]); 
            exit();   
        }
    $userData=[
        "name"=>$database->escape_value($_POST['name']),
        "email"=>$database->escape_value($_POST['email']),
        "phone"=>$database->escape_value($_POST['phone']),
        "user_id"=>$_SESSION['ht_userId'],
        "institition_id "=>$_SESSION['ht_hotel'],
    ];
    $isUserInserted=$database->insert("beneficiary_tb",$userData);
    if($isUserInserted){
        echo json_encode(["isOk"=>true,"data"=>input::get("name") ."  has been saved"]); 
    }else{
        echo json_encode(["isOk"=>false,"data"=>input::get("name") ." Failed to be created please try again"]);
    }
       
        break;
    default:
        echo json_encode(["isOk"=>false,"data"=>"action".$action.'  not found']);
        break;
}
?>