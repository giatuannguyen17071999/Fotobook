$().ready(function() {
    $("#login_form").validate({
        group: {
            nameGroup: "user[email] user[password]"
        },
        rules: {
            "user[email]": {
                required: true,
                email: true
            },
            "user[password]": {
                required: true
            }
        },
        messages: {
            "user[email]": {
                required: "Please enter your email",
                email: "Your email address must be in the format of name@domain.com"
            },
            "user[password]": {
                required: "Please enter your password",
            }
        }
    });
});