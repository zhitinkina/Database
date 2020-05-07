var cart = {}; // корзина

function init() {
    //вычитуем файл goods.json
    // $.getJSON("goods.json", goodsOut);
    var hash = window.location.hash.substring(1);
    console.log(hash);
    $.post(
        "php/admin/core.php",
        {
            "action" : "selectOneGoods",
            "id" : hash
        },
        goodsOut
    );
}

function goodsOut(data) {
    // вывод на страницу
    if (data != 0) {
        data = JSON.parse(data);
        console.log(data);
        var out='';
        
        out +='<div class="cart">';
        out +=`<button class="add-to-later" data-id="${data.id}">&hearts;</button>`;
        out +=`<p class="name">${data.name}</p>`;
        out +=`<img src="images/${data.img}" alt="">`;
        out +=`<div class="cost">${data.cost}</div>`;
        out +=`<button class="add-to-cart" data-id="${data.id}">Купить</button>`;
        out +='</div>';
    
        $('.goods-out').html(out);
        $('.add-to-cart').on('click', addToCart);
        $('.add-to-later').on('click', addToLater);
    }
    else {
        $('.goods-out').html('Такого товара не существует');
    }
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
