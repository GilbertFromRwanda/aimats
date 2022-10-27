<?php
include("includes/head.php");
?>

<div id="main-wrapper">
    <?php include("includes/sidebar.php") ?>
    <!-- header here -->
    <?php include("header.php") ?>
    <!-- chatbox here -->
    <div class="content-body">
    <div class="container-fluid">
        <div class="row">
          <?php 
           switch ($level) {
            case 'ADMIN':
             include('./partial/admin_home.php');
              break;
              case 'STUDENT':
                include('./partial/stu_home.php');
                break;
                case 'PARTERN':
                  include('./partial/par_home.php');
                  break;
                case 'SUPERVISIOR':
                    include('./partial/sup_home.php');
                    break;
            default:
            echo "<p>Your homepage not found</p>";
              break;
           }
          ?>
        </div>   
    </div>
    </div>
<!-- include footer -->
<?php include_once("./footer.php") ?>