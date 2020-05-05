var cart = {}; // корзина

function init() {
    //вычитуем файл goods.json
    // $.getJSON("goods.json", goodsOut);
    $.post(
        "admin/core.php",
        {
            "action" : "loadGoogs"
        },
        goodsOut
    );
}

function goodsOut(data) {
    // вывод на страницу
    data = JSON.parse(data);
    console.log(data);
    var out='';
    for (var key in data) {
        out +='<div class="cart">';
        out +='<div class="cart__wrap">';
        out +='<div class="cart__img">';
        out +=`<img src="images/${data[key].img}" alt="">`;
        out +='</div>';

        out +='<div class="cart__info">';
        out +=`<p class="name"><a href="goods.html#${key}">${data[key].name}</a></p>`;
        out +=`<a class="add-to-later hearts" data-id="${key}"><img src="images/main/later.svg"></a>`;
        out +='</div>';

        out +=`<div class="cart__descr">${data[key].description}</div>`;

        out +='<div class="cart__info">';
        out +=`<div class="cost">${data[key].cost} &#x20BD;</div>`;
        out +=`<a href="cart.html" class="cart__info-basket"><img src="images/main/basket.svg"></a>`;
        out +=`<button class="add-to-cart btn" data-id="${key}">Купить</button>`;
        out +='</div>';
        out +='</div>';
        out +='</div>';
    }
    $('.goods-out').html(out);
    $('.add-to-cart').on('click', addToCart);
    $('.add-to-later').on('click', addToLater);
}

function addToLater() {
    //добавляем товар в желания
    var later = {};
    if (localStorage.getItem('later')) {
        // если есть - расширфровываю и записываю в переменную cart
        later = JSON.parse(localStorage.getItem('later'));
    }
    alert('Добавлена в желания!');
    var id = $(this).attr('data-id');
    later[id] = 1;
    localStorage.setItem('later', JSON.stringify(later));
}

function addToCart() {
    //добавляем товар в корзину
    var id = $(this).attr('data-id');
    // console.log(id);
    if (cart[id]==undefined) {
        cart[id] = 1; //если в корзине нет товара - делаем равным 1
    }
    else {
        cart[id]++; //если такой товар есть - увеличиваю на единицу
    }
    showMiniCart();
    saveCart();
}

function saveCart() {
    //сохраняю корзину в localStorage
    localStorage.setItem('cart', JSON.stringify(cart)); //корзину в строку
}

function showMiniCart() {
    //показываю мини корзину
    var out="";
    for (var key in cart) {
        out += key +' --- '+ cart[key]+'<br>';
    }
    $('.mini-cart').html(out);
}

function loadCart() {
    //проверяю есть ли в localStorage запись cart
    if (localStorage.getItem('cart')) {
        // если есть - расширфровываю и записываю в переменную cart
        cart = JSON.parse(localStorage.getItem('cart'));
        showMiniCart();
    }
}

$(document).ready(function () {
    init();
    loadCart();
});
