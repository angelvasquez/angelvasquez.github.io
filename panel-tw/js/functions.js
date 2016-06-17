$(document).ready(function(){

	console.log("init");

	var elements = new Array;
	var listSelected;
	var tagList = new Array;
	var object;
	var selected;


	var elements = $('.panel > .data-panel > .resources > .trigger-cont > .trigger');

		$(elements).each(function(elemIndex){
			$(this).on("click", function(){
				selected = elemIndex;
				var top = parseInt(this.offsetTop+30);
				var left = parseInt(this.offsetLeft);
				$(".modal").css({
					top: top+"px",
					left: left+"px",
					display: 'block'
				});
			});

			
		});

		$('#addElement').on('click', function(){
			listSelected = $("resources-"+selected);
			object = $("#newElement").val();
			tagList = object.split(',');
			for(var i = 0; i < tagList.length; i++){
				$('#tags-'+selected).append("<li id="+tagList[i]+">"+tagList[i]+" <i class='fa fa-times'></i></li>");
			 }
		});


		$("#close-modal").on('click', function(){
			$(".modal").css({
				display: 'none'
			});
			$('#newElement').val("");
		});

		/*$("#resources-"+selected+" #tags-"+selected+" #"+tagList[i]+" .close").on('click', function(){
			
		});*/

		$("#tags-0 > #ubuntu > i").on('click', function(){
			$("#tags-0 #ubuntu").remove();
		})

		

})