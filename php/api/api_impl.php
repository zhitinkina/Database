<?php
    require_once("php/include/common.inc.php");

    // TODO: FUCK IT NOW! RENAME GOODS!
    // + plural form
    // + SQL-inj

    function connect(){
        $conn = mysqli_connect("localhost", "root", "", "shop");
        if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());
        }
        return $conn;
    }

    function selectGoods() {
        $dbHandler = new DbHandler(DB_HOST, DB_USER, DB_PASS, DB_NAME, DB_PORT);
        echo(json_encode($dbHandler->queryGetAssoc("SELECT * FROM goods")));
    }

    function selectOneGoods() {
        $id = Request::getFromPost("gid");

        $dbHandler = new DbHandler(DB_HOST, DB_USER, DB_PASS, DB_NAME, DB_PORT);
        $row = $dbHandler->queryGetAssoc("SELECT * FROM goods WHERE id = '$id'");
        echo(count($row)
            ? json_encode($row[0])
            : "0"
        );
    }

    function updateGoods() {
        $id = Request::getFromPost("id");
        $name = Request::getFromPost("gname");
        $cost = Request::getFromPost("gcost");
        $descr = Request::getFromPost("gdescr");
        $ord = Request::getFromPost("gorder");
        $img = Request::getFromPost("gimg");

        $dbHandler = new DbHandler(DB_HOST, DB_USER, DB_PASS, DB_NAME, DB_PORT);
        $dbHandler->query("UPDATE goods SET name = '$name', cost = '$cost', description = '$descr', ord = '$ord', img = '$img' WHERE id = '$id'");
    }

    function newGoods() {

        $dbHandler = new DbHandler(DB_HOST, DB_USER, DB_PASS, DB_NAME, DB_PORT);
        $dbHandler->query("INSERT INTO goods(name, cost, description, ord, img) VALUES ('$name', '$cost', '$descr', '$ord', '$img')");
    }
