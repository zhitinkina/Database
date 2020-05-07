// TODO: нахуй и в пизду

var cart = {};
function loadCart() {
    //проверяю есть ли в localStorage запись cart
    if (localStorage.getItem('cart')) {
        // если есть - расширфровываю и записываю в переменную cart
        cart = JSON.parse(localStorage.getItem('cart'));
            showCart();
        }
    else {
        $('.main-cart').html('Корзина пуста!');
    }
}

function showCart() {
    //вывод корзины
    if (!isEmpty(cart)) {
        $('.main-cart').html('Корзина пуста!');
    }
    else {
        $.getJSON('goods.json', function (data) {
            var goods = data;
            var out = '';
            for (var id in cart) {
                out +='<div class="cart-basket">';
                
                out +='<div class="cart-basket--img">';
                out += `<img src="images\\${goods[id].img}">`;
                out +='</div>';

                out +='<div class="cart-basket--info">';

                out +='<div class="cart-basket--name">';
                out += `<p class="name">${goods[id].name}</p>`;
                out += `<button data-id="${id}" class="del-goods btn--delete">x</button>`;
                out +='</div>';

                out +=`<div class="cart__descr">${goods[id].description}</div>`;

                out +='<div class="cart-basket--cost">';
                out +=`<div class="cost">${goods[id].cost} &#x20BD;</div>`;
                out +='<div class="cart-basket--operation">';
                out += `<button data-id="${id}" class="btn--operation minus-goods">-</button>`;
                out += `<input class="quantity-num" value="${cart[id]}" />`;
                out += `<button data-id="${id}" class="btn--operation plus-goods">+</button>`;
                out +='</div>';
                out +='</div>';

                out +='</div>';
                out += `<div class="cost-good">${cart[id]*goods[id].cost}</div>`;
                out +='</div>';
            }
            $('.main-cart').html(out);
            $('.del-goods').on('click', delGoods);
            $('.plus-goods').on('click', plusGoods);
            $('.minus-goods').on('click', minusGoods);
        });
    }
}

function delGoods() {
    //удаляем товар из корзины
    var id = $(this).attr('data-id');
    delete cart[id];
    saveCart();
    showCart();
}
function plusGoods() {
    //добавляет товар в корзине
    var id = $(this).attr('data-id');
    cart[id]++;
    saveCart();
    showCart();
}
function minusGoods() {
    //уменьшаем товар в корзине
    var id = $(this).attr('data-id');
    if (cart[id]==1) {
        delete cart[id];
    }
    else {
        cart[id]--;
    }
    saveCart();
    showCart();
}

function saveCart() {
    //сохраняю корзину в localStorage
    localStorage.setItem('cart', JSON.stringify(cart)); //корзину в строку
}

function isEmpty(object) {
    //проверка корзины на пустоту
    for (var key in object)
    if (object.hasOwnProperty(key)) return true;
    return false;
}

function clickZakaz() {
    document.getElementById("email-field").style.display = "block";
}

function sendEmail() {
    var ename = $('#ename').val();
    var email = $('#email').val();
    var ephone = $('#ephone').val();
    if (ename!='' && email!='' && ephone!='') {
        if (isEmpty(cart)) {
            $.post(
                "php/core/mail.php",
                {
                    "ename" : ename,
                    "email" : email,
                    "ephone" : ephone,
                    "cart" : cart
                },
                function(data){
                    if (data==1) {
                        alert('Заказ отправлен');
                    }
                    else {
                        alert('Повторите заказ');
                    }
                }
            );
        }
        else {
            alert('Корзина пуста');
        }
    }
    else {
        alert('Заполните поля');
    }

}

$(document).ready(function () {
   loadCart();
   $('.btn-zakaz').on('click', clickZakaz); // отправить письмо с заказом
   $('.send-email').on('click', sendEmail); // отправить письмо с заказом
});