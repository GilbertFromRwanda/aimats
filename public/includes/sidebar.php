<!-- style="background-color: #2f4cddb3;border-radius: 0px 0px 100px 100px;" -->
<div class="nav-header" style="background-color: #2f4cddb3;border-radius: 20px 20px;">
      <a href="home" class="brand-logo">
      <img class="logo-abbr" src="images/logo.png" alt="">
        <span class="brand-title">AIMATS</span>
        <!-- <span class="logo-abbr ">mSt</span> -->
      </a>
      <div class="nav-control">
        <div class="hamburger">
          <span class="line"></span><span class="line"></span><span class="line"></span>
        </div>
      </div>
    </div>
 <!-- Sidebar start
        *********************************** --> 
    <div class="deznav">
      <div class="deznav-scroll">
        <ul class="metismenu" id="menu">
          <li>
            <a class=" ai-icon" href="home" aria-expanded="false">
              <i class="flaticon-381-networking"></i>
              <span class="nav-text">Dashboard</span>
            </a>
          </li>
          <?php if($level=='STUDENT'){ ?>
            <li>
            <a class="ai-icon" href="a_log_book">
              <i class="flaticon-381-book"></i>
              <span class="nav-text">Log book
              </span>
            </a>
          </li>
            <?php }?>
            <?php if($level=='SUPERVISIOR'){ ?>
            <li>
            <a class="ai-icon" href="s_log_book">
              <i class="flaticon-381-book"></i>
              <span class="nav-text">Log book
              </span>
            </a>
          </li>
            <?php }?>
          <?php if($level=='ADMIN'){ ?>
   
          <li>
            <a class="ai-icon" href="a_student_request">
              <i class="flaticon-381-add"></i>
              <span class="nav-text">Student request
              </span>
            </a>
          </li>
            <li>
            <a class="ai-icon" href="a_student">
              <i class="flaticon-381-user-5"></i>
              <span class="nav-text">Students
              </span>
            </a>
          </li>
            <li>
            <a class=" ai-icon" href="a_internaship">
              <i class="flaticon-381-share-2"></i>
              <span class="nav-text">Internaship</span>
            </a>
          </li>
          <li>
            <a class="ai-icon" href="institition">
              <i class="flaticon-381-home"></i>
              <span class="nav-text">Partner</span>
            </a>
          </li>
          <li>
            <a class="ai-icon" href="a_suppervisior">
              <i class="flaticon-381-gift"></i>
              <span class="nav-text">Suppervisior</span>
            </a>
          </li>
          <li>
          <li>
            <a class=" ai-icon" href="reports">
              <i class="flaticon-381-blueprint"></i>
              <span class="nav-text">Reports</span>
            </a>
          </li>
          <?php } ?> 
          <?php 
            if($level==="INST_ADMIN"){
             ?>
            <li>
            <a class="ai-icon" href="benificiary">
              <i class="flaticon-381-gift"></i>
              <span class="nav-text">Beneficiary</span>
            </a>
          </li>
          <a class="ai-icon" href="benificiary">
              <i class="flaticon-381-gift"></i>
              <span class="nav-text">Beneficiaryy</span>
            </a>
          </li>
          <li>
            <a class=" ai-icon" href="allowedDevice">
              <i class="flaticon-381-share-2"></i>
              <span class="nav-text">Allowed devices</span>
            </a>
          </li>
          <li>
            <a class=" ai-icon" href="requested">
              <i class="flaticon-381-bookmark-1"></i>
              <span class="nav-text">Requested devices</span>
            </a>
          </li>
          <li>
            <a class=" ai-icon" href="requests">
              <i class="flaticon-381-plus"></i>
              <span class="nav-text">new devices</span>
            </a>
          </li>
          <li>
            <a class=" ai-icon" href="reported">
              <i class="flaticon-381-bookmark"></i>
              <span class="nav-text">Reported devices</span>
            </a>
          </li>
          <li>
            <a class=" ai-icon" href="reports">
              <i class="flaticon-381-blueprint"></i>
              <span class="nav-text">Reports</span>
            </a>
          </li>
          <?php } ?>
          <?php if($level=="BEN_ADMIN"){ ?>
          <li>
            <a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
              <i class="flaticon-381-share-2"></i>
              <span class="nav-text">Requests</span>
            </a>
            <ul aria-expanded="false">
              <li><a href="requests">New Request</a></li>
              <li><a href="requested">View Requested devices</a></li>
            </ul>
          </li>
          <li>
            <a class=" ai-icon" href="reported">
              <i class="flaticon-381-bookmark"></i>
              <span class="nav-text">Reported devices</span>
            </a>
          </li>
          
          <li>
            <a class=" ai-icon" href="reports">
              <i class="flaticon-381-blueprint"></i>
              <span class="nav-text">Reports</span>
            </a>
          </li>
          <?php } ?>
          <!-- <li>
            <a class=" ai-icon" href="devices">
              <i class="flaticon-381-cloud-computing"></i>
              <span class="nav-text">Device Management</span>
            </a>
          </li> -->

          <?php if(in_array($level,['ADMIN','INST_ADMIN'])){ ?>
          <li>
            <a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
              <i class="flaticon-381-user-1"></i>
              <span class="nav-text">Users</span>
            </a>
            <ul aria-expanded="false">
              <li><a href="add_user">Add User</a></li>
              <li><a href="list_user">All Users</a></li>
            </ul>
          </li>
          
          <?php } ?>
        </ul>
      </div>
    </div>
    <!--**********************************
            Sidebar end
        ***********************************-->