(function ($) {
    "use strict";

    // PRE LOADER
    var preloader = $('#preloader');
    $(window).on('load', function () {
        setTimeout(function () {
            preloader.fadeOut('slow', function () { $(this).remove(); });
        }, 300)
    });

    //Facebook chat button
    $(function () {
        $(".pulse").hover(function () {
            $(this).removeClass("pulse");
        }, function () {
            $(this).addClass("pulse");
        });
    });

    //Navigation Section
    $('.navbar-collapse a').on('click', function () {
        $(".navbar-collapse").collapse('hide');
    });

    // Owl Carousel
    $('.owl-carousel').owlCarousel({
        animateOut: 'fadeOut',
        items: 1,
        loop: true,
        autoplay: true,
    })

    // PARALLAX EFFECT
    $.stellar();

    //SMOOTHSCROLL
    $(function () {
        $('.navbar-default a, #home a, footer a').on('click', function (event) {
            var $anchor = $(this);
            var nav = $($anchor.attr('href'));
            if (nav.length) {
                $('html, body').stop().animate({
                    scrollTop: nav.offset().top - 49
                }, 1000);
                event.preventDefault();
            }
        });
    });
    // WOW ANIMATION
    new WOW({ mobile: false }).init();
})(jQuery);

function notifyMetro(text, className) {
    $.notify({
        title: "Info",
        text: text,
        image: "<img src='media/images/icon/P.png'/>"
    }, {
        style: "metro",
        className: className,
        autoHide: true,
        clickToHide: true
    });
}

$('.sidebar-menu li').on('click', function (e) {
    e.stopPropagation();
    $(this).toggleClass('active');

});