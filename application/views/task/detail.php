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
        <?php
          $timeleft = strtotime($header['tanggal'])-strtotime(date('Y-m-d'));
          $daysleft = round((($timeleft/24)/60)/60);
        ?>
        <p>End Date : <span id="tanggal_project"><?=$header['tanggal'];?></span></p>
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
              <?php
                if($header['status']==0){
                  echo '<button class="btn btn-sm btn-block btn-primary" id="tambah">Tambah</button>';
                }
              ?>
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
                  <td width="50%">Notes</td>
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
    <div class="modal-dialog modal-lg">
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
                        <div class="col-md-4">
                            Task Number
                        </div>
                        <div class="col-md-8">
                            <input type="text" id="task_number" name="task_number" class="form-control myline" value="Auto Generated" readonly>
                        </div>
                    </div>
                    <div class="row mb-1">
                        <div class="col-md-4">
                            Tanggal Selesai
                        </div>
                        <div class="col-md-8">
                          <div class="input-group date" id="date_id" data-target-input="nearest">
                              <input type="text" name="tanggal" value="<?=date('Y-m-d');?>" class="form-control datetimepicker-input" id="tanggal_dt" data-target="#date_id" placeholder="Tanggal ..."/>
                              <div class="input-group-append" data-target="#date_id" data-toggle="datetimepicker">
                                  <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                              </div>
                          </div>
                        </div>
                    </div>
                    <div class="row mb-1">
                        <div class="col-md-4">
                            PIC<font color="#f00">*</font>
                        </div>
                        <div class="col-md-8">
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
                        <div class="col-md-4">
                            Notes
                        </div>
                        <div class="col-md-8">
                          <textarea rows="5" class="form-control" name="notes" id="notes"></textarea>
                        </div>
                    </div>
                    <div class="row mb-1">
                        <div class="col-md-4">
                            Percentage<br>
                            <small><b>Range 0-100</b></small>
                        </div>
                        <div class="col-md-8">
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
<script>
var dsState;
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
  dsState = "Input";
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
  if($.trim($("#tanggal_dt").val()) == 0){
    Toast.fire({
      icon: 'error',
      title: ' Tanggal harus diisi'
    });
  }else{
    $(this).prop('disabled', true);
    $('#tambah_sj_txt').text('Please Wait ...');
    proceed_save();
  }
});

function proceed_save(){
  if(dsState=="Input"){
    var url = '<?=base_url('Task/save_detail');?>';
  }else{
    var url = '<?=base_url('Task/update_detail');?>';
  }
  $.ajax({
    type:"POST",
    url:url,
    data:{
      id: $('#id').val(),
      task_id: <?=$this->uri->segment(3);?>,
      task_parent_id: 0,
      task_number: $('#task_number').val(),
      tanggal: $('#tanggal_dt').val(),
      pic_id: $('#pic_id').val(),
      notes: $('#notes').val(),
      percentage: $('#percentage').val(),
      level: 1,
    },
    success:function(result){
      if(result['status']=="sukses"){
        $('#load_trx').DataTable().ajax.reload();
        $('#myModal').modal('hide');
        $('#saveData').prop('disabled', false);
        $('#tambah_sj_txt').text('Simpan');
        parent_progress_bar(result['parent_persen']);
        $('#tanggal_project').txt(result['tanggal']);
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

function editData(id){
  dsState = "Edit";
  $.ajax({
    type:"POST",
    url:"<?=base_url('Task/get_task_detail');?>",
    data:{
      id:id
    },
    success:function(result){
      $('#id').val(result['id']);
      $('#task_number').val(result['task_number']);
      $('#tanggal_dt').val(result['tanggal']);
      $('#notes').val(result['notes']);
      $('#percentage').val(result['percentage']);
      $('#pic_id').val(result['pic_id']).trigger('change');
      $("#myModal").find('.modal-title').text('Tambah Data Transaksi');
      $("#myModal").modal('show',{backdrop: 'true'});
    }
  });
}

function parent_progress_bar(valeur){
  $('.progress-bar').css('width', valeur+'%').attr('aria-valuenow', valeur);
  $('#progressbar_text').text(valeur);
}

function openLog(id){
  $.ajax({
    type:"POST",
    url: '<?=base_url('Task/get_detail_history');?>',
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