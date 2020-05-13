<!DOCTYPE html>
<html lang="ru">
    {include file="head.tpl" title="Вход"}

    <body class="page-info">
        <header class="header-goods">
            {include file="header.tpl" bla="Вход"}
        </header>

    <main class="main-block">
        <div class="wrapper">

        <div class="user-login__block">
            <div class="user-login"> 

                <label id="login" class="user-login__label">
                    <span>Логин</span>
                    <input class="input" type="text" value="" autocomplete="off">
                </label>

                <label id="login" class="user-login__label">
                    <span>Пароль</span>
                    <input class="input" type="password" value="" autocomplete="off">
                </label>

                <a href="registration.php" class="registration">Вы еще не зарегистрировались?</a>
            </div> 
        </div>

        </div>
    </main>

    <footer class="footer"></footer>

    <script src="libs/jquery-3.2.1.min.js"></script>
    <script src="js/goods.js"></script>
    </body>
</html>