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
    <!-- /.row -->
    <div class="row">
      <div class="col-lg-12 mx-auto">
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">Project List</h3>
            <div class="card-tools">
              <button class="btn btn-sm btn-block btn-primary" id="tambah">Tambah</button>
            </div>
          </div>
          <div class="card-body">
            <div class="row mb-1">
              <div class="col-md-1">
                <label for="Doctor-name">From</label>
              </div>
              <div class="col-md-3">
                <input type="date" id="StartDate"
                  class="form-control" value="<?=date('Y-m-d', strtotime($start));?>">
              </div>
              <div class="col-md-1">
                <label for="dob">To</label>
              </div>
              <div class="col-md-3">
                <input type="date" id="EndDate"
                  class="form-control" value="<?=date('Y-m-d', strtotime($end));?>">
              </div>
              <div class="col-md-1">
                <label for="dob">Status</label>
              </div>
              <div class="col-md-3">
                <select class="form-control" id="status">
                  <option value="0" <?=($status==0)? 'selected':'';?>>Ongoing Project</option>
                  <option value="1" <?=($status==1)? 'selected':'';?>>Closed Project</option>
                </select>
              </div>
            </div>
            <div class="row mb-1">
              <div class="col-md-2">
                <label for="dob">Project Manager</label>
              </div>
              <div class="col-md-3">
                <select class="form-control" id="pic">
                  <option value="0" <?=($pic_selected==0)? 'selected':'';?>>Semua</option>
                  <?php
                    foreach ($pic as $key => $p) {
                      echo '<option value="'.$p->id.'" '.(($pic_selected==$p->id)? 'selected':'').'>'.$p->name.'</option>';
                    }
                  ?>
                </select>
              </div>
              <div class="col-md-4">
                <a href="javascript:;" class="btn btn-info btn" id="filter"><i class="fa fa-search"></i> Filter </a>
              </div>
            </div>
          </div>
        </div>
        <!-- Accordion -->
        <div id="accordionExample" class="accordion shadow">
          <?php foreach ($list_data as $key => $v) { 
            $bg = 'bg-white';
            $timeleft = strtotime($v->tanggal)-strtotime(date('Y-m-d'));
            $daysleft = round((($timeleft/24)/60)/60);
            if($daysleft>0 && $daysleft<7){
              $bg = 'bg-warning';
            }

            if($daysleft==0){
              $bg = 'bg-orange';
            }

            if($daysleft<0){
              $bg = 'bg-red';
            }

            if($v->status==1){
              $bg = 'bg-powderblue';
            }
          ?>
            <div class="card">
              <div id="header_<?=$v->id;?>" class="card-header <?=$bg;?> shadow-sm border-0">
                <h6 class="mb-0 font-weight-bold float-left">
                  <a href="#" data-toggle="collapse" data-target="#header_content_<?=$v->id;?>" aria-expanded="true" aria-controls="header_<?=$v->id;?>" class="d-block position-relative text-dark text-uppercase collapsible-link py-2">
                  <?php
                    echo $v->no_task.' ('.$v->percentage.'%)';
                    if($v->status==0){
                      echo '<small>'.$v->tanggal.' ('.$daysleft.' days left)</small>';
                    }else{
                      echo '<small>'.$v->tanggal.' (Finished)</small>';
                    }
                  ?>
                  </a>
                </h6>
                <h6>
                  <?php
                  if($this->session->userdata('id_roles')!=3){
                      if($v->status == 0){
                        echo '<button  class="btn btn-primary btn-xs float-right mr-2" style="margin-top:2px; margin-bottom:2px; color: white;" onclick="tambah_dt('.$v->id.')"><i class="fa fa-plus"></i> Tambah</button>';
                      }
                      if($v->status == 0){
                        echo '<a href="'.base_url('Task/detail/').$v->id.'" class="btn btn-success btn-xs float-right mr-2" style="margin-top:2px; margin-bottom:2px; color: white;"><i class="fa fa-book"></i> View Detail </a> ';
                        echo ' <a href="javascript:;" onclick="editData('.$v->id.')" class="btn btn-info btn-xs float-right mr-2" style="margin-top:2px; margin-bottom:2px;"><i class="fa fa-pencil-alt"></i> Edit </a> ';
                      }
                      echo ' <button type="button" class="btn btn-xs float-right mr-2 btn-primary" style="margin-top:2px; margin-bottom:2px;" onclick="openLog('.$v->id.')"><i class="fa fa-briefcase"></i> History</button>';
                      if($v->percentage==100 & $v->status == 0){
                        echo ' <button type="button" class="btn btn-xs float-right mr-2 btn-danger" style="margin-top:2px; margin-bottom:2px;" onclick="closeProject('.$v->id.')"><i class="fa fa-times"></i> Close</button>';
                      }
                  }
                  ?>
                </h6>
              </div>
              <div id="header_content_<?=$v->id;?>" data-parent="#header_<?=$v->id;?>" class="collapse">
                <div class="card-body p-3">
                  <p class="font-weight-light m-0 pb-3">
                    <?=$v->notes;?>
                  </p>

                  <?php 
                    $detail = json_decode($v->list); 
                    foreach ($detail as $k => $val) {
                      if($val->detail_id!=null){
                        $count_txt = strlen($val->notes_detail);
                  ?>
                  <div class="card">
                    <div id="detail_<?=$val->detail_id;?>" class="card-header bg-white shadow-sm border-0">
                      <h6> 
                        <?php if($val->child>0){ ?>
                          <a href="<?=base_url('Task/detailed/').$v->id.'/'.$val->detail_id;?>" class="btn btn-success btn-xs float-right" style="margin-top:2px; margin-bottom:2px; margin-left: 2px;"><i class="fa fa-book"></i> View Detail </a> 
                        <?php }
                          if($val->child==0){
                            if($v->status==0){
                              echo ' <a href="javascript:;" class="btn btn-info btn-xs float-right" style="margin-top:2px; margin-bottom:2px;" onclick="editData_dt('.$val->detail_id.')"><i class="fas fa-pencil-alt"></i> Edit </a> ';
                            }
                          }
                        ?>
                        <button type="button" class="btn btn-xs btn-primary float-right mr-2" style="margin-top:2px; margin-bottom:2px;" onclick="openLogDetail(<?=$val->detail_id;?>)">History</button> &nbsp; 
                      <div class="float-left">
                        <h6 class="mb-0 font-weight-bold"><a href="#" data-toggle="collapse" data-target="#detail_content_<?=$val->detail_id;?>" aria-expanded="true" aria-controls="detail_content_<?=$val->detail_id;?>" class="d-block position-relative text-dark text-uppercase collapsible-link py-2">
                        <?=$val->task_number.' ('.$val->persen_detail.'%)';?></a></h6>
                        <p class="font-weight-light m-0"><?=substr($val->notes_detail,0,150).(($count_txt>150)?' ...':'');?></p>
                      </div>
                    </div>
                    <div id="detail_content_<?=$val->detail_id;?>" data-parent="#detail_<?=$val->detail_id;?>" class="collapse">
                      <div class="card-body p-3">
                        <?php 
                          foreach ($val->detail as $kd => $vd) {
                        ?>
                        <div class="card">
                          <div id="detailed_<?=$vd->id;?>" class="card-header bg-white shadow-sm border-0">
                            <h6>
                              <?php
                                echo ' <a href="javascript:;" class="btn btn-info btn-xs float-right" style="margin-top:2px; margin-bottom:2px;" onclick="editData_detailed('.$vd->id.')"><i class="fas fa-pencil-alt"></i> Edit </a> ';
                              ?>
                              <button type="button" class="btn btn-xs btn-primary float-right mr-2" style="margin-top:2px; margin-bottom:2px;" onclick="openLogDetail(<?=$vd->id;?>)">History</button> &nbsp; 
                            <div class="float-left">
                              <h6 class="mb-0 font-weight-bold"><a href="#" data-toggle="collapse" data-target="#detailed_content_<?=$vd->id;?>" aria-expanded="true" aria-controls="detailed_content_<?=$vd->id;?>" class="d-block position-relative text-dark text-uppercase collapsible-link py-2">
                              <?=$vd->task_number.' ('.$vd->percentage.'%)';?></a></h6>
                            </div>
                          </div>
                          <div id="detailed_content_<?=$vd->id;?>" data-parent="#detailed_<?=$vd->id;?>" class="collapse">
                            <div class="card-body p-3">
                              <p class="font-weight-light m-0"><?=$vd->notes;?></p>
                            </div>
                          </div>
                        </div>
                        <?php } ?>
                      </div>
                    </div>
                  </div>
                  <?php } 
                      } ?>
                </div>
              </div>
            </div>
          <?php } ?>
        </div>
      </div>
    </div>

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
<form method="post" id="form_close_project" style="display: none;">
  <input type="hidden" name="id" id="id_close_project">
