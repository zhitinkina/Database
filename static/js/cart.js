function clickZakaz() {
    $.post("/api/pay_cart", {}, (resp) => {})
}

$(document).ready(function () {
   $('.btn-zakaz').on('click', clickZakaz);
});
