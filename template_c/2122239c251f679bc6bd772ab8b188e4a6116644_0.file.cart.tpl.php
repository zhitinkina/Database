<?php
/* Smarty version 3.1.29, created on 2020-05-13 16:25:20
  from "C:\server2go\server2go\htdocs\shop\Database\template\cart.tpl" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_5ebc03509ac012_68760318',
  'file_dependency' => 
  array (
    '2122239c251f679bc6bd772ab8b188e4a6116644' => 
    array (
      0 => 'C:\\server2go\\server2go\\htdocs\\shop\\Database\\template\\cart.tpl',
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
function content_5ebc03509ac012_68760318 ($_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="ru">
    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:head.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('title'=>"Корзина"), 0, false);
?>


    <body class="page-info">
        <header class="header-goods">
            <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('bla'=>"Корзина"), 0, false);
?>

        </header>

        <main class="main-block main-block--cart">

            <div class="wrapper">
                <div class="wrapper__one">
                    <div class="main-cart"></div>
                </div>
                <div class="wrapper__two">

                    <div class="itogo">
                        <div class="itogo-block">
                            <h1 class="itogo-block__heading">Cумма заказа:</h1>
                            <div class="cost-good">567 рублей ????</div>
                            <button class="btn btn-zakaz">Оформить заказ</button>
                        </div>

                        <div id="email-field" class="email-field">
                            <p>Имя: <input type="text" id="ename"></p>
                            <p>Email: <input type="text" id="email"></p>
                            <p>Телефон: <input type="text" id="ephone"></p>
                            <p><button class="send-email">Заказать</button></p>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <footer class="footer"></footer>

    <?php echo '<script'; ?>
 src="libs/jquery-3.2.1.min.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="js/cart.js"><?php echo '</script'; ?>
>
    </body>
</html><?php }
}
