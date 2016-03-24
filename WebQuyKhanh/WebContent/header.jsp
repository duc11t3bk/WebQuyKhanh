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

<script src="js/jquery-2.2.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>

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
			$("#form-register").css("top", "20%");
			$(".overflow").show();
		});
	});
</script>
<script type="text/javascript">
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
</script>
<script type="text/javascript">
	function doAjaxPost(){
		var email=$("#mail").val();
		$.ajax({
			type: "POST",
			url : "/home.do",
			data : "email="+email,
			success: function(response){
				$("#show").html(response);
			},
			error: function(e){
				alert("error"+e);
			}
		});
	}
</script>
</head>
<body>
	<div class="overflow"></div>
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
						<html:form method="post" action="/home">
							<div class="row">
								<h5 class="col-lg-2">Email:</h5>
								<html:text styleId="mail" property="email" styleClass="col-lg-8"></html:text>								
							</div>
							
								<div class="row" style="text-align:center">
									<span style="color: red" id="show" > 
									</span>
								</div>
							
							<div class="row">
								<h5 class="col-lg-2">Mật khẩu:</h5>
								<html:password property="password" styleClass="col-lg-8"></html:password>								
							</div>
							<logic:notEmpty name="loginForm" scope="session" >
								<div class="row" style="text-align: center">								
									<span style="color: red"><bean:write
											property="passwordError" name="loginForm" scope="session" />
									</span>
								</div>
							</logic:notEmpty>
							<div class="row">
								<html:button property="submit" styleClass="col-lg-offset-2 col-lg-8 btn btn-primary" onclick="doAjaxPost()" >Đăng nhập</html:button>
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
						<div class="row">
							<input class="col-lg-offset-2 col-lg-8" type="text"
								placeholder="Email" />
						</div>
						<div class="row">
							<input class="col-lg-offset-2 col-lg-8" type="text"
								placeholder="Số điện thoại" />
						</div>
						<div class="row">
							<input class="col-lg-offset-2 col-lg-8" type="text"
								placeholder="Mật khẩu" />
						</div>
						<div class="row">
							<input class="col-lg-offset-2 col-lg-8" type="text"
								placeholder="Xác nhận mật khẩu" />
						</div>
						<div class="row">
							<input class="col-lg-offset-2 col-lg-8 btn btn-primary"
								type="button" value="Đăng ký" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="navigation">
		<ul class="menu">
			<li><a href="introduce.html">Giới thiệu</a></li>
			<li><a href="home.html"><span
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
					<li><a href="vocaLevel.html">Học từ vựng</a></li>
					<li><a href="translationLevel.html">Luyện dịch câu</a></li>
				</ul></li>
			<li id="btn-login"><a href="#x"><span
					class="glyphicon glyphicon-log-in"></span> Đăng nhập</a>
				<ul class="submenu">
					<li id="btn-register"><a href="#x">Đăng kí</a></li>
				</ul></li>
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