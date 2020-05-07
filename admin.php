<?php
    require_once("php/include/database.inc.php");
    require_once("libs/Smarty.class.php");

    $smarty = new Smarty();
    $smarty->template_dir = "template";
    $smarty->compile_dir  = "template_c";
    $smarty->cache_dir = "cache";
    $smarty->config_dir = "configs";
    // $smarty->setCaching(Smarty::CACHING_LIFETIME_CURRENT); // release only

    $dbHandler = new DbHandler(DB_HOST, DB_USER, DB_PASS, DB_NAME, DB_PORT);
    $categories = $dbHandler->queryGetAssoc("SELECT id, name FROM goods");

    $smarty->assign("categories", $categories);
    $smarty->display("admin.tpl");
