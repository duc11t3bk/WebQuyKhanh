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
<meta name="author" content="Minh Duc" />
<title>Trung Tâm Du Học và Nhật Ngữ Quý Khanh</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="css/mycss/styleframehome.css">
<link rel="stylesheet" type="text/css"
	href="css/mycss/styleviewpost.css">
<script src="js/jquery-2.2.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/myjs/includehtml.js"></script>
</head>
<body>
	<div class="wrapper">
		<div class="include" data-include="header.jsp"></div>
		<div class="container main-container">
			<div class="row">
				<div class="content">
					<div class="col-lg-9 main-content">
						<div class="row">
							<div class="panel panel-primary">
								<div class="panel-heading">
									<div class="panel-title">Bài đăng số 1</div>
								</div>
								<div class="panel-body">
									<div class="row">
										<div class="col-lg-12" style="width: 100%; height: 300px;">
											<img id="postsimage" src="image/phusi2.jpg">
										</div>
									</div>
									<div class="row" style="margin-top: 20px;">
										<div class="col-lg-12">
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing
												elit. Sed non dui sodales, faucibus libero ut, posuere
												felis. Donec imperdiet suscipit accumsan. Aenean consequat
												condimentum velit ut tempor. Nam porta massa in metus
												bibendum congue. Pellentesque ultrices vestibulum mattis.
												Aliquam egestas nunc at ullamcorper ultricies. Donec feugiat
												velit nulla, vel sodales est ullamcorper id.Lorem ipsum
												dolor sit amet, consectetur adipiscing elit. Sed non dui
												sodales, faucibus libero ut, posuere felis. Donec imperdiet
												suscipit accumsan. Aenean consequat condimentum velit ut
												tempor. Nam porta massa in metus bibendum congue.
												Pellentesque ultrices vestibulum mattis. Aliquam egestas
												nunc at ullamcorper ultricies. Donec feugiat velit nulla,
												vel sodales est ullamcorper id.Lorem ipsum dolor sit amet,
												consectetur adipiscing elit. Sed non dui sodales, faucibus
												libero ut, posuere felis. Donec imperdiet suscipit accumsan.
												Aenean consequat condimentum velit ut tempor. Nam porta
												massa in metus bibendum congue. Pellentesque ultrices
												vestibulum mattis. Aliquam egestas nunc at ullamcorper
												ultricies. Donec feugiat velit nulla, vel sodales est
												ullamcorper id. Lorem ipsum dolor sit amet, consectetur
												adipiscing elit. Sed non dui sodales, faucibus libero ut,
												posuere felis. Donec imperdiet suscipit accumsan. Aenean
												consequat condimentum velit ut tempor. Nam porta massa in
												metus bibendum congue. Pellentesque ultrices vestibulum
												mattis. Aliquam egestas nunc at ullamcorper ultricies. Donec
												feugiat velit nulla, vel sodales est ullamcorper id.</p>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-12">
											<div class="col-lg-6">
												<a class="btn btn-default" href="#x"><span
													class="glyphicon glyphicon-thumbs-up"></span> Like</a> <span>500</span>
											</div>
											<div class="col-lg-6">
												<h5 style="text-align: right">Người đăng : nnnn</h5>
												<h5 style="text-align: right">Ngày đăng : 15-3-2016</h5>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="panel panel-primary">
								<div class="panel-heading">
									<div class="panel-heading">Bình luận</div>
								</div>
								<div class="panel-body">
									<div class="row">
										<div class="col-lg-12">This is div comment</div>
									</div>
									<div class="row">
										<div class="col-lg-12" style="text-align: center">
											<input class="btn btn-default" type="button" value="More" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 include" data-include="rightcontent.jsp"></div>
				</div>
			</div>
		</div>
		<div id="footer" class="include" data-include="footer"
			data-type=".html"></div>
	</div>
</body>
</html>