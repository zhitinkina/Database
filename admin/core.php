<?php
$action = $_POST['action'];

require_once 'function.php';

switch ($action) {
     case 'init':
          init();
          break;
     case "selectOneGoods":
          selectOneGoods();
          break;
     case "updateGoogs":
          updateGoogs();
          break;
     case "newGoogs":
          newGoogs();
          break;
     case "loadGoogs":
          loadGoogs();
          break;
     case "loadSingleGoods":
          loadSingleGoods();
          break;
}