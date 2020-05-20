$(document).ready(function () {
   $(".btn-zakaz").click(() => $.post("/api/pay_cart", () => window.location.reload()));
   $(".decrease-product-quantity").click(function() {
       $.post(`/api/change_product_quantity/${$(this).attr("data-id")}/-1`);
   });
   $(".increase-product-quantity").click(function() {
       $.post(`/api/change_product_quantity/${$(this).attr("data-id")}/1`);
   });
   $(".del-goods").click(function() {
       $.post(`/api/change_product_quantity/${$(this).attr("data-id")}/${-32767}`); // TODO: fuck yourself
   });
});
