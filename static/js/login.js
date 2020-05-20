
$(document).ready(function () {
    $('#submit').click(() => {
         $.ajax("/api/login", {
              type: "POST",
              data: {
                   "login": $("#login").val(),
                   "password": 1 + $("#password").val(),
              },
              statusCode: {
                  200: () => {
                      const next = (new URL(window.location.href)).searchParams.get("next") || "/";
                      window.location.href = `${next}`;
                  },
                  401: () => {
                      console.log(401); // TODO:
                  },
              },
         });
    });
});
