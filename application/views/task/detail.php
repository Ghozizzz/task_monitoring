<!-- Content Header (Page header) -->
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0 text-dark">Project <?=$header['no_task'];?></h1>
      </div><!-- /.col -->
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="<?=base_url('Task')?>">Task</a></li>
          <li class="breadcrumb-item active">Detail</li>
        </ol>
      </div><!-- /.col -->
    </div><!-- /.row -->
    <div class="progress">
      <div class="progress-bar" role="progressbar" aria-valuenow="<?=$header['percentage'];?>"
      aria-valuemin="0" aria-valuemax="100" style="width:<?=$header['percentage'];?>%">
        <span><strong id="progressbar_text"><?=$header['percentage'];?></strong> % Complete</span>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12">
        <p>
          <?=$header['notes'];?>
        </p>
      </div>
    </div>
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
            <h3 class="card-title">Task Detail List</h3>
            <div class="card-tools">
              <button class="btn btn-sm btn-block btn-primary" id="tambah">Tambah</button>
            </div>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
            <table id="load_trx" class="table table-bordered">
              <thead>
                <tr>
                  <td>#</td>
                  <td>Task Number</td>
                  <td>Tanggal</td>
                  <td>Nama PIC</td>
                  <td>Notes</td>
                  <td>Percentage</td>
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
                            <input type="text" id="task_number" name="task_number" class="form-control myline">
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
                            <input type="text" id="pic_name" name="pic_name" class="form-control myline"
                              value="<?=$this->session->userdata('name');;?>" readonly="readonly">
                        </div>
                    </div>
                    <div class="row mb-1">
                        <div class="col-md-5">
                            Notes
                        </div>
                        <div class="col-md-7">
                          <textarea class="form-control" name="notes" id="notes"></textarea>
                        </div>
                    </div>
                    <div class="row mb-1">
                        <div class="col-md-5">
                            Percentage<br>
                            <small><b>Range 0-100</b></small>
                        </div>
                        <div class="col-md-7">
                            <input type="text" id="percentage" name="percentage" class="form-control myline" value="0">
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
      "ajax":{
        "url":"<?=site_url('Task/task_detail_list');?>",
        "type":"post",
        "data":function (data) {
            data.task_id = <?=$this->uri->segment(3);?>;
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
  if($.trim($("#task_number").val()) == 0){
    Toast.fire({
      icon: 'error',
      title: ' Task Number harus diisi'
    });
  }else if($.trim($("#tanggal_dt").val()) == 0){
    Toast.fire({
      icon: 'error',
      title: ' Tanggal harus diisi'
    });
  }else{
    $(this).prop('disabled', true).text('Please Wait ...');
    proceed_save();
  }
});

function proceed_save(){
  $.ajax({
    type:"POST",
    url:"<?=base_url('Task/save_detail');?>",
    data:{
      task_id: <?=$this->uri->segment(3);?>,
      task_parent_id: 0,
      task_number: $('#task_number').val(),
      tanggal: $('#tanggal_dt').val(),
      pic_id: <?=$this->session->userdata('user_id');;?>,
      notes: $('#notes').val(),
      percentage: $('#percentage').val(),
      level: 1,
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