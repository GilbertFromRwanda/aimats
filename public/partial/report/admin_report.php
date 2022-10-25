<?php
function redirect()
{
    echo "Unautorized <span >Redirecting ...</span>";
    echo '<meta http-equiv="refresh" content="1;url=./reports">';
    exit(0);
}
if (!input::required(array('rname'))) {
    redirect();
}
$rName = input::get("rname"); // report name;
$from = input::get('from');
$to = input::get('to');
if ($rName == "SR") {
    $fdata=[];
    $sups = $database->fetch("SELECT id,email,place,name FROM a_partner_tb ");
    foreach ($sups as $key => $s) {
        $id=$s['id'];
        // get supplied ist
        $purchased=(int)$database->get("sum(purchased) as p","device_requests","request_code IN(SELECT r_code from inst_requests where sup_id=$id)")->p;
        // count devices got problems while in guarante
        $problems=(int)$database->get("count(*) as b","supplied_devices","request_code IN(SELECT r_code from inst_requests where sup_id=$id) AND end_guarantee > status_date")->b;
        $pp=$purchased?$purchased:1;
        $fdata[]=(object)[
    "supId"=>$s['id'],
    "name"=>$s['name'],
    "email"=>$s['email'],
    "place"=>$s['place'],
    "pur"=>$purchased,
    "pro"=>$problems,
    "per"=>round($problems*100/$pp,2)];
    }
    usort($fdata,function($first,$second){
        return $first->per > $second->per;
    });
    ?>
    <!-- THE SUPPLIER RATING -->
    <div class="col-12">
        <div class="card">
            <div class="card-header border-0 pb-0 d-sm-flex d-block">
                <div class=" text-center d-flex justify-content-center align-items-center">
                    <h4 class="card-title mb-1  "> The Suppliers rating based on how devices had problems under Guarantee <br />
                        <hr class=" hr" />
                    </h4>
                </div>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th class=" fs-13">#</th>
                                <th class=" fs-13">Name</th>
                                <th class=" fs-13">Email</th>
                                <th class=" fs-13">Place</th>
                                <th class=" fs-13">S. Devices</th>
                                <th class=" fs-13">P. Devices</th>
                                <th class=" fs-13">%</th>
                            </tr>
                        </thead>
                        <tbody class=" fs-12">
                            <?php
                            $i=1;
                            foreach ($fdata as $key => $h) {
                            ?>
                                <tr>
                                    <td><?= $i ?></td>
                                    <td class=" text-capitalize"><?= $h->name ?></td>
                                    <td class=""><?= $h->email ?></td>
                                    <td class=""><?= $h->place?></td>
                                    <td class=""><?= $h->pur?></td>
                                    <td class=""><?= $h->pro?></td>
                                    <td class=""><?= $h->per?>%</td>
                                </tr>
                            <?php
                                $i++;
                            } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    
<?php } elseif ($rName == "LRQD") {
    $cond="";
    $date="";
    if(input::required(array('from','to'))){
    $f=input::get('from');
    $t=input::get('to');
        $from=date('Y-m-d 00:00:00',strtotime($f));
        $to=date('Y-m-d 23:59:59',strtotime($t));
        $cond=" where created_at >='$from' AND created_at <='$to'";
        $date="($f to $t)";
    }
    ?>
    <div class="col-12">
        <div class="card">
            <div class="card-header border-0 pb-0 d-sm-flex d-block">
                <div class=" text-center d-flex justify-content-center align-items-center">
                    <h4 class="card-title mb-1  "> List of requested devices <?=$date?> <br />
                        <hr class=" hr" />
                    </h4>
                </div>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th class=" fs-13">#</th>
                                <th class=" fs-13">Date</th>
                                <th class=" fs-13">Name</th>
                                <th class=" fs-13">R.QTY</th>
                                <th class=" fs-13">S.QTY</th>
                                <th class=" fs-13">Inst</th>
                            </tr>
                        </thead>
                        <tbody class=" fs-12">
                            <?php
     
                            $lists = $database->fetch("SELECT * FROM device_requests $cond ");
                            $i = 1;
                            $instName=[];
                            foreach ($lists as $key => $h) {
                                if(!isset($instName[$h['institition_id']])){
                                    $ii=$h['institition_id'];
                                    $instName[$ii]=$database->get('name',"institition_tb","id=$ii")->name;
                                }
                            ?>
                                <tr>
                                    
                                    <td><?= $i ?></td>
                                    <td class=" "><?= date('Y-m-d',strtotime($h['created_at'])) ?></td>
                                    <td class="text-capitalize">
                                        <?= $h['name'] ?></td>
                                    <td class=""><?= $h['numbers'] ?></td>
                                    <td class=""><?= $h['purchased'] ?></td>
                                    <td class="text-capitalize"><?= $instName[$h['institition_id']]?></td>
                                </tr>
                            <?php
                                $i++;
                            } 
                            $instName=true;
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    
    <!-- The list of requested devices -->

<?php } else if ($rName == "LRPD") { 
            $cond=" WHERE has_reported='yes'";
            $date="";
            if(input::required(array('from','to'))){
            $f=input::get('from');
            $t=input::get('to');
                $from=date('Y-m-d',strtotime($f));
                $to=date('Y-m-d',strtotime($t));
                $cond=" where status_date >='$from' AND status_date <='$to' AND has_reported='yes'";
                $date="($f to $t)";
            }
        ?>
    <!-- // The list of reported devices -->
    <div class="col-12">
        <div class="card">
            <div class="card-header border-0 pb-0 d-sm-flex d-block">
                <div class=" text-center d-flex justify-content-center align-items-center">
                    <h4 class="card-title mb-1  "> List of reported devices <?=$date?> <br />
                        <hr class=" hr" />
                    </h4>
                </div>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th class=" fs-13">#</th>
                                <th class=" fs-13">Date</th>
                                <th class=" fs-13">Name/serial</th>
                                <th class=" fs-13">Supplier</th>
                                <th class=" fs-13">Inst</th>
                                <th class=" fs-13">Reason</th>
                            </tr>
                        </thead>
                        <tbody class=" fs-12">
                            <?php
                            $lists = $database->fetch("SELECT serial_number,request_code,device_id,comment, status_date FROM supplied_devices $cond  ");
                            $i = 1;
                            $instName='';
                            $suppName='';
                            $devs=[];
                            $codes=[];
                            foreach ($lists as $key => $h) {
                                if(!isset($codes[$h['request_code']])){
                                    $supInfo=$database->get('inst_id,sup_id','inst_requests',"r_code='{$h['request_code']}'");
                                    $instName=$database->get('name',"institition_tb","id={$supInfo->inst_id}")->name;
                                    $suppName=$database->get('name',"a_partner_tb","id={$supInfo->sup_id}")->name;
                                    $codes[$h['request_code']]= $instName.'#'.$suppName;
                                }
                                if(!isset($devs[$h['device_id']])){
                                    $did=$h['device_id'];
                                    $devs[$did]=$database->get('name',"device_requests","id={$h['device_id']}")->name;
                                }
                            ?>
                                <tr>
                                    
                                    <td><?= $i ?></td>
                                    <td class=" "><?= $h['status_date'] ?></td>
                                    <td class="text-uppercase">
                                    <?= $devs[$h['device_id']]?>/<?= $h['serial_number'] ?></td>
                                    <td class="text-capitalize"><?= $suppName ?></td>
                                    <td class="text-capitalize"><?= $instName ?></td>
                                    <td class=""><?=$h['comment']?></td>
                                </tr>
                            <?php
                                $i++;
                            } 
                            $devs=true;
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
<?php } else if ($rName == "LS") { ?>
    <!-- // The list of suppliers -->
    <div class="col-12">
        <div class="card">
            <div class="card-header border-0 pb-0 d-sm-flex d-block">
                <div class=" text-center d-flex justify-content-center align-items-center">
                    <h4 class="card-title mb-1  "> List of Suppliers <br />
                        <hr class=" hr" />
                    </h4>
                </div>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th class=" fs-13">#</th>
                                <th class=" fs-13">Name</th>
                                <th class=" fs-13">Email</th>
                                <th class=" fs-13">Phone</th>
                                <th class=" fs-13">Place</th>
                            </tr>
                        </thead>
                        <tbody class=" fs-12">
                            <?php
                            $lists = $database->fetch("SELECT * FROM a_partner_tb order by id desc");
                            $i = 1;
                            foreach ($lists as $key => $h) {
                            ?>
                                <tr>
                                    <td><?= $i ?></td>
                                    <td class=" text-capitalize"><?= $h['name'] ?></td>
                                    <td class=""><?= $h['email'] ?></td>
                                    <td class=""><?= $h['phone'] ?></td>
                                    <td class=""><?= $h['place'] ?></td>
                                </tr>
                            <?php
                                $i++;
                            } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
<?php } else {
    redirect();
}
?>