$(window).scroll(function() {    
    var scroll = $(window).scrollTop();    
    if (scroll >= 100) {
       $('nav').addClass('active');
    }else{
		$('nav').removeClass('active');
	};
});