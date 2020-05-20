$(document).ready(function () {
    $('#submit').click(() => {
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
                      console.log(409); // TODO:
                  }
              },
         });
    });
});
