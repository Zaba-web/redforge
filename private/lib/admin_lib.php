<?php
    
    Class FormDserializer{
        
        static function Deserialize($data) {

        $data_couple = explode("&", $data);

        $data_parsed = array();

        foreach ($data_couple as $data_item) {

            $data_item_parsed = explode("=", $data_item);
            if (count($data_item_parsed) == 2) {
                $data_parsed[$data_item_parsed[0]] = $data_item_parsed[1]; // for common text
            } else { // if array item contains '=' mark
                $data_key = $data_item_parsed[0];
                unset($data_item_parsed[0]);
                $data_value = implode("=", $data_item_parsed);
                $data_parsed[$data_key] = $data_value;
            }
        }

        return $data_parsed;
        }

    }

    Class DataHandler{

        static public function CheckFilling($array){
            $status = true;
            $empty = 0;
            foreach ($array as $value){
                if(strlen($value) == 0){
                    $empty++;
                }
            }
            if($empty >= count($array)){
                $status = false;
            }
            return $status;
        }
        
        static public function GetArrayKeys($array){
            $keys = array_keys($array);
            return implode(",", $keys);
        }
        
        static public function GetArrayValuesToInsert($array, $db){
            foreach($array as $key => $value){
                $array[$key] = $db->real_escape_string($array[$key]);
                $array[$key] = "'".$array[$key]."'";
            }
            return implode(",", $array);
        }
        
        static public function GetArrayValuesToUpdate($array,$db){
            $response;
            foreach ($array as $key=>$value){
                $value = $db->real_escape_string($value);
                $response = $response.",".$key."='".$value."'";
            }
            return ltrim($response,",");
        }
        
        static public function Code($row){
            $response;
            foreach ($row as $key => $value){
                if($value == ""){$row[$key] = "-";}
                $response = $response.$key."≈".$value."╬";
            }
        
            return $response;
        }
        
    }
    
    function load_partition($selected, $error, $pathes){
        
        if($error){
            $result = $pathes->server_path."private/template/components/error.html";
        }else{
            if(file_exists($pathes->server_path."private/template/components/".$selected.".html")){
                $result = $pathes->server_path."private/template/components/".$selected.".html";
            }else{
                $result = $pathes->server_path."private/template/components/error.html";
            }
        }
        
        return $result;
        
    }  
    
    function get_array_values_to_update($array, $db){
        $response;
        foreach ($array as $key=>$value){
            $value = $db->real_escape_string($value);
            $response = $response.",".$key."='".$value."'";
        }
        return ltrim($response,",");
    }
    
    function get_admin_items_list($table,$layout,$db,$pathes){
        $query_builder = new QueryBuilder($db);
        $result = $query_builder->select($table);
        
        if ($result->num_rows > 0) {

            while ($item_info = $result->fetch_assoc()) {
                include $pathes->server_path . "private/template/layouts/" . $layout . ".html";
            }
            
        }else{
            echo "<p>Тут поки що нічого немає</p>";
        }
    }
    
    function get_file_list($layout,$type){
        $pathes = new PathConfig();
        $dir = $pathes->server_path."content/";
        $file_list = scandir($dir);
        
        unset($file_list[0]);
        unset($file_list[1]);
        
        $item_info = array();
        
        $statement;
        
        foreach($file_list as $file){
            
            if($type=="file"){
                $statement = !is_dir($pathes->server_path."content/".$file);
            }else if($type == "dir"){
                $statement = is_dir($pathes->server_path."content/".$file);
            }
            
            if($statement){
                if(strlen($file)>20){
                    $file_short = mb_strimwidth($file,0,20,"...");
                }else{
                    $file_short = $file;
                }
                $item_info["name"] = $file;
                $item_info["name_short"] = $file_short;
                $item_info["size"] = round(filesize($dir.$file)/1048576,3);
                include $pathes->server_path."private/template/layouts/".$layout.".html";
            }
        }
    }
    
    function get_reference_data($id,$db){
        
        $result = $query_builder = new QueryBuilder($db);
        $result = $query_builder->select("admin_references WHERE id='$id'");
        return $result->fetch_assoc();
        
    }
    
    function get_admin_menu_modules_list($db){
        $query = $db->query("SELECT * FROM admin_menu WHERE type = 'custom' AND visibility = 1");
        if($query->num_rows>0){
            return get_item_list($query, "private/template/layouts/admin_menu.html", true);
        }else{
            return "<li class='reset'><p>Додаткових розділів не знайдено</p></li>";
        }
    }
    
    function check_is_developer($id,$db){
        $res = $db->query("SELECT * FROM admin_developers WHERE user_id = '$id'");
        if($res->num_rows>0){
            return true;
        }else{
            return false;
        }
    }
    
    function get_dev_menu_list($db){
        if(check_is_developer($_SESSION['id'],$db)){
            $query = $db->query("SELECT * FROM admin_menu WHERE type = 'dev' AND visibility = 1");
            if($query->num_rows>0){
                return get_item_list($query, "private/template/layouts/admin_menu.html", true);
            }else{
                return "<li class='reset'><p>Розділів розробника не знайдено</p></li>";
            }    
        }else{
            return "<li class='reset'><p>Доступ розробника заборонено</p></li>";
        }
        
    }
    
    class Widget{
        
        
        private $table;
        private $db;
        private $last_selector;
        private $popular_selector;
        public $children_table;
        
        public $title;
        public $count;
        public $last;
        public $best;
        public $children_count;
        
        public function __construct($_title, $_table, $_last_selector, $_popular_selector, $_db, $_children_table = null) {
            
            $this->title = $_title;
            $this->table = $_table;
            $this->db = $_db;
            $this->last_selector = $_last_selector;
            $this->popular_selector = $_popular_selector;
            $this->children_table = $_children_table;
            
        }
        
        function get_count(){
            
            $count = $this->db->query("SELECT * FROM $this->table");
            $this->count = $count->num_rows;
            
        }
        
        function get_last(){
            
            $last = $this->db->query("SELECT $this->last_selector FROM $this->table ORDER BY id DESC LIMIT 1");
            $last = $last->fetch_assoc();
            $this->last = $last[$this->last_selector];
            
        }
        
        function get_views(){
            if($this->children_table == null){
                $views = $this->db->query("SELECT $this->last_selector FROM $this->table ORDER BY $this->popular_selector DESC LIMIT 1");
                $views = $views->fetch_assoc();

                $this->best = $views[$this->last_selector];
            }
        }
        
        
    }
    
    function get_widget($_title, $_table, $_last_selector, $_popular_selector, $_db, $_children_table = null){
        $widget = new Widget($_title, $_table, $_last_selector, $_popular_selector, $_db, $_children_table);
        $widget->get_count();
        $widget->get_last();
        $widget->get_views();
        include $pathes->server_path."private/template/layouts/widget.html";;
        unset($widget);
    }
    
    function get_site_info($db){
        $qbuilder = new QueryBuilder($db);
        $result = $qbuilder->select("site_info");
        return $result->fetch_assoc();
    }