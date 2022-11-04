<?php

class Admin extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model("Model_master");
        if($this->session->userdata('user_logged') === null) redirect(site_url('login'));
    }

    public function index()
    {
        $data['content']= "layout/example";
        $this->load->view('layout', $data);
    }

/** Users **/
    public function users()
    {
        $data['content']= "master/users";
        $data['data'] = $this->Model_master->users()->result();
        $data['roles'] = $this->Model_master->roles()->result();
        $this->load->view('layout', $data);
    }

    function users_save(){
        $user_id  = $this->session->userdata('user_id');
        $tanggal  = date('Y-m-d H:i:s');
        $this->db->trans_start();
        $data = [
                    'username'=> $this->input->post('username'),
                    'name'=> $this->input->post('name'),
                    'id_roles'=> $this->input->post('roles'),
                    'password'=> password_hash('admin', PASSWORD_BCRYPT),
                    'created_at'=> $tanggal,
                    'created_by'=> $user_id,
                ];
       
        $this->db->insert('users', $data); 
        if($this->db->trans_complete()){
            $this->session->set_flashdata('sukses', 'Data user berhasil disimpan');
        }else{
            $this->session->set_flashdata('gagal', 'Data user gagal disimpan');
        }
        redirect('Admin/users');       
    }
    
    function users_delete(){
        $id = $this->uri->segment(3);
        $this->db->trans_start();
        if(!empty($id)){
            $this->db->where('id', $id);
            $this->db->delete('users');            
        }
        if($this->db->trans_complete()){
            $this->session->set_flashdata('sukses', 'Data user berhasil dihapus');
        }else{
            $this->session->set_flashdata('gagal', 'Data user gagal dihapus');
        }
        redirect('Admin/users');
    }
    
    function users_edit(){
        $id = $this->input->post('id');
        $data = $this->Model_master->get_users($id)->row_array(); 
        
        header('Content-Type: application/json');
        echo json_encode($data);       
    }
    
    function users_update(){
        $user_id  = $this->session->userdata('user_id');
        $tanggal  = date('Y-m-d H:i:s');
        $this->db->trans_start();
        
        $data = [
                'username'=> $this->input->post('username'),
                'name'=> $this->input->post('name'),
                'id_roles'=> $this->input->post('roles'),
                'modified_at'=> $tanggal,
                'modified_by'=> $user_id
            ];
        
        $this->db->where('id', $this->input->post('id'));
        $this->db->update('users', $data);
        
        if($this->db->trans_complete()){
            $this->session->set_flashdata('sukses', 'Data user berhasil disimpan');
        }else{
            $this->session->set_flashdata('gagal', 'Data user gagal disimpan');
        }
        redirect('Admin/users');
    }

    function change_password()
    {
        $data['content']= "master/change_password";
        $this->load->view('layout', $data);
    }

    function update_password(){
        $user_id    = $this->session->userdata('user_id');
        $user_name  = $this->session->userdata('username');
        $post_data  = $this->input->post('data');
        $isi_data   = explode("^", $post_data);
        
        $old_password = $isi_data[0];
        $new_password = $isi_data[1];
        $tanggal = date('Y-m-d H:i:s');
        
        $this->load->model('Model_user');
        $cek = $this->Model_user->doLogin($user_name, $old_password);
        if($cek){
            $data = array(
                'password'=> password_hash($new_password, PASSWORD_BCRYPT),
                'modified_at'=> $tanggal,
            );
            
            $this->db->where('id', $user_id);
            $this->db->update('users', $data);
            
            $url = "SUKSES";
        }else{
            $url = "SALAH";
        }
        header('Content-Type: application/json');
        echo json_encode($url);
    }

/** Numberings **/
    function numbering(){
        $data['content']= "master/numberings";
        $data['data'] = $this->Model_master->list_numbering()->result();
        $this->load->view('layout', $data);
    }
    
    function cek_number(){
        $code = $this->input->post('data');
        $cek_data = $this->Model_master->cek_numbering($code)->row_array();
        $return_data = ($cek_data)? "ADA": "TIDAK ADA";

        header('Content-Type: application/json');
        echo json_encode($return_data);
    }
    
    function number_save(){        
        $data = array(
            'prefix'=> $this->input->post('prefix'),
            'date_info'=> ($this->input->post('date_info')=="on")? 1: 0,
            'padding'=> $this->input->post('padding'),
            'prefix_separator'=> $this->input->post('prefix_separator'),
            'date_separator'=> $this->input->post('date_separator')
        );
        
        $this->db->insert('m_numberings', $data); 
        $this->session->set_flashdata('sukses', 'Data berhasil disimpan');
        redirect('Admin/numbering');
    }
    
    function number_delete(){
        $id = $this->uri->segment(3);
        if(!empty($id)){
            $this->db->where('id', $id);
            $this->db->delete('m_numberings');            
        }
        $this->session->set_flashdata('sukses', 'Data berhasil dihapus');
        redirect('Admin/numbering');
    }
    
    function number_edit(){
        $id = $this->input->post('id');
        $data = $this->Model_master->show_numbering($id)->row_array();
        if($data['date_info']==1){
            $data['date_info'] = true;
        }else{
            $data['date_info'] = false;
        }
        
        header('Content-Type: application/json');
        echo json_encode($data);        
    }
    
    function number_update(){        
        $data = array(
                'prefix'=> $this->input->post('prefix'),
                'date_info'=> ($this->input->post('date_info')=="on")? 1: 0,
                'padding'=> $this->input->post('padding'),
                'prefix_separator'=> $this->input->post('prefix_separator'),
                'date_separator'=> $this->input->post('date_separator')
            );
        #echo "<pre>"; die(var_dump($this->input->post()));
        $this->db->where('id', $this->input->post('id'));
        $this->db->update('m_numberings', $data);
        
        $this->session->set_flashdata('sukses', 'Data berhasil disimpan');
        redirect('Admin/numbering');
    }
}