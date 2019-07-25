<?php
    
    require_once $pathes->server_path."private/lib/admin_lib.php";
    
    $selected = $rс->param;
    
    $allow = $_SESSION['access'] >= $admin_access_level ? true : false;
    
    if($selected == null){
        $selected = "home";
    }
   
    if($allow){
           
        $result = $db->query("SELECT * FROM admin_menu WHERE name = '$selected'");
        
        if($result->num_rows > 0){
            $error = false;
            $load = $selected;
        }else{
            $error = true;
        }
        
        include $pathes->server_path.'private/template/composition/dashboard.html';
        
    }else{
        require_once $pathes->server_path.'private/template/composition/admin_auth.html';
    }
   
   