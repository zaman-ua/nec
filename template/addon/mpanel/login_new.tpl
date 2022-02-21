<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>{$sProjectName} mp v{$sMpanelVersion} - MstarPanel</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/libp/adminlte304/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bbootstrap 4 -->
  <link rel="stylesheet" href="/libp/adminlte304/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="/libp/adminlte304/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="/libp/adminlte304/plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/libp/adminlte304/dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="/libp/adminlte304/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="/libp/adminlte304/plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="/libp/adminlte304/plugins/summernote/summernote-bs4.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

    <link href='/libp/mpanel/css/overlay.css' rel='stylesheet' />
  
  <link rel="SHORTCUT ICON" href="{$sMainUrlHttp}favicon.ico">
  
  <!-- jQuery -->
<script src="/libp/adminlte304/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/libp/adminlte304/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="/libp/adminlte304/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="/libp/adminlte304/plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
{*<script src="/libp/adminlte304/plugins/sparklines/sparkline.js"></script>*}
<!-- JQVMap -->
<script src="/libp/adminlte304/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="/libp/adminlte304/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="/libp/adminlte304/plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="/libp/adminlte304/plugins/moment/moment.min.js"></script>
<script src="/libp/adminlte304/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="/libp/adminlte304/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="/libp/adminlte304/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="/libp/adminlte304/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="/libp/adminlte304/dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="/libp/adminlte304/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/libp/adminlte304/dist/js/demo.js"></script>

	<script language="javascript" type="text/javascript" src="/js/general.js?2436"></script>
	<script language="javascript" type="text/javascript" src="/libp/mpanel/js/functions.js?268"></script>
	<script language="javascript" type="text/javascript" src="/libp/mpanel/js/browser_functions.js?268"></script>
	
	<script language="javascript" type="text/javascript" src="/libp/popcalendar/popcalendar.js?2291"></script>
	<script language="javascript" type="text/javascript" src="/libp/mpanel/js/uploader.js"></script>
	
	<link rel="StyleSheet" href="/libp/mpanel/dtree/dtree.css" type="text/css" />
	<script type="text/javascript" src="/libp/mpanel/dtree/dtree.js"></script>
	
	<script type="text/javascript" src="/libp/js/table.js"></script>
	
	<script language="javascript" type="text/javascript" src="/libp/mpanel/js/ColorPicker2.js"></script>
	<script language="javascript" type="text/javascript" src="/libp/mpanel/js/custom.js"></script>
	<script language="javascript" type="text/javascript" src="/libp/mpanel/js/mpanel.js"></script>
	<script language="javascript" type="text/javascript" src="/libp/mpanel/js/opacity.js"></script>
	
	<script language="javascript" type="text/javascript" src="/libp/ckeditor/ckeditor.js"></script>
	<script language="javascript" type="text/javascript" src="/libp/ckeditor/config.js?3"></script>
	
	<script language="javascript" type="text/javascript" src="/libp/mpanel/js/color_table_new.js?1"></script>
	
	{$sHeadAdditional}
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-dark navbar-primary">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
 </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar elevation-4 sidebar-light-primary">
    <!-- Brand Logo -->
    <a href="#" target="_blank" class="brand-link">
      <img src="/libp/adminlte304/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">{$sProjectName}</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="info">
          <ul class="list-unstyled">
	          <li>{$aAdmin.login}</li>
	          <li>{$aAdmin.last_login}</li>
	          <li>{$aAdmin.last_referer}</li>
	          {if $sVersionTecDoc}<li>TecDoc: {$sVersionTecDoc}</li>{/if}
          </ul>
	          <a style="color:#007bff;" href="/">Вернутся на сайт</a>
        </div>
      </div>
      <!-- Sidebar Menu -->
      {include file="mpanel/dtree.tpl"}
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark" id="path">{$sPath}</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item active" id="win_head">{$sWinHead}</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div id="result_text"><div class="empty_p">&nbsp;</div></div>
    	<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-body p-0" id="sub_menu" style="padding: 10px !important;">
						</div>
                        <div id="loading_id">
                            <div id="loading_id_text">
                                    <img src="/image/mpanel/ajax-loader2.gif">
                                    <div class="alert alert-success" role="alert" id="overlay_messsage">
                                        {$oLanguage->getDMessage('plaese wait, processing is in progress')}
                                    </div>
                            </div>
                        </div>
					</div>
				</div>
			</div>
		</div>
    
      <div class="container-fluid" id="win_text">
          {$sText}
       </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> {$sMpanelVersion}
    </div>
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->



<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<!-- @@@@@@@@@@@@@@@@@@  XAJAX Javascript Code @@@@@@@@@@@@@@@ -->
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
{$sXajaxJavascript}
<script>
xajax.loadingFunction = show_loading;
xajax.doneLoadingFunction = hide_loading;
</script>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

</body>
</html>