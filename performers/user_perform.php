<?php

    session_start();

    require_once $_SERVER[DOCUMENT_ROOT].'/config/path_cfg.php';
    $pathes = new PathConfig();
    require_once $pathes->server_path."config/db_cfg.php";
    require_once $pathes->server_path."config/users_cfg.php";
    require_once $pathes->server_path."lib/users_manage.php";
    
    $user = new User($user_settings, $db);
    
    if(isset($_POST['reg_btn'])){
        
        unset($_POST['reg_btn']);
        
        $reg_user_info = array();

        $keys = array_keys($user_settings);

        for($i = 0; $i<count($_POST); $i++){

            $reg_user_info[$keys[$i]] = $_POST[$keys[$i]];

        }

        $reg_user_info["access"] = $default_access_level;
        $reg_user_info["password_re"] = $_POST["password_re"];
            
        $result = $user->register($reg_user_info);

        if($result){

            echo "do_if_success";

        }else{

            echo "do_if_error";
            
        }
    }
    
    if(isset($_POST['auth_btn'])){
        
        unset($_POST['auth_btn']);
        
        $auth_user_info = array();
        
        $keys = array_keys($user_settings);
        $keys_post = array_keys($_POST);
        
        $auth_user_info[$keys[0]] = $_POST[$keys_post[0]];
        $auth_user_info[$keys[1]] = $_POST[$keys_post[1]];
        
        if($user->authorize($auth_user_info)){
            
            if($_GET['redir']=="admin"){
                if($_SESSION['access']>=$admin_access_level){
                    header('Location: '.$pathes->client_path."admin/");
                }
            }
            echo "ok";
        }else{

            echo "notok";

        }
        
    }
    
    if(isset($_GET['exit'])){
        
        session_destroy();
        
    }
    
    