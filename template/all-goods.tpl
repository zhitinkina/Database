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
            <div class="header__logo"><a href="index.php"><img src="images/main/logo.svg" alt="company"></a></div>
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
                {foreach $cards as $card}
                    <div class="cart">
                        <div class="cart__wrap">
                            <div class="cart__img">
                                <img src="images/{$card.img}" alt="">
                            </div>
                            <div class="cart__info">
                                <p class="name"><a href="goods.html#{$card.id}">{$card.name}</a></p>
                                <a class="add-to-later hearts" data-id="{$card.id}"><img src="images/main/later.svg"></a>
                            </div>
                            <div class="cart__descr">{$card.description}</div>
                            <div class="cart__info">
                                <div class="cost">{$card.cost} &#x20BD;</div>
                                <a href="cart.html" class="cart__info-basket"><img src="images/main/basket.svg"></a>
                                <button class="add-to-cart btn" data-id="{$card.id}">Купить</button>
                            </div>
                        </div>
                    </div>
                {/foreach}
            </div>
        </div>


        <!-- <a href="cart.html">Корзина</a>
        <div class="mini-cart"></div>
        <a href="later.html">Желания</a>
        <div class="goods-out"></div> -->
    </main>
    <footer class="footer"></footer>

    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/main.js"></script>
    </body>
</html>