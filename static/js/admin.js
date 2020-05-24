$(document).ready(function () {
   $("#id-prod").change(function() {
        const id = $(this).val();
        $.get(`/api/product/${id}`, (resp) => {
            //console.log(resp);
            const ap = JSON.parse(resp);
            $('#name').val(ap.name);
            $('#cost').val(0);
            $('#description').val(ap.description);
        });
    });
});
