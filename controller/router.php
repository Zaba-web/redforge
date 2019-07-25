<?php

    class Router{
        
        private $url;
        private $routes;
        public  $controller;
        public  $param;
        
        public function __construct($_url, $_routes) {
            
            $this->url = $_url;
            $this->routes = $_routes;
            
        }
        
        public function url_parse(){
            
            $url_parsed = explode("/", $this->url);
            
            if($url_parsed[0] == null and $url_parsed[1] == null){  // page is default controller
                
                $this->controller = "main";
                
            }else if($url_parsed[1] == null){
                
                
                if(array_key_exists($url_parsed[0], $this->routes)){ 
                    
                    $this->controller = $url_parsed[0];
                    
                }else{             // page is default controller if one parameter given
                   
                    $this->controller = "page";
                    $this->param = $url_parsed[0];
                    
                }
                
            }else{
            
                $this->controller = $url_parsed[0]; 
                $this->param = $url_parsed[1]; 
                
                
            }
            
        }
        
    }