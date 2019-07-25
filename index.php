<?php 
    session_start();
    
    require_once $_SERVER[DOCUMENT_ROOT].'/config/path_cfg.php';
    $pathes = new PathConfig();
    require_once $pathes->server_path."config/db_cfg.php";
    require_once $pathes->server_path."config/routes_cfg.php";
    require_once $pathes->server_path."config/users_cfg.php";
    require_once $pathes->server_path."config/template_info.php";
    
    
    require_once $pathes->server_path."controller/router.php";
    
    require_once $pathes->server_path."lib/db_output.php";
    require_once $pathes->server_path."lib/modules_output.php";
    require_once $pathes->server_path."lib/users_manage.php";
    
    require_once $pathes->server_path."config/modules_cfg.php";
    
    $url = $_GET['url'];
    
    $rс = new Router($url, $routes);
    $rс ->url_parse();
    
    if(array_key_exists($rс->controller, $routes)){
        
        require_once $pathes->server_path."controller/".$routes[$rс->controller];
        
    }else{
        
        require_once $pathes->server_path."template/composition/404.html";
        
    }

?>