function getTotalPrice() {
    const prices = [...$(".cost")].map((v) => parseFloat(v.textContent));
    const quanities = [...$(".quantity-num")].map((v) => parseInt(v.textContent, 10));
    if (prices.length !== quanities.length) {
        return NaN; // TODO: fuck yourself
    }
    return quanities.map((q, i) => q * prices[i]).reduce((res, cost) => res + cost, 0);
}

function invalidateTotalPrice() {
    $(".cost-good").text(getTotalPrice());
}

$(document).ready(function () {
    $(".cost-good").ready(invalidateTotalPrice);
    $(".btn-zakaz").click(() => {
        $.post("/api/pay_cart", () => window.location.reload()); // TODO:
    });

    $(".decrease-product-quantity").click(function () {
        $.post(`/api/change_product_quantity/${$(this).attr("data-id")}/-1`);
        const counter = $(this).parent()[0].childNodes[3];
        counter.textContent = parseInt(counter.textContent, 10) - 1;

        if (counter.textContent === "0") {
            $(this).parent()[0].parentElement.parentElement.parentElement.remove();
        }
        invalidateTotalPrice();
    });

    $(".increase-product-quantity").click(function () {
        $.post(`/api/change_product_quantity/${$(this).attr("data-id")}/1`);
        const counter = $(this).parent()[0].childNodes[3];
        counter.textContent = parseInt(counter.textContent, 10) + 1;
        invalidateTotalPrice();
    });

    $(".del-goods").click(function () {
        $.post(`/api/change_product_quantity/${$(this).attr("data-id")}/${-32767}`); // TODO: fuck yourself
        $(this).parent()[0].parentElement.parentElement.remove();
        invalidateTotalPrice();
    });
});