</form>

<div class="modal fade" id="dt_myModal" tabindex="-1" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">&nbsp;</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <form class="eventInsForm" method="post" target="_self" name="dt_frmInv" 
                    id="dt_frmInv">
                    <input type="hidden" id="dt_id" name="dt_id">
                    <input type="hidden" id="dt_task_id" name="dt_task_id">
                    <input type="hidden" id="dt_task_parent_id" name="dt_task_parent_id">
                    <div class="row mb-1">
                        <div class="col-md-5">
                            Task Number
                        </div>
                        <div class="col-md-7">
                            <input type="text" id="dt_task_number" name="dt_task_number" class="form-control myline" value="Auto Generated" readonly>
                        </div>
                    </div>
                    <div class="row mb-1">
                        <div class="col-md-5">
                            Tanggal Selesai
                        </div>
                        <div class="col-md-7">
                          <div class="input-group date" id="dt_date_id" data-target-input="nearest">
                              <input type="text" name="dt_tanggal" value="<?=date('Y-m-d');?>" class="form-control datetimepicker-input" id="dt_tanggal_dt" data-target="#dt_date_id" placeholder="Tanggal ..."/>
                              <div class="input-group-append" data-target="#dt_date_id" data-toggle="datetimepicker">
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
                          <select class="form-control select2bs4" name="dt_pic_id" id="dt_pic_id">
                            <option value="">Please Select ...</option>
                            <?php
                              foreach ($pic_dt as $key => $pdt) {
                                echo '<option value="'.$pdt->id.'">'.$pdt->name.'</option>';
                              }
                            ?>
                          </select>
                        </div>
                    </div>
                    <div class="row mb-1">
                        <div class="col-md-5">
                            Notes
                        </div>
                        <div class="col-md-7">
                          <textarea class="form-control" name="dt_notes" id="dt_notes"></textarea>
                        </div>
                    </div>
                    <div class="row mb-1">
                        <div class="col-md-5">
                            Percentage<br>
                            <small><b>Range 0-100</b></small>
                        </div>
                        <div class="col-md-7">
                            <input type="text" id="dt_percentage" name="dt_percentage" class="form-control myline" value="0">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">                        
                <button type="button" class="btn btn-primary" id="dt_saveData"><i class="fa fa-plus"></i> <span id="dt_tambah_sj_txt">Tambah</span></button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-times"></i> Tutup</button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="dtd_myModal" tabindex="-1" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">&nbsp;</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <form class="eventInsForm" method="post" target="_self" name="dtd_frmInv" 
                    id="dtd_frmInv">
                    <input type="hidden" id="dtd_id" name="dtd_id">
                    <input type="hidden" id="dtd_task_id" name="dtd_task_id">
                    <input type="hidden" id="dtd_task_parent_id" name="dtd_task_parent_id">
                    <div class="row mb-1">
                        <div class="col-md-5">
                            Task Number
                        </div>
                        <div class="col-md-7">
                            <input type="text" id="dtd_task_number" name="dtd_task_number" class="form-control myline" value="Auto Generated" readonly>
                        </div>
                    </div>
                    <div class="row mb-1">
                        <div class="col-md-5">
                            Tanggal Selesai
                        </div>
                        <div class="col-md-7">
                          <div class="input-group date" id="dtd_date_id" data-target-input="nearest">
                              <input type="text" name="dtd_tanggal" value="<?=date('Y-m-d');?>" class="form-control datetimepicker-input" id="dtd_tanggal_dt" data-target="#dtd_date_id" placeholder="Tanggal ..."/>
                              <div class="input-group-append" data-target="#dtd_date_id" data-toggle="datetimepicker">
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
                          <select class="form-control select2bs4" name="dtd_pic_id" id="dtd_pic_id">
                            <option value="">Please Select ...</option>
                            <?php
                              foreach ($pic_dtd as $key => $pdtd) {
                                echo '<option value="'.$pdtd->id.'">'.$pdtd->name.'</option>';
                              }
                            ?>
                          </select>
                        </div>
                    </div>
                    <div class="row mb-1">
                        <div class="col-md-5">
                            Notes
                        </div>
                        <div class="col-md-7">
                          <textarea class="form-control" name="dtd_notes" id="dtd_notes"></textarea>
                        </div>
                    </div>
                    <div class="row mb-1">
                        <div class="col-md-5">
                            Percentage<br>
                            <small><b>Range 0-100</b></small>
                        </div>
                        <div class="col-md-7">
                            <input type="text" id="dtd_percentage" name="dtd_percentage" class="form-control myline" value="0">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">                        
                <button type="button" class="btn btn-primary" id="dtd_saveData"><i class="fa fa-plus"></i> <span id="dtd_tambah_sj_txt">Tambah</span></button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-times"></i> Tutup</button>
            </div>
        </div>
    </div>
