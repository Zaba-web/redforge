<?php

    class User{
        
        private $user_settings;
        private $user_settings_parsed;
        private $db;
        
        public function __construct($_user_settings, $_db) {
            
            $this->user_settings_parsed = implode(',',$_user_settings); // processed array that is used in insert requests
            $this->user_settings = $_user_settings;
            $this->db = $_db;
            
        }
        
        
        
        function reg_info_hande($reg_user_info){
            
            
            $reg_user_info['password'] = md5($reg_user_info['password']);
            
            $keys = array_keys($reg_user_info);
            
            for($i = 0; $i < count($reg_user_info); $i++){

                $reg_user_info[$keys[$i]] = $this->db->real_escape_string($reg_user_info[$keys[$i]]);
                $reg_user_info[$keys[$i]] = htmlspecialchars($reg_user_info[$keys[$i]]);
                
                if( !is_int($reg_user_info[$keys[$i]])){

                    $reg_user_info[$keys[$i]] = "'".$reg_user_info[$keys[$i]]."'"; // processing data array values to be inserted into the database as a string

                }
            }
                
            return implode(',',$reg_user_info);
            
        }
        
        
        
        function register($reg_user_info){
            
            if($reg_user_info["password"] == $reg_user_info["password_re"]){
                
                unset($reg_user_info["password_re"]);

                $check_uniq = $reg_user_info[$keys[0]];
                $check_uniq_query = $this->db->query("SELECT varchar_param1 FROM users WHERE varchar_param1 = '$check_uniq'");
                
                if($check_uniq_query->num_rows == 0){
                    
                    $reg_user_info = $this->reg_info_hande($reg_user_info);

                    if($this->db->query("INSERT INTO users ($this->user_settings_parsed) VALUES ($reg_user_info)")){
                        return true;
                    }else{
                        return false;
                    }
                
                }else{
                    return false;
                }
                
            }else{
                return false;
            }
        
        }
        
        
        function authorize($auth_user_info){
            
            
            $keys = array_keys($auth_user_info);
            
            $login_key_name = $keys[0];
            $password_key_name = $keys[1];
            
            $auth_login = $auth_user_info[$login_key_name];
            $auth_password = md5($auth_user_info[$password_key_name]);
            
            $login_link = $this->user_settings[$login_key_name];
            $password_link = $this->user_settings[$password_key_name];
            
            $auth = $this->db->query("SELECT * FROM users WHERE $login_link = '$auth_login'");
            
            
            if($auth){
                
                
                if($auth->num_rows>0){
                    
                    $auth = $auth->fetch_assoc();
                    
                    if($auth[$password_link] == $auth_password){
                        
                        $_SESSION['id'] = $auth['id'];    
                        
                        foreach ($this->user_settings as $key => $value) {
                            
                            $_SESSION[$key] = $auth[$value];    
                            
                        }
                        
                        return true;
                        
                    }else{
                        return false;
                    }
                    
                }else{
                    return false;
                }
                
                
            }else{
                return false;
            }
            
            
            
        }
        
    }