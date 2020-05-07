<!DOCTYPE html>
<html lang="ru">
    {include file="head.tpl" title="Администратор"}

    <body class="page-info">
        <header class="header-goods">
            {include file="header.tpl" bla="Для админа"}
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