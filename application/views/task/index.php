<!-- Content Header (Page header) -->
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0 text-dark">Task</h1>
      </div><!-- /.col -->
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="#">Task</a></li>
          <li class="breadcrumb-item active">Index</li>
        </ol>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>

<section class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <div class="alert alert-success <?=(empty($this->session->flashdata('sukses'))? "d-none": ""); ?>" id="box_msg_sukses">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <h5><i class="icon fas fa-check"></i> Sukses</h5>
            <span id="msg_sukses"><?php echo $this->session->flashdata('sukses'); ?></span>
        </div>
        <div class="alert alert-danger <?=(empty($this->session->flashdata('gagal'))? "d-none": ""); ?>" id="box_msg_gagal">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <h5><i class="icon fas fa-ban"></i> Gagal</h5>
            <span id="msg_sukses"><?php echo $this->session->flashdata('gagal'); ?></span>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-12">
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">Project List</h3>
            <div class="card-tools">
              <button class="btn btn-sm btn-block btn-primary" id="tambah">Tambah</button>
            </div>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
            <!-- <div class="row mb-1">
              <div class="col-md-1">
                <label for="Doctor-name">From</label>
              </div>
              <div class="col-md-3">
                <input type="date" id="StartDate"
                  class="form-control" value="<?=date('Y-m-d', strtotime('-2 months'));?>">
              </div>
              <div class="col-md-1">
                <label for="dob">To</label>
              </div>
              <div class="col-md-3">
                <input type="date" id="EndDate"
                  class="form-control" value="<?=date('Y-m-d', strtotime('+1 months'));?>">
              </div>
            </div> -->
            <div class="row mb-1">
              <div class="col-md-1">
                <label for="dob">Status</label>
              </div>
              <div class="col-md-3">
                <select class="form-control" id="status">
                <?php if($this->session->userdata('id_roles')==3){ ?>
                  <option value="0">Ongoing Project</option>
                  <option value="1">Closed Project</option>
                <?php }else{ ?>
                  <option value="1">Closed Project</option>
                  <option value="0">Ongoing Project</option>
                <?php } ?>
                </select>
              </div>
              <div class="col-md-2">
                <label for="dob">Project Manager</label>
              </div>
              <div class="col-md-3">
                <select class="form-control" id="pic">
                  <option value="0">Semua</option>
                  <?php
                    foreach ($pic as $key => $p) {
                      echo '<option value="'.$p->id.'" >'.$p->name.'</option>';
                    }
                  ?>
                </select>
              </div>
              <div class="col-md-4">
                <a href="javascript:;" class="btn btn-info btn" id="filter"><i class="fa fa-search"></i> Filter </a>
                <a href="javascript:;" class="btn btn-info btn" id="reset">Reset</a>
              </div>
            </div>
            <table id="load_trx" class="table table-bordered">
              <thead>
                <tr>
                  <td>#</td>
                  <td>Nama Project</td>
                  <td width="10%">Tanggal Selesai</td>
                  <td>Client</td>
                  <td>PIC</td>
                  <td width="50%">Notes</td>
                  <td>Status</td>
                  <td>Action</td>
                </tr>
              </thead>
            </table>
          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->
  </div>
  <!-- /.container-fluid -->
</section>

<div class="modal fade" id="myModal" tabindex="-1" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">&nbsp;</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <form class="eventInsForm" method="post" target="_self" name="frmInv" 
                    id="frmInv">
                    <input type="hidden" id="id" name="id">
                    <div class="row mb-1">
                        <div class="col-md-5">
                            Nama Project
                        </div>
                        <div class="col-md-7">
                            <input type="text" id="no_task" name="no_task" class="form-control myline">
                        </div>
                    </div>
                    <div class="row mb-1">
                        <div class="col-md-5">
                            Tanggal Selesai
                        </div>
                        <div class="col-md-7">
                          <div class="input-group date" id="date_id" data-target-input="nearest">
                              <input type="text" name="tanggal" value="<?=date('Y-m-d');?>" class="form-control datetimepicker-input" id="tanggal_dt" data-target="#date_id" placeholder="Tanggal ..."/>
                              <div class="input-group-append" data-target="#date_id" data-toggle="datetimepicker">
                                  <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                              </div>
                          </div>
                        </div>
                    </div>
                    <div class="row mb-1">
                        <div class="col-md-5">
                            PIC<font color="#f00">*</font>
                        </div>
                        <div class="col-md-7">
                          <select class="form-control select2bs4" name="pic_id" id="pic_id">
                            <option value="">Please Select ...</option>
                            <?php
                              foreach ($pic as $key => $v) {
                                echo '<option value="'.$v->id.'">'.$v->name.'</option>';
                              }
                            ?>
                          </select>
                        </div>
                    </div>
                    <div class="row mb-1">
                        <div class="col-md-5">
                            Client<font color="#f00">*</font>
                        </div>
                        <div class="col-md-7">
                          <select class="form-control select2bs4" name="client_id" id="client_id">
                            <option value="">Please Select ...</option>
                            <?php
                              foreach ($client as $key => $v) {
                                echo '<option value="'.$v->id.'">'.$v->nama_client.'</option>';
                              }
                            ?>
                          </select>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-5">
                            Notes
                        </div>
                        <div class="col-md-7">
                          <textarea class="form-control" name="notes" id="notes"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">                        
                <button type="button" class="btn btn-primary" id="saveData"><i class="fa fa-save"></i> <span id="tambah_sj_txt">Simpan</span></button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-times"></i> Tutup</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade bd-example-modal-lg" id="historyModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Timeline</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div id="content_timeline">
        </div>
      </div>
    </div>
    </div>
  </div>
