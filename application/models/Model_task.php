<?php
class Model_task extends CI_Model{
/** Task **/
    function get_task($id){
        return $this->db->query("select * from task where id = ".$id);
    }

    function task_full($s,$e,$status,$pic,$id_roles,$user_id,$task_id,$db_driver){
        $where = '';
        if($id_roles==2){
            $where .= 'and t.pic_id ='.$user_id.' ';
        }
        if($id_roles==3){
            $where .= 'and t.id in ('.implode(',',$task_id).') ';
        }
        $where .= 'and t.status = '.$status.' ';
        if($pic>0){
            $where .= 'and t.pic_id = '.$pic.' ';
        }

        if($db_driver=='postgre'){
            return $this->db->query("Select t.*, COALESCE((select round(sum(percentage)/count(id),2) from task_detail where task_id = t.id and parent_id = 0),0) as percentage, json_agg(json_build_object(
                        'detail_id', td.id,
                        'task_number', td.task_number,
                        'notes_detail', td.notes,
                        'persen_detail', td.percentage,
                        'child', (select count(id) from task_detail where parent_id = td.id)
                        )) as list
                From task t
                left join task_detail td on td.task_id = t.id and td.level = 1
                where t.tanggal between '".$s."' and '".$e."' ".$where."
                group by t.id, td.id");
        }else{
            return $this->db->query("Select t.*, COALESCE((select round(sum(percentage)/count(id),2) from task_detail where task_id = t.id and parent_id = 0),0) as percentage, 
                CONCAT('[',
                    GROUP_CONCAT(JSON_OBJECT(
                        'detail_id', td.id,
                        'task_number', td.task_number,
                        'notes_detail', td.notes,
                        'persen_detail', td.percentage,
                        'child', (select count(id) from task_detail where parent_id = td.id)
                        )
                    ),']') as list
                From task t
                left join task_detail td on td.task_id = t.id and td.level = 1
                where t.tanggal between '".$s."' and '".$e."' ".$where."
                group by t.id");
        }
    }

    function get_task_persen($id){
        return $this->db->query("select task.*, COALESCE((select round(sum(percentage)/count(id),2) from task_detail where task_id = task.id and parent_id = 0),0) as percentage from task where id = ".$id);
    }

    function get_task_detail($id){
        return $this->db->query("Select * from task_detail where id = ".$id);
    }

