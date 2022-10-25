<?php
$series=[];
$cats=[];
$sId=$_SESSION['ht_hotel'];
$hasNotify=false;
$suppl=$database->get("name,is_active","a_partner_tb","id=$sId");
if (isset($_GET['n'])) {
    $id = $_GET['n'];
    $hasNotify=true;
    $idDec=input::enc_dec("d",$id);
    $database->query("DELETE FROM notifications_tb where id=$idDec");
}
function displayDevices($r_code){
    global $database;
    $devices=$database->fetch("SELECT name,numbers,specifications as spec  FROM device_requests where request_code='$r_code'");
    echo "<ul class='list-group list-group-flush'>";
   foreach ($devices as $key => $d) {
     echo "<li class='list-group-item'>{$d['name']} ({$d['numbers']})<br/>
     <p>{$d['spec']}</p>
     </li>";
    }
    echo "</ul>";
}
?>
<div class="col-xl-12">
    <div class="card">
        <div class="card-header border-0 pb-0 d-sm-flex flex-wrap d-block">
            <div class="mb-3">
                <h4 class="card-title mb-1 text-capitalize"><?=$suppl->name?></h4>
                <small class="mb-0">
                    View all Tenders
                 </small>
            </div>
            <?php if($suppl->is_active=="yes"){ ?>
            <div class="card-action card-tabs mb-3">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link <?=$hasNotify?'':'active'?> " data-bs-toggle="tab" href="#monthly" role="tab" aria-selected="false">
                           Applied Tender
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <?=$hasNotify?'active':''?>" data-bs-toggle="tab" href="#today" role="tab" aria-selected="true">
                            New Tender
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="card-body tab-content pt-3">
            <div class="tab-pane fade <?=$hasNotify?'':'active show'?> " id="monthly">
                <div class="height500 dz-scroll loadmore-content ps ps--active-y" id="sellingItemsContent">
                    <?php
                    $myTenders=$database->fetch("SELECT * FROM supplier_application WHERE sup_id=$sId order by id desc");
                    $hasData=false;
                    foreach ($myTenders as $key => $mt) {
                        $hasData=true;
                        $rcode=$mt['request_code'];
                        $mt['has_deliveried']="no";
                        $a=['cls'=>'text-warning','lbl'=>'pending'];
                        if($mt['winner_id']==$sId){
                            $a=['cls'=>'text-success','lbl'=>'taken'];
                            $mt['has_deliveried']=$database->get("has_deliveried as d","inst_requests","r_code='$rcode'")->d;
                        }else if($mt['winner_id']!=0){
                        $a=['cls'=>'text-danger','lbl'=>'lost'];
                        }
                        ?>
                <div class="media mb-4 items-list-2" id="ta_<?=$rcode?>">
                        <a href="ecom-product-detail.html">
                        <img class="img-fluid rounded me-3" width="85" src="images/tender.png" alt="DexignZone"></a>
                        <div class="media-body col-6 px-0">
                            <h5 class="mt-0 mb-1"><a class="text-black" href="#">TenderId #<?=$rcode?></a></h5>
                            <small class="font-w500 mb-3">
                            <a class="<?=$a['cls']?> text-uppercase" href="javascript:void(0);"><?= $a['lbl']?></a>
                            <?php if($a['lbl']=="taken" && $mt['has_deliveried']=="no"){
                                if($mt['has_sent']=="no"){
                                ?>
                            <a href="#" class=" btn btn-xs btn-outline-warning" onclick="deliveryDevice('<?=$rcode?>')" >Deliver</a>
                            <?php } else{
                                echo " <span class =' btn btn-link text-warning'>Wait delivery approval</span>";
                            }
                        } else if($a['lbl']=="taken" && $mt['has_deliveried']=="yes"){
                            echo "<span class ='btn btn-link text-info'>Delivered</span>";
                        } ?>
                        </small>
                            <span class="text-secondary me-2 fo"></span>
                            <ul class="fs-14 list-inline">
                                <li class="me-3">
                                    <?php
                                     echo displayDevices($rcode);
                                    ?>
                                </li>
                                <li><?=input::timeAgo($mt['created_at'])?></li>
                            </ul>
                            <div class="d-flex flex-column">
                                <p>Guarante: <?=$mt['guarante'] ?></p>
                                <p>Delivery Time: <?=$mt['delivery_time'] ?></p>
                                <p>Special offer:<?=$mt['special_offer']?>
                                 </p>
                            </div>
                        </div>
                        <div class="media-footer align-self-center ms-auto d-block align-items-center d-sm-flex">
                            <h3 class="mb-0 font-w600 text-secondary">FRW <?=$mt['price']?></h3>
                            <?php if($mt['winner_id']==0){ ?>
                            <div class=" ms-3 ">
                                <button type="button" class="btn btn-xs btn-outline-warning" onClick="cancelTender('<?=$rcode?>')">
                                    Cancel application
                                </button>
                            </div>
                            <?php } ?>
                        </div>
                    </div>
                <?php
            }
            echo $hasData?"":"<div class='alert alert-danger'>No tender you applied</div>";
                ?>
                </div>
                <div class="text-center bg-white pt-3">
                    <a href="javascript:void(0);" class="btn-link dz-load-more" rel="#" id="sellingItems">View more <i class="fa fa-angle-down ms-2 scale-2"></i></a>
                </div>
            </div>      
            <div class="tab-pane fade <?=$hasNotify?'active show':''?> " id="today">
                <div class="height500 dz-scroll loadmore-content ps" id="sellingItems3Content">
                    <!--  -->
                   <?php
                   $condT="";
                   if(isset($_GET['d'])){
                    $cd=$_GET['d'];
                    $condT="r_code=$cd AND ";
                   }
                   $newTenders=$database->fetch("SELECT r_code,updated_at FROM inst_requests where $condT sup_id=0 AND has_published='yes'");
                  $hasNew=false;
                  foreach ($newTenders as $key => $nt) {
                    $hasNew=true;
                    ?>
                <div class="media mb-4 items-list-2">
                        <a href="#">
                            <img class="img-fluid rounded me-3" width="85" src="images/tender.png" alt="DexignZone"></a>
                          <div class="media-body col-6 px-0">
                            <h5 class="mt-0 mb-1"><a class="text-black" href="#">TenderID:#<?=$nt['r_code']?></a></h5>
                              <small class="font-w500 mb-3"><a class="text-warning" href="javascript:void(0);">New</a></small>
                            <span class="text-secondary me-2 fo"></span>
                            <ul class="fs-14 list-inline">
                            <li class="me-3">
                                <?php
                                displayDevices($nt['r_code']);
                               ?></li>
                                <li><?=input::timeAgo($nt['updated_at'])?></li>
                            </ul>
                     </div>
                        <div class="media-footer align-self-center ms-auto d-block align-items-center d-sm-flex">
                            <div class=" ms-3 ">
                                <button type="button" class="btn btn-xs btn-outline-danger" onClick="applyTender('<?=$nt['r_code']?>')" >
                                    Apply Now
                                </button>
                            </div>
                        </div>
                    </div>
                    <?php }
                    echo $hasNew?"":"<div class='alert alert-outline-success'>No tender Available </div>";
                   ?>
                </div>
                <div class="text-center bg-white pt-3">
                    <a href="javascript:void(0);" class="btn-link dz-load-more" rel="#" id="sellingItems3">View more <i class="fa fa-angle-down ms-2 scale-2"></i></a>
                </div>
            </div>
       
        </div>
        <?php } else{?>
            <div class="card-body">
                <div class="col-12 text-center">
                <button class=" btn btn-lg btn-outline-warning">
                    Your Account is not Approved 
                </button>
                </div>
               
            </div>
       <?php }  ?>
    </div>
