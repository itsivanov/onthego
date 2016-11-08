
function numericInput(input) {
    var value = input.value;
    var re = /[^0-9]/gi;
    if (re.test(value)) {
        value = value.replace(re, '');
        input.value = value;
    }
}
var closeAllModal = function() {
    $('.modal').fadeOut();
    $('body').removeClass('nonScroll');
};
var closeModal = function(){
    $('.modalClose').on('click', function(e){
        e.preventDefault();
        $(this).parents('.modal').fadeOut();
        $('body').removeClass('nonScroll');
    })
};
$(document).ready(function(){

    $(function() {
        if($("#map_place").size() > 0) {
            var team_address = '4800 Linton Blvd. Delray Beach, FL 33445';
            initialize("map_place");
            codeAddress(team_address);

            var geocoder;
            var map;
            function initialize(mapID) {
                geocoder = new google.maps.Geocoder();
                //var latlng = new google.maps.LatLng(25.789909449515676,-80.34109360674591);
                var mapOptions = {
                    zoom: 12,
                    scrollwheel: false,
                    //center: latlng,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };

                map = new google.maps.Map(document.getElementById(mapID), mapOptions);
                var styles = [
                    {
                        stylers: [
                            { saturation: -100 },
                            { lightness: 20}
                        ]
                    }
                ];
                map.setOptions({styles: styles});
            }

            function codeAddress(address) {
                geocoder.geocode( { 'address': address}, function(results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                        map.setCenter(results[0].geometry.location);
                        var marker = new google.maps.Marker({
                            map: map,
                            scrollwheel: false,
                            position: results[0].geometry.location,
                            draggable: false,
                            icon: '/img/tooltip.png'
                        });

                        google.maps.event.addListener(marker, 'dragend', function(evt){
                            alert(evt.latLng.lat()+","+evt.latLng.lng());
                        });
                    } else {
                        alert("Geocode was not successful for the following reason: " + status);
                    }
                });
            }
        }
    });
    if ($('.palmItemContent').length > 0){
        $('.palmItemViewMore').on('click', function(e){
            e.preventDefault();
            $(this).parents('.palmItemContent').toggleClass('palmHideContent');
        })
    }
    if ($('.palmAccordionBlock').length > 0){
        $('.palmAccordionBlock .palmAccTitle').on('click', function(e){
            e.preventDefault();
            $(this).toggleClass('active').parents('.palmAccordionBlock').find('.palmAccContent').slideToggle();
        })
    }
    if ($('.palmWaitNumber').length > 0){
        $('.minus').on('click', function(){
            var currentValue = $(this).parents('.palmWaitNumber').find('input').val();
            $(this).parents('.palmWaitNumber').find('input').val(currentValue - 1);
        });
        $('.plus').on('click', function(){
            var currentValue = $(this).parents('.palmWaitNumber').find('input').val();
            $(this).parents('.palmWaitNumber').find('input').val(currentValue * 1 + 1);
        })
    }

    if ($('.navBurger').length > 0){
        $('.navBurger').on('click', function(e){
            e.preventDefault();
            $('body').toggleClass('nonScroll');
            $(this).toggleClass('active').parents('.headerSection').find('.nav').toggleClass('active');
        });
    }
    if ($('.palmCustomSelect').length > 0){
        $('.palmCustomSelect select').selectbox();
    }
    if ($('.palmCustomSimpleSelect').length > 0){
        $('.palmCustomSimpleSelect select').selectbox();
    }

    if ($(window).width() > 1024) {
        $('div[data-type="background"]').each(function () {
            var bg_block = $(this);
            $(window).scroll(function () {
                var yPos = -($(window).scrollTop() / bg_block.data('speed'));
                var coords = 'center ' + yPos + 'px';
                bg_block.css({backgroundPosition: coords});
            });
        });
    }

    if ($('div[data-content="tabs"]').length > 0) {
        $('div[data-content="tabs"]').each(function () {
            var nav = $(this).find('.tabsNavigation .item');
            var block = $(this).find('.tabsContent .item');
            nav.on('click', function (e) {
                e.preventDefault();
                var data = $(this).data('tab');
                nav.removeClass('active');
                $(this).addClass('active');
                block.removeClass('open').hide();
                $(this).parents('.tabsSection').find('.tabsContent').find('.item[data-tab=' + data + ']').addClass('open').fadeIn();
            });
        });
    }
    if ($(window).width() < 1024) {
        $('.storyTabs .tabsNavigation').slick({
            arrows: true,
            slidesToShow: 1,
            slidesToScroll: 1,
            infinite: true,
            centerMode: false,
            prevArrow: '<button type="button" data-role="none" class="slick-prev" aria-label="Previous" tabindex="0" role="button"><i class="fa fa-angle-left"></i></button>',
            nextArrow: '<button type="button" data-role="none" class="slick-next" aria-label="Next" tabindex="0" role="button"><i class="fa fa-angle-right"></i></button>'
        });
        $('.storyTabs .tabsContent').slick({
            arrows: false,
            slidesToShow: 1,
            slidesToScroll: 1,
            infinite: true,
            fade: true,
            centerMode: false,
            prevArrow: '<button type="button" data-role="none" class="slick-prev" aria-label="Previous" tabindex="0" role="button"><i class="fa fa-angle-left"></i></button>',
            nextArrow: '<button type="button" data-role="none" class="slick-next" aria-label="Next" tabindex="0" role="button"><i class="fa fa-angle-right"></i></button>'
        });
        $('.storyTabs .tabsNavigation').on('afterChange', function (event, slick, currentSlide) {
            console.log(currentSlide);
            console.log(slick);
            $('.storyTabs .tabsContent').slick('slickGoTo', currentSlide);
        });
        $('.storyTabs .tabsContent').on('afterChange', function (event, slick, currentSlide) {
            console.log(currentSlide);
            console.log(slick);
            $('.storyTabs .tabsNavigation').slick('slickGoTo', currentSlide);
        });
        $('.storyTabs .tabsNavigation .item').off('click');
    }
    if ($(window).width() < 740) {
        $('.brandsHeader').slick({
            arrows: true,
            slidesToShow: 1,
            slidesToScroll: 1,
            infinite: true,
            centerMode: false,
            prevArrow: '<button type="button" data-role="none" class="slick-prev" aria-label="Previous" tabindex="0" role="button"><i class="fa fa-angle-left"></i></button>',
            nextArrow: '<button type="button" data-role="none" class="slick-next" aria-label="Next" tabindex="0" role="button"><i class="fa fa-angle-right"></i></button>'
        })
    }


    $('.slideDown').on('click', function(e){
        e.preventDefault();
        $('body, html').animate({scrollTop: $(window).height()+'px'}, 500);
    });
    $('.categoryLink').on('click', function(e){
        e.preventDefault();
        var storeOffset = $('.storeItems').offset().top - 100;
        $('body, html').animate({scrollTop: storeOffset+'px'}, 500);
    });

    $('.slideUp').on('click', function(e){
        e.preventDefault();
        $('body, html').animate({scrollTop: '0px'}, 500);
    });

    var goFirstSlide = function () {
        setTimeout(function () {

            $('#productCarousel').find('.slides').css('transform', 'translate3d(0px, 0px, 0px)');
        }, 500);
        console.log('asdadas');
        console.log($('#productCarousel').find('.slides'));
    };

    if ($(window).width() > 745) {
        $('.productImages').each(function () {
            $('#productSlider').flexslider({
                animation: "slide",
                controlNav: false,
                animationLoop: true,
                slideshow: false,
                selector: ".slides > .slideItem",
                sync: '#productCarousel'
            });
            $('#productCarousel').flexslider({
                animation: "slide",
                controlNav: false,
                animationLoop: true,
                slideshow: false,
                selector: ".slides > .slideItem",
                itemWidth: 130,
                maxItems: 4,
                asNavFor: '#productSlider',
                // end: goFirstSlide
            });
        });
    }
    else{
        $('.productImages').each(function () {
            $('#productSlider').flexslider({
                animation: "slide",
                controlNav: false,
                animationLoop: true,
                slideshow: false,
                selector: ".slides > .slideItem",
                sync: '#productCarousel'
            });
            $('#productCarousel').flexslider({
                animation: "slide",
                controlNav: false,
                animationLoop: true,
                slideshow: false,
                selector: ".slides > .slideItem",
                itemWidth: 130,
                maxItems: 1,
                asNavFor: '#productSlider',
                // end: goFirstSlide
            });
        });
    }

    if ($('.loginModal').length > 0){
        $(document).on('click', '.login:not(.register)', function(e){
            e.preventDefault();
            $('body').addClass('nonScroll');
            $('.registerModal').fadeOut();
            $('.resetModal').fadeOut();
            $('.loginModal').fadeIn();
            closeModal();
        });
    }
    if ($('.registerModal').length > 0){
        $(document).on('click', '.register', function(e){
            e.preventDefault();
            $('body').addClass('nonScroll');
            $('.loginModal').fadeOut();
            $('.resetModal').fadeOut();
            $('.navBurger').removeClass('active').parents('.headerSection').find('.nav').removeClass('active');
            $('.registerModal').fadeIn();
            closeModal();
        });
    }
    if ($('.resetModal').length > 0){
        $(document).on('click', '.reset', function(e){
            e.preventDefault();
            $('body').addClass('nonScroll');
            $('.loginModal').fadeOut();
            $('.registerModal').fadeOut();
            $('.resetModal').fadeIn();
            closeModal();
        });
    }

    if ($('.feedbackModal').length > 0){
        $('#ButtonFeedback').on('click', function(e){
            e.preventDefault();
            $('body').addClass('nonScroll');
            $('.loginModal').fadeOut();
            $('.registerModal').fadeOut();
            $('.resetModal').fadeOut();
            $('.feedbackModal').fadeIn();
            closeModal();
        });
    }

    if ($('.feedbackModal2').length > 0){
        $('#ButtonFeedback2').on('click', function(e){
            e.preventDefault();
            $('body').addClass('nonScroll');
            $('.loginModal').fadeOut();
            $('.registerModal').fadeOut();
            $('.resetModal').fadeOut();
            $('.feedbackModal').fadeOut();
            $('.feedbackModal2').fadeIn();
            closeModal();
        });
    }

    $("a.take,a.take-two").fancybox({
        'padding' : 0,
        'autoScale' : true,
        'autoDimensions' : false,
        'transitionIn' : 'none',
        'transitionOut' : 'none',
        'scrolling' : 'auto'
    });

    //$('#feedbackForm').on('change', '.radio :radio', function (e) {
    //    var $this = $(e.currentTarget),
    //        $input = $this.parents('.radio').find('.other');
    //    if ($this.parents('.radio').find(':radio.').val() == 'other') {
    //        $input.show();
    //    } else {
    //        $input.hide();
    //    }
    //});

});

