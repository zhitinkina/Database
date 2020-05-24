$(document).ready(function () {
    $("#submit").click(() => {
         $.ajax("/api/login", {
              type: "POST",
              data: {
                   "login": $("#login").val(),
                   "password": $("#password").val(),
              },
              statusCode: {
                  200: () => {
                      const next = (new URL(window.location.href)).searchParams.get("next") || "/";
                      window.location.href = `${next}`;
                  },
                  401: () => {
                      $("#err_msg").text("Invalid login/password").show();
                  },
              },
         });
    });
});
