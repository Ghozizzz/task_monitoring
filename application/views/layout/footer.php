
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <strong>Copyright &copy; 2014-2019 <a href="http://adminlte.io">AdminLTE.io</a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 3.0.5
    </div>
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery UI 1.11.4 -->
<script src="<?=base_url();?>plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="<?=base_url();?>plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Select2 -->
<script src="<?=base_url();?>plugins/select2/js/select2.full.min.js"></script>
<!-- Sparkline -->
<script src="<?=base_url();?>plugins/sparklines/sparkline.js"></script>
<!-- jQuery Knob Chart -->
<script src="<?=base_url();?>plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- Bootstrap4 Duallistbox -->
<script src="<?=base_url();?>plugins/moment/moment.min.js"></script>
<script src="<?=base_url();?>plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.js"></script>
<!-- InputMask -->
<script src="<?=base_url();?>plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>
<!-- daterangepicker -->
<script src="<?=base_url();?>plugins/daterangepicker/daterangepicker.js"></script>
<!-- Summernote -->
<script src="<?=base_url();?>plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="<?=base_url();?>plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- Datatables -->
<script src="<?=base_url();?>plugins/datatables/jquery.dataTables.min.js"></script>
<script src="<?=base_url();?>plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="<?=base_url();?>plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="<?=base_url();?>plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<!-- AdminLTE App -->
<script src="<?=base_url();?>assets/js/adminlte.js"></script>
<script>
$(function () {

  window.setTimeout(function() {
    $(".alert-success").hide();
    $(".alert-danger").hide();
  }, 4000);
  //Initialize Select2 Elements
  // $('.select2').select2();
  $('.select2bs4').select2({
    theme: 'bootstrap4'
  });

  //Datemask dd/mm/yyyy
  $('#tanggal_dm').inputmask('yyyy-mm-dd', { 'placeholder': 'yyyy-mm-dd' });

  //Date range picker
  $('#date_id').datetimepicker({
      format: 'YYYY-MM-DD',
  });

  $('#dt_date_id').datetimepicker({
      format: 'YYYY-MM-DD',
  });

  $('#date_jt').datetimepicker({
      format: 'YYYY-MM-DD'
  });

  $('#datetime_id').datetimepicker({
      // timePicker: true,
      format: 'YYYY-MM-DD HH:mm',
  });

  $("#example2").DataTable({
    "responsive": true,
    "autoWidth": false,
    "order": [],
    "columnDefs": [ {
          "targets": 'no-sort',
          "orderable": false,
    } ]
  });

  $("#dt_simple").DataTable({
      "paging": false,
      "lengthChange": false,
      "searching": false,
      "ordering": false,
      "info": false,
      "autoWidth": false,
      "responsive": false,
    });
});
</script>
</body>
</html>
