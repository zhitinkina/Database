$(document).ready(function () {
    $("#submit").click(() => {
         $.ajax("/api/signup", {
              type: "POST",
              data: {
                  "login": $("#login").val(),
                  "password": $("#password").val(),
                  "email": $("#email").val(),
                  "name": $("#name").val(),
              },
              statusCode: {
                  200: () => {
                      window.location.href = "/login";
                  },
                  409: () => {
                      $("#err_msg").text("Login/email conflict").show();
                  }
              },
         });
    });
});
