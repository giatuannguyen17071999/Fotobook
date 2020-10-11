$(document).ready(function() {
    if ($('#notify').text())
        alert($('#notify').text());


    // Add Click Event
    $(".category").on('click', '.category__item', function() {
        if ($(this).hasClass('active'))
            return;
        $('.category__item.active').removeClass("active");
        $(this).addClass("active")
    });
});