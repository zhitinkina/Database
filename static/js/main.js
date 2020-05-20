function addToCart() {
    const id = $(this).attr("data-id");
    $.post(`/api/change_product_quantity/${id}/1`);
}

$(document).ready(function () {
    $(".add-to-cart").on("click", addToCart);
});
