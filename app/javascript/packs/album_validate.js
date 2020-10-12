$().ready(function() {
    $("#form_album").validate({
        rules: {
            "album[title]": {
                required: true,
                maxlength: 140
            },
            "album[description]": {
                required: true,
                maxlength: 300
            },
            "album[image]": {
                required: true
            }
        },
        messages: {
            "album[title]": {
                required: "Please enter your album title",
                maxlength: "Your title  must less than 140 character"
            },
            "album[description]": {
                required: "Please enter your album description",
                maxlength: "Your description  must less than 300 character"
            },
            "album[image]": {
                required: "You need add the image file to your album!"
            }
        }
    });
});