<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="author" content="Minh Duc" />
<title>Trung Tâm Du Học và Nhật Ngữ Quý Khanh</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/mycss/styleintroduce.css">
<script src="js/jquery-2.2.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#myCarousel-post").carousel({
			interval : 6000
		})
		$("#myCarousel-post").on("slid.bs.carousel", function() {

		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#myCarousel-teacher").carousel({
			interval : 5000
		})
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		var documentEl = $(document);
		var parallaxBg = $(".parallax-bg");

		documentEl.on("scroll", function() {
			var currScrollPos = $(documentEl).scrollTop();
			parallaxBg.css("scroll", "0" + -currScrollPos / 4 + "px");
			console.log("Scroll :" + currScrollPos);
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		var documentEl = $(document);
		var mCircles = $(".m-circle");
		var mRectangles = $(".m-rectangle");
		var mTexts = $(".m-text");
		for (var i = 0; i < mCircles.length; i++) {
			$(mCircles[i]).hide();
			$(mRectangles[i]).hide();
		}
		for (var i = 0; i < mTexts.length; i++) {
			$(mTexts[i]).hide();
		}
		var flagCircle = true;
		var flagText = true;
		documentEl.on("scroll", function() {
			var currScrollPos = $(documentEl).scrollTop();
			if (currScrollPos >= 265 && flagCircle == true) {
				for (var i = 0; i < mCircles.length; i++) {
					$(mCircles[i]).fadeIn(2000);
					$(mRectangles[i]).fadeIn(2000);
				}
				flag = false;
			}
			if (currScrollPos >= 1420 && flagText == true) {
				for (var i = 0; i < mTexts.length; i++) {
					$(mTexts[i]).fadeIn(2000);
				}
			}
		});
	});
