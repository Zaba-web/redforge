<?php

    function insert_in_page($selector, $response, $content){
        
        $content = str_replace("{#".$selector."#}", $response, $content);
        return $content;
        
    }
    
    
    function contains($haystack,$needle){
        
        if (strpos($haystack,$needle) !== false) {
           return true;
        }
        
    }
    
    
    function module_handle($query, $module_name, $db){
         
        $result = $db->query($query);

        $response;

        $layout_name = $pathes->server_path."modules/".$module_name."/".$module_name.".html";
        $layout = file($layout_name);

        while($row = $result->fetch_assoc()){

            $keys = array_keys($row);

            foreach($layout as $value){

                foreach($keys as $key){

                    if(contains($value, "{#".$key."#}")){

                        $value = str_replace("{#".$key."#}",$row[$key],$value);

                    }
                }
                $response = $response.$value;
            }
        }
        
        return $response;
    }
    
   