</div>
<form method="post" id="form_close_project" style="display: none;">
  <input type="hidden" name="id" id="id_close_project">
</form>
<script>
var dsState;

$(document).ready(function() {
  $('#load_trx').DataTable( {
      "processing": true,
      "serverSide": true,
      "searchDelay": 900,
      "ajax":{
        "url":"<?=site_url('Task/task_list');?>",
        "type":"post",
        "data":function (data) {
            var startDate = $('#StartDate').val();
            var endDate = $('#EndDate').val();
            var status = $('#status').val();
            var pic = $('#pic').val();
            data.startDate = startDate;
            data.endDate = endDate;
            data.status = status;
            data.pic = pic;
        }
      },
      "columnDefs":[
        {
          "targets":'_all',
          "className":'p-1'
        },
        {
          "targets":[3,4],
          "className":'text-right'
        }
      ]
  });
});

$("#tambah").click(function(){
  dsState = "Input";
  $('#no_task').val('');
  $('#tanggal_dt').val('');
  $('#pic_id').val('').trigger('change');
  $('#client_id').val('').trigger('change');
  $('#notes').val('');
  $("#myModal").find('.modal-title').text('Tambah Data Project');
  $("#myModal").modal('show',{backdrop: 'true'}); 
});

$("#reset").click(function () {
  $('#StartDate').val('<?=date('Y-m-d', strtotime('-2 months'));?>');
  $('#EndDate').val('<?=date('Y-m-d');?>');
  $('#load_trx').DataTable().ajax.reload();
});

$("#filter").click(function () {
  $('#load_trx').DataTable().ajax.reload(); 
});

$("#saveData").click(function(){
  if($.trim($("#no_task").val()) == 0){
    Toast.fire({
      icon: 'error',
      title: ' Nama Project harus diisi'
    });
  }else if($.trim($("#tanggal_dt").val()) == 0){
    Toast.fire({
      icon: 'error',
      title: ' Tanggal harus diisi'
    });
  }else if($.trim($("#pic_id").val()) == ""){
    Toast.fire({
      icon: 'error',
      title: ' PIC harus diisi'
    });
  }else if($.trim($("#client_id").val()) == ""){
    Toast.fire({
      icon: 'error',
      title: ' Client harus diisi'
    });
  }else{
    $(this).prop('disabled', true);
    $('#tambah_sj_txt').text('Please Wait ...');
    proceed_save();
  }
});

function proceed_save(){
  if(dsState=="Input"){
    var url = '<?=base_url('Task/save');?>';
  }else{
    var url = '<?=base_url('Task/update');?>';
  }
  $.ajax({
    type:"POST",
    url: url,
    data:{
      id: $('#id').val(),
      no_task: $('#no_task').val(),
      tanggal: $('#tanggal_dt').val(),
      pic_id: $('#pic_id').val(),
      client_id: $('#client_id').val(),
      notes: $('#notes').val(),
    },
    success:function(result){
      console.log(result);
      if(result['status']=="sukses"){
        $("#saveData").prop('disabled', false);
        $('#tambah_sj_txt').text("Simpan");
        $('#load_trx').DataTable().ajax.reload();
        $('#myModal').modal('hide');
        Toast.fire({
          icon: 'success',
          title: ' '+result['msg'],
          timer: 1500
        });
      }else{
        Toast.fire({
          icon: 'error',
          title: ' '+result['msg'],
          timer: 1500
        });
      }
    }
  });
}

function closeProject(id){
  if (window.confirm("Anda yakin ingin close project ini ?")) {
    $('#id_close_project').val(id);
    $('#form_close_project').attr("action", "<?=base_url();?>/Task/close_project");
    $('#form_close_project').submit(); 
  }
}

function editData(id){
  dsState = "Edit";
  $.ajax({
    type:"POST",
    url:"<?=base_url('Task/get_task');?>",
    data:{
      id:id
    },
    success:function(result){
      $('#id').val(result['id']);
      $('#no_task').val(result['no_task']);
      $('#tanggal_dt').val(result['tanggal']);
      $('#notes').val(result['notes']);
      $('#client_id').val(result['client_id']).trigger('change');
      $('#pic_id').val(result['pic_id']).trigger('change');
      $("#myModal").find('.modal-title').text('Edit Data Project');
      $("#myModal").modal('show',{backdrop: 'true'});
    }
  });
}

function openLog(id){
  $.ajax({
    type:"POST",
    url: '<?=base_url('Task/get_history');?>',
    data:{
      id: id,
    },
    success:function(result){
      $(".timeline2").remove();
      $('#historyModal').modal('show');
      $("#content_timeline").append(result);
    }
  });
}
</script>