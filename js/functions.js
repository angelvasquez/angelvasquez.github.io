$(document).ready(function(){

	console.log("init");

	var elements = new Array;
	var tagList = new Array;
	var listSelected;
	var elemSelected;
	var object;
	var selected;
	var top;
	var left;


	var elements = $('.panel > .data-panel > .resources > .trigger-cont > .trigger');

		$(elements).each(function(elemIndex){
			$(this).on("click", function(){
				selected = elemIndex;
				var position = $(this).position();
				var top = position.top;
				var left = position.left;
				if (navigator.appVersion.indexOf("MSIE") != -1){
					top = top + 30;
					$(".modal").css({
						top: top+"px",
						left: left+"px",
						display: 'block'
					});
				}else{
					top = top + 30;
					$(".modal").css({
						top: top+"px",
						left: left+"px",
						display: 'block'
					});
				}
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


		$("#tags-0 > #ubuntu > i").on('click', function(){
			$("#tags-0 #ubuntu").remove();
		});
});