</div>
 <!-- modal -->
 <div class="modal fade bd-example-modal-lg" id="basicModal" tabindex="-1" role="dialog" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
        <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"><span id="asr"></span>Basic Info</h5>
                    <button class=" badge badge-circle badge-outline-danger"  data-bs-dismiss="modal"> 
                        <span class=" fa fa-times "></span> &times</button>
                </div>
                <div class="modal-body">
                    <form id="form">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="mb-3">
                                    <label for="menu_type" class="text-black form-label">Price in FRW <span class=" text-danger">*</span></label>
                                    <input type="hidden" name="code" class="" value="" id="rcode" />
                                    <input type="hidden" name="action" class="" value="SEND_TENDER_APPLICATION" />
                                    <input type="number" name="price" class=" form-control" placeholder="eg:300000" />
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="mb-3">
                                    <label for="menu_type" class="text-black form-label">Delivery time in days <span class=" text-danger">*</span> </label>
                                    <input type="number" name="delivery_time" value="" class=" form-control" placeholder="eg:7" />
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="mb-3">
                                    <label for="menu_type" class="text-black form-label">Guarante in months </label>
                                    <input type="number" name="guarante" class=" form-control" value="0" />
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="mb-3">
                                    <label for="menu_type" class="text-black form-label">Special Offer </label>
                                    <textarea class=" form-control" name="special_offer"></textarea>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="mb-3 text-center">
                                    <label for="menu_type" class="text-black form-label"> </label>
                                    <button type="button" class=" btn btn-outline-primary" onclick="saveApplication(this)"> Save</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    