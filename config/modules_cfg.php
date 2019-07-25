<?php

    require_once $_SERVER[DOCUMENT_ROOT].'/config/path_cfg.php';
    $pathes = new PathConfig();
    require_once $pathes->server_path."modules/menu/menu.php";
