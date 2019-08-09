<?php
    
    session_start();

    require_once $_SERVER[DOCUMENT_ROOT].'/config/path_cfg.php';
    $pathes = new PathConfig();
    require_once $pathes->server_path."config/db_cfg.php";
    require_once $pathes->server_path."config/routes_cfg.php";
    require_once $pathes->server_path."config/users_cfg.php";
    
    require_once $pathes->server_path."lib/db_output.php";
    require_once $pathes->server_path."private/lib/admin_lib.php";
    
    if($_SESSION['access'] >= $admin_access_level){
        
        $query_builder = new QueryBuilder($db);
        
        $performer = $_POST['performer'];
        
        // C - створення запису в таблиці
        
        if($_POST['key'] == "C"){
            
            // парсинг інформації
            
            $data = urldecode($_POST['data']);
            $data_parsed = decode($data);
            
            unset($data_parsed['id']);
            
            if($_POST['content'] != null){
                $data_parsed['content'] = $_POST['content'];
            }
            
            if(check_filling($data_parsed)){
            
                $keys = get_array_keys($data_parsed);
                $values = get_array_values_to_insert($data_parsed,$db);
				
                if($query_builder->insert($performer,$keys,$values)){
                    echo "Операцію успішно виконано";
                }else{
                    echo "При виконанні операції виникла помилка";
                }
            
            }else{
                echo "Принаймні одне поле повинно бути заповнене";
            }
        }else if($_POST['key'] == "D"){
            
            $id = $_POST['data'];
            if($query_builder->delete($performer, "id = '$id'")){
                echo "Дані успішно видално";
            }else{
                echo "При видаленні даних виникла помилка";
            }
            
        }else if($_POST['key'] == "G"){
            
            $id = $_POST['data'];
            $result = $query_builder->select($performer." WHERE id='$id'");
            $row = $result->fetch_assoc();
            echo code($row);
            
        }else if($_POST['key'] == "U"){
            
            $data = urldecode($_POST['data']);
            $data_parsed = decode($data);
            
            if($_POST['content'] != null){
                $data_parsed['content'] = $_POST['content'];
            }
            
            $id = $data_parsed['id'];
            unset($data_parsed['id']);
            
            $query_statement = get_array_values_to_update($data_parsed, $db);
            if($query_builder->update($performer, $query_statement, "WHERE id = '$id'")){
                echo "Дані успішно оновлено";
            }else{
                echo "Не вдалося оновити дані";
            }
            
        }else if($_POST['key'] == "US"){
            
            $id = $_POST['data'];
            $opType = $_POST['content'];
            
            $access_level = $query_builder->select($performer." WHERE id='$id'");
            $access_level = $access_level->fetch_assoc();
            $access_level = $access_level['int_param1'];
            
            if($opType == "upgrade"){
                $new_access_level = $access_level + 1;
            }else if($opType == "downgrade"){
                $new_access_level = $access_level - 1;
            }
            
            if($query_builder->update($performer, "int_param1 = '.$new_access_level.'", "WHERE id = '$id'")){
                echo "Операцію успішно виконано";
            }else{
                echo "Не вдалося виконати операцію";
            }
            
        }else if($_POST['key'] == "F"){
            $data = $_POST['data'];
            $result = $query_builder->select("admin_references WHERE title LIKE '%$data%'");
            $response;
            while($row = $result->fetch_assoc()){
                $response = $response.$row['id']."=".$row['title'].";";
            }
            echo $response;
        }
        
    }