<?php

   $page = $rс->param == null ? "main" : $rс->param;
   
   $mysqli_result = $db->query("SELECT * FROM pages WHERE name = '$page'");
   
   if($mysqli_result->num_rows > 0){
       
       $data = $mysqli_result->fetch_assoc();
       
       $views = $data['views'];
       $views++;
       
       $db->query("UPDATE pages SET views = '$views' WHERE name = '$page'");
       
       
       require_once $pathes->server_path."template/composition/single_page.html";
       
   }else{
       
       require_once $pathes->server_path."template/composition/404.html";
       
   }
   
   