<?php
/* Smarty version 3.1.29, created on 2020-05-13 16:22:14
  from "C:\server2go\server2go\htdocs\shop\Database\template\index.tpl" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_5ebc02961e37e1_80435877',
  'file_dependency' => 
  array (
    '638acb39cde4f5b299f4afa31b01a035310fd5bd' => 
    array (
      0 => 'C:\\server2go\\server2go\\htdocs\\shop\\Database\\template\\index.tpl',
      1 => 1589237437,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:head.tpl' => 1,
    'file:header.tpl' => 1,
  ),
),false)) {
function content_5ebc02961e37e1_80435877 ($_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="ru">
    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:head.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('title'=>"eshop"), 0, false);
?>


    <body class="page-home">
        <section class="home-hero">
            <header class="header">
                <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('bla'=>''), 0, false);
?>

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
        <a href="later.php">Желания</a>
        <div class="goods-out"></div> -->
    </main>
    <footer></footer>

    <?php echo '<script'; ?>
 src="libs/jquery-3.2.1.min.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="js/main.js"><?php echo '</script'; ?>
>
    </body>
</html><?php }
}
