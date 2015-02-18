
$("#trigger").click(function(e){
	e.stopPropagation();
	$("#sidebar-wrapper").addClass("active");
});

$("#collapse").click(function(e){
	e.stopPropagation();
	$("#sidebar-wrapper").removeClass("active");
});

$("#filter-btn").click(function(e){
	e.stopPropagation();
	$("#sidebar-wrapper").removeClass("active");
})


jQuery(document).ready(function( $ ) {
	$('span').counterUp({
		delay: 10, // the delay time in ms
		time: 1000 // the speed time in ms
	});
});