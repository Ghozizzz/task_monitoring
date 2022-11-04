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
        $this->load->view('layout', $data);
    }

    function task_list() {
        $start = $this->input->post('startDate');
        $end = $this->input->post('endDate');
        $arr = [
            'start' => $start,
            'end' => $end,
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
            $row[] = $item->name;
            $row[] = $item->notes;
            $row[] = '<progress class="percentage" value="'.$item->percentage.'" max="100"></progress> '.$item->percentage.'%';
            $row[] = '<a href="'.base_url('Task/detail/').$item->id.'" class="btn btn-success btn-xs" style="margin-top:2px; margin-bottom:2px;"><i class="fa fa-book"></i> View Detail </a>';

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

    function detail(){
        $module_name = $this->uri->segment(1);
        $id = $this->uri->segment(3);
        $group_id    = $this->session->userdata('group_id');
        $data['group_id']  = $group_id;
        $data['header'] = $this->Model_task->get_task_persen($id)->row_array();
        $data['content'] = "task/detail";
        $this->load->view('layout', $data);
    }

    function task_detail_list() {
        $task_id = $this->input->post('task_id');
        $arr = [
            'task_id' => $task_id,
            'level' => 1,
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
            $row[] = '<progress class="percentage" value="'.$item->percentage.'" max="100"></progress> '.$item->percentage.'%';
            $row[] = '<a href="'.base_url('Task/detailed/').$task_id.'/'.$item->id.'" class="btn btn-success btn-xs" style="margin-top:2px; margin-bottom:2px;"><i class="fa fa-book"></i> View Detail </a>';

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
        $tanggal  = date('Y-m-d H:i:s');
        $tgl_input = date('Y-m-d', strtotime($this->input->post('tanggal')));
        $tgl_code = date('m/y', strtotime($this->input->post('tanggal')));

        $this->db->trans_start();
        // $code = $this->Model_master->getNumbering('JASA',$tgl_input);
        $data = array(
            'task_id' => $this->input->post('task_id'),
            'task_number' => $this->input->post('task_number'),
            'tanggal' => $tgl_input,
            'pic_id' => $this->input->post('pic_id'),
            'notes' => $this->input->post('notes'),
            'percentage' => $this->input->post('percentage'),
            'parent_id' => $this->input->post('task_parent_id'),
            'level' => $this->input->post('level'),
            'created_at' => $tanggal,
            'created_by' => $user_id
        );
        $this->db->insert('task_detail', $data);
        $t_id = $this->db->insert_id();

        $parent = $this->Model_task->parent_persen($this->input->post('task_parent_id'))->row_array();
        $parent_persen =  $parent['persen']/$parent['jumlah'];
        $this->db->where('id', $this->input->post('task_parent_id'));
        $this->db->update('task_detail', [
            'percentage' => $parent_persen,
            'created_at' => $tanggal,
            'created_by' => $user_id
        ]);

        if($this->db->trans_complete()){
            $res['status'] = 'sukses';
            $res['msg']    = 'Data berhasil di simpan';
            $res['parent_persen'] = number_format($parent_persen,2,'.',',');
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
        $tanggal  = date('Y-m-d H:i:s');
        $tgl_input = date('Y-m-d', strtotime($this->input->post('tanggal')));
        $tgl_code = date('m/y', strtotime($this->input->post('tanggal')));

        $this->db->trans_start();
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
            'created_at' => $detail_before['created_at'],
            'created_by' => $detail_before['created_by'],
        ]);

        $data = array(
            'task_number' => $this->input->post('task_number'),
            'tanggal' => $tgl_input,
            'notes' => $this->input->post('notes'),
            'percentage' => $this->input->post('percentage'),
            'created_at' => $tanggal,
            'created_by' => $user_id
        );
        $this->db->where('id', $id);
        $this->db->update('task_detail', $data);

        $parent = $this->Model_task->parent_persen($this->input->post('task_parent_id'))->row_array();
        $parent_persen =  $parent['persen']/$parent['jumlah'];
        $this->db->where('id', $this->input->post('task_parent_id'));
        $this->db->update('task_detail', [
            'percentage' => $parent_persen,
            'created_at' => $tanggal,
            'created_by' => $user_id
        ]);

        if($this->db->trans_complete()){
            $res['status'] = 'sukses';
            $res['msg']    = 'Data berhasil di update';
            $res['parent_persen'] = number_format($parent_persen,2,'.',',');
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
            $row[] = '<progress class="percentage" value="'.$item->percentage.'" max="100"></progress> '.$item->percentage.'%';
                $action = '<a href="javascript:;" class="btn btn-info btn-xs" style="margin-top:2px; margin-bottom:2px;" onclick="editData('.$item->id.')"><i class="fas fa-pencil-alt"></i> Edit </a>';
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

    function get_task_detail()
    {
        $id = $this->input->post('id');

        $result= $this->Model_task->get_task_detail($id)->row_array();

        header('Content-Type: application/json');
        echo json_encode($result);
    }

    function get_detail_history()
    {
        $id = $this->input->post('id');

        $h= $this->Model_task->get_task_detail($id)->row_array();
        $result= $this->Model_task->get_detail_history($id)->result();

        $html = '<ul class="timeline2">';
        $html .= '<li class="event" data-date="'.$h['tanggal'].'">'.
                    '<h3>'.$h['task_number'].'</h3>'.
                    '<p>'.$h['notes'].'</p>'.
                    '<progress class="percentage" value="'.$h['percentage'].'" max="100"></progress> '.$h['percentage'].'%'.
                '</li>';
        foreach ($result as $key => $v) {
            $html .= '<li class="event" data-date="'.$v->tanggal.'">'.
                        '<h3>'.$v->task_number.'</h3>'.
                        '<p>'.$v->notes.'</p>'.
                        '<progress class="percentage" value="'.$v->percentage.'" max="100"></progress> '.$v->percentage.'%'.
                    '</li>';
        }
        $html .='</ul>';

        header('Content-Type: application/json');
        echo json_encode($html);
    }
}