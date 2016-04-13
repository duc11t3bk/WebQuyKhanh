<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<html>
<head>
<meta charset="utf-8" />
<title>Trung Tâm Du Học và Nhật Ngữ Quý Khanh</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/mycss/styleheader.css">


<script type="text/javascript">
	$(document).ready(function() {
		$("#btn-login").on("click", function() {
			$("#form-login").css("top", "30%");
			$(".overflow").show();
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btn-register").on("click", function(e) {
			e.stopPropagation();
			$("#form-register").css("top", "12%");
			$(".overflow").show();
		});
	});
</script>
<script type="text/javascript">
	/* hide login-form and register-form*/
	$(document).ready(function() {
		function closeLogReg() {
			$("#form-login").css("top", "-400px");
			$("#form-register").css("top", "-600px");
			$("#new-level").css("top","-300px");
			$("#new-lesson").css("top","-300px");
			$("#form-confirm").css("top","-300px");
			$("#form-upload-lesson").css("top","-100%");
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
</script>
<script type="text/javascript">
	function closeLogReg() {
		$("#form-login").css("top", "-400px");
		$("#form-register").css("top", "-600px");
		$(".overflow").hide();
	}
	function login() {
		$("#emailError").html("");
		$("#passwordError").html("");
		$("#notification-login").html("");
		var email = $("#email").val();
		var password = $("#password").val();
		console.log("email" + email + ":password" + password);
		$.ajax({
			type : "POST",
			url : "http://localhost:8080/WebQuyKhanh/login.do",
			data : "email=" + email + "&password=" + password,
			dataType : "json",
			success : function(response) {
				if (response[0].checkValidate == "false") {
					$("#emailError").html(response[0].emailError);
					$("#passwordError").html(response[0].passwordError);
				} else {
					if (response[0].login == "failed") {
						$("#notification-login").html(
								"Tài khoản hoặc mật khẩu không đúng");
					}
					if (response[0].login == "success") {
						$("#notification-login").html("Đăng nhập thành công");
						setTimeout(function() {
							$("#email").val("");
							$("#password").val("");
							$("#notification-login").val("");
							closeLogReg();
							location.href = "/WebQuyKhanh/home.jsp";
						}, 800);
					}
				}
			},
			error : function(e) {
				alert("Error: " + e);
			}
		});
	}
	function register() {
		$("#emailRegisError").html("");
		$("#phoneNumberRegisError").html("");
		$("#passwordRegisError").html("");
		$("#retypePasswordRegisError").html("");
		$("#notification-register").html("");
		var email = $("#emailRegis").val();
		var phoneNumber = $("#phoneNumberRegis").val();
		var password = $("#passwordRegis").val();
		var retypePassword = $("#retypePasswordRegis").val();
		console.log("email" + email + "phone" + phoneNumber + "password"
				+ password + "retype" + retypePassword);
		$.ajax({
			type : "POST",
			url : "http://localhost:8080/WebQuyKhanh/register-member.do",
			data : "email=" + email + "&phoneNumber=" + phoneNumber
					+ "&password=" + password + "&retypePassword="
					+ retypePassword,
			dataType : "json",
			success : function(response) {
				var object = response[0];
				console.log("response" + response[0].register);
				if (object.register == "failed") {
					$("#emailRegisError").html(object.emailError);
					$("#phoneNumberRegisError").html(object.phoneNumberError);
					$("#passwordRegisError").html(object.passwordError);
					$("#retypePasswordRegisError").html(
							object.retypePasswordError);
				} else {
					if (object.register == "success") {
						$("#notification-register").html(object.message);
						setTimeout(function() {
							closeLogReg();
							$("#emailRegis").val("");
							$("#phoneNumberRegis").val("");
							$("#passwordRegis").val("");
							$("#retypePasswordRegis").val("");
							$("notification-register").val("");
						}, 1000);
					}
				}
			},
			error : function(errormessage) {
				alert("Error" + errormessage);
			}
		});
	}
</script>
</head>
<body>
	<div class="overflow"></div>
	<!-- Form đăng nhập -->
	<div class="container">
		<div class="row">
			<div class="col-lg-offset-2 col-lg-8" id="form-login">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="panel-title" style="text-align: center; float: left">Đăng
							Nhập</div>
						<span class="glyphicon glyphicon-remove"
							style="display: block; float: right; cursor: pointer"></span>
						<div class="clear"></div>

					</div>
					<div class="panel-body">
						<html:form action="/login">
							<div class="row" style="text-align: center">
								<label id="notification-login" style="color: red"></label>
							</div>
							<div class="row">
								<label class="col-lg-2">Email:</label>
								<div class="col-lg-8">
									<html:text styleId="email" property="email"
										styleClass="form-control"></html:text>
								</div>
							</div>

							<div class="row" style="text-align: center">
								<label id="emailError" style="color: red"></label>
							</div>

							<div class="row">
								<label class="col-lg-2">Mật khẩu: </label>
								<div class="col-lg-8">
									<html:password styleId="password" property="password"
										styleClass="form-control"></html:password>
								</div>
							</div>
							<logic:notEmpty name="loginForm" scope="session">
								<div class="row" style="text-align: center">
									<label id="passwordError" style="color: red"> </label>
								</div>
							</logic:notEmpty>
							<div class="row">
								<html:button property="submit"
									styleClass="col-lg-offset-2 col-lg-8 btn btn-primary"
									onclick="login()">Đăng nhập</html:button>
							</div>
							<div class="row" style="text-align: center">
								<img src="image/facebook-login-button.png" width="200px"
									height="40px">
							</div>
						</html:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Form đăng ký -->
	<div class="container">
		<div class="row">
			<div class="col-lg-offset-2 col-lg-8" id="form-register">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="panel-title" style="float: left; text-align: center">Đăng
							ký</div>
						<span class="glyphicon glyphicon-remove"
							style="display: block; float: right; cursor: pointer"></span>
						<div class="clear"></div>
					</div>
					<div class="panel-body">
						<html:form action="/register-member">
							<div class="row" style="color: red; text-align: center">
								<label id="notification-register" style="color: red"></label>
							</div>
							<div class="row">
								<label class="col-lg-2"><span
									class="glyphicon glyphicon-envelope"></span> Email</label>
								<div class="col-lg-8 ">
									<html:text styleId="emailRegis" styleClass="form-control"
										property="email" />
								</div>
							</div>
							<div class="row" style="text-align: center">
								<label id="emailRegisError" style="color: red"></label>
							</div>
							<div class="row">
								<label class="col-lg-2"><span
									class="glyphicon glyphicon-earphone"></span> Số điện thoại :</label>
								<div class="col-lg-8 ">
									<html:text styleId="phoneNumberRegis" property="phoneNumber"
										styleClass="form-control"></html:text>
								</div>
							</div>
							<div class="row" style="text-align: center">
								<label id="phoneNumberRegisError" style="color: red"></label>
							</div>
							<div class="row">
								<label class="col-lg-2"><span
									class="glyphicon glyphicon-lock"></span> Mật khẩu :</label>
								<div class="col-lg-8">
									<html:password styleId="passwordRegis"
										styleClass=" form-control" property="password"></html:password>
								</div>
							</div>
							<div class="row" style="text-align: center">
								<label id="passwordRegisError" style="color: red"></label>
							</div>
							<div class="row">
								<label class="col-lg-2"><span
									class="glyphicon glyphicon-lock"></span> Nhập lại mật khẩu </label>
								<div class="col-lg-8">
									<html:password styleClass="form-control"
										styleId="retypePasswordRegis" property="retypePassword"></html:password>
								</div>
							</div>
							<div class="row" style="text-align: center">
								<label id="retypePasswordRegisError" style="color: red"></label>
							</div>
							<div class="row">
								<html:button
									styleClass="col-lg-offset-2 col-lg-8 btn btn-primary"
									property="submit" value="Đăng ký" onclick="register()"></html:button>
							</div>
						</html:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Menu -->
	<div class="navigation">
		<ul class="menu">
			<li><a href="introduce.jsp">Giới thiệu</a></li>
			<li><a href="home.jsp"><span
					class="glyphicon glyphicon-home"></span> Trang chủ</a></li>
			<li><a href="japanStudyAbroad.html"><span
					class="glyphicon glyphicon-plane"></span> Du học Nhật Bản</a></li>
			<li><a href="japanClass.html"><span
					class="glyphicon glyphicon-hand-right"></span> Lớp học tiếng Nhật</a>
				<ul class="submenu">
					<li><a href="documentation.html">Tài liệu tham khảo</a></li>
					<li><a href="recruitment.html">Tuyển dụng</a></li>
				</ul></li>
			<li><a href="#"><span class="glyphicon glyphicon-hourglass"></span>
					Học từ vựng</a>
				<ul class="submenu">
					<li><html:link action="/member-manage-level?action=vocabulary">Học từ vựng</html:link></li>
					<li><html:link action="/member-manage-level?action=translate">Luyện dịch câu</html:link></li>
				</ul></li>
			<logic:empty name="loginForm" property="member" scope="session">
				<li id="btn-login"><a href="#x"><span
						class="glyphicon glyphicon-log-in"></span> Đăng nhập</a>
					<ul class="submenu">
						<li id="btn-register"><a href="#x">Đăng kí</a></li>
					</ul></li>
			</logic:empty>
			<logic:notEmpty name="loginForm" property="member" scope="session">

				<li style="float: right"><html:link href="#"
						styleId="emailUser">
						<bean:define id="member" name="loginForm" property="member"
							scope="session" />
						<bean:define id="image" name="member" property="image"></bean:define>
						<img class="img-circle" alt="hinh" src="avata/${image }"
							height="40px" width="40px">
						<bean:write name="member" property="email" />
					</html:link> 
					<!-- Menu member --> 
					<logic:equal value="0" name="member"
						property="priority">
						<ul class="submenu" style="text-align: left">
							<li><html:link action="/member-update-infor"
									style="margin-left:5px;">
									<span class="glyphicon glyphicon-info-sign"></span> Thông tin cá nhân</html:link></li>
							<li><html:link action="/logout" style="margin-left:5px;">
									<span class="glyphicon glyphicon-log-out"></span> Đăng xuất</html:link></li>
						</ul>
					</logic:equal> 
					<!-- Menu teacher admin --> 
					<logic:notEqual value="0"
						name="member" property="priority">
						<ul class="submenu" style="text-align: left">
							<li><html:link action="/teacher-update-infor"
									style="margin-left:5px;">
									<span class="glyphicon glyphicon-info-sign"></span> Thông tin cá nhân</html:link></li>
							<li><html:link action="/teacher-update-infor" style="margin-left:5px">
									<span class="glyphicon glyphicon-cog"></span> Trang Quản lí</html:link></li>
							<li><html:link action="/logout" style="margin-left:5px;">
									<span class="glyphicon glyphicon-log-out"></span> Đăng xuất</html:link></li>
						</ul>
					</logic:notEqual></li>

			</logic:notEmpty>
		</ul>
	</div>
		<div class="container" style="margin-top: 50px;">
		<div class="row">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
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
				<a class="left carousel-control" href="#myCarousel" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</div>
</body>
</html>

	