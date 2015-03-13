$(".btn-create-modal").click(function(){
	$(".box-ecupon").show()
})


$('.picker').datepicker({
    calendarWeeks: true,
     format: 'mm/dd/yyyy',
    startDate: '-3d'
});

$(document).ready(function() {
  	$('#rootwizard').bootstrapWizard({'tabClass': 'bwizard-steps'});
});
