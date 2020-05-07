<!DOCTYPE html>
<html lang="ru">
    {include file="head.tpl" title="Корзина"}

    <body class="page-info">
        <header class="header-goods">
            {include file="header.tpl" bla="Корзина"}
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

    <script src="libs/jquery-3.2.1.min.js"></script>
    <script src="js/cart.js"></script>
    </body>
</html>