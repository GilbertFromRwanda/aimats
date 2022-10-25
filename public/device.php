<?php

if (!isset($_GET['d']) || !is_numeric($_GET['d'])) {
    echo "Some data are missing! <span >Redirecting ...</span>";
    echo '<meta http-equiv="refresh" content="2;url=./home">'; 
}
$id=$_GET['d'];
$nm=$_GET['nm'];
include("./includes/head.php");

?>
<div id="main-wrapper">
    <?php include("./includes/sidebar.php") ?>
    <!-- header here -->
    <?php include("./header.php") ?>
    <!-- chatbox here -->
    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header border-0 pb-0 d-sm-flex flex-wrap d-block">
                            <div class="mb-3">
                                <h4 class="card-title mb-1">
                                    <!-- <button class=" btn btn-outline-primary">Create Menu</button> -->
                                    <!-- <button class=" btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#basicModal">Add New</button> -->
                                </h4>                                   
                                <!-- <small class="mb-0"></small> -->
                            </div>
                            <div class="card-action card-tabs mb-3">
                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-bs-toggle="tab" href="#monthly" role="tab">
                                            Device detials for <span class=" text-black-50"><?= $nm?></span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
             <div class="col-12">
                <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                                <table id="example"  class="display" style="min-width: 845px">
                                    <thead>
                                        <tr>
                                        <th>#</th>
                                        <th class=" fs-13">Serial.N</th>
                                        <th class=" fs-13">Manufacturer</th>
                                        <th class=" fs-13">Date</th>
                                        <th class=" fs-13">Guarantee</th>
                                        <th class=" fs-13">status</th>
                                        <th class=" fs-13"></th>
                                        </tr>
                                    </thead>
                                    <tbody class=" fs-12">
                                        <?php
                                        $i=1;
                                        $lists=$database->fetch("SELECT * FROM supplied_devices where device_id=$id");
                                        foreach ($lists as $key => $h) {
                                            ?>
                                            <tr>
                                                <td><?=$i?></td>
                                                <td><?=$h['serial_number']?></td>
                                                <td  class=" text-uppercase"><?=$h['manufacturer']?></td>
                                                <td  class=""><?=date('Y-m-d', strtotime($h['created_at']))?></td>
                                                <td><?=$h['end_guarantee']?></td>
                                                <td class=" text-uppercase"><?=$h['status']?></td>
                                                <td class=" d-flex flex-row justify-content-center align-items-center" id="td_<?=$h['id']?>">
                                                <?php if($level==="BEN_ADMIN"):
                                                    if(in_array($h['c_flow'],['none','instToBen'])):
                                                    ?>
                                                   <button class=" btn btn-outline-info btn-xxs" type="button" onclick="onDeviceReport('<?=$h['id']?>','NS','<?=$h['status']?>','<?=$h['serial_number']?>')"> <span class=" fa fa-edit"></span></button>
                                                    <?php
                                                     if(date('Y-m-d')< $h['end_guarantee']): ?>
                                                  <button type="button" class="btn btn-outline-warning btn-xxs m-1" onclick="onDeviceReport('<?=$h['id']?>','NR','<?=$h['status']?>','<?=$h['serial_number']?>')">report</button>
                                                <?php endif; endif;endif; ?>
                                            </td>
                                            </tr>
                                        <?php 
                                    $i++;
                                    }
                                        ?>
                                    </tbody>
                                </table>
                            </div>
                </div>
                </div>
             </div>
            </div>
        </div>
    </div>
        <!-- modal -->
        <div class="modal fade bd-example-modal-lg" id="basicModal" tabindex="-1" role="dialog" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
        <div class="modal-dialog modal-dialog-centered modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Edit devices status Info <span class=" text-black-50" id="info"></span></h5>
                    <span class="  close"  data-bs-dismiss="modal"> <span class=" fa fa-times" ></span></span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="form" method="post" action="#">
                    <div class="row">
                    <div class="col-lg-12 d-none "id="NS">
                            <div class="mb-3">
                                <label for="cat" class="text-black form-label">Health Status <span class="required text-danger">*</span></label>
                                <select type="text" class="form-control" value="" name="status" id="cat">
                                    <option value="" disabled selected>__select__</option>
                                    <option value="functional">Functional</option>
                                    <option value="maintenance">Maintenance</option>
                                    <option value="nonfunctional">Non functional</option>
                                    <option value="lost">Lost</option>
                                </select>
                            </div>
                        </div> 
                        <div class="col-lg-12" id="NR">
                            <div class="mb-3">
                                <label for="name" class="text-black form-label">Short Descriptions <span class="required text-danger">*</span></label>
                                <textarea  name="description"  class=" form-control " id="name"></textarea>
                                <input type="hidden" name="action" value="DEVICE_HEALTH_STATUS"/>
                                <input type="hidden" name="currentS" value="" id="currentS"/>
                                <input type="hidden" name="serial" value="" id="serial"/>
                                <input type="hidden" name="btnClicked" value="" id="btnClicked"/>
                                <input type="hidden" name="dname" value="<?=$_GET['nm']?>" id="btnClicked"/>
                                <input type="hidden" name="dId" value="" id="dId"/>
                            </div>
                        </div> 
                        <div class="col-12">
                            <div id="ajaxresults"></div>
                        </div>
                    </div>
                </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger light"  data-bs-dismiss="modal" >Close</button>
                    <button type="button" class="btn btn-primary" onclick="onDeviceStatusSave(this)">Save</button>
                </div>
            </div>
        </div>
    </div>
    <!-- end of modal -->
    <!-- include footer -->
    <?php include_once("./footer.php") ?>