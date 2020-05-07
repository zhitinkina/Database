function init() {
    //вычитуем файл goods.json
    $.post(
        "php/admin/core.php",
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
    var later = {};
    if (localStorage.getItem('later')) {
        // если есть - расширфровываю и записываю в переменную later
        later = JSON.parse(localStorage.getItem('later'));
        for (var key in later) {

            out +='<div class="cart">';
            out +='<div class="cart__wrap">';
            out +='<div class="cart__img">';
            out +=`<img src="images/${data[key].img}" alt="">`;
            out +='</div>';

            out +='<div class="cart__info">';
            out +=`<p class="name"><a href="goods.php#${key}">${data[key].name}</a></p>`;
            out +=`<a class="add-to-later hearts" data-id="${key}"><img src="images/main/later.svg"></a>`;
            out +='</div>';

            out +=`<div class="cart__descr">${data[key].description}</div>`;

            out +='<div class="cart__info">';
            out +=`<div class="cost">${data[key].cost} &#x20BD;</div>`;
            out +=`<a href="cart.html" class="cart__info-basket"><img src="images/main/basket.svg"></a>`;
            out +=`<a href="goods.php#${key}" class="add-to-cart btn">Просмотреть</a>`;
            out +='</div>';
            out +='</div>';
            out +='</div>';
        }
        $('.goods-out').html(out);
    }
    else {
        $('.goods-out').html('Добавьте товар');
    }
}

$(document).ready(function () {
    init();
    loadCart();
});