</script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-3 my-banner my-banner-left">
				<bean:define id="leftBanner" name="homeForm" property="leftBanner"></bean:define>
				<img alt="hinh" src="image/${leftBanner }" style="width: 100%; height: 100%;">
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-3 my-banner my-banner-right">
				<bean:define id="rightBanner" name="homeForm" property="rightBanner"></bean:define>
				<img alt="hinh" src="image/${rightBanner }" style="width: 100%; height: 100%;">
			</div>
		</div>
	</div>
	<div class="parent">
		
		<div class="col-lg-12" id="center-name"
			style="margin-top: 10px; margin-bottom: 10px">
			<div class="col-lg-1">
				<img class="img-circle" src="image/iconqk.jpg" width="100px"
					height="100px" alt="hinh">
			</div>
			<div class="col-lg-10"
				style="text-align: :left; height: 100px; padding-left: 0px;">
				<h2 class="m-title">TRUNG TÂM DU HỌC VÀ NHẬT NGỮ QUÝ KHANH</h2>
			</div>
		</div>
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<logic:iterate id="posts" name="homeForm" property="listPostsNews"
					indexId="index">
					<logic:equal value="0" name="index">
						<li data-target="#carousel-example-generic"
							data-slide-to="${index }" class="active"></li>
					</logic:equal>
					<logic:notEqual value="0" name="index">
						<li data-target="#carousel-example-generic"
							data-slide-to="${index }"></li>
					</logic:notEqual>
				</logic:iterate>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<logic:iterate id="posts" name="homeForm" property="listPostsNews"
					indexId="index">
					<logic:equal value="0" name="index">
						<bean:define id="imageName" name="posts" property="image"></bean:define>
						<div class="item active">
							<img src="postsimage/${imageName }" alt="hinh">
						</div>
					</logic:equal>
					<logic:notEqual value="0" name="index">
						<bean:define id="imageName" name="posts" property="image"></bean:define>
						<div class="item">
							<img src="postsimage/${imageName }" alt="hinh">
						</div>
					</logic:notEqual>
				</logic:iterate>
			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<div class="row" id="group-button">
			<div class="col-lg-12" style="text-align: center; margin-top: 10px">
				<html:link action="/home.do">
					<button type="button" class="m-btn">
						<div class="div-btn"></div>
						<h5 class="text-btn">Trang Chủ</h5>
					</button>
				</html:link>
				<html:link action="/register-study.do?action=registerstudy">
					<button type="button" class="m-btn">
						<div class="div-btn"></div>
						<h5 class="text-btn">Đăng Ký Học</h5>
					</button>
				</html:link>
			</div>
		</div>
	</div>
	<div class="row parallax-bg" style="margin-bottom: 50px;">
		<div class="col-lg-12">
			<div class="col-lg-4">
				<div class="m-circle">
					<a href="#"><h4>Du Học Nhật Ngữ Quý Khanh</h4></a>
				</div>
				<div class="m-rectangle"></div>
			</div>
			<div class="col-lg-4">
				<div class="m-circle ">
					<a href="#"><h4>Tư Vấn - Dịch Thuật Quý Khanh</h4></a>
				</div>
				<div class="m-rectangle"></div>
			</div>
			<div class="col-lg-4">
				<div class="m-circle ">
					<a href="#"><h4>Liên Kết Đào Tạo</h4></a>
				</div>
				<div class="m-rectangle"></div>
			</div>
		</div>
	</div>
	<div class="container my-container" style="margin-top: 20px;">
		<hr>
		<div class="row" style="margin-top: 20px; margin-bottom: 20px">
			<div id="myCarousel-post" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner" role="listbox">
					<logic:iterate id="listChild" name="homeForm"
						property="listPostsStudyAbroad" indexId="index">
						<logic:equal value="0" name="index">
							<div class="item active">
								<div class="row">
									<logic:iterate id="posts" name="listChild">
										<div class="col-lg-4">
											<bean:define id="imageName" name="posts" property="image"></bean:define>
											<bean:define id="postID" name="posts" property="postID"></bean:define>
											<html:link action="/view-posts?postID=${postID }" ><img src="postsimage/${imageName }" alt="hinh"></html:link>
											<div class="carousel-caption"><html:link action="/view-posts?postID=${postID }"><bean:write name="posts" property="title"/> </html:link></div>
										</div>
									</logic:iterate>
								</div>
							</div>
						</logic:equal>
						<logic:notEqual value="0" name="index">
							<div class="item">
								<div class="row">
									<logic:iterate id="posts" name="listChild">
										<div class="col-lg-4">
											<bean:define id="imageName" name="posts" property="image"></bean:define>
											<bean:define id="postID" name="posts" property="postID"></bean:define>
											<html:link action="/view-posts?postID=${postID }" ><img src="postsimage/${imageName }" alt="hinh"></html:link>
											<div class="carousel-caption"><html:link action="/view-posts?postID=${postID }"><bean:write name="posts" property="title"/> </html:link> </div>
										</div>
									</logic:iterate>
								</div>
							</div>
						</logic:notEqual>
					</logic:iterate>
				</div>
				<!-- Controls -->
				<a class="left carousel-control" href="#myCarousel-post"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel-post"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<hr>
		<div class="row" style="margin-top: 20px; margin-bottom: 20px">
			<div id="myCarousel-teacher" class="carousel slide"
				data-ride="carousel">
				<div class="carousel-inner" role="listbox">
					<logic:iterate id="listChild" name="homeForm" property="listTeacher" indexId="index">
						<logic:equal value="0" name="index">
							<div class="item active">
								<div class="row">
									<logic:iterate id="teacher" name="listChild">
										<bean:define id="imageName" name="teacher" property="image"></bean:define>
										<div class="col-lg-3">
											<div class="teacher-info">
												<div class="col-lg-12 " style="text-align: left;">
													<span class="glyphicon glyphicon-education"></span>
													<bean:write name="teacher" property="certificate" />
												</div>
											</div>
											<a href="#"><img src="avata/${imageName }" alt="hinh"></a>
											<h6><bean:write name="teacher" property="name"/> </h6>
										</div>
									</logic:iterate>
								</div>
							</div>
						</logic:equal>
						<logic:notEqual value="0" name="index">
							<div class="item">
								<div class="row">
									<logic:iterate id="teacher" name="listChild">
										<bean:define id="imageName" name="teacher" property="image"></bean:define>
										<div class="col-lg-3">
											<div class="teacher-info">
												<div class="col-lg-12">
													<span class="glyphicon glyphicon-education"></span>
													<bean:write name="teacher" property="certificate" />
												</div>
											</div>
											<a href="#"><img src="avata/${imageName }" alt="hinh"></a>
											<h6><bean:write name="teacher" property="name"/> </h6>
										</div>
									</logic:iterate>
								</div>
							</div>
						</logic:notEqual>
					</logic:iterate>
				</div>
				<!-- Controls -->
				<a class="left carousel-control" href="#myCarousel-teacher"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel-teacher"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<hr>
		<div class="row" style="margin-top: 10px; margin-bottom: 10px">
			<div class="col-lg-5 m-div">
				<div class="m-text">
					<h3>Thông tin liên hệ</h3>
					<h5>230 Nguyễn Tri Phương - Thanh Khê - Đà Nẵng</h5>
				</div>
				<div class="m-text">
					<h3>Điện Thoại</h3>
					<h5>0511 6282 666</h5>
				</div>
				<div class="m-text">
					<h3>Email</h3>
					<h5>duhocquykhanh@gmail.com</h5>
				</div>
			</div>
			<div class="col-lg-7">
				<iframe
					src="https://www.google.com/maps/d/u/0/embed?mid=zbL1GksznTqg.kr35Pcwz-gSo"
					width="100%" height="480"></iframe>
			</div>
		</div>
	</div>

</body>
</html>