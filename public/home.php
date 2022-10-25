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
              case 'INST_ADMIN':
                include('./partial/inst_home.php');
                break;
                case 'BEN_ADMIN':
                  include('./partial/ben_home.php');
                  break;
                case 'SUP_ADMIN':
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