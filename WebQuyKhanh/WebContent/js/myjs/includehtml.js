
/*

example :
	<div class="include" data-include="header" data-type=".html"> </div>

*/

	var includes= $(".include");
	jQuery.each(includes,function(){
		var file = $(this).data("include");
		$(this).load(file);
	});


