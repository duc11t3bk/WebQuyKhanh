$(document).ready(function() {
	$("#btn-login").on("click", function() {
		$("#form-login").css("top", "30%");
		$(".overflow").show();
	});
});

$(document).ready(function() {
	$("#btn-register").on("click", function(e) {
		e.stopPropagation();
		$("#form-register").css("top", "20%");
		$(".overflow").show();
	});
});

$(document).ready(function() {
	function closeLogReg() {
		$("#form-login").css("top", "-400px");
		$("#form-register").css("top", "-400px");
		$(".overflow").hide();
	}
	$(".overflow").on("click", function() {
		closeLogReg();
	});
	var removes = $(".glyphicon-remove");
	for (var i = 0; i < removes.length; i++) {
		$(removes[i]).on("click", function() {
			closeLogReg();
		});
	}
});
