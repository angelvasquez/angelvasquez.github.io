$(document).ready(function(){

	$('.mobile-menu').on('click', function(){
		$('#main-nav').slideToggle();
	})

});



$(window).scroll(function() {

	if($(window).width() >= 700){
	    if ($(window).scrollTop() >= 100) {
	       $('nav').addClass('active');
	    }else{
			$('nav').removeClass('active');
		};
	};

});