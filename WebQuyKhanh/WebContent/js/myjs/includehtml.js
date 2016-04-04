/*

 example :
 <div class="include" data-include="header" data-type=".html"> </div>

 */
$(document).ready(function(){
	var includes = $(".include");
	jQuery.each(includes, function() {
		var file = $(this).data("include");
		console.log("file"+file);
		$(this).load(file);
	});
});

