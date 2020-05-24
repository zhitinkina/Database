$(document).ready(function () {
   $("#id-prod").change(function() {
        const id = $(this).val();
        $.get(`/api/product/${id}`, (resp) => {
            const product = JSON.parse(resp);
            $("#name").val(product.name);
            $("#cost").val(product.cost);
            $("#category").val(product.category);
            $("#description").val(product.description);
        });
    });
});
