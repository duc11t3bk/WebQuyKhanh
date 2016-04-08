function formConfirm(path, message) {
	console.log("path :" + path);
	$("#form-confirm-message").html(message);
	$("#form-confirm").css("top", "20%");
	$(".overflow").show();
	$("#ok").on("click", function() {
		window.location.href = path;
		console.log("url" + window.location.href);
	});
	$("#cancel").on("click", function() {
		$("#form-confirm").css("top", "-300px");
		$(".overflow").hide();
	});
}