<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<title>Trung Tâm Du Học và Nhật Ngữ Quý Khanh</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/mycss/stylerightcontent.css">
<link rel="stylesheet" type="text/css"
	href="css/mycss/styleadminmanage.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<script src="js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#datepicker").datepicker();
		$("#emailRS").attr("placeholder", "Email");
		$("#phoneNumberRS").attr("placeholder", "Số điện thoại");
	});
</script>
<script type="text/javascript">
	function resetStatus() {
		var toolTipText = $(".tooltiptext");
		for (var i = 0; i < toolTipText.length; i++) {
			$(toolTipText[i]).css("visibility", "hidden");
			$(toolTipText[i]).css("opacity", "0");
		}
		var formControl = $(".form-register-study .form-control");
		for (var i = 0; i < formControl.length; i++) {
			$(formControl[i]).css("border-color", "#ccc");
		}
	}
	$(document)
			.ready(
					function() {
						$("#btn-submit")
								.on(
										"click",
										function() {
											var email = $("#emailRS").val();
											var phoneNumber = $(
													"#phoneNumberRS").val();

											$
													.ajax({
														type : "POST",
														url : "register-study.do",
														data : "action=studyabroad&email="
																+ email
																+ "&phoneNumber="
																+ phoneNumber,
														dataType : "json",
														success : function(
																response) {
															var jsonObject = response[0];
															var result = jsonObject.result;
															console
																	.log("result"
																			+ result);
															if ("success" == result) {
																$("#notify")
																		.html(
																				"Đăng ký thành công");
															} else {
																if (jsonObject.emailError != null) {
																	$(
																			"#emailRS")
																			.css(
																					"border-color",
																					"red");
																	$(
																			"#emailRSError")
																			.html(
																					""
																							+ jsonObject.emailError);
																}
																if (jsonObject.phoneNumberError != null) {
																	$(
																			"#phoneNumberRS")
																			.css(
																					"border-color",
																					"red");
																	$(
																			"#phoneNumberRSError")
																			.html(
																					""
																							+ jsonObject.phoneNumberError);
																}
															}
														},
														error : function(
																errormessage) {
															alert("error "
																	+ errormessage);
														},
													});
										});

						$("#emailRS").focus(function() {
							resetStatus();
							$(this).css("border-color", "#66afe9");
							$("#emailRSError").css("visibility", "visible");
							$("#emailRSError").css("opacity", "1");
							setTimeout(function() {
								$("#emailRSError").css("opacity", "0");
								$("#emailRSError").css("visibility", "hidden");
							}, 1500);
						});
						$("#phoneNumberRS").focus(
								function() {
									resetStatus();
									$(this).css("border-color", "#66afe9");
									$("#phoneNumberRSError").css("visibility",
											"visible");
									$("#phoneNumberRSError")
											.css("opacity", "1");
									setTimeout(function() {
										$("#phoneNumberRSError").css("opacity",
												"0");
										$("#phoneNumberRSError").css(
												"visibility", "hidden");
									}, 1500);
								});
					});
</script>
</head>
<body>
	<div id="right-content">
		<div class="panel panel-default mypanel">
			<div class="panel-heading">
				<div class="panel-title">Đăng ký tư vấn du học</div>
			</div>
			<div class="panel-body form-register-study"
				style="text-align: center">
				<html:form action="/register-study">
					<div class="row" style="text-align: center">
						<label id="notify"></label>
					</div>
					<div class="row" style="margin-bottom: 10px">
						<div class="col-lg-12 mytooltip">
							<html:text styleId="emailRS" property="email"
								styleClass="form-control my-text-input"></html:text>
							<span id="emailRSError" class="tooltiptext">Mời bạn nhập
								email ! </span>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12 mytooltip">
							<html:text styleId="phoneNumberRS" property="phoneNumber"
								styleClass="form-control my-text-input"></html:text>
							<span id="phoneNumberRSError" class="tooltiptext">Mời bạn
								nhập số điện thoại ! </span>
						</div>
					</div>
					<div class="row" style="margin-top: 10px;">
						<button id="btn-submit" type="button" class="my-btn">Đăng
							ký</button>
					</div>
				</html:form>
			</div>
		</div>
		<div id="datepicker" style="margin: auto"></div>
		<div class="panel panel-default mypanel" style="margin-top: 20px">
			<div class="panel-heading">
				<div class="panel-title">Top học viên xuất sắc</div>
			</div>
			<div class="panel-body">
				<div id="myCarousel-right" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel-right" data-slide-to="0"
							class="active"></li>
						<li data-target="#myCarousel-right" data-slide-to="1"></li>
						<li data-target="#myCarousel-right" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="image/phusi3.jpg" alt="Hinh">
							<div class="carousel-caption">...</div>
						</div>
						<div class="item">
							<img src="image/image2.jpg" alt="Hinh">
							<div class="carousel-caption"></div>
						</div>
						<div class="item">
							<img src="image/image1.jpg" alt="Hinh">
							<div class="carousel-caption"></div>
						</div>
					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#myCarousel-right"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel-right"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
		<div class="panel panel-default mypanel">
			<div class="panel-heading">
				<div class="panel-title">Thống kê</div>
			</div>
			<div class="panel-body">
				<p>Tổng số lượt truy cập : 123</p>
				<p>Số lượt truy cập hôm nay: 123</p>
				<p>Thành viên: 123</p>
			</div>
		</div>
	</div>
</body>
</html>