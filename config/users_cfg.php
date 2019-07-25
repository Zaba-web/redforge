<?php
    
    $user_settings = array(
        
        "login"      => "varchar_param1",  // necessary 
        "password"   => "varchar_param2",  // necessary
        "name"       => "varchar_param3",  // necessary
        "access"     => "int_param1",      // necessary
        "avatar"     => "text_param1"      // preferably for admin panel
        
    );
    
    $permission_settings = array(
        
      0  => "Гість",  
      1  => "Користувач", 
      2  => "Адміністратор"
        
    );
    
    $default_access_level = 1;  
    $admin_access_level = 2; // you can set the admin access level
    
    // data required for authorization must be associated with your user settings keys
    
    $login_link = "login"; 
    $password_link = "password"; 
    $access_link = "access";