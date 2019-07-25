<?php
    
    class PathConfig{
        
        public $server_path;
        public $client_path;
        public $template_path;
        
        public function __construct() {
            
            $this->server_path = $_SERVER[DOCUMENT_ROOT]."/";
            $this->client_path = "http://".$_SERVER[SERVER_NAME]."/";
            $this->template_path = "http://".$_SERVER[SERVER_NAME]."/template/";
            
        }
        
    }
    
    
