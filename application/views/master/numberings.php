<!-- Content Header (Page header) -->
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Master</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="#">Master</a></li>
          <li class="breadcrumb-item active">Numberings</li>
        </ol>
      </div>
    </div>
  </div><!-- /.container-fluid -->
</section>
<div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title"></h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- form start -->
        <form class="eventInsForm" method="post" target="_self" name="formku" id="formku">
          <input type="hidden" id="id" name="id">
          <div class="form-group">
            <label>Prefix</label>
            <input type="text" class="form-control" name="prefix" id="prefix" placeholder="prefix ...">
          </div>
          <div class="form-group">
            <label>Date Info</label>
            <input type="checkbox" id="date_info" name="date_info" checked data-bootstrap-switch data-off-color="danger" data-on-color="success">
          </div>
          <div class="form-group">
            <label>Padding</label>
            <input type="text" class="form-control" name="padding" id="padding" placeholder="padding ...">
          </div>
          <div class="form-group">
            <label>Prefix Separator</label>
            <input type="text" class="form-control" name="prefix_separator" id="prefix_separator" placeholder="Prefix Separator ...">
          </div>
          <div class="form-group">
            <label>Date Separator</label>
            <input type="text" class="form-control" name="date_separator" id="date_separator" placeholder="Date Separator ...">
          </div>
        </form>
      </div>
      <div class="modal-footer justify-content-between">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="saveData">Save changes</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<section class="content">
  <div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="alert alert-success <?=(empty($this->session->flashdata('sukses'))? "d-none": ""); ?>" id="box_msg_sukses">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h5><i class="icon fas fa-check"></i> Sukses</h5>
                <span id="msg_sukses"><?=$this->session->flashdata('sukses'); ?></span>
            </div>
            <div class="alert alert-danger <?=(empty($this->session->flashdata('gagal'))? "d-none": ""); ?>" id="box_msg_gagal">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h5><i class="icon fas fa-ban"></i> Gagal</h5>
                <span id="msg_sukses"><?=$this->session->flashdata('gagal'); ?></span>
            </div>
        </div>
    </div>
    <div class="row">
      <div class="col-12">
        <div class="card">
          <div class="card-header">
            <div class="d-flex justify-content-between">
              <h3 class="card-title">Data Numberings</h3>
              <div class="card-tools">
                <button class="btn btn-block btn-primary" id="tambah">Tambah</button>
              </div>
            </div>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
            <table id="example2" class="table table-bordered table-striped">
              <thead>
              <tr>
                <th>No</th>
                <th>Prefix</th> 
                <th>Date Info</th> 
                <th>Padding</th>
                <th>Prefix Separator</th> 
                <th>Date Separator</th> 
                <th>Actions</th>
              </tr>
              </thead>
              <tbody>
                <?php $no = 0; foreach ($data as $key => $v) { $no++;?>
                <tr>
                    <td><?=$no; ?></td>
                    <td><?=$v->prefix; ?></td>
                    <td><?=($v->date_info==1)? "Yes": "No"; ?></td>
                    <td><?=$v->padding; ?></td>
                    <td><?=$v->prefix_separator; ?></td>
                    <td><?=$v->date_separator; ?></td>
                    <td>
                    <button class="btn btn-info btn-sm" onclick="editData(<?=$v->id;?>)"><i class="fa fa-edit"></i> Edit</button>
                    <a class="btn btn-danger btn-sm" href="<?=base_url().'Admin/number_delete/'.$v->id;?>" onclick="return confirm('Anda yakin menghapus data ini?');"><i class="fa fa-trash"></i> Delete</a>
                    </td>
                </tr>
                <?php } ?>
              </tbody>
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
<script>
var dsState;

$("#tambah").click(function(){
    $('#prefix').val('');
    $('#padding').val('');
    $('#prefix_separator').val('');
    $('#date_separator').val('');
    $('#id').val('');
    dsState = "Input";
    
    $("#myModal").find('.modal-title').text('Add Numbering');
    $("#myModal").modal('show',{backdrop: 'true'}); 
});

$("#saveData").click(function(){
    if($.trim($("#prefix").val()) == ""){
        $('#message').html("Prefix can`t be blank!");
        $('.alert-danger').show();
    }else if($.trim($("#padding").val()) == ""){
        $('#message').html("Padding value can`t be blank!");
        $('.alert-danger').show();
    }else{       
        if(dsState=="Input"){
            $.ajax({
                type:"POST",
                url:'<?=base_url('Admin/cek_number'); ?>',
                data:"data="+$("#prefix").val(),
                success:function(result){
                    //console.log(result);
                    if(result=="ADA"){
                        $('#message').html("Prefix type already exist! Please choose other.");
                        $('.alert-danger').show();
                    }else{
                        $('#message').html("");
                        $('.alert-danger').hide();
                        $('#formku').attr("action", "<?=base_url();?>Admin/number_save");
                        $('#formku').submit();                    
                    }
                }
            });
        }else{
            $('#formku').attr("action", "<?=base_url();?>Admin/number_update");
            $('#formku').submit(); 
        }
    };
});

function editData(id){
    dsState = "Edit";
    $.ajax({
        url: "<?=base_url('Admin/number_edit'); ?>",
        type: "POST",
        data : {id: id},
        success: function (result){
           $('#prefix').val(result['prefix']);
           $("#date_info").bootstrapSwitch('state', result['date_info']);
           $('#padding').val(result['padding']);
           $('#prefix_separator').val(result['prefix_separator']);
           $('#date_separator').val(result['date_separator']);
           $('#id').val(result['id']);
           
           $("#myModal").find('.modal-title').text('Edit Numbering');
           $("#myModal").modal('show',{backdrop: 'true'});           
        }
    });
}

function myCurrency(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode!==190)
        return false;
    return true;
}

$(function(){    
    window.setTimeout(function() { $(".alert-success").hide(); }, 4000);
});
</script>