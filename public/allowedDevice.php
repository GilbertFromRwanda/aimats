<?php
require_once("../config/grobals.php");
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
                                            ALL Allowed devices
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
                                        <!-- <th class=" fs-13">Category</th> -->
                                            <th class=" fs-13">Name</th>
                                        </tr>
                                    </thead>
                                    <tbody class=" fs-12">
                                        <?php
                                        $i=1;
                                        $lists=$database->fetch("SELECT name,cat FROM allowed_devices order by id desc");
                                        $cat='';
                                        foreach ($lists as $key => $h) {
                                            if($cat!="{$h['cat']}"){
                                                ?>
                                                <tr><td class=" text-center text-uppercase  text-primary fs-13" colspan="2"><?=$h['cat']?></td></tr>
                                           <?php 
                                        $i=1;   
                                        }
                                            ?>
                                            <tr>
                                                <td><?=$i?></td>
                                               <!-- <td class=" text-uppercase text-primary"><?= $cat=="{$h['cat']}"?'':$h['cat'] ?></td> -->
                                                <td class=" text-uppercase"><?= $h['name'] ?></td>
                                            </tr>
                                        <?php
                                    $cat=$h['cat'];    
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
        <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add New devices</h5>
                    <span class="  close"> <span class=" fa fa-times"  onclick="window.location.reload(true)"></span></span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="form" method="post" action="#">
                    <div class="row">
                    <div class="col-lg-12">
                            <div class="mb-3">
                                <label for="cat" class="text-black form-label">Category <span class="required text-danger">*</span></label>
                                <select type="text" class="form-control" value="" name="category" id="cat">
                                    <option value="" disabled selected>__select__</option>
                                    <option value="inputDevice" >Input device</option>
                                    <option value="outputDevice" >output device</option>
                                    <option value="storageDevice" >Storage device</option>
                                    <option value="processingDevice" >Processing device</option>
                                    <option value="networkDevice" >Network device</option>
                                </select>
                            </div>
                        </div> 
                        <div class="col-lg-12">
                            <div class="mb-3">
                                <label for="name" class="text-black form-label">Name <span class="required text-danger">*</span></label>
                                <input type="text"  name="name" placeholder="Eg: device name here" class=" form-control text-uppercase" id="name"/>
                                <input type="hidden" name="action" value="CREATE_NEW_DEVICE"/>
                            </div>
                        </div> 
                        <div class="col-12">
                            <div id="ajaxresults"></div>
                        </div>
                    </div>
                </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger light" onclick="window.location.reload(true)" >Close</button>
                    <button type="button" class="btn btn-primary" onclick="onBenCreated(this)">Save</button>
                </div>
            </div>
        </div>
    </div>
    <!-- end of modal -->
    <!-- include footer -->
    <?php include_once("./footer.php") ?>