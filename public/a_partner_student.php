<?php
require_once("../config/grobals.php");

include("./includes/head.php");
if (isset($_GET['n'])) {
    $id = $_GET['n'];
    $idDec=input::enc_dec("d",$id);
    $database->query("DELETE FROM notifications_tb where id=$idDec");
}
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
                                </h4>                                   
                                <!-- <small class="mb-0"></small> -->
                            </div>
                            <div class="card-action card-tabs mb-3">
                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link  active"   href="a_student_request" role="tab">
                                            Back
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
             <div class=" card">
             <div class="card-body">
                    <div class="table-responsive">
                                <table id="example"  class="display">
                                    <thead>
                                        <tr>
                                        <th class=" fs-13">#</th>
                                        <!-- <th class=" fs-13">ID</th> -->
                                            <th class=" fs-13">Names</th>
                                            <th class=" fs-13">Major</th>
                                            <th class=" fs-13">Email</th>
                                            <th class=" fs-13">Tel</th>
                                        </tr>
                                    </thead>
                                    <tbody class=" fs-12">
                                    
                                        <?php
                                        $userId=$_SESSION['ht_userId'];
                                            $cond="";
                                            if(isset($_GET['pinter']) && is_numeric($_GET['pinter'])){
                                                $cond="where internaship_periode_id={$_GET['pinter']} AND partner_id={$userId} order by id desc ";
                                            }
                                        //   echo $cond;
                                        $lists=$database->fetch("SELECT * FROM a_student_tb $cond ");
                                        $i=0;
                                        $inters=[];
                                        $partners=[];
                                        $supv=[];
                                        foreach ($lists as $key => $h) {
                                            $i++;
                                            ?>
                                            <tr>
                                            <td><?= $i?></td>
                                                <td class=" text-capitalize"><?= $h['first_name'] .' '. $h['last_name'] ?></td>
                                                <td class=" text-capitalize"><?= $h['major_in'] ?></td>
                                                <td class=""><?= $h['email'] ?></td>
                                                <td class=""><?= $h['phone'] ?></td>
                                                <!-- <td>
                                                    <select  class="approveSupplier form-control is_<?=$h['is_active']?>" data-sup="<?= $h['id']?>">
                                                       <option value="yes" <?php if($h['is_active']=="yes")echo "selected" ?>> Yes </option>
                                                       <option value="no" <?php if($h['is_active']=="no")echo "selected" ?>> No </option>
                                                </select>
                                                </td> -->
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
                    <h5 class="modal-title" id="title">Add New Student</h5>
                    <span class="  close"> <span class=" fa fa-times " data-bs-dismiss="modal"></span></span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="form">
                        <div class="row divRequestForm mydv" >
                            <div class="col-md-8">
                            <div class="mb-3">
                                <label for="menu_type" class="text-black form-label">Internaship period <span class="required text-danger">*</span></label>
                                <select type="text" class="form-control" value="" name="internaship" id="intern">
                                    <?php 
                                
                                    ?>
                            </select>                           
                            </div>
                            </div>
                            <div class="col-md-4 mt-2">
                            <div class="mb-3 mt-4"> 
                        </div>
                        </div>
                    <div class="row d-none divStudent mydv">
                        <div class="col-lg-6">
                            <div class="mb-3">
                                <label for="menu_type" class="text-black form-label">Student name <span class="required text-danger">*</span></label>
                                <input type="text" readonly="true"  name="name" id="names" class=" form-control text-uppercase"/>
                                <input type="hidden" name="action" id="action" value="ASSIGN_STUDENT_TO_PARTNER_TO_SUPPERVISIOR"/>
                            </div>
                        </div> 
                        <div class="col-lg-6">
                            <div class="mb-3">
                                <label for="menu_type" class="text-black form-label">Major In <span class="required text-danger">*</span></label>
                                <input  type="text" name="majorIn" id="majorIn" class=" form-control"/>
                            </div>
                        </div> 
                        <div class="col-lg-6">
                            <div class="mb-3">
                                <label for="menu_type" class="text-black form-label">Suppervisior <span class="required text-danger">*</span></label>
                                <!-- <input type="number"  name="tin" placeholder="Eg:000000001" class=" form-control" onkeypress="limitKeypress(event,this.value,9)"/> -->
                                <select value="" id="sSuppervisior" name="suppervisior" class="form-control">
                                </select>
                            </div>
                        </div> 
                        <div class="col-lg-6">
                            <div class="mb-3">
                                <label for="menu_type" class="text-black form-label">Partner  <span class="required text-danger">*</span> <span class=" text-warning" id="waitPartner"></span></label>
                                <select value="" id="sPartner" name="partner" class=" form-control">
                                </select>
                            </div>
                        </div> 
                        <div class="col-md-12 text-center">
                        <button type="button" class="btn btn-primary "  onclick="onAssignStudent(this)">Save</button> 
                        </div> 
                    </div>
                    <div class="row">
                    <div class="col-12">
                            <div id="ajaxresults"></div>
                        </div>
                    </div>
               
                </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger light" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary  d-none"  onclick="onSupplierCreated(this)">Save</button>
                </div>
            </div>
        </div>
    </div>
    <!-- end of modal -->
    <!-- include footer -->
    <?php include_once("./footer.php") ?>
