<?php
/* Smarty version 3.1.29, created on 2020-05-07 01:13:52
  from "E:\!git\tmp\server2go\htdocs\template\index.tpl" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_5eb344b047a505_63907610',
  'file_dependency' => 
  array (
    '103d5a97ad2bd95d0bd7d4b39ce6f22158b1c9fc' => 
    array (
      0 => 'E:\\!git\\tmp\\server2go\\htdocs\\template\\index.tpl',
      1 => 1588806820,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5eb344b047a505_63907610 ($_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="ru">
    <head>
        <meta charset="UTF-8">
        <title>eshop</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/header.css">
    </head>

    <body class="page-home">
        <section class="home-hero">
            <header class="header">
              <div class="wrapper header__wrap">
                <div class="header__logo"><a href="index.html"><img src="images/main/logo.svg" alt="company"></a></div>
                <nav class="header__nav">
                    <div class="header__right"><a href="all-goods.html" class="btn btn--category">Товары</a></div>
                    <a href="later.html"> <img src="images/main/heart.svg"></a>
                    <a href="cart.html"><img src="images/main/basket.svg"></a>
                    <div class="header__right"><a href="#" class="btn">Вход</a></div>
                </nav>
              </div>
            </header>

            <div class="wrapper home-hero__wrap">
                <h1 class="home-hero__heading"> Красота </h1>
                <p class="home-hero__descr"> вокруг - и внутри каждой </p>

                <div class="home-hero__nav">
                <a href="#">Наши партнёры</a>
                <a href="#">О нас</a>
                <a href="#">Социальные сети</a>
                </div>
            </div>

        </section>

    <main>
        <!-- <a href="cart.html">Корзина</a>
        <div class="mini-cart"></div>
        <a href="later.html">Желания</a>
        <div class="goods-out"></div> -->
    </main>
    <footer></footer>

    <?php echo '<script'; ?>
 src="js/jquery-3.2.1.min.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="js/main.js"><?php echo '</script'; ?>
>
    </body>
</html><?php }
}
