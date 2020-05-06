<?php
/* Smarty version 3.1.29, created on 2020-05-07 01:03:43
  from "E:\!git\tmp\server2go\htdocs\template\all-goods.tpl" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_5eb3424f624cd0_83932311',
  'file_dependency' => 
  array (
    'd5f48dff052eb88584d4eff0985a3db8ef06a6fc' => 
    array (
      0 => 'E:\\!git\\tmp\\server2go\\htdocs\\template\\all-goods.tpl',
      1 => 1588806222,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5eb3424f624cd0_83932311 ($_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="ru">
    <head>
        <meta charset="UTF-8">
        <title>Все товары</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/goods.css">
    </head>

    <body class="page-info">
        <header class="header-goods">
            <div class="wrapper header__wrap">
            <div class="header__logo"><a href="index.html"><img src="images/main/logo.svg" alt="company"></a></div>
            <nav class="header__nav">
                <div class="header__right"><a href="all-goods.html" class="btn btn--category">Товары</a></div>
                <a href="later.html"> <img src="images/main/heart.svg"></a>
                <a href="cart.html"><img src="images/main/basket.svg"></a>
                <div class="header__right"><a href="#" class="btn">Вход</a></div>
            </nav>
            </div>

            <div class="title__block">
                <div class="wrapper"><h1>Категории</h1></div>
            </div>
        </header>

    <main class="main-block">
        <div class="wrapper">
            <div class="category__block">
                <a class="category__item">
                    <img src="images/main/hair.jpg">
                    <div class="category__name">Волосы</div>
                </a>
                <a class="category__item">
                    <img src="images/main/body.jpg">
                    <div class="category__name">Тело</div>
                </a>
                <a class="category__item">
                    <img src="images/main/manik.jpg">
                    <div class="category__name">Ногти</div>
                </a>
                <a class="category__item">
                    <img src="images/main/cosmetic.jpg">
                    <div class="category__name">Лицо</div>
                </a>
            </div>
        </div>

        <div class="title__block-block">
            <div class="wrapper"><h1>Товары</h1></div>
        </div>

        <div class="wrapper">
            <div class="goods-out">
                <?php
$_from = $_smarty_tpl->tpl_vars['cards']->value;
if (!is_array($_from) && !is_object($_from)) {
settype($_from, 'array');
}
$__foreach_card_0_saved_item = isset($_smarty_tpl->tpl_vars['card']) ? $_smarty_tpl->tpl_vars['card'] : false;
$_smarty_tpl->tpl_vars['card'] = new Smarty_Variable();
$_smarty_tpl->tpl_vars['card']->_loop = false;
foreach ($_from as $_smarty_tpl->tpl_vars['card']->value) {
$_smarty_tpl->tpl_vars['card']->_loop = true;
$__foreach_card_0_saved_local_item = $_smarty_tpl->tpl_vars['card'];
?>
                    <div class="cart">
                        <div class="cart__wrap">
                            <div class="cart__img">
                                <img src="images/<?php echo $_smarty_tpl->tpl_vars['card']->value['img'];?>
" alt="">
                            </div>
                            <div class="cart__info">
                                <p class="name"><a href="goods.html#<?php echo $_smarty_tpl->tpl_vars['card']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['card']->value['name'];?>
</a></p>
                                <a class="add-to-later hearts" data-id="<?php echo $_smarty_tpl->tpl_vars['card']->value['id'];?>
"><img src="images/main/later.svg"></a>
                            </div>
                            <div class="cart__descr"><?php echo $_smarty_tpl->tpl_vars['card']->value['description'];?>
</div>
                            <div class="cart__info">
                                <div class="cost"><?php echo $_smarty_tpl->tpl_vars['card']->value['cost'];?>
 &#x20BD;</div>
                                <a href="cart.html" class="cart__info-basket"><img src="images/main/basket.svg"></a>
                                <button class="add-to-cart btn" data-id="<?php echo $_smarty_tpl->tpl_vars['card']->value['id'];?>
">Купить</button>
                            </div>
                        </div>
                    </div>
                <?php
$_smarty_tpl->tpl_vars['card'] = $__foreach_card_0_saved_local_item;
}
if ($__foreach_card_0_saved_item) {
$_smarty_tpl->tpl_vars['card'] = $__foreach_card_0_saved_item;
}
?>
            </div>
        </div>


        <!-- <a href="cart.html">Корзина</a>
        <div class="mini-cart"></div>
        <a href="later.html">Желания</a>
        <div class="goods-out"></div> -->
    </main>
    <footer class="footer"></footer>

    <?php echo '<script'; ?>
 src="js/jquery-3.2.1.min.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="js/main.js"><?php echo '</script'; ?>
>
    </body>
</html><?php }
}
