<?php
/* Smarty version 3.1.29, created on 2020-05-13 17:33:48
  from "C:\server2go\server2go\htdocs\shop\Database\template\registration.tpl" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_5ebc135c414a90_47828944',
  'file_dependency' => 
  array (
    '8850cea41c143a6532706bae8b0920590c719f73' => 
    array (
      0 => 'C:\\server2go\\server2go\\htdocs\\shop\\Database\\template\\registration.tpl',
      1 => 1589384023,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:head.tpl' => 1,
    'file:header.tpl' => 1,
  ),
),false)) {
function content_5ebc135c414a90_47828944 ($_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="ru">
    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:head.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('title'=>"Регистрация"), 0, false);
?>


    <body class="page-info">
        <header class="header-goods">
            <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('bla'=>"Регистрация"), 0, false);
?>

        </header>

    <main class="main-block">
        <div class="wrapper">

        <div class="user-login__block">
            <div class="user-login"> 

                <label id="login" class="user-login__label">
                    <span>Имя</span>
                    <input class="input" type="text" value="" autocomplete="off">
                </label>

                <label id="login" class="user-login__label">
                    <span>Логин</span>
                    <input class="input" type="text" value="" autocomplete="off">
                </label>

                <label id="login" class="user-login__label">
                    <span>Пароль</span>
                    <input class="input" type="password" value="" autocomplete="off">
                </label>

                <label id="login" class="user-login__label">
                    <span>Почта</span>
                    <input class="input" type="email" value="" autocomplete="off">
                </label>
            </div> 
        </div>

        </div>
    </main>

    <footer class="footer"></footer>

    <?php echo '<script'; ?>
 src="libs/jquery-3.2.1.min.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="js/goods.js"><?php echo '</script'; ?>
>
    </body>
</html><?php }
}