</div>

<script>
var dsState;
var dsStateDetail;
var dsStateDetailed;

/** Detail 2 **/
function tambah_dtd(task_id){
  dsStateDetailed = "Input";
  $('#dtd_task_id').val(task_id);
  $('#dtd_task_parent_id').val(0);
  $('#dtd_tanggal_dt').val('');
  $('#dtd_pic_id').val('').trigger('change');
  $('#dtd_notes').val('');
  $("#dtd_myModal").find('.modal-title').text('Tambah Data Transaksi');
  $("#dtd_myModal").modal('show',{backdrop: 'true'}); 
}

function editData_dtd(id){
  dsStateDetailed = "Edit";
  $.ajax({
    type:"POST",
    url:"<?=base_url('Task/get_task_detail');?>",
    data:{
      id:id
    },
    success:function(result){
      $('#dtd_id').val(result['id']);
      $('#dtd_task_id').val(result['task_id']);
      $('#dtd_task_parent_id').val(result['parent_id']);
      $('#dtd_task_number').val(result['task_number']);
      $('#dtd_tanggal_dt').val(result['tanggal']);
      $('#dtd_notes').val(result['notes']);
      $('#dtd_percentage').val(result['percentage']);
      $('#dtd_pic_id').val(result['pic_id']).trigger('change');
      $("#dtd_myModal").find('.modal-title').text('Tambah Data Transaksi');
      $("#dtd_myModal").modal('show',{backdrop: 'true'});
    }
  });
}

