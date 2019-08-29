<?php

    $category_name = $rс->param;
    
    if ($category_name == null){
        
        $category_list = $db->query("SELECT * FROM categories WHERE ISNULL(parent)");
        require_once $pathes->server_path."template/composition/categories_page.html";
        
        
    }else{
        
       $category_info = $db->query("SELECT * FROM categories WHERE name='$category_name'"); 
       if($category_info->num_rows > 0){
           
            $category_info_fetched = $category_info->fetch_assoc();

            $id = $category_info_fetched["id"];
            $title = $category_info_fetched["title"];

            $post_list = $db->query("SELECT * FROM posts WHERE parent = '$category_name'");
            $children_category_list = $db->query("SELECT * FROM categories WHERE parent = '$category_name'");

            require_once $pathes->server_path."template/composition/posts_page.html";
            
       }else{
           
           require_once $pathes->server_path."template/composition/404.html";
           
       }
       
    }