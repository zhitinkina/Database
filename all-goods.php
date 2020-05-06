<?php
    require_once("php/include/common.inc.php");
    require_once("libs/Smarty.class.php");

    $smarty = new Smarty();
    $smarty->template_dir = "template";
    $smarty->compile_dir  = "template_c";
    $smarty->cache_dir = "cache";
    $smarty->config_dir = "configs";
    // $smarty->setCaching(Smarty::CACHING_LIFETIME_CURRENT); // release only

    $dbHandler = new DbHandler(DB_HOST, DB_USER, DB_PASS, DB_NAME, DB_PORT);
    $cards = $dbHandler->queryGetAssoc("SELECT * FROM goods");

    $smarty->assign("cards", $cards);
    $smarty->display("all-goods.tpl");
