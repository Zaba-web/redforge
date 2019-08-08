<?php

    $table_name = "mod_advanced_menu";
    
    $amenu = null;
    
    $qbuilder = new QueryBuilder($db);
    $advanced_menu_raw = $qbuilder->select($table_name." WHERE parent IS NULL"); // selection of main menu items
    
    function get_sub_menu($qbuilder,$cur_menu_item,$table_name){
        
        $id = $cur_menu_item['id'];
            
        $advanced_sub_menu_raw = $qbuilder->select($table_name." WHERE parent = '$id'"); // selection of sub menu items
            
        if($advanced_sub_menu_raw->num_rows>0){
            $subres = "<ul>";
            while($advanced_sub_menu = $advanced_sub_menu_raw->fetch_assoc()){
                $subres = $subres."<li><a href='".$advanced_sub_menu['href']."'>".$advanced_sub_menu['title']."</a>".get_sub_menu($qbuilder, $advanced_sub_menu, $table_name)."</li>"; // recursive selection of deep level menu items
            }
            $subres = $subres."</ul>";
        }else{
            return;
        }
        
        return $subres;
        
    }
    
    $amenu = "<ul>";
    
    if($advanced_menu_raw->num_rows > 0){
        while($advanced_menu_main = $advanced_menu_raw->fetch_assoc()){
            
            $subres = null;
            
            $subres = get_sub_menu($qbuilder, $advanced_menu_main, $table_name);
            
            $amenu = $amenu."<li><a href='".$advanced_menu_main['href']."'>".$advanced_menu_main['title']."</a>".$subres."</li>";
            
        }
    }

    $amenu = $amenu."</ul>";

