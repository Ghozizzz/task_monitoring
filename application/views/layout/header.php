<!DOCTYPE html>
<html lang="id">
<head>
  <?php $m1 = $this->uri->segment(1); $m2 = $this->uri->segment(2); ?>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Company :: <?php echo $m1; ?></title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?=base_url();?>plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bbootstrap 4 -->
  <link rel="stylesheet" href="<?=base_url();?>plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="<?=base_url();?>plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?=base_url();?>assets/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="<?=base_url();?>plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="<?=base_url();?>plugins/daterangepicker/daterangepicker.css">
  <link rel="stylesheet" href="<?=base_url();?>plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="<?=base_url();?>plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="<?=base_url();?>plugins/select2/css/select2.min.css">
  <link rel="stylesheet" href="<?=base_url();?>plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
  <!-- Custom -->
  <link rel="stylesheet" href="<?=base_url();?>assets/css/custom.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <!-- jQuery -->
  <script src="<?=base_url();?>assets/js/jquery-3.5.1.min.js"></script>
  <!-- SweetAlert2 -->
  <link rel="stylesheet" href="<?=base_url();?>plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
  <!-- SweetAlert2 -->
  <script src="<?=base_url();?>plugins/sweetalert2/sweetalert2.min.js"></script>
  <script>
    const Toast = Swal.mixin({
      toast: true,
      position: 'bottom-end',
      showConfirmButton: false,
      timer: 3000
    });
  </script>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
      <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
    </ul>
    <!-- SEARCH FORM -->
    <form class="form-inline ml-3">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-navbar" type="submit">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Notifications Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-user"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <a href="<?=base_url();?>Admin/change_password" class="dropdown-item">
            <i class="fas fa-key"></i> Change Password
          </a>
          <div class="dropdown-divider"></div>
          <a href="<?=base_url();?>Login/logout" class="dropdown-item">
            <i class="fas fa-sign-out-alt"></i> Logout
          </a>
        </div>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="<?=base_url();?>assets/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">Company</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="<?=base_url();?>assets/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="<?=base_url();?>Admin" class="d-block"><?php echo $this->session->userdata('name');?></a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <li class="nav-item has-treeview <?=($m1=='Task')? 'menu-open':'' ;?>">
            <a href="#" class="nav-link <?=($m1=='Task')? 'active':'' ;?>">
              <i class="nav-icon fas fa-truck"></i>
              <p>
                Task
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<?=base_url();?>Task/index" class="nav-link <?=($m1 == 'Task' && $m2=='index')? 'active':'' ;?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Project List</p>
                </a>
              </li>
            </ul>
          </li>
        <?php if($this->session->userdata('id_roles') == 1){ ?>
          <li class="nav-header">Master</li>
          <li class="nav-item has-treeview <?=($m1=='Admin')? 'menu-open':'' ;?>">
            <a href="#" class="nav-link <?=($m2=='bank' || $m2=='barang' || $m2=='barang_relasi' || $m2=='customer' || $m2=='supplier' || $m2=='group_supplier')? 'active':'' ;?>">
              <i class="nav-icon fas fa-sitemap"></i>
              <p>
                Data Master
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<?=base_url();?>Admin/numbering" class="nav-link <?=($m2=='numbering')? 'active':'' ;?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Numbering</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<?=base_url();?>Admin/users" class="nav-link <?=($m2=='users')? 'active':'' ;?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Users</p>
                </a>
              </li>
            </ul>
          </li>
        <?php } ?>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">