<?php

class Task extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model("Model_task");
        if($this->session->userdata('user_logged') === null) redirect(site_url('login'));
    }

    public function index()
    {
        $this->load->model("Model_master");
        $data['content']= "task/index";
        $data['pic'] = $this->Model_master->user_roles(2)->result();
        $data['client'] = $this->Model_master->get_client()->result();
        $this->load->view('layout', $data);
    }

    public function home()
    {
        $user_id  = $this->session->userdata('user_id');
        $id_roles  = $this->session->userdata('id_roles');
        $this->load->model("Model_master");
        $data['content']= "task/index_v2";
        $data['pic'] = $this->Model_master->user_roles(2)->result();
        $data['pic_dt'] = $this->Model_master->user_roles(3)->result();
        $data['client'] = $this->Model_master->get_client()->result();

        // if(null!==$this->uri->segment(3) && null!==$this->uri->segment(4)){
        //     $s = $this->uri->segment(3);
        //     $e = $this->uri->segment(4);
        // }else{
        //     $e = date('Y-m-d', strtotime('+1 months'));
        //     $s = date('Y-m-d', strtotime('-6 months'));
        // }

        $e = date('Y-m-d', strtotime('+10 years'));
        $s = date('Y-m-d', strtotime('-10 years'));

        if(null!==$this->uri->segment(5)){
            $status = $this->uri->segment(5);
        }else{
            $status = 0;
        }
        if(null!==$this->uri->segment(6)){
            $pic = $this->uri->segment(6);
        }else{
            $pic = 0;
        }

        $data['start'] = $s;
        $data['end'] = $e;
        $data['status'] = $status;
        $data['pic_selected'] = $pic;

        $task_id_in = [];
        if($id_roles==3){
            $task_loop = $this->Model_task->get_task_id_list($user_id)->result();
            foreach ($task_loop as $key => $value) {
                $task_id_in[$key] = $value->task_id;
            }
        }

        $loop = $this->Model_task->task_full($s,$e,$status,$pic,$id_roles,$user_id,$task_id_in)->result();
        foreach ($loop as $key => $v) {
            $detail = json_decode($v->list);
            $json = [];
            foreach ($detail as $k => $val) {
                $json[$k] = $val;
                if(isset($val->detail_id)){
                    $json[$k]->detail= $this->Model_task->task_detailed_get($val->detail_id)->result();
                }
            }
            $v->list = json_encode($json);
        }

        $data['list_data'] = $loop;
        $this->load->view('layout', $data);
    }

    function task_list() {
        $user_id  = $this->session->userdata('user_id');
        $id_roles  = $this->session->userdata('id_roles');
        $start = $this->input->post('startDate');
        $end = $this->input->post('endDate');
        $status = $this->input->post('status');
        $pic = $this->input->post('pic');

        $task_id_in = [];
        if($id_roles==3){
            $task_loop = $this->Model_task->get_task_id_list($user_id)->result();
            foreach ($task_loop as $key => $value) {
                $task_id_in[$key] = $value->task_id;
            }
        }

        $arr = [
            'start' => $start,
            'end' => $end,
            'status' => $status,
            'pic' => $pic,
            'id_roles' => $id_roles,
            'user_id' => $user_id,
            'task_id' => $task_id_in
        ];

        $list = $this->Model_task->get_datatables($arr,'task_list');
        $data = array();
        $no = @$_POST['start'];
        foreach ($list['data'] as $item) {
            $no++;
            $action = '';
            $row = array();
            $row[] = $no.".";
            $row[] = $item->no_task;
            $row[] = date('d-m-Y', strtotime($item->tanggal));
            $row[] = $item->nama_client;
            $row[] = $item->name;
            $row[] = $item->notes;
            // $row[] = '<progress class="percentage" value="'.$item->percentage.'" max="100"></progress> '.$item->percentage.'%';
            $row[] = $item->percentage.'%';
                $action =  '<a href="'.base_url('Task/detail/').$item->id.'" class="btn btn-success btn-xs" style="margin-top:2px; margin-bottom:2px;"><i class="fa fa-book"></i> View Detail </a> ';
                if($id_roles!=3){
                    $action .= '<a href="javascript:;" onclick="editData('.$item->id.')" class="btn btn-info btn-xs" style="margin-top:2px; margin-bottom:2px;"><i class="fa fa-pencil-alt"></i> Edit </a> ';
                    $action .= '<button type="button" class="btn btn-xs btn-primary" onclick="openLog('.$item->id.')">History</button>';
                }
                if($item->percentage==100 & $item->status == 0){
                    $action .= '<a href="javascript:;" onclick="closeProject('.$item->id.')" class="btn btn-danger btn-xs" style="margin-top:2px; margin-bottom:2px;"><i class="fa fa-times"></i> Closed </a>';
                }
            $row[] = $action;

            $data[] = $row;
        }
        $output = array(
            "draw" => @$_POST['draw'],
            "recordsTotal" => $list['count_all'],
            "recordsFiltered" => $list['count_filtered'],
            "data" => $data,
        );
        // output to json format
        echo json_encode($output);
    }

    function save(){
        $user_id  = $this->session->userdata('user_id');
        $tanggal  = date('Y-m-d H:i:s');
        $tgl_input = date('Y-m-d', strtotime($this->input->post('tanggal')));
        $tgl_code = date('m/y', strtotime($this->input->post('tanggal')));

        $this->db->trans_start();
        // $code = $this->Model_master->getNumbering('JASA',$tgl_input);
        $data = array(
            // 'no_task'=>substr($code,13,4).'/'.$tgl_code,
            'no_task'=>$this->input->post('no_task'),
            'tanggal'=>$tgl_input,
            'pic_id'=>$this->input->post('pic_id'),
            'client_id'=>$this->input->post('client_id'),
            'notes'=>$this->input->post('notes'),
            'created_at'=>$tanggal,
            'created_by'=>$user_id
        );
        $this->db->insert('task', $data);
        $t_id = $this->db->insert_id();

        if($this->db->trans_complete()){
            $res['status'] = 'sukses';
            $res['msg']    = 'Data berhasil di simpan';
        }else{
            $res['status'] = 'sukses';
            $res['msg']    = 'Data gagal di simpan';
        }
        header('Content-Type: application/json');
        echo json_encode($res);
    }

    function update(){
        $user_id  = $this->session->userdata('user_id');
        $id = $this->input->post('id');
        $tanggal  = date('Y-m-d H:i:s');
        $tgl_input = date('Y-m-d', strtotime($this->input->post('tanggal')));
        $tgl_code = date('m/y', strtotime($this->input->post('tanggal')));

        $this->db->trans_start();
        $detail_before = $this->Model_task->get_task($id)->row_array();
        $history_remarks = '';

        if($detail_before['no_task']!=$this->input->post('no_task')){
            $history_remarks .= 'Perubahan nama project ';
        }
        if($detail_before['tanggal']!=$this->input->post('tanggal')){
            $history_remarks .= 'Perubahan tanggal ';
        }
        if($detail_before['pic_id']!=$this->input->post('pic_id')){
            $history_remarks .= 'Perubahan PIC ';
        }
        if($detail_before['client_id']!=$this->input->post('client_id')){
            $history_remarks .= 'Perubahan Client ';
        }
        if($detail_before['notes']!=$this->input->post('notes')){
            $history_remarks .= 'Perubahan notes ';
        }

        if($history_remarks!=''){
            //Insert History
            $this->db->insert('task_history',[
                'id_task' => $id,
                'no_task' => $detail_before['no_task'],
                'tanggal' => $detail_before['tanggal'],
                'pic_id' => $detail_before['pic_id'],
                'client_id' => $detail_before['client_id'],
                'notes' => $detail_before['notes'],
                'status' => $detail_before['status'],
                'history_remarks' => $history_remarks,
                'created_at' => $detail_before['created_at'],
                'created_by' => $detail_before['created_by'],
            ]);
        }

        $data = array(
            'no_task'=>$this->input->post('no_task'),
            'tanggal'=>$tgl_input,
            'pic_id'=>$this->input->post('pic_id'),
            'client_id'=>$this->input->post('client_id'),
            'notes'=>$this->input->post('notes'),
            'created_at'=>$tanggal,
            'created_by'=>$user_id
        );
        $this->db->where('id', $id);
        $this->db->update('task', $data);
        $t_id = $this->db->insert_id();

        if($this->db->trans_complete()){
            $res['status'] = 'sukses';
            $res['msg']    = 'Data berhasil di simpan';
        }else{
            $res['status'] = 'sukses';
            $res['msg']    = 'Data gagal di simpan';
        }
        header('Content-Type: application/json');
        echo json_encode($res);
    }

    function detail(){
        $module_name = $this->uri->segment(1);
        $this->load->model("Model_master");
        $id = $this->uri->segment(3);
        $group_id    = $this->session->userdata('group_id');
        $data['group_id']  = $group_id;
        $data['header'] = $this->Model_task->get_task_persen($id)->row_array();
        $data['pic'] = $this->Model_master->user_roles(3)->result();
        $data['content'] = "task/detail";
        $this->load->view('layout', $data);
    }

    function task_detail_list() {
        $task_id = $this->input->post('task_id');
        $user_id  = $this->session->userdata('user_id');
        $id_roles  = $this->session->userdata('id_roles');
        $arr = [
            'task_id' => $task_id,
            'level' => 1,
            'user_id' => $user_id,
            'id_roles' => $id_roles
        ];

        $list = $this->Model_task->get_datatables($arr,'task_detail_list');
        $data = array();
        $no = @$_POST['start'];
        foreach ($list['data'] as $item) {
            $no++;
            $action = '';
            $row = array();
            $row[] = $no.".";
            $row[] = $item->task_number;
            $row[] = date('d-m-Y', strtotime($item->tanggal));
            $row[] = $item->name;
            $row[] = $item->notes;
            $row[] = $item->percentage.'%';
                $action = '<a href="'.base_url('Task/detailed/').$task_id.'/'.$item->id.'" class="btn btn-success btn-xs" style="margin-top:2px; margin-bottom:2px;"><i class="fa fa-book"></i> View Detail </a> ';
                if($item->child==0){
                    if($item->status_header==0){
                        $action .= '<a href="javascript:;" class="btn btn-info btn-xs" style="margin-top:2px; margin-bottom:2px;" onclick="editData('.$item->id.')"><i class="fas fa-pencil-alt"></i> Edit </a> ';
                    }
                    $action .= '<button type="button" class="btn btn-xs btn-primary" onclick="openLog('.$item->id.')">History</button> ';
                }
            $row[] = $action;

            $data[] = $row;
        }
        $output = array(
                    "draw" => @$_POST['draw'],
                    "recordsTotal" => $list['count_all'],
                    "recordsFiltered" => $list['count_filtered'],
                    "data" => $data,
                );
        // output to json format
        echo json_encode($output);
    }

    function save_detail(){
        $user_id  = $this->session->userdata('user_id');
        $task_id = $this->input->post('task_id');
        $level = $this->input->post('level');
        $parent_id = $this->input->post('task_parent_id');
        $tanggal  = date('Y-m-d H:i:s');
        $tgl_input = date('Y-m-d', strtotime($this->input->post('tanggal')));
        $tgl_code = date('m/y', strtotime($this->input->post('tanggal')));

        $this->db->trans_start();

        $project = $this->Model_task->get_task($task_id)->row_array();
        $tanggal_project = $project['tanggal'];
        if($project['tanggal']<$tgl_input){

            $this->db->insert('task_history',[
                'id_task' => $task_id,
                'no_task' => $project['no_task'],
                'tanggal' => $project['tanggal'],
                'pic_id' => $project['pic_id'],
                'client_id' => $project['client_id'],
                'notes' => $project['notes'],
                'status' => $project['status'],
                'history_remarks' => 'Perubahan tanggal oleh '.$this->session->userdata('name').' dengan Task '.$this->input->post('task_number'),
                'created_at' => $project['created_at'],
                'created_by' => $project['created_by'],
            ]);

            $this->db->where('id', $task_id);
            $this->db->update('task',[
                'tanggal' => $tgl_input,
                'created_at' => $tanggal,
                'created_by' => $user_id,
            ]);
            $tanggal_project = $tgl_input;
        }

        if($level==1){
            $number = $this->Model_task->cek_number($task_id,$level)->row_array();
            $numbering = $number['jumlah']+1;
            $task_number = $numbering;
            $pic_id = $this->input->post('pic_id');
        }else{
            $number = $this->Model_task->cek_number_parent($parent_id,$level)->row_array();
            $parent_number = $this->Model_task->get_task_detail($parent_id)->row_array();
            $numbering = $number['jumlah']+1;
            $task_number = $parent_number['numbering'].'.'.$numbering;
            $pic_id = $parent_number['pic_id'];
        }

        $data = array(
            'task_id' => $task_id,
            'task_number' => 'Task '.$task_number,
            'numbering' => $numbering,
            'tanggal' => $tgl_input,
            'pic_id' => $pic_id,
            'notes' => $this->input->post('notes'),
            'percentage' => $this->input->post('percentage'),
            'parent_id' => $parent_id,
            'level' => $level,
            'created_at' => $tanggal,
            'created_by' => $user_id
        );
        $this->db->insert('task_detail', $data);
        $t_id = $this->db->insert_id();

        $parent = $this->Model_task->parent_persen($parent_id)->row_array();
        $parent_persen =  $parent['persen']/$parent['jumlah'];
        $this->db->where('id', $parent_id);
        $this->db->update('task_detail', [
            'percentage' => $parent_persen,
            'created_at' => $tanggal,
            'created_by' => $user_id
        ]);

        if($this->db->trans_complete()){
            $res['status'] = 'sukses';
            $res['msg']    = 'Data berhasil di simpan';
            $res['parent_persen'] = number_format($parent_persen,2,'.',',');
            $res['tanggal'] = $tanggal_project;
        }else{
            $res['status'] = 'sukses';
            $res['msg']    = 'Data gagal di simpan';
        }
        header('Content-Type: application/json');
        echo json_encode($res);
    }

    function update_detail(){
        $user_id  = $this->session->userdata('user_id');
        $id = $this->input->post('id');
        $task_id = $this->input->post('task_id');
        $task_parent_id = $this->input->post('task_parent_id');
        $tanggal  = date('Y-m-d H:i:s');
        $tgl_input = date('Y-m-d', strtotime($this->input->post('tanggal')));
        $tgl_code = date('m/y', strtotime($this->input->post('tanggal')));

        $this->db->trans_start();

        $project = $this->Model_task->get_task($task_id)->row_array();
        $tanggal_project = $project['tanggal'];
        if($project['tanggal']<$tgl_input){

            $this->db->insert('task_history',[
                'id_task' => $task_id,
                'no_task' => $project['no_task'],
                'tanggal' => $project['tanggal'],
                'pic_id' => $project['pic_id'],
                'client_id' => $project['client_id'],
                'notes' => $project['notes'],
                'status' => $project['status'],
                'history_remarks' => 'Perubahan tanggal oleh '.$this->session->userdata('name').' dengan Task '.$this->input->post('task_number'),
                'created_at' => $project['created_at'],
                'created_by' => $project['created_by'],
            ]);

            $this->db->where('id', $task_id);
            $this->db->update('task',[
                'tanggal' => $tgl_input,
                'created_at' => $tanggal,
                'created_by' => $user_id,
            ]);
            $tanggal_project = $tgl_input;
        }

        $detail_before = $this->Model_task->get_task_detail($id)->row_array();

        //Insert History
        $this->db->insert('task_detail_history',[
            'task_detail_id' => $id,
            'task_number' => $detail_before['task_number'],
            'tanggal' => $detail_before['tanggal'],
            'pic_id' => $detail_before['pic_id'],
            'notes' => $detail_before['notes'],
            'percentage' => $detail_before['percentage'],
            'status' => $detail_before['status'],
            'parent_id' => $detail_before['parent_id'],
            'created_at' => $detail_before['created_at'],
            'created_by' => $detail_before['created_by'],
        ]);

        $data = array(
            'task_number' => $this->input->post('task_number'),
            'tanggal' => $tgl_input,
            'pic_id' => $this->input->post('pic_id'),
            'notes' => $this->input->post('notes'),
            'percentage' => $this->input->post('percentage'),
            'created_at' => $tanggal,
            'created_by' => $user_id
        );
        $this->db->where('id', $id);
        $this->db->update('task_detail', $data);

        if($this->input->post('level')>1){
            $parent = $this->Model_task->parent_persen($task_parent_id)->row_array();
            $cek_tgl = $this->Model_task->get_task_detail($task_parent_id)->row_array();
            $update_tanggal = $cek_tgl['tanggal'];
            if($cek_tgl['tanggal']<$tgl_input){
                $update_tanggal = $tgl_input;
            }
            $parent_persen =  $parent['persen']/$parent['jumlah'];
            $this->db->where('id', $task_parent_id);
            $this->db->update('task_detail', [
                'tanggal' => $update_tanggal,
                'percentage' => $parent_persen,
                'created_at' => $tanggal,
                'created_by' => $user_id
            ]);
        }else{
            $parent = $this->Model_task->task_persen($this->input->post('task_id'))->row_array();
            $parent_persen =  $parent['persen']/$parent['jumlah'];
        }

        if($this->db->trans_complete()){
            $res['status'] = 'sukses';
            $res['msg']    = 'Data berhasil di update';
            $res['parent_persen'] = number_format($parent_persen,2,'.',',');
            $res['tanggal'] = $tanggal_project;
        }else{
            $res['status'] = 'sukses';
            $res['msg']    = 'Data gagal di update';
        }
        header('Content-Type: application/json');
        echo json_encode($res);
    }

    function detailed(){
        $module_name = $this->uri->segment(1);
        $task_id = $this->uri->segment(3);
        $id = $this->uri->segment(4);
        $group_id    = $this->session->userdata('group_id');
        $data['group_id']  = $group_id;
        $data['header'] = $this->Model_task->get_parent_task($id)->row_array();
        $data['level'] = $data['header']['level']+1;
        $data['content'] = "task/detailed";
        $this->load->view('layout', $data);
    }

    function task_detailed_list() {
        $task_id = $this->input->post('task_id');
        $task_parent_id = $this->input->post('task_parent_id');
        $check = $this->Model_task->get_task_detail($task_parent_id)->row_array();
        $level = $check['level']+1;
        $arr = [
            'task_id' => $task_id,
            'task_parent_id' => $task_parent_id,
            'level' => $level,
        ];

        $list = $this->Model_task->get_datatables($arr,'task_detailed_list');
        $data = array();
        $no = @$_POST['start'];
        foreach ($list['data'] as $item) {
            $no++;
            $action = '';
            $row = array();
            $row[] = $no.".";
            $row[] = $item->task_number;
            $row[] = date('d-m-Y', strtotime($item->tanggal));
            $row[] = $item->name;
            $row[] = substr($item->notes, 0, 100).'...';
            $row[] = $item->percentage.'%';
                $action = '';
                if($item->status_header==0){
                    $action .= '<a href="javascript:;" class="btn btn-info btn-xs" style="margin-top:2px; margin-bottom:2px;" onclick="editData('.$item->id.')"><i class="fas fa-pencil-alt"></i> Edit </a>';
                }
                $action .= '<button type="button" class="btn btn-xs btn-primary" onclick="openLog('.$item->id.')">History</button>';
            $row[] = $action;

            $data[] = $row;
        }
        $output = array(
                    "draw" => @$_POST['draw'],
                    "recordsTotal" => $list['count_all'],
                    "recordsFiltered" => $list['count_filtered'],
                    "data" => $data,
                );
        // output to json format
        echo json_encode($output);
    }

    function get_task()
    {
        $id = $this->input->post('id');

        $result= $this->Model_task->get_task($id)->row_array();

        header('Content-Type: application/json');
        echo json_encode($result);
    }

    function get_task_detail()
    {
        $id = $this->input->post('id');

        $result= $this->Model_task->get_task_detail($id)->row_array();

        header('Content-Type: application/json');
        echo json_encode($result);
    }

    function get_history()
    {
        $id = $this->input->post('id');

        $h= $this->Model_task->get_task($id)->row_array();
        $result= $this->Model_task->get_history($id)->result();

        $html = '<ul class="timeline2">';
        $html .= '<li class="event" data-date="'.$h['tanggal'].'">'.
                    '<h3>'.$h['no_task'].'</h3>'.
                    '<p>'.$h['notes'].'</p>'.
                    '<small>'.$h['created_at'].'</small>'.
                '</li>';
        foreach ($result as $key => $v) {
            $html .= '<li class="event" data-date="'.$v->tanggal.'">'.
                        '<strong>'.$v->history_remarks.'</strong>'.
                        '<h3>'.$v->no_task.'</h3>'.
                        '<p>'.$v->notes.'</p>'.
                        '<small>'.$v->created_at.'</small>'.
                    '</li>';
        }
        $html .='</ul>';

        header('Content-Type: application/json');
        echo json_encode($html);
    }

    function get_detail_history()
    {
        $id = $this->input->post('id');

        $h= $this->Model_task->get_task_detail($id)->row_array();
        if($h['level']==1){
            $result= $this->Model_task->get_detail_history_combine($id)->result();
        }else{
            $result= $this->Model_task->get_detail_history($id)->result();
        }

        $html = '<ul class="timeline2">';
        if($h['level']==2){
            $html .= '<li class="event" data-date="'.$h['tanggal'].'">'.
                        '<h3>'.$h['task_number'].'</h3>'.
                        '<p>'.$h['notes'].'</p>'.
                        '<progress class="percentage" value="'.$h['percentage'].'" max="100"></progress> '.$h['percentage'].'% '.
                        '<small>'.$h['created_at'].'</small>'.
                    '</li>';
        }
        foreach ($result as $key => $v) {
            $html .= '<li class="event" data-date="'.$v->tanggal.'">'.
                        '<h3>'.$v->task_number.'</h3>'.
                        '<p>'.$v->notes.'</p>'.
                        '<progress class="percentage" value="'.$v->percentage.'" max="100"></progress> '.$v->percentage.'% '.
                        '<small>'.$v->created_at.'</small>'.
                    '</li>';
        }
        $html .='</ul>';

        header('Content-Type: application/json');
        echo json_encode($html);
    }

    function close_project(){
        $user_id = $this->session->userdata('user_id');
        $tanggal = date('Y-m-d H:i:s');

        $this->db->where('id', $this->input->post('id'));
        $this->db->update('task', [
            'status' => 1,
            'closed_at' => $tanggal,
            'closed_by' => $user_id
        ]);
        $this->session->set_flashdata('sukses', 'Data berhasil diclose');
        redirect('Task/home');
    }
}