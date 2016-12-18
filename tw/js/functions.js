$(document).ready(function(){

	var tagList = new Array;
	var listSelected;
	var elemSelected;
	var object;
	var selected;
	var top;
	var left;


	var elements = $('.trigger');

	$('.trigger').each(function(elemIndex){
		$(this).on("click", function(){
			console.log(elemIndex);
			selected = elemIndex;
			var position = $(this).position();
			var top = position.top;
			var left = position.left;
			top = top + 30;
			$(".modal").css({
				top: top+"px",
				left: left+"px",
				display: 'block'
			});
		});//end trigger modal

		$(".tags").on('click', "i", function(){
			$(this).parent().remove();
		});
	});


	$('#addElement').on('click', function(){
		listSelected = $("resources-"+selected);
		object = $("#newElement").val();
		tagList = object.split(',');
		if($('#newElement').val() == ""){
			alert("Please add some resources");
		}else{
			for(var i = 0; i < tagList.length; i++){
				$('#tags-'+selected).append("<li id="+tagList[i]+">"+tagList[i]+" <i class='fa fa-times'></i></li>");
			 }
		}
	});


	$("#close-modal").on('click', function(){
		$(".modal").css({
			display: 'none'
		});
		$('#newElement').val("");
	});
});