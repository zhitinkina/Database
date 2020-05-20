$(document).ready(function () {
    $('#logout').click(() => $.post("/api/logout", () => window.location.reload()));
});
