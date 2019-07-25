<?php
    
    $selector = "menu";

    $module_name = "menu";

    $query = "SELECT * FROM $module_name ORDER BY id ASC";

    $response = module_handle($query, $module_name, $db);

    $menu = $response;

    