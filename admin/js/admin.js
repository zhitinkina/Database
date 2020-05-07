function selectGoods() {
    var id = $('.goods-out select option:selected').attr('data-id');
    $.post(
        "core.php",
        {
            "action" : "selectOneGoods",
            "gid" : id
        },
        function(data) {
            data = JSON.parse(data);
            $('#gname').val(data.name);
            $('#gcost').val(data.cost);
            $('#gdescr').val(data.description);
            $('#gorder').val(data.ord);
            $('#gimg').val(data.img);
            $('#gid').val(data.id);
        }
    )
}

function saveToDb() {
    var id = $('#gid').val();
    $.post(
        "../php/admin/core.php",
        {
            "action" : id ? "updateGoogs" : "newGoogs",
            "id" : id ? id : 0,
            "gname" : $('#gname').val(),
            "gcost" : $('#gcost').val(),
            "gdescr" : $('#gdescr').val(),
            "gorder" : $('#gorder').val(),
            "gimg" : $('#gimg').val()
        },
        function(data) {
            if (data == 1) {
                location.reload();
            }
            else {
                console.log(data);
            }
        }
    );
}

$(document).ready(function () {
   $('.goods-out select').on('change', selectGoods);
   $('.add-to-db').on('click', saveToDb);
});