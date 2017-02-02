(function( $ ) {


    //Function to animate slider captions 
    function doAnimations( elems ) {
        //Cache the animationend event in a variable
        var animEndEv = 'webkitAnimationEnd animationend';
        
        elems.each(function () {
            var $this = $(this),
                $animationType = $this.data('animation');
            $this.addClass($animationType).one(animEndEv, function () {
                $this.removeClass($animationType);
            });
        });
    }

    $(function () {
            $('[data-toggle="tooltip"]').tooltip()
    })


    //active class for item elements
    $('.item').each(function(elemIndex){
        $(this).on("click", function(){
            $('.item').each(function(elemIndex){
                    $(this).removeClass("active");
            });
            $(this).addClass("active");
        });
    });


    //no-selected class for btn-select elements
     $('.columna__plan ').each(function(elemIndex){
        $(this).on("click", function(){
            $('.columna__plan').each(function(elemIndex){
                    $(this).addClass("no-selected");
            });
            $(this).removeClass("no-selected");

            $('.tab-opciones').animate({
                opacity: 0,
                height: 0
            });

            $('.congrats').animate({
                opacity: 1,
                height: '120px'
            });

            $('.bajada').animate({
                opacity: 0,
                height: 0
            });

           
        });
    });


    $('.seq-finish').on('click', function(){
        $('.alert').fadeIn();
    })

    $('.seq-prev.last').on('click', function(){
        $('.alert').fadeOut();
    })
        
    //Variables on page load 
    var $myCarousel = $('#carousel-example-generic'),
        $firstAnimatingElems = $myCarousel.find('.item:first').find("[data-animation ^= 'animated']");
        
    //Initialize carousel 
    $myCarousel.carousel();
    
    //Animate captions in first slide on page load 
    doAnimations($firstAnimatingElems);
    
    //Pause carousel  
    $myCarousel.carousel('pause');
    
    
    //Other slides to be animated on carousel slide event 
    $myCarousel.on('slide.bs.carousel', function (e) {
        var $animatingElems = $(e.relatedTarget).find("[data-animation ^= 'animated']");
        doAnimations($animatingElems);
    });


    
})(jQuery);