$(window).load(function(){
    $('.preLoader').fadeOut();
    if ($(window).width() > 1024) {
        $('.slideImage').zoom();
    }

    if ($(window).width() > 745) {
        if ($('.imageModal').length > 0) {
            $('.slideImage').on('click', function (e) {
                e.preventDefault();
                $('body').addClass('nonScroll');
                $('.registerModal').fadeOut();
                $('.registerLogin').fadeOut();
                var scrImage = $(this).attr('href');
                $('.imageModal').fadeIn().find('.imageBlock').html('<span href='+scrImage+' class="modalImage"><img src="'+scrImage+'" alt="" title="" /></span>');
                $('.modalImage').zoom();
                closeModal();
            });
        }
    }
    else{
        if ($('.imageModal').length > 0) {
            $('.slideImage').on('click', function (e) {
                e.preventDefault();
                $('body').addClass('nonScroll');
                $('.registerModal').fadeOut();
                $('.registerLogin').fadeOut();
                var scrImage = $(this).attr('href');
                $('.imageModal').fadeIn().find('.imageBlock').html('<img src="'+scrImage+'" alt="" title="" />');
                $('.modalImage').zoom();
                closeModal();
            });
        }
    }
    // $('.fancybox').fancybox({
    //     'padding': 'none'
    // });
});
$(window).resize(function(){

});
$(window).on('scroll', function() {
    var window_scroll = $(window).scrollTop();
    if (window_scroll > 0) {
        $('.navigation').addClass('fixedNav');
    }
    else{
        $('.navigation').removeClass('fixedNav');
    }

    var arrowOffset;
    if ($('.storeItems').length > 0){
        arrowOffset = $('.storeItems').offset().top - 100;
    }
    else{
        arrowOffset = 700;
    }


    if (window_scroll > arrowOffset) {
        $('.slideUp').fadeIn();
    }
    else{
        $('.slideUp').fadeOut();
    }
});