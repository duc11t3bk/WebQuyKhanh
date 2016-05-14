$(document).ready(function(){
	$("#image-small").on("click", function() {
		var src = $(this).attr("src");
		console.log("src " + src);
		$("#image-large").attr("src", src);
		$("#frame-zoom").css("visibility", "visible");
		$("#frame-zoom").css("opacity", "1");
		$("#frame-zoom").css("width", "95%");
		$("#frame-zoom").css("height", "800px");
		$("#frame-zoom").css("top", "10px");
		$("#frame-zoom").css("left", "2%");
		$(".overflow").show();
	});
	$("#my-remove").on("click", function() {
		$("#frame-zoom").css("opacity", "0");
		$("#frame-zoom").css("width", "40%");
		$("#frame-zoom").css("height", "40%");
		$("#frame-zoom").css("top", "10%");
		$("#frame-zoom").css("left", "30%");
		$("#frame-zoom").css("visibility", "hidden");
		$(".overflow").hide();
	});
});