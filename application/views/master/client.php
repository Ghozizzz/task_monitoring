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
          <li class="breadcrumb-item active">client</li>
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
            <label>Nama client</label>
            <input type="text" class="form-control" name="nama_client" id="nama_client" placeholder="Nama client ...">
          </div>
          <div class="form-group">
            <label>Alamat</label>
            <input type="text" class="form-control" name="alamat" id="alamat" placeholder="Nama client ...">
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
            <div class="d-flex justify-content-between">
              <h3 class="card-title">Data client</h3>
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
                <th>Nama client</th>
                <th>Alamat</th>
                <th>Action</th>
              </tr>
              </thead>
              <tbody>
                <?php foreach ($data as $key => $v) { ?>
                <tr>
                  <td><?=$v->nama_client;?></td>
                  <td><?=$v->alamat;?></td>
                  <td>
                    <button class="btn btn-info btn-sm" onclick="editData(<?=$v->id;?>)"><i class="fa fa-edit"></i> Edit</button>
                    <a class="btn btn-danger btn-sm" href="<?=base_url().'Admin/client_delete/'.$v->id;?>" onclick="return confirm('Anda yakin menghapus data ini?');"><i class="fa fa-trash"></i> Delete</a>
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

  
  $('#id').val('');
  $('#alamat').val('');  
  $('#nama_client').val('');

  dsState = "Input";
  $("#myModal").find('.modal-title').text('Tambah Data client');
  $("#myModal").modal('show',{backdrop: 'true'}); 
});

$("#saveData").click(function(){
  if($.trim($("#nama_client").val()) == ""){
    Toast.fire({
      icon: 'error',
      title: ' Nama client harus diisi'
    });
  } else if($.trim($("#alamat").val()) == ""){
    Toast.fire({
      icon: 'error',
      title: ' Alamat harus diisi'
    });
  } else {
    if(dsState=="Input"){
        $('#formku').attr("action", "<?=base_url();?>Admin/client_save");
        $('#formku').submit();
    }else{
        $('#formku').attr("action", "<?=base_url();?>Admin/client_update");
        $('#formku').submit(); 
    }
  }
});

function editData(id){
  dsState = "Edit";
  $.ajax({
      url: "<?=base_url('Admin/client_edit');?>",
      type: "POST",
      data : {id: id},
      success: function (result){
        console.log(result);
          $('#nama_client').val(result['nama_client']);
          $('#alamat').val(result['alamat']);
          $('#id').val(result['id']);
          
          $("#myModal").find('.modal-title').text('Edit Data client');
          $("#myModal").modal('show',{backdrop: 'true'});           
      }
  });
}
</script>