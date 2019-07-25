<?php
    
    session_start();

    require_once $_SERVER[DOCUMENT_ROOT].'/config/path_cfg.php';
    $pathes = new PathConfig();
    require_once $pathes->server_path."config/db_cfg.php";
    require_once $pathes->server_path."config/routes_cfg.php";
    require_once $pathes->server_path."config/users_cfg.php";
    
    require_once $pathes->server_path."lib/db_output.php";
    require_once $pathes->server_path."private/lib/admin_lib.php";
    
    if($_SESSION['access'] >= $admin_access_level){
        
        
        
    }
