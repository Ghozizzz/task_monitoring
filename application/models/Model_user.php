<?php

class Model_user extends CI_Model
{
    public function doLogin($username,$password){
        // cari user berdasarkan email dan username
        $this->db->where('username', $username);
        $user = $this->db->get('users')->row();
        // jika user terdaftar
        if($user){
            // periksa password-nya
            $isPasswordTrue = password_verify($password, $user->password);
            // $isPasswordTrue = $this->bcrypt->check_password($password, $user->password);

            // jika password benar
            if($isPasswordTrue){ 
                // login sukses yay!
                $this->session->set_userdata([
                    'user_id' => $user->id,
                    'username' => $user->username,
                    'password' => $user->password,
                    'name' => $user->name,
                    'id_roles' => $user->id_roles,
                    'user_logged' => "login",
                ]);
                $this->_updateLastLogin($user->id);
                return true;
            }
        }
        
        // login gagal
		return false;
    }

    public function isNotLogin(){
        return $this->session->userdata('status') === null;
    }

    private function _updateLastLogin($id){
        $sql = "UPDATE users SET last_login=now() WHERE id={$id}";
        $this->db->query($sql);
    }

}