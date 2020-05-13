<!DOCTYPE html>
<html lang="ru">
    {include file="head.tpl" title="Регистрация"}

    <body class="page-info">
        <header class="header-goods">
            {include file="header.tpl" bla="Регистрация"}
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

    <script src="libs/jquery-3.2.1.min.js"></script>
    <script src="js/goods.js"></script>
    </body>
</html>