<?php
    

    function get_item_list($result, $layout, $custom = false){
        $pathes = new PathConfig();
        if(!$custom){
            
            $path = $pathes->server_path."template/layout/$layout".".html";
            
        }else{
            
            $path = $pathes->server_path.$layout;
            
        }
        
        while($item_info = $result->fetch_assoc()){
            
            include $path;
            
        }
        
    }
    
    
    Class QueryBuilder{
        
        private $db;
        
        public function __construct($_db) {
            $this->db = $_db;
        }
        
        public function insert($table, $keys, $values){
            if($this->db->query("INSERT INTO $table ($keys) VALUES ($values)")){
                return true;
            }else{
                return false;
            }
        }
        
        public function select($table, $query = "*"){

            return $this->db->query("SELECT $query FROM $table");

        }
        
        public function delete($table, $condition){

            return $this->db->query("DELETE FROM $table WHERE $condition");

        }
        
        public function update($table, $query, $condition){

            return $this->db->query("UPDATE $table SET $query $condition");

        }
        
        public function get_instance(){
            return $this->db;
        }
        
    }
    

    