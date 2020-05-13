<?php
/* Smarty version 3.1.29, created on 2020-05-13 16:32:06
  from "C:\server2go\server2go\htdocs\shop\Database\template\header.tpl" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_5ebc04e685bc31_72332169',
  'file_dependency' => 
  array (
    '25725eac8ee12079c9d1511c2e6573f6c12619aa' => 
    array (
      0 => 'C:\\server2go\\server2go\\htdocs\\shop\\Database\\template\\header.tpl',
      1 => 1589380049,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5ebc04e685bc31_72332169 ($_smarty_tpl) {
?>
<div class="wrapper header__wrap">
    <div class="header__logo">
        <a href="index.php"><img src="images/main/logo.svg" alt="company"></a>
    </div>
    <nav class="header__nav">
        <div class="header__right">
            <a href="all-goods.php" class="btn btn--category">Товары</a>
        </div>
        <a href="later.php"><img src="images/main/heart.svg"></a>
        <a href="cart.php"><img src="images/main/basket.svg"></a>
        <div class="header__right">
            <a href="user-login.php" class="btn">Вход</a>
        </div>
    </nav>
</div>

<?php if ($_smarty_tpl->tpl_vars['bla']->value) {?>
    <div class="title__block">
        <div class="wrapper">
            <h1><?php echo $_smarty_tpl->tpl_vars['bla']->value;?>
</h1>
        </div>
    </div>
<?php }
}
}
