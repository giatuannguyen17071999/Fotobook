$('#btn__change_avatar').click(function() {
    $("input[type='file']#btn_open_file").trigger('click');
})
$("input[type='file']#btn_open_file").change(function() {
    $('.edit__avatar__image').first.prepend(this.value);
})