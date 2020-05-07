<?php
    require_once("php/api/api_impl.php");

    $action = $_POST['action'];

    switch ($action) {
         case "selectOneGoods":
              selectOneGoods();
              break;
         case "updateGoods":
              updateGoods();
              break;
         case "newGoods":
              newGoods();
              break;
    }
