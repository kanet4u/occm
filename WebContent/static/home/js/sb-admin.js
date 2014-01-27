$(function () {

    $('#side-menu').metisMenu();

});

//Loads the correct sidebar on window load
$(function () {

    $(window).bind("load", function () {
        console.log($(this).width())
        if ($(this).width() < 768) {
            $('div.sidebar-collapse').addClass('collapse')
        } else {
            $('div.sidebar-collapse').removeClass('collapse')
        }
    })
})

//Collapses the sidebar on window resize
$(function () {

    $(window).bind("resize", function () {
        console.log($(this).width())
        if ($(this).width() < 768) {
            $('div.sidebar-collapse').addClass('collapse')
        } else {
            $('div.sidebar-collapse').removeClass('collapse')
        }
    })
})
$(function () {

    $('.btn-delete').bind("click", function () {
        if (confirm('Are you sure delete the item?')) {
            document.location.href = $(this).attr('action');
        }
    })
})
