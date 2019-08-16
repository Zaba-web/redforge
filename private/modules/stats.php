<?php 
    require_once '../lib/vendor/phpQuery-onefile.php';
    require_once '../lib/livePar.php';

    $grabber = new Grabber("mkkp.tk.te.ua","m1n2b3v4");
    $main_parser = new MainParser();


    
    function handle_difference($array){
        for($i = 1; $i<count($array);$i++){
            $item = explode("+",$array[$i]);
            if(count($item) == 2){
                $item[1] = "<sup style='color:green' title='Різниця вчорашнім значенням у цей же час'>+".$item[1]."</sup>";
                $array[$i] = implode("", $item);
            }
        }
        return $array;
    }

    if(isset($_POST['key'])){
        
        $data = $grabber->getData("?date=".$_POST['date']);
        $data = $main_parser->loadData($data);

        $views = handle_difference($main_parser->parseTable(1));
        $sessions = handle_difference($main_parser->parseTable(2));
        $visits = handle_difference($main_parser->parseTable(3));
        $hosts = handle_difference($main_parser->parseTable(4));
        if($_POST['key'] == "G_T"){
            $views = implode(";", $views);
            $sessions = implode(";",$sessions);
            $visits = implode(";",$visits);
            $hosts = implode(";",$hosts);
            echo $views."-".$sessions."-".$visits."-".$hosts;
        }else if($_POST['key'] == "G_C"){
            $data = $grabber->getData("index.tsv?graph=tsv");
            $chart = $main_parser->parseChart($data);
            
            $dates = implode(";",$chart->date_list);
            $views = implode(";",$chart->views_list);
            $visits = implode(";",$chart->visit_list);
            echo $dates."-".$views."-".$visits;
        }
    }
