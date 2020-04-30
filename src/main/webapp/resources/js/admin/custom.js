
var selectSection = function(indexP, indexC){
	var $parentA = $($($('#exampleAccordion').children()[indexP]).children()[0]);
	
	$parentA.css('background-color', 'skyblue').css('color', 'black')
	.hover(function(){
	    $(this).css('color', '#f8f9fa');
	}, function(){
	    $(this).css('color', 'black');
	});
	$parentA.click();
	
	if(typeof indexC != "undefined"){
		var $childrenA = $($($parentA.next().children()[indexC]).children()[0]);
		$childrenA.css('color', 'skyblue')
		.hover(function(){
		    $(this).css('color', '#f8f9fa');
		}, function(){
		    $(this).css('color', 'skyblue');
		});
	}
}

var hideMenu = function(){
	setTimeout(() => {
		$('#exampleAccordion').children().each(function(i, e){
		    $($(e).children()[0]).next().removeClass('show');
		});
	}, 30);
	
}