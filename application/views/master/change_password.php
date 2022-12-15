
<section class="content">
  <div class="container-fluid">
    <div class="card">
        <div class="card-body pt-5">
            <div class="row">
                <div class="col-md-5 col-sm-12">           
                    <form class="eventInsForm" method="post" target="_self" name="formku" id="formku">
                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <div class="alert alert-danger" style="display: none;">
                                    <button class="close" data-close="alert"></button>
                                    <span id="message">&nbsp;</span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-5 col-sm-12">Old Password <font color="#f00">*</font></div>
                            <div class="col-md-7 col-sm-12">
                                <input type="password" id="old_password" name="old_password" 
                                       class="form-control" style="margin-bottom:5px" maxlength="25" value="">
                            </div>
                        </div> 
                        <div class="row">
                            <div class="col-md-5 col-sm-12">New Password <font color="#f00">*</font></div>
                            <div class="col-md-7 col-sm-12">
                                <input type="password" id="new_password" name="new_password" 
                                       class="form-control" style="margin-bottom:5px" maxlength="25" value="">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-5 col-sm-12">Confirm Password <font color="#f00">*</font></div>
                            <div class="col-md-7 col-sm-12">
                                <input type="password" id="confirm_password" name="confirm_password" 
                                       class="form-control" style="margin-bottom:5px" maxlength="25" value="">
                            </div>
                        </div> 
                        <div class="row">
                            <div class="col-md-5 col-sm-12">&nbsp;</div>
                            <div class="col-md-7 col-sm-12">
                                &nbsp;<br>
                                <input type="button" onClick="simpandata();" name="btnSave" 
                                    value="Save" class="btn btn-primary" id="btnSave">
                                <br>&nbsp;</td>
                            </div>
                        </div>
                    </form>        
                </div>
            </div> 
        </div>
    </div>   
  </div>
</section>                   

<script>
function simpandata(){		
    if($.trim($("#old_password").val()) == ""){
        alert("Old password can`t be blank!");  
    }else if($.trim($("#new_password").val()) == ""){
        alert("New password can`t be blank!");
    }else if($.trim($("#confirm_password").val()) == ""){
        alert("Confirm_password can`t be blank!");
    }else if($("#confirm_password").val() != $("#new_password").val()){
        alert("Password does not match confirmation!");
    }else{              
        $('#btnSave').val('Please Wait ...');    
        $.ajax({
            type:"POST",
            url:'<?= base_url('Admin/update_password'); ?>',
            data:"data="+$("#old_password").val()+"^"+$("#new_password").val(),
            success:function(result){
                $('#btnSave').val('Save');
                if(result=="SALAH"){
                    $('#message').html("Old password is wrong!");
                    $('.alert-danger').show(); 
                }else{
                    alert('Password Berhasil diubah');
                    location.reload();                            
                }
            }
        });    
    };
};
</script>