$("#dtd_saveData").click(function(){
  if($.trim($("#dtd_tanggal_dt").val()) == 0){
    Toast.fire({
      icon: 'error',
      title: ' Tanggal harus diisi'
    });
  }else{
    $(this).prop('disabled', true);
    $('#dtd_tambah_sj_txt').text('Please Wait ...');
    proceed_save_dt();
  }
});

function proceed_save_dtd(){
  if(dsStateDetailed=="Input"){
    var dtd_url = '<?=base_url('Task/save_detail');?>';
  }else{
    var dtd_url = '<?=base_url('Task/update_detail');?>';
  }
  $.ajax({
    type:"POST",
    url:dtd_url,
    data:{
      id: $('#dtd_id').val(),
      task_id: $('#dtd_task_id').val(),
      task_parent_id: $('#dtd_task_parent_id').val(),
      task_number: $('#dtd_task_number').val(),
      tanggal: $('#dtd_tanggal_dt').val(),
      pic_id: $('#dtd_pic_id').val(),
      notes: $('#dtd_notes').val(),
      percentage: $('#dtd_percentage').val(),
      level: 1,
    },
    success:function(result){
      if(result['status']=="sukses"){
        $('#dtd_myModal').modal('hide');
        $('#dtd_saveData').prop('disabled', false);
        $('#dtd_tambah_sj_txt').text('Simpan');
        Toast.fire({
          icon: 'success',
          title: ' '+result['msg'],
          timer: 1500
        });
        location.reload();
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

/** Detail 1 **/
function tambah_dt(task_id){
  dsStateDetail = "Input";
  $('#dt_task_id').val(task_id);
  $('#dt_task_parent_id').val(0);
  $('#dt_tanggal_dt').val('');
  $('#dt_pic_id').val('').trigger('change');
  $('#dt_notes').val('');
  $("#dt_myModal").find('.modal-title').text('Tambah Data Transaksi');
  $("#dt_myModal").modal('show',{backdrop: 'true'}); 
}

function editData_dt(id){
  dsStateDetail = "Edit";
  $.ajax({
    type:"POST",
    url:"<?=base_url('Task/get_task_detail');?>",
    data:{
      id:id
    },
    success:function(result){
      $('#dt_id').val(result['id']);
      $('#dt_task_id').val(result['task_id']);
      $('#dt_task_parent_id').val(result['parent_id']);
      $('#dt_task_number').val(result['task_number']);
      $('#dt_tanggal_dt').val(result['tanggal']);
      $('#dt_notes').val(result['notes']);
      $('#dt_percentage').val(result['percentage']);
      $('#dt_pic_id').val(result['pic_id']).trigger('change');
      $("#dt_myModal").find('.modal-title').text('Tambah Data Transaksi');
      $("#dt_myModal").modal('show',{backdrop: 'true'});
    }
  });
}

$("#dt_saveData").click(function(){
  if($.trim($("#dt_tanggal_dt").val()) == 0){
    Toast.fire({
      icon: 'error',
      title: ' Tanggal harus diisi'
    });
  }else{
    $(this).prop('disabled', true);
    $('#dt_tambah_sj_txt').text('Please Wait ...');
    proceed_save_dt();
  }
});

function proceed_save_dt(){
  if(dsStateDetail=="Input"){
    var dt_url = '<?=base_url('Task/save_detail');?>';
  }else{
    var dt_url = '<?=base_url('Task/update_detail');?>';
  }
  $.ajax({
    type:"POST",
    url:dt_url,
    data:{
      id: $('#dt_id').val(),
      task_id: $('#dt_task_id').val(),
      task_parent_id: $('#dt_task_parent_id').val(),
      task_number: $('#dt_task_number').val(),
      tanggal: $('#dt_tanggal_dt').val(),
      pic_id: $('#dt_pic_id').val(),
      notes: $('#dt_notes').val(),
      percentage: $('#dt_percentage').val(),
      level: 1,
    },
    success:function(result){
      if(result['status']=="sukses"){
        $('#dt_myModal').modal('hide');
        $('#dt_saveData').prop('disabled', false);
        $('#dt_tambah_sj_txt').text('Simpan');
        Toast.fire({
          icon: 'success',
          title: ' '+result['msg'],
          timer: 1500
        });
        location.reload();
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

/** Project **/
$("#tambah").click(function(){
  dsState = "Input";
  $('#id').val('');
  $('#no_task').val('');
  $('#tanggal_dt').val('');
  $('#pic_id').val('').trigger('change');
  $('#client_id').val('').trigger('change');
  $('#notes').val('');
  $("#myModal").find('.modal-title').text('Tambah Data Project');
  $("#myModal").modal('show',{backdrop: 'true'}); 
});

$("#filter").click(function(){
    var s=$('#StartDate').val();
    var e=$('#EndDate').val();
    var status=$('#status').val();
    var pic=$('#pic').val();
    window.location = '<?=base_url();?>Task/home/'+s+'/'+e+'/'+status+'/'+pic;
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
        $('#myModal').modal('hide');
        Toast.fire({
          icon: 'success',
          title: ' '+result['msg'],
          timer: 1500
        });
        location.reload();
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

function closeProject(id){
  if (window.confirm("Anda yakin ingin close project ini ?")) {
    $('#id_close_project').val(id);
    $('#form_close_project').attr("action", "<?=base_url();?>/Task/close_project");
    $('#form_close_project').submit(); 
  }
}

function openLogDetail(id){
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