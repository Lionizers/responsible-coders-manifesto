/* -----------------------------------
Template:  P-folio One Page Parallax Portfolio Template
Author: RoyHridoy
Version: 1.0
Design and Developed by: Hridoy Roy

NOTE: This is main js file. All js plugin active & custom js included in this file.

--------------------------------------*/

/*================================================
[  Table of contents  ]
==================================================
01. Top Menu Stick
02. jQuery MeanMenu
03. SmoothSroll
04. Scrollspy
05. venobox
06. wow js
07. testimonials
08. stellar
09. CounterUp
10. MixitUp
11. ScrollUp
12. Contact form
13. Preloader


======================================
[ End table content ]
======================================*/

(function ($) {
    "use strict";

/*******************
01. Top Menu Stick
********************/
    var sticky_menu = $('#sticker, #sticker-mobile');
    var pos = sticky_menu.position();
    if (sticky_menu.length) {
        var windowpos = sticky_menu.offset().top;
        $(window).on('scroll', function() {
            var windowpos = $(window).scrollTop();
            if (windowpos > pos.top) {
                sticky_menu.addClass('stick');
            } else {
                sticky_menu.removeClass('stick');
            }
        });
    }

/*******************
02. jQuery MeanMenu
********************/
    $('.mobile-menu nav').meanmenu({
        meanScreenWidth: "768",
        meanMenuContainer: ".mobile-menu"
    });

/*******************
03. SmoothSroll
********************/
    $('.smooth, .smooth-scroll a').on('click', function (event) {
        var $anchor =$(this);
        var headerH ='69';
        $('html, body').stop().animate({
            'scrollTop': $($anchor.attr('href')).offset().top - headerH + "px"
        }, 1200, 'easeInOutExpo');
        event.preventDefault();
    });

/*******************
04. Scrollspy
********************/

    // $('body').scrollspy({ target: '.navbar-collapse',offset: 95 })


/*******************
05. venobox
********************/
    // $('.venobox').venobox();

/********************
06. wow js
********************/

    new WOW().init();

/********************
08. stellar
********************/
    $.stellar({
        horizontalScrolling: false,
        verticalOffset: 40
    });

/********************
9. CounterUp
********************/
    // $('.counter').counterUp({
    //     delay: 20,
    //     time: 2000
    // });

/********************
11. ScrollUp
********************/
    // $.scrollUp({
    //     scrollText: '<i class="fa fa-angle-double-up"></i>',
    //     easingType: 'linear',
    //     scrollSpeed: 900,
    //     animation: 'fade'
    // });

/********************
12. Contact form
********************/

    // $('.contact-form-btn button').on('click', function(){
    //     $('.contact-overlay').slideDown(500);
    // });
    // $('.contact-overlay .close-form').on('click', function(){
    //     $('.contact-overlay').slideUp(500);
    // });

/********************
13. Preloader
********************/

    $(window).on('load', function() {
        $('#status').fadeOut();
        $('#preloader').delay(350).fadeOut('slow');
        $('body').delay(350).css({'overflow':'visible'});
    });

})(jQuery);