    function get_parent_task($id){
        return $this->db->query("select td.*, t.no_task, t.status as status_header from task_detail td
            left join task t on td.task_id = t.id
            where td.id = ".$id);
    }

    function get_history($id){
        return $this->db->query("Select * From task_history where id_task =".$id." order by created_at desc");
    }

    function get_detail_history($id){
        return $this->db->query("Select * From task_detail_history where task_detail_id =".$id." order by created_at desc");
    }

    function get_detail_history_combine($id){
        return $this->db->query("select * from (
            (
                Select task_number, tanggal, notes, percentage, created_at From task_detail_history where task_detail_id =".$id."
            )UNION ALL(
                select task_number, tanggal, notes, percentage, created_at from task_detail_history where parent_id =".$id."
            )UNION ALL(
                select task_number, tanggal, notes, percentage, created_at from task_detail where parent_id =".$id."
                        )) as a
            order by created_at desc");
    }

    function task_persen($id){
        return $this->db->query("SELECT count(id) as jumlah, sum(percentage) as persen  FROM task_detail where task_id = ".$id." and level = 1");
    }

    function parent_persen($id){
        return $this->db->query("SELECT count(id) as jumlah, sum(percentage) as persen  FROM task_detail where parent_id = ".$id);
    }

    function cek_number($id,$level){
        return $this->db->query("Select count(id) as jumlah From task_detail where task_id =".$id." and level =".$level);
    }

    function cek_number_parent($id,$level){
        return $this->db->query("Select count(id) as jumlah From task_detail where parent_id =".$id." and level =".$level);
    }

    function get_task_id_list($user_id){
        return $this->db->query("select task_id from task_detail where pic_id =".$user_id." group by task_id");
    }

    function task_list($data){
        // start datatables
        $this->column_order = array(null, 't.no_task', 't.tanggal', 'c.nama_client', 'u.name', 't.notes', 't.status'); //set column field database for datatable orderable
        $this->column_search = array('t.no_task', 't.tanggal', 'c.nama_client', 'u.name', 't.notes', 't.status'); //set column field database for datatable searchable
        $this->order = array('t.tanggal' => 'asc'); // default order 

        $this->db->select('t.*, u.name, c.nama_client, COALESCE((select round(sum(percentage)/count(id),2) from task_detail where task_id = t.id and parent_id = 0),0) as percentage');
        $this->db->from('task as t');
        $this->db->join('users u', 't.pic_id = u.id', 'left');
        $this->db->join('users u2', 't.created_by = u2.id', 'left');
        $this->db->join('m_client c', 't.client_id = c.id', 'left');
        $this->db->where('flag_delete',0);
        if($data['id_roles']==2){
            $this->db->where('pic_id', $data['user_id']);
        }
        if($data['id_roles']==3){
            $this->db->where_in('t.id', $data['task_id']);
        }
        if($data['pic']>0){
            $this->db->where('pic_id', $data['pic']);
        }
        if(!empty($data['start']) && !empty($data['end'])){
            $this->db->where('t.tanggal >=', $data['start']);
            $this->db->where('t.tanggal <=', $data['end']);
        }
        $this->db->where('t.status', $data['status']);
        $this->db->order_by('tanggal','desc');
    }

    function task_detail_list($data){
        // start datatables
        $this->column_order = array(null, 't.no_task', 'td.tanggal', 'u.name', 'td.notes', 'td.status'); //set column field database for datatable orderable
        $this->column_search = array('t.no_task', 'td.tanggal', 'u.name', 'td.notes', 'td.status'); //set column field database for datatable searchable
        $this->order = array('t.tanggal' => 'asc'); // default order 

        $this->db->select('td.*, t.no_task, t.status as status_header, u.name, (select count(id) from task_detail where parent_id = td.id) as child');
        $this->db->from('task_detail as td');
        $this->db->join('task t', 'td.task_id = t.id', 'left');
        $this->db->join('users u', 'td.pic_id = u.id', 'left');
        $this->db->join('users u2', 'td.created_by = u2.id', 'left');
        $this->db->where('td.task_id',$data['task_id']);
        $this->db->where('td.parent_id',0);
        $this->db->where('td.flag_delete',0);
        $this->db->where('td.status',0);
        $this->db->where('td.level',1);
        if($data['id_roles']==3){
            $this->db->where('td.pic_id', $data['user_id']);
        }
        if(!empty($data['start']) && !empty($data['end'])){
            $this->db->where('t.tanggal >=', $data['start']);
            $this->db->where('t.tanggal <=', $data['end']);
        }
    }

    function task_detailed_get($id){
        return $this->db->query("select * from task_detail where parent_id = ".$id." order by numbering");
    }

    function task_detailed_list($data){
        // start datatables
        $this->column_order = array(null, 't.no_task', 'td.tanggal', 'u.name', 'td.notes', 'td.status'); //set column field database for datatable orderable
        $this->column_search = array('t.no_task', 'td.tanggal', 'u.name', 'td.notes', 'td.status'); //set column field database for datatable searchable
        $this->order = array('t.tanggal' => 'asc'); // default order 

        $this->db->select('td.*, t.no_task, t.status as status_header, u.name, (select count(id) from task_detail_history where task_detail_id = td.id) as jumlah_history');
        $this->db->from('task_detail as td');
        $this->db->join('task t', 'td.task_id = t.id', 'left');
        $this->db->join('users u', 'td.pic_id = u.id', 'left');
        $this->db->join('users u2', 'td.created_by = u2.id', 'left');
        $this->db->where('td.task_id',$data['task_id']);
        $this->db->where('td.parent_id',$data['task_parent_id']);
        $this->db->where('td.flag_delete',0);
        $this->db->where('td.status',0);
        $this->db->where('td.level',$data['level']);
        if(!empty($data['start']) && !empty($data['end'])){
            $this->db->where('t.tanggal >=', $data['start']);
            $this->db->where('t.tanggal <=', $data['end']);
        }
    }

    //Datatables
    function get_datatables($id,$func_name) {
        $this->_get_datatables_query($id,$func_name);
        if(@$_POST['length'] != -1)
        $this->db->limit(@$_POST['length'], @$_POST['start']);
        $query = $this->db->get();
        $data['data'] = $query->result();

        $this->_get_datatables_query($id,$func_name);
        $query = $this->db->get();
        $data['count_filtered'] = $query->num_rows();

        $this->$func_name($id);
        $query2 = $this->db;
        $data['count_all'] = $query2->count_all_results();
        return $data;
    }

    private function _get_datatables_query($id,$func_name) {
        $this->$func_name($id);

        $i = 0;

        foreach ($this->column_search as $item) { // loop column 
            if(@$_POST['search']['value']) { // if datatable send POST for search
                if($i===0) { // first loop
                    $this->db->group_start(); // open bracket. query Where with OR clause better with bracket. because maybe can combine with other WHERE with AND.
                    $this->db->like($item, $_POST['search']['value']);
                } else {
                    $this->db->or_like($item, $_POST['search']['value']);
                }
                if(count($this->column_search) - 1 == $i) //last loop
                    $this->db->group_end(); //close bracket
            }
            $i++;
        }

        if(isset($_POST['order'])) { // here order processing
            $this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
        }  else if(isset($this->order)) {
            $order = $this->order;
            $this->db->order_by(key($order), $order[key($order)]);
        }
    }
}