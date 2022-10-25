<?php
include("./includes/head.php");
?>

<div id="main-wrapper">
    <?php include("./includes/sidebar.php") ?>
    <!-- header here -->
    <?php include("./header.php") ?>
    <!-- chatbox here -->
    <div class="content-body">
        <div class="container-fluid">
            <div class="form-head d-flex mb-3 align-items-start">
                <div class="me-auto d-none d-lg-block">
                    <h2 class="text-primary font-w600 mb-0">Reports</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <?php
                                if ($level == "ADMIN") { ?>

                                    <div class="col-lg-4">
                                        <div class="widget-stat card">
                                            <div class="card-body p-4 btn-outline-primary " onclick="chooseReport('SR','The suppliers rating')">
                                                <div class="media ai-icon d-flex">
                                                    <div class="media-body ">
                                                        <p class="mb-0">The suppliers rating </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="widget-stat card">
                                            <div class="card-body p-4 btn-outline-warning dates" onclick="chooseReport('LRQD','List of requested devices')">
                                                <div class="media ai-icon d-flex">
                                                    <div class="media-body ">
                                                        <p class="mb-0">List of requested devices </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="widget-stat card">
                                            <div class="card-body p-4 btn-outline-light dates" onclick="chooseReport('LRPD','List of reported devices')">
                                                <div class="media ai-icon d-flex">
                                                    <div class="media-body ">
                                                        <p class="mb-0">List of reported devices </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="widget-stat card">
                                            <div class="card-body p-4 btn-outline-success dates" onclick="chooseReport('LS','List of suppliers')">
                                                <div class="media ai-icon d-flex">
                                                    <div class="media-body ">
                                                        <p class="mb-0">List of suppliers </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                               
                                    <?php } elseif ($level == "INST_ADMIN") { ?>
                                       
                                        <div class="col-lg-4">
                                        <div class="widget-stat card">
                                            <div class="card-body p-4 btn-outline-success" onclick="chooseReport('BR','The beneficiary rating')">
                                                <div class="media ai-icon d-flex">
                                                    <div class="media-body ">
                                                        <p class="mb-0">The beneficiary rating </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="widget-stat card">
                                            <div class="card-body p-4 btn-outline-info dates" onclick="chooseReport('LRQD','List of requested devices')">
                                                <div class="media ai-icon d-flex">
                                                    <div class="media-body ">
                                                        <p class="mb-0">List of requested devices </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="widget-stat card">
                                            <div class="card-body p-4 btn-outline-danger dates" onclick="chooseReport('LRPD','List of reported devices')">
                                                <div class="media ai-icon d-flex">
                                                    <div class="media-body ">
                                                        <p class="mb-0">List of reported devices </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="widget-stat card">
                                            <div class="card-body p-4 btn-outline-warning dates" onclick="chooseReport('LDNW','List of devices not working ')">
                                                <div class="media ai-icon d-flex">
                                                    <div class="media-body ">
                                                        <p class="mb-0">List of devices not working </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                               
                                <?php } else { ?>

                                    <div class="col-lg-4">
                                        <div class="widget-stat card btn-outline-primary dates" onclick="chooseReport('LRQD','List of requested devices')">
                                            <div class="card-body p-4">
                                                <div class="media ai-icon d-flex">
                                                    <div class="media-body ">
                                                        <p class="mb-0">List of requested devices</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="widget-stat card">
                                            <div class="card-body p-4 btn-outline-info dates" onclick="chooseReport('LRD','List of replaced devices')">
                                                <div class="media ai-icon d-flex">
                                                    <div class="media-body ">
                                                        <p class="mb-0">List of replaced devices  </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="widget-stat card">
                                            <div class="card-body p-4 btn-outline-danger dates"  onclick="chooseReport('LMD','List of maintenance devices')">
                                                <div class="media ai-icon d-flex">
                                                    <div class="media-body ">
                                                        <p class="mb-0">List of maintenance devices </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="widget-stat card">
                                            <div class="card-body p-4 btn-outline-success dates" onclick="chooseReport('LUD','List of unfunctional devices')">
                                                <div class="media ai-icon d-flex">
                                                    <div class="media-body ">
                                                        <p class="mb-0">List of unfunctional devices</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <?php } ?>
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
                    <h5 class="modal-title"><span id="asr"></span> reports</h5>
                    <button class=" badge badge-circle badge-outline-danger"> 
                        <span class=" fa fa-times " data-bs-dismiss="modal"></span></button>
                </div>
                <div class="modal-body">
                   <form id="form">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="mb-3">
                                    <label for="menu_type" class="text-black form-label">From </label>
                                    <input type="date" name="from" class=" form-control" />
                                    <input type="hidden" name="rname" class="form-control" id="rname" />
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="mb-3">
                                    <label for="menu_type" class="text-black form-label">To </label>
                                    <input type="date" name="to" class=" form-control" />
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="mb-3 text-center">
                                    <label for="menu_type" class="text-black form-label"> </label>
                                    <button type="button" class=" btn btn-outline-primary" onclick="generateReport()"> Generate</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <!-- include footer -->
    <?php include_once("./footer.php") ?>