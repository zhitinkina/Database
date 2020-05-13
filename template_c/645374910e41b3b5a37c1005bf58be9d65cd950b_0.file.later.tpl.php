<?php
/* Smarty version 3.1.29, created on 2020-05-13 16:25:18
  from "C:\server2go\server2go\htdocs\shop\Database\template\later.tpl" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_5ebc034ea4c4d3_13941786',
  'file_dependency' => 
  array (
    '645374910e41b3b5a37c1005bf58be9d65cd950b' => 
    array (
      0 => 'C:\\server2go\\server2go\\htdocs\\shop\\Database\\template\\later.tpl',
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
function content_5ebc034ea4c4d3_13941786 ($_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="ru">
    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:head.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('title'=>"Желания"), 0, false);
?>


    <body class="page-info">
        <header class="header-goods">
            <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('bla'=>"Желания"), 0, false);
?>

        </header>

        <main class="main-block main-block--cart">

            <div class="wrapper">
                <div class="goods-out"></div>
            </div>
        </main>

        <!-- <footer class="footer"></footer> -->

    <?php echo '<script'; ?>
 src="libs/jquery-3.2.1.min.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="js/later.js"><?php echo '</script'; ?>
>
    </body>
</html><?php }
}
