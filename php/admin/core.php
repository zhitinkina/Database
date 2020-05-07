<?php
    $action = $_POST['action'];

    require_once 'function.php';

    switch ($action) {
         case "selectOneGoods":
              selectOneGoods();
              break;
         case "updateGoogs":
              updateGoogs();
              break;
         case "newGoogs":
              newGoogs();
              break;
         case "loadSingleGoods":
              loadSingleGoods();
              break;
    }
