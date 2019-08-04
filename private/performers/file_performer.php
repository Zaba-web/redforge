<?php

    session_start();

    if ($_SESSION['access'] > 1) {
        if(!isset($_POST['key'])){
            
            if ((!empty($_POST)) && (isset($_SERVER['HTTP_X_REQUESTED_WITH'])) && ($_SERVER['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest'))
                ;
            header('Content-Type: application/json; charset=utf-8');
            $response = array();
            $response['status'] = 'bad';
            if (!empty($_FILES['file']['tmp_name'])) {
                for ($key = 0; $key < count($_FILES['file']['tmp_name']); $key++) {
                    $upload_path = $_SERVER['DOCUMENT_ROOT'] . "/content/";
                    $user_filename = $_FILES['file']['name'][$key];
                    $userfile_basename = pathinfo($user_filename, PATHINFO_FILENAME);
                    $userfile_extension = pathinfo($user_filename, PATHINFO_EXTENSION);
                    $server_filename = $userfile_basename . "." . $userfile_extension;
                    $server_filepath = $upload_path . $server_filename;
                    $i = 0;
                    while (file_exists($server_filepath)) {
                        $i++;
                        $server_filepath = $upload_path . $userfile_basename . "($i)." . $userfile_extension;
                    }
                    if (copy($_FILES['file']['tmp_name'][$key], $server_filepath)) {
                        $response['files'][] = $server_filepath;
                        $response['status'] = 'ok';
                    }
                }
            }
            echo json_encode($response);
        }else if($_POST['key'] == "C-D"){
            $data = $_POST['data'];
            if(strlen($data) == 0){
                echo "Введіть назву папки";
            }else{
                mkdir($_SERVER['DOCUMENT_ROOT'] . "/content/".$data);
                echo "Папку успішно створено";
            }
        }else if($_POST['key'] == "D-F"){
            $data = $_POST['data'];
            if(file_exists($_SERVER['DOCUMENT_ROOT'] . "/content/".$data)){
                chmod($_SERVER['DOCUMENT_ROOT'] . "/content/".$data, 0755);
                unlink($_SERVER['DOCUMENT_ROOT'] . "/content/".$data);
                echo "Файл видалено";
            }else{
                echo "Файл не знайдено";
            }
        }else if($_POST['key'] == "G-D"){
            $data = $_POST['data'];
            $file_list = scandir($_SERVER['DOCUMENT_ROOT'] . "/content/".$data);
        
            unset($file_list[0]);
            unset($file_list[1]);
            
            $item_info = array();
            $item_list;
            
            foreach($file_list as $file){
              $item_list = $item_list.$file.";";
            }
            echo $item_list."╬".$data;
        }
    }
    
