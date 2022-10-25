<?php
// require_once("../config/grobals.php");
include("./includes/head.php");
?>
<style>
.border-red{
    border: 1px solid red;
}
</style>
<div id="main-wrapper">
    <?php include("./includes/sidebar.php") ?>
    <!-- header here -->
    <?php include("./header.php") ?>
    <?php
    $currentIntern=$database->get("*","a_internaship_periode","status='activated'");
    $studentNumbers=0;
    if(isset($currentIntern->id)){
    $studentNumbers=$database->count_all("a_student_tb where internaship_periode_id={$currentIntern->id}");
    $studentNumbers-=$currentIntern->taken_student;
    }
    if($studentNumbers==0){
        redirect::back();
        exit(0);
    }
   
    ?>
    <!-- chatbox here -->
    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header border-0 pb-0 d-sm-flex flex-wrap d-block">
                            <div class="mb-3">
                                <p class="mb-1">
                              <span>Current Internaship students <span class="badge badge-info badge-sm"><?=$studentNumbers?></span></span>
                                  
                                </p>                                   
                                <!-- <small class="mb-0"></small> -->
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
                                            <th class=" fs-13">Major </th>
                                            <th class=" fs-13">Available</th>
                                            <th class=" fs-13">Take</th>
                                        </tr>
                                    </thead>
                                    <tbody class=" fs-12">
                                        <?php
                                        $major=$database->fetch("SELECT COUNT(*) as total,major_in FROM a_student_tb WHERE (internaship_periode_id={$currentIntern->id} AND partner_id IS NULL) GROUP by major_in");
                                        $i=0;
                                        foreach ($major as $key => $m) {
                                            $i++;
                                            $noSpace=input::removeSpaceWith($m['major_in'],"_");
                                            ?>
                                            <tr>
                                            <td><?= $i?></td>
                                    <td class=" text-capitalize"><?=$m['major_in']?></td>
                                    <td><?=$m['total']?></td>
                                    <td><input class="form-control" type="number" name="<?=$noSpace?>" id="input<?=$i?>" data-count="<?=$m['total']?>" data-name="<?=$m['major_in']?>" value="0"></td>
                                    </tr>
                                    <?php 
                                    }
                                    ?>
                                    <tr><td colspan="3" class=" text-center">
                                        <button style="margin-left:38%;position: absolute;" class="btn btn-outline-primary" onclick="onPartnerSendRequest(<?=$i?>)">Send Request Now</button></td></tr>
                                    </tbody>
                                </table>
                            </div>
                   
                 </div>
                </div>
             </div>
            </div>
        </div>
    </div>
    <!-- include footer -->
    <?php include_once("./footer.php") ?>
    <script>
        var inter="<?=$currentIntern->id?>";
        function onPartnerSendRequest(round=0){
            let urlname="";
            let urlvalue="";
            let isCorrect=true;
            let hasData=false;
            for (let index = 1; index <=round; index++) {
                let taken=$(`#input${index}`).val();
                let Available= $(`#input${index}`).data("count");
                let name=$(`#input${index}`).data("name");
                if(taken>Available && taken>0){
                    $(`#input${index}`).addClass("border-red");
                    isCorrect=false;
                }else if(taken>0){
                urlname+=`${name},`;
                urlvalue+=`${taken},`;
                hasData=true;
                }else{
                    $(`#input${index}`).removeClass("border-red");   
                }
            }
            if(!isCorrect){
                alert("Please check your input");
                return;
            }
            if(!hasData){
                alert("couldn't empty");
                return;
            }
            fetch(`ajax_pages/internaship?action=PARTNER_REQUEST_STUDENT&major=${urlname}&major_value=${urlvalue}&inter=${inter}`)
            .then((res)=>res.json()).then((res)=>{
                console.log(res);
            });
        }
        $(document).ready(()=>{

        })
    </script>