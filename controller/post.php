<?php
    $post_name = $rс->param;

    
    if($post_name == null){
        
        require_once $pathes->server_path."template/composition/404.html";
        
    }else{
        
        $post_info = $db->query("SELECT * FROM posts WHERE name='$post_name'");
        
        $data = $post_info->fetch_assoc();
        
        $views = $data['views'];
        $views++;
        
        $db->query("UPDATE posts SET views = '$views' WHERE name = '$post_name'");
        
        if($post_info->num_rows > 0){    
            require_once $pathes->server_path."template/composition/single_post.html";
        }else{
            require_once $pathes->server_path."template/composition/404.html";
        }
        
    }