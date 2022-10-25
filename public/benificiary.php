<?php
// require_once("../config/grobals.php");
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
                                    <button class=" btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#basicModal">Add New</button>
                                </h4>                                   
                                <!-- <small class="mb-0"></small> -->
                            </div>
                            <div class="card-action card-tabs mb-3">
                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-bs-toggle="tab" href="#monthly" role="tab">
                                            ALL benificieries
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
                                        <th class=" fs-13">#</th>
                                            <th class=" fs-13">Name</th>
                                            <th class=" fs-13">Email</th>
                                            <th class=" fs-13">Phone</th>
                                            <th class=" fs-13">Join Date</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody class=" fs-12">
                                        <?php
                                        $ins=$_SESSION['ht_hotel'];
                                        $cond=" where institition_id=$ins";
                                        if($level=="ADMIN"){
                                            $cond="";
                                        }
                                        $lists=$database->fetch("SELECT * FROM beneficiary_tb $cond   order by id desc");
                                        $i=0;
                                        echo $ins;
                                        foreach ($lists as $key => $h) {
                                            $i++;
                                            ?>
                                            <tr>
                                            <td><?= $i?></td>
                                                <td class=" text-capitalize"><?= $h['name'] ?></td>
                                                <td class=""><?= $h['email'] ?></td>
                                                <td class=""><?= $h['phone'] ?></td>
                                                <td class=""><?= date('Y-m-d',strtotime($h['created_at'])) ?></td>
                                                <td>
                                                    <div class="dropdown ms-auto text-right">
                                                        <div class="btn-link" data-bs-toggle="dropdown">
                                                            <svg width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                    <rect x="0" y="0" width="24" height="24"></rect>
                                                                    <circle fill="#000000" cx="5" cy="12" r="2"></circle>
                                                                    <circle fill="#000000" cx="12" cy="12" r="2"></circle>
                                                                    <circle fill="#000000" cx="19" cy="12" r="2"></circle>
                                                                </g>
                                                            </svg>
                                                        </div>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a class="dropdown-item" href="#"><i class="las la-check-square scale5 text-primary me-2"></i> Edit</a>
                                                            <!-- <a class="dropdown-item" href="#"><i class="las la-times-circle scale5 text-danger me-2"></i> Reject Order</a> -->
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        <?php }
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
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add New benificiare</h5>
                    <span class="  close"> <span class=" fa fa-times " data-bs-dismiss="modal"></span></span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="form">
                    <div class="row">
                        <?php if($level=="ADMIN") { ?>
                    <div class="col-lg-12">
                            <div class="mb-3">
                                <label for="menu_type" class="text-black form-label">institition <span class="required text-danger">*</span></label>
                                                            <select type="text" class="form-control" value="" name="institition" id="insti">
                                                            <option value="" disabled selected>__select__</option>
                                                            <?php 
                                                                $lists=$database->fetch("SELECT id,name from institition_tb order by id desc");
                                                                foreach ($lists as $key => $h) {
                                                                ?>    
                                                                <option value="<?=$h['id']?>"><?=$h['name']?></option>
                                                                <?php }?>
                                                            </select>
                            
                            </div>
                        </div>
                        <?php } ?>
                        <div class="col-lg-12">
                            <div class="mb-3">
                                <label for="menu_type" class="text-black form-label">Name <span class="required text-danger">*</span></label>
                                <input type="text"  name="name" placeholder="Eg:UR" class=" form-control text-uppercase"/>
                                <input type="hidden" name="action" value="CREATE_NEW_BEN"/>
                            </div>
                        </div> 
                        <div class="col-lg-6">
                            <div class="mb-3">
                                <label for="menu_type" class="text-black form-label">Contact Email <span class="required text-danger">*</span></label>
                                <input  type="email" name="email"  class=" form-control"/>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="mb-3">
                                <label for="menu_type" class="text-black form-label">Contact Phone <span class="required text-danger">*</span></label>
                                <input  type="number" name="phone"  onkeypress="limitKeypress(event,this.value,10)" placeholder="Eg:0789000000" class=" form-control"/>
                            </div>
                        </div> 
                        <div class="col-12">
                            <div id="ajaxresults"></div>
                        </div>
                    </div>
                </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger light" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="onBenCreated(this)">Save</button>
                </div>
            </div>
        </div>
    </div>
    <!-- end of modal -->
    <!-- include footer -->
    <?php include_once("./footer.php") ?>