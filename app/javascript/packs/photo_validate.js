$().ready(function() {
    $("#form_photo").validate({
        rules: {
            "photo[title]": {
                required: true,
                maxlength: 140
            },
            "photo[description]": {
                required: true,
                maxlength: 300
            },
            "photo[image]": {
                required: true
            }
        },
        messages: {
            "photo[title]": {
                required: "Please enter your post title",
                maxlength: "Your first name must less than 140 character"
            },
            "photo[description]": {
                required: "Please enter your post description",
                maxlength: "Your last name must less than 300 character"
            },
            "photo[image]": {
                required: "You need add the image file you want to share!"
            }
        }
    });
});