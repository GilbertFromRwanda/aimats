<?php
$instId=$_SESSION['ht_hotel'];
$series=[["name"=>"Working","data"=>[]],["name"=>"Not Working","data"=>[]]];
$cats=[];
$suppliers=$database->fetch("SELECT id,name FROM beneficiary_tb where institition_id=$instId");
foreach ($suppliers as $key => $s) {
  $cats=array_merge($cats,[$s['name']]);
  $w=0;
  $nw=0;
  // get count devices
  // get requests assigned to the suppliers
  $reqs=$database->fetch("select r_code from inst_requests where ben_id={$s['id']}");
  foreach ($reqs as $key => $r) {
    $code=$r['r_code'];
    $devices=$database->fetch("SELECT status FROM supplied_devices WHERE request_code='$code'");
    foreach ($devices as $key => $d) {
      if($d['status']!="functional"){
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
                  <h4 class="card-title mb-1">Benificiaries rate</h4>
                  <small class="mb-0">The Graph shows how devices working and not working </small>
                </div>
              </div>
              <div class="card-body revenue-chart px-3">
                <div id="chartBar"></div>
              </div>
            </div>
          </div>
        
        <div class="col-lg-6">
                <div class="row">
          <div class="col-lg-6">
            <div class="widget-stat card">
              <div class="card-body p-4">
                <div class="media ai-icon d-flex">
                  <span class="me-3 bgl-primary text-primary">
                  </span>
                  <div class="media-body">
                    <h3 class="mb-0 text-black">
                      <span class="counter ms-0"><?=$database->count_all(" beneficiary_tb where institition_id=$instId"); ?></span>
                    </h3>
                    <p class="mb-0">Benificiaries </p>
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
                  </span>
                  <div class="media-body">
                    <h3 class="mb-0 text-black">
                      <span class="counter ms-0">
                      <?php
                      echo $database->count_all(" supplied_devices sd INNER JOIN device_requests dr on sd.device_id=dr.id   AND dr.institition_id=$instId AND sd.status='functional'"); 
                      ?>
                      </span>
                    </h3>
                    <p class="mb-0">Working devices </p>
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
                  </span>
                  <div class="media-body">
                    <h3 class="mb-0 text-black">
                      <span class="counter ms-0">
                      <?php
                      echo $database->count_all(" supplied_devices sd INNER JOIN device_requests dr on sd.device_id=dr.id   AND dr.institition_id=$instId AND sd.has_replaced='yes'");  
                      ?>
                      </span>
                    </h3>
                    <p class="mb-0">Replaced devices  </p>
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
                  </span>
                  <div class="media-body">
                    <h3 class="mb-0 text-black">
                      <span class="counter ms-0">
                      <?php
                      $cond="INNER JOIN device_requests dr on sd.device_id=dr.id AND dr.institition_id=$instId";
                      echo $database->count_all("supplied_devices sd $cond"); 
                      ?>
                      </span>
                    </h3>
                    <p class="mb-0">All devices </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
            </div>
            </div>
       