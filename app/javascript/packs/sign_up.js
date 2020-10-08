$().ready(function() {
    $("#signup_form").validate({
        groups: {
            nameGroup: "user[first_name] user[last_name]"
        },
        rules: {
            "user[first_name]": {
                required: true,
                maxlength: 25
            },
            "user[last_name]": {
                required: true,
                maxlength: 25
            },
            "user[email]": {
                required: true,
                maxlength: 64,
                email: true
            },
            "user[password]": {
                required: true,
                maxlength: 64
            }
        },
        messages: {
            "user[first_name]": {
                required: "Please enter your first name",
                maxlength: "Your first name must less than 25 character"
            },
            "user[last_name]": {
                required: "Please enter your last name",
                maxlength: "Your last name must less than 25 character"
            },
            "user[email]": {
                required: "We need your email address to contact you",
                maxlength: "Your email must less than 255 character",
                email: "Your email address must be in the format of name@domain.com"
            },
            "user[password]": {
                required: "Please enter your password",
                maxlength: "Your email must less than 64 character"
            }
        }
    });
});