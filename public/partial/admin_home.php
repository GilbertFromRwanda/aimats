<?php
function checkIsAValidDate($myDateString){
  return (bool)strtotime($myDateString);
}
$series=[["name"=>"Working","data"=>[]],["name"=>"Not Working","data"=>[]]];
$cats=[];
// get suppliers
// $series[]
$suppliers=$database->fetch("SELECT id,name FROM a_partner_tb");
foreach ($suppliers as $key => $s) {
  $cats=array_merge($cats,[$s['name']]);
  $w=0;
  $nw=0;
  // get count devices
  // get requests assigned to the suppliers
  $reqs=$database->fetch("select r_code from inst_requests where sup_id={$s['id']}");
  foreach ($reqs as $key => $r) {
    $code=$r['r_code'];
    $devices=$database->fetch("SELECT id,end_guarantee,status_date,status from supplied_devices WHERE request_code='$code'");
    foreach ($devices as $key => $d) {
        // check if it was damged under guarante
        if($d['end_guarantee']>$d['status_date']){
          $nw++;
        }else{
          $w++;
        }
    }
  }
  $series[0]["data"]=array_merge($series[0]["data"],[$w]);
  $series[1]["data"]=array_merge($series[1]["data"],[$nw]);
}
?>      
        <div class="col-lg-6">
            <div class="card">
              <div class="card-header border-0 pb-0 d-sm-flex d-block">
                <div>
                  <h4 class="card-title mb-1">Supplier rate</h4>
                  <small class="mb-0">The Graph shows how devices damaged under guarantee </small>
                </div>
              </div>
              <div class="card-body revenue-chart px-3">
                
                <div id="chartBar"></div>
              </div>
            </div>
          </div>
        
        <div class="col-lg-6">
          <div class="row">
          <div class="col-lg-12">
            <div class="widget-stat card">
              <div class="card-body p-4" onclick="window.location.href='tenders'">
                <div class="media ai-icon d-flex">
                  <span class="me-3 bgl-primary text-primary">
                  <i class="flaticon-381-add"></i>
                  </span>
                  <div class="media-body">
                    <h3 class="mb-0 text-black">
                      <span class="counter ms-0">
                      <?php
                      $cond="";
                      echo $database->count_all("supplier_application where winner_id=0"); 
                      ?>
                      </span>
                    </h3>
                    <p class="mb-0">Tenders Application </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="widget-stat card">
              <div class="card-body p-4">
                <div class="media ai-icon d-flex">
                  <span class="me-3 bgl-primary text-primary">
                  <i class="flaticon-381-home"></i>
                  </span>
                  <div class="media-body">
                    <h3 class="mb-0 text-black">
                      <span class="counter ms-0"><?=$database->count_all("institition_tb "); ?></span>
                    </h3>
                    <p class="mb-0">Instititions </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="widget-stat card">
              <div class="card-body p-4">
                <div class="media ai-icon d-flex">
                  <span class="me-3 bgl-primary text-primary">
                  <i class="flaticon-381-success"></i>
                  </span>
                  <div class="media-body">
                    <h3 class="mb-0 text-black">
                      <span class="counter ms-0">
                      <?php
                      echo $database->count_all("a_partner_tb "); 
                      ?>
                      </span>
                    </h3>
                    <p class="mb-0">Suppliers </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="widget-stat card">
              <div class="card-body p-4">
                <div class="media ai-icon d-flex">
                  <span class="me-3 bgl-primary text-primary">
                    <!-- <i class="ti-user"></i> -->
                    <i class="flaticon-381-share-2"></i>
                  </span>
                  <div class="media-body">
                    <h3 class="mb-0 text-black">
                      <span class="counter ms-0">
                      <?php
                      echo $database->count_all("supplied_devices"); 
                      ?>
                      </span>
                    </h3>
                    <p class="mb-0">Supplied devices </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="widget-stat card">
              <div class="card-body p-4">
                <div class="media ai-icon d-flex">
                  <span class="me-3 bgl-primary text-primary">
                  <i class="flaticon-381-bookmark"></i>
                  </span>
                  <div class="media-body">
                    <h3 class="mb-0 text-black">
                      <span class="counter ms-0">
                      <?php
                      $cond="INNER JOIN device_requests dr on sd.device_id=dr.id AND sd.has_reported='yes'";
                      echo $database->count_all("supplied_devices sd $cond"); 
                      ?>
                      </span>
                    </h3>
                    <p class="mb-0">Reported devices </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
       
            </div>
            </div>
       