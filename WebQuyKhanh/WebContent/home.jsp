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
	<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="css/mycss/stylehome.css">
	<link rel="stylesheet" type="text/css" href="css/mycss/styleframehome.css">
	<link rel="stylesheet" type="text/css" href="css/mycss/styleheader.css">
	<script src="js/jquery-2.2.0.min.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/myjs/includehtml.js"></script>

</head>
<body>
	<div class="wrapper">
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="container main-container">
		<div class="row">
			<div class="content">
				<div class="col-lg-9 main-content">
					<div class="row">
						<div class="col-lg-6 new-post" style="padding-right:0px;">
							<img src="image/phusi3.jpg" width="100%" height="250px">
							<a href="#" id="new-more">Xem thêm <span class="glyphicon glyphicon-chevron-right"></span></a>
						</div>
						<div class="col-lg-6" style="padding-left:0px;">
							<div id="mypanel" class="panel panel-default" style="height:250px">
								<div class="panel-heading">
									<div class="panel-title"><a href="#">Tin mới đăng</a></div>
								</div>
								<div class="panel-body">
									<ul>
										<li><a href="viewPost.html">Bài đăng số 1</a></li>
										<li><a href="#">Item 1</a></li>
										<li><a href="#">Item 1</a></li>
										<li><a href="#">Item 1</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div id="mypanel" class="panel panel-default">
								<div class="panel-heading">
									<div class="panel-title"><a href="#">Du học Nhật Bản</a></div>
								</div>
								<div class="panel-body">
								<div id="myCarousel-abroad" class="carousel slide" data-ride="carousel">
								  <!-- Wrapper for slides -->
								  	<div class="carousel-inner" role="listbox">
								    	<div class="item active">
									      	<div class="row">
									      		<div class="col-lg-6">
									      			<img src="image/phusi3.jpg" alt="Hinh">
									      		</div>
									      		<div class="col-lg-6">
									      			<img src="image/phusi3.jpg" alt="Hinh">
									      		</div>
									      	</div>
									    </div>
									    <div class="item">
									      	<div class="row">
									      		<div class="col-lg-6">
									      			<img src="image/image2.jpg" alt="Hinh">
									      		</div>
									      		<div class="col-lg-6">
									      			<img src="image/image2.jpg" alt="Hinh">
									      		</div>
									      </div>
									    </div>
										<div class="item">
											<div class="row">
									      		<div class="col-lg-6">
									      			<img src="image/image1.jpg" alt="Hinh">
									      		</div>
									      		<div class="col-lg-6">
									      			<img src="image/image1.jpg" alt="Hinh">
									      		</div>
									      	</div>	
									    </div>
									 </div>

									  <!-- Controls -->
									<a class="left carousel-control" href="#myCarousel-abroad" role="button" data-slide="prev">
									    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
									    <span class="sr-only">Previous</span>
									</a>
									<a class="right carousel-control" href="#myCarousel-abroad" role="button" data-slide="next">
									    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
									    <span class="sr-only">Next</span>
									</a>
								</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
							<div class="col-lg-6 new-post" style="padding-right:0px;">
							<img src="image/phusi3.jpg" width="100%" height="250px">
							<a href="#" id="new-more">Xem thêm <span class="glyphicon glyphicon-chevron-right"></span></a>
						</div>
						<div class="col-lg-6" style="padding-left:0px;">
							<div id="mypanel" class="panel panel-default" style="height:250px">
								<div class="panel-heading">
									<div class="panel-title"><a href="#">Lớp học tiếng Nhật</a></div>
								</div>
								<div class="panel-body">
									<ul>
										<li><a href="#">Item 1</a></li>
										<li><a href="#">Item 1</a></li>
										<li><a href="#">Item 1</a></li>
										<li><a href="#">Item 1</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<div id="mypanel" class="panel panel-default">
								<div class="panel-heading">
									<div class="panel-title">Tuyển dụng</div>
								</div>
								<div class="panel-body">
									<ul>
										<li><a href="#">Item 1</a></li>
										<li><a href="#">Item 1</a></li>
										<li><a href="#">Item 1</a></li>
										<li><a href="#">Item 1</a></li>	
									</ul>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div id="mypanel" class="panel panel-default">
								<div class="panel-heading">
									<div class="panel-title">Tài liệu tham khảo</div>
								</div>
								<div class="panel-body">
									<ul>
										<li><a href="#">Item 1</a></li>
										<li><a href="#">Item 1</a></li>
										<li><a href="#">Item 1</a></li>
										<li><a href="#">Item 1</a></li>	
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<jsp:include page="rightcontent.jsp"></jsp:include>
				</div>
			</div>
		</div>		
	</div>	
	<div id="footer">
	<jsp:include page="footer.jsp"></jsp:include>
	</div>
	</div>
</body>
</html>