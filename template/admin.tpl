<!DOCTYPE html>
<html lang="ru">
    <head>
        <meta charset="UTF-8">
        <title>Администратор</title>
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" href="../css/goods.css">
    </head>

    <body class="page-info">
        <header class="header-goods">
            <div class="wrapper header__wrap">
            <div class="header__logo"><a href="../index.html"><img src="../images/main/logo.svg" alt="company"></a></div>
            <nav class="header__nav">
                <div class="header__right"><a href="all-goods.html" class="btn btn--category">Товары</a></div>
                <a href="later.html"> <img src="../images/main/heart.svg"></a>
                <a href="cart.html"><img src="../images/main/basket.svg"></a>
                <div class="header__right"><a href="#" class="btn">Вход</a></div>
            </nav>
            </div>

            <div class="title__block">
                <div class="wrapper"><h1>Для админа</h1></div>
            </div>
        </header>

        <main class="main-block">
            <div class="wrapper">

                <div class="block-update">
                    <div class="goods-out">
                        <select class="select-goods">
                            <option data-id="0">Новый товар</option>
                            {foreach $categories as $category}
                                <option data-id="{$category.id}">{$category.name}</option>
                            {/foreach}
                        </select>
                    </div>

                    <p class="block-update__info">Имя:</p> <input class="block-update__input" type="text" id="gname">
                    <p class="block-update__info">Стоимость:</p> <input class="block-update__input" type="text" id="gcost">
                    <p class="block-update__info">Изображение:</p> <input class="block-update__input" type="text" id="gimg">
                    <p class="block-update__info">Порядок:</p> <input class="block-update__input" type="text" id="gorder">
                    <p class="block-update__info">Описание:</p> <textarea class="block-update__input" id="gdescr"></textarea>
                    <input type="hidden" id="gid">

                    <button class="add-to-db btn btn-zakaz">Обновить</button>
                </div>
            </div>
        </main>

        <footer class="footer"></footer>

    <script src="libs/jquery-3.2.1.min.js"></script>
    <script src="js/admin.js"></script>
    </body>
</html>