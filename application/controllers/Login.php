<?php

class Login extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model("Model_user");
        $this->load->library('form_validation');
    }

    public function index()
    {
        // tampilkan halaman login
        $this->load->view("login");
    }

    public function doLogin(){
        if($this->Model_user->doLogin($this->input->post('username'),$this->input->post('password'))){
            $url = 'sukses';
        }else{
            $url = 'gagal';
        }
        header('Content-Type: application/json');
        echo json_encode($url); 
    }

    public function logout()
    {
        // hancurkan semua sesi
        $this->session->sess_destroy();
        redirect(site_url('login'));
    }
}