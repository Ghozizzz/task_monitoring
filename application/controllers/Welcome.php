<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

    function __construct(){
        parent::__construct();

        if($this->session->userdata('user_logged') === null) redirect(site_url('login'));
    }
    
    public function index(){
        $data['judul']  = "";
        $data['content']= "layout/example";
        $this->load->view('layout', $data);
    }
}
