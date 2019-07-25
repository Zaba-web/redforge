<?php
    
    // простий модуль створений з використанням стандартної бібліотеки

    $selector = "sanka";

    if(contains($data['content'],"{#".$selector."#}")){
        
        $module_name = "test";

        $query = "SELECT * FROM $module_name";

        $response = module_handle($query, $module_name, $db);

        $data['content'] = insert_in_page($selector, $response, $data['content']);
    
    }