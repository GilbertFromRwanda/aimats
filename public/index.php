<?php
session_start();
require("../util/input.php");
if(isset($_SESSION['ht_userId'])){
  header('Location:home');
  exit(0);
}
?>
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="stomach,mystomach,mstoma,hotel app,restaurant menu" />
    <meta name="author" content="Gilbert Niyonsaba" />
    <meta name="robots" content="" />
    <meta name="description" content="Mystoma - Restaurant,hotel and bar customer care" />
    <title>AIMATS-LoginId</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/customer/nprogress.css" rel='stylesheet' />
    <link href="css/customer/mycss.css" rel='stylesheet' />
  <script src="js/customer/nprogress.js"></script>
  <style>

  </style>
</head>
<body class="h-100 mybg">

<script type="text/javascript">
    NProgress.configure({
      showSpinner: false
    });
    NProgress.start();
    if (document.readyState === 'ready' || document.readyState === 'complete') {
      NProgress.done(true);
    } else {
      document.onreadystatechange = function() {
        if (document.readyState == "complete") {
          NProgress.done(true);
        }
      }
    }
  </script>
    <div class="authincation h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100 align-items-center">
                <div class="col-md-6">
                    <div class="authincation-content">
                        <div class="row no-gutters">
                            <div class="col-xl-12">
                                <div class="auth-form">
									<div class="text-center">
                                        <!-- MyStoma -->
										<a href="./"><img src="images/logo.png" alt="">
                  </a>
									</div>
                                    <!-- <h4 class="text-center mb-4">Account Locked</h4> -->
                                    <form action="#" id="formLock" autocomplete="off">
                                        <div class="form-group">
                                            <label><strong>Username</strong></label>
                                            <input type="text" class="form-control" value="" name="user_name" placeholder="Eg:johnd" onkeypress="limitKeypress(event,this.value,50)">
                                            <input type="hidden" class="form-control" value="<?=input::enc_dec("e",'ADMIN_LOGIN')?>" name="faction">
                                        </div>
                                        <div class="form-group">
                                            <label><strong>password</strong></label>
                                            <input type="password" class="form-control text-uppercase" value="" name="password" id="pswd" >
                                        </div>
                                        <div class="form-group  text-center">
                                        <div id="ajaxresults"></div>
                                            <button id="btnaLogin" type="button" class="btn  btn-xs btn-outline-primary w-25">Login </button>
                                            <a href="register" class="btn  btn-xs btn-outline-warning ">Become our Partner </a>
                                      </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- #/ container -->
    <!-- Common JS -->
    <script src="vendor/global/global.min.js"></script>
    <!-- Custom script -->
    <!-- <script src="../js/customer/auth.js"></script> -->
    <script src="js/customer/functions.js"></script>
    <script>
      var input = document.getElementById("pswd");
input.addEventListener("keypress", function(event) {
  if (event.key === "Enter") {
    event.preventDefault();
    document.getElementById("btnaLogin").click();
  }
});
      $("#btnaLogin").click(function(){
           let d=$("#formLock").serialize();
           let btn=$(this);
           $(btn).addClass("d-none");
           NProgress.start();
           sendWithAjax(d,"ajax_pages/user/login").then((res) => {
            NProgress.done(true);
            $(btn).removeClass("d-none");
            if (res.isOk) {
          $("#ajaxresults").html(`<div class="alert alert-success"><p>${res.data}</p></div>`);
          window.location.href=`home`;
        } else {
          $("#ajaxresults").html(`<div class="alert alert-warning"><p>${res.data}</p></div>`);
        }
           }).catch((err) => {
            NProgress.done(true);
           });
      })
    </script>
</body>
</html>