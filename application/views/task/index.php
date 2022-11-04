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
            <div class="row mb-1">
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
                  class="form-control" value="<?=date('Y-m-d');?>">
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
                  <td>Nomor</td>
                  <td>Tanggal</td>
                  <td>Nama PIC</td>
                  <td>Notes</td>
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
                    <div class="row mb-1">
                        <div class="col-md-5">
                            Task Number
                        </div>
                        <div class="col-md-7">
                            <input type="text" id="no_task" name="no_task" class="form-control myline">
                        </div>
                    </div>
                    <div class="row mb-1">
                        <div class="col-md-5">
                            Tanggal
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
                          <select class="form-control" name="pic_id" id="pic_id">
                            <option value="">Please Select ...</option>
                            <?php
                              foreach ($pic as $key => $v) {
                                echo '<option value="'.$v->id.'">'.$v->name.'</option>';
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
                <button type="button" class="btn btn-primary" id="saveData"><i class="fa fa-plus"></i> <span id="tambah_sj_txt">Tambah</span></button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-times"></i> Tutup</button>
            </div>
        </div>
    </div>
</div>
<script>
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
            data.startDate = startDate;
            data.endDate = endDate;
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
  $('#no_task').val('');
  $('#tanggal_dt').val('');
  $('#pic_id').val('').trigger('change');
  $('#notes').val('');
  $("#myModal").find('.modal-title').text('Tambah Data Transaksi');
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
      title: ' Task Number harus diisi'
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
  }else{
    $(this).prop('disabled', true).text('Please Wait ...');
    proceed_save();
  }
});

function proceed_save(){
  $.ajax({
    type:"POST",
    url:"<?=base_url('Task/save');?>",
    data:{
      no_task: $('#no_task').val(),
      tanggal: $('#tanggal_dt').val(),
      pic_id: $('#pic_id').val(),
      notes: $('#notes').val(),
    },
    success:function(result){
      console.log(result);
      if(result['status']=="sukses"){
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

</script>