$('.fancybox').fancybox({
	maxWidth	: 1180,
	maxHeight	: 600,
	fitToView	: true,
	width		: '1180',
	height		: '550',
	autoSize	: false,
	closeClick	: false,
	openEffect	: 'none',
	closeEffect	: 'none',
	padding		: 0,
	closeClick	: false,
	modal		: false,
	iframe 		: {
		scrolling : 'no',
		preload   : true
	}
});


$('#multi-select').multiselect({
	nonSelectedText: 'SERVICIOS',
	maxHeight: 300,
	buttonWidth: '185px',
	includeSelectAllOption: true,
	selectAllText: 'Seleccionar Todos...',
	selectAllValue: 0,
	filterPlaceholder: 'Buscar...',
	enableFiltering: true,
	selectAllNumber: false,
	allSelectedText: "Todos",
	nSelectedText: ' Seleccionados'
});

$('[data-toggle="tooltip"]').tooltip({
	placement : 'right'
})

$('.clickable').collapse();

$('#lnk-home').animate({
	opacity : 1
}, 2000);

