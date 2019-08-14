<?php
    
    abstract Class Performer{ // main performer
        
        protected $query_builder;
        protected $pathes;
        protected $data;
        protected $content;
        protected $table;


        static public function getPerformer($key){
            $classname = $key."_Performer";
            if(class_exists($classname)){
                return new $classname;
            }else{
                return "Не вдалося виконати запит: звернення до невідомого класу";
            }
        }
        
        public function init($query_builder, $pathes, $data, $content, $table){
            
            $this->query_builder = $query_builder;
            $this->pathes = $pathes;
            $this->data = $data;
            $this->content = $content;
            $this->table = $table;
            
        }
        
        abstract function execute();
        
    }
    
    class C_Performer extends Performer{ // create performer
        
        public function execute(){
            
            if($this->data != null and $this->table != null){
                $this->data = urldecode($this->data);
                $this->data = FormDserializer::Deserialize($this->data);
                
                unset($this->data['id']);
                
                if($this->content != null){
                    $this->data['content'] = $this->content;
                }
                
                if(DataHandler::CheckFilling($this->data)){
                    $keys = DataHandler::GetArrayKeys($this->data);
                    $values = DataHandler::GetArrayValuesToInsert($this->data, $this->query_builder->get_instance());
                    
                    if($this->query_builder->insert($this->table,$keys,$values)){
                        return "Операцію успішно виконано";
                    }else{
                        return "При виконанні операції виникла помилка";
                    }
                    
                }else{
                    return "Принаймні одне поле повинно бути заповнене";
                }
            }
            
        }
        
    }
    
    class D_Performer extends Performer{ // delete performer
        
        public function execute(){

            $id = $this->data;
            if($this->query_builder->delete($this->table, "id = '$id'")){
                return "Дані успішно видално";
            }else{
                return "При видаленні даних виникла помилка";
            }

        }
    }
    
    class G_Performer extends Performer{ // get performer
        
        public function execute(){

            $id = $this->data;
            $result = $this->query_builder->select($this->table." WHERE id='$id'");
            $row = $result->fetch_assoc();
            return DataHandler::Code($row);

        }
    }
    
    class U_Performer extends Performer{ // update performer
        
        public function execute(){

            $this->data = urldecode($this->data);
            $this->data = FormDserializer::Deserialize($this->data);
            
            if($this->content != null){
                $this->data['content'] = $this->content;
            }
            
            $id = $this->data['id'];
            unset($this->data['id']);
            
            $query_statement = get_array_values_to_update($this->data, $this->query_builder->get_instance());
            if($this->query_builder->update($this->table, $query_statement, "WHERE id = '$id'")){
                return "Дані успішно оновлено";
            }else{
                return "Не вдалося оновити дані";
            }
        }
    }
    
    class US_Performer extends Performer{ // user performer
        
        public function execute(){
            
            $id = $this->data;
            $opType = $this->content;
            
            $access_level = $this->query_builder->select($this->table." WHERE id='$id'");
            $access_level = $access_level->fetch_assoc();
            $access_level = $access_level['int_param1'];
            
            if($opType == "upgrade"){
                $new_access_level = $access_level + 1;
            }else if($opType == "downgrade"){
                $new_access_level = $access_level - 1;
            }
            
            if($this->query_builder->update($this->table, "int_param1 = $new_access_level"," WHERE id = '$id'")){
                return "Операцію успішно виконано";
            }else{
                return "Не вдалося виконати операцію";
            }
            
        }
    }
    
    class F_Performer extends Performer{ // find performer
        public function execute(){
            
            $result = $this->query_builder->select("admin_references WHERE title LIKE '%$this->data%'");
            $response;
            while($row = $result->fetch_assoc()){
                $response = $response.$row['id']."=".$row['title'].";";
            }
            return $response;
            
        }
    }