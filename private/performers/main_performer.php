<?php
    
    session_start();

    require_once $_SERVER[DOCUMENT_ROOT].'/config/path_cfg.php';
    $pathes = new PathConfig();
    require_once $pathes->server_path."config/db_cfg.php";
    require_once $pathes->server_path."config/routes_cfg.php";
    require_once $pathes->server_path."config/users_cfg.php";
    
    require_once $pathes->server_path."lib/db_output.php";
    require_once $pathes->server_path."private/lib/admin_lib.php";
    require_once $pathes->server_path."private/lib/performer_lib.php";
    
    if($_SESSION['access'] >= $admin_access_level){
        
        $query_builder = new QueryBuilder($db);
        $data = $_POST['data'];
        $content = $_POST['content'];
        $table = $_POST['performer'];
        $key = $_POST['key'];
        
        $performer = Performer::getPerformer($key);
        
        if($performer instanceof Performer){
            
            $performer->init($query_builder,$pathes,$data,$content,$table);
           $response = $performer->execute();

           echo $response;
            
        }else{
            echo "Не вдалося виконати запит: звернення до невідомого класу";
        }
        


    }