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
<link rel="stylesheet" type="text/css"
	href="css/mycss/styleframehome.css">
<link rel="stylesheet" type="text/css" href="css/mycss/styleheader.css">
<script src="js/jquery-2.2.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/myjs/includehtml.js"></script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="container" style="margin-top: 50px;">
			<div class="row">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<logic:iterate id="posts" name="homeForm" property="listPostsNews"
							indexId="index">
							<logic:equal value="0" name="index">
								<li data-target="#myCarousel" data-slide-to="${index }"
									class="active"></li>
							</logic:equal>
							<logic:notEqual value="0" name="index">
								<li data-target="#myCarousel" data-slide-to="${index }"></li>
							</logic:notEqual>
						</logic:iterate>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<logic:iterate id="posts" name="homeForm" property="listPostsNews"
							indexId="index">
							<bean:define id="imageName" name="posts" property="image"></bean:define>
							<bean:define id="postID" name="posts" property="postID"></bean:define>
							<logic:equal value="0" name="index">
								<div class="item active">
									<html:link action="/view-posts?postID=${postID }">
										<img src="postsimage/${imageName }" alt="Hinh">
									</html:link>
									<div class="carousel-caption">
										<bean:write name="posts" property="title" />
									</div>
								</div>
							</logic:equal>
							<logic:notEqual value="0" name="index">
								<div class="item">
									<html:link action="/view-posts?postID=${postID }">
										<img src="postsimage/${imageName }" alt="Hinh">
									</html:link>
									<div class="carousel-caption">
										<bean:write name="posts" property="title" />
									</div>
								</div>
							</logic:notEqual>
						</logic:iterate>
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
		<div class="container main-container">
			<div class="row">
				<div class="content">
					<div class="col-lg-9 main-content">
						<div class="row parent">
							<div class="col-lg-6 childLeft" style="padding-right: 0px;">
								<bean:define id="postsFirst" name="homeForm"
									property="listPostsNews[0]"></bean:define>
								<bean:define id="imageNameFirst" name="postsFirst"
									property="image"></bean:define>
								<bean:define id="postsFirstID" name="postsFirst"
									property="postID"></bean:define>
								<img src="postsimage/${imageNameFirst }" width="100%"
									height="100%">
								<html:link action="/view-posts?postID=${postsFirstID }"
									styleClass="new-more">Xem thêm <span
										class="glyphicon glyphicon-chevron-right"></span>
								</html:link>
							</div>
							<div class="col-lg-6 childRight" style="padding-left: 0px;">
								<div class="panel panel-default mypanel">
									<div class="panel-heading">
										<div class="panel-title">
											<a href="#">Tin mới đăng</a>
										</div>
									</div>
									<div class="panel-body">
										<ul>
											<logic:iterate id="posts" name="homeForm"
												property="listPostsNews">
												<bean:define id="postsID" name="posts" property="postID"></bean:define>
												<li>
													<div class="col-lg-12">
														<span class="glyphicon glyphicon-stop"></span>
														<html:link action="/view-posts?postID=${postsID }">
															<bean:write property="title" name="posts" />
														</html:link>
													</div>
													<div class="col-lg-12">
														<hr>
													</div>
												</li>
											</logic:iterate>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="panel panel-default mypanel">
									<div class="panel-heading">
										<div class="panel-title">
											<html:link action="/view-list-posts?category=DHNB"> Du học Nhật Bản</html:link>
										</div>
									</div>
									<div class="panel-body">
										<div id="myCarousel-abroad" class="carousel slide"
											data-ride="carousel">
											<!-- Wrapper for slides -->
											<div class="carousel-inner" role="listbox">
												<logic:iterate id="listChild" name="homeForm"
													property="listPostsStudyAbroad" indexId="index">
													<logic:equal value="0" name="index">
														<div class="item active">
															<div class="row">
																<logic:iterate id="posts" name="listChild">
																	<bean:define id="imageName" name="posts"
																		property="image"></bean:define>
																	<div class="col-lg-6">
																		<img src="postsimage/${imageName }" alt="Hinh">
																		<div class="carousel-caption">
																			<bean:write property="title" name="posts" />
																		</div>
																	</div>
																</logic:iterate>
															</div>
														</div>
													</logic:equal>
													<logic:notEqual value="0" name="index">
														<div class="item">
															<div class="row">
																<logic:iterate id="posts" name="listChild">
																	<bean:define id="imageName" name="posts"
																		property="image"></bean:define>
																	<div class="col-lg-6">
																		<img src="postsimage/${imageName }" alt="Hinh">
																		<div class="carousel-caption">
																			<bean:write property="title" name="posts" />
																		</div>
																	</div>
																</logic:iterate>
															</div>
														</div>
													</logic:notEqual>
												</logic:iterate>
											</div>
											<!-- Controls -->
											<a class="left carousel-control" href="#myCarousel-abroad"
												role="button" data-slide="prev"> <span
												class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
												<span class="sr-only">Previous</span>
											</a> <a class="right carousel-control" href="#myCarousel-abroad"
												role="button" data-slide="next"> <span
												class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
												<span class="sr-only">Next</span>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row parent">
							<div class="col-lg-6 childLeft" style="padding-right: 0px;">
								<bean:define id="postsSecond" name="homeForm"
									property="listPostsJapaneseClass[0]"></bean:define>
								<bean:define id="imageNameSecond" name="postsSecond"
									property="image"></bean:define>
								<bean:define id="postsSecondID" name="postsSecond"
									property="postID"></bean:define>
								<img src="postsimage/${imageNameSecond }" width="100%"
									height="100%">
								<html:link action="/view-posts?postID=${postsSecondID }"
									styleClass="new-more">Xem thêm <span
										class="glyphicon glyphicon-chevron-right"></span>
								</html:link>
							</div>
							<div class="col-lg-6 childRight" style="padding-left: 0px;">
								<div class="panel panel-default mypanel">
									<div class="panel-heading">
										<div class="panel-title">
											<html:link action="/view-list-posts?category=LHTN"> Lớp học tiếng Nhật</html:link>
										</div>
									</div>
									<div class="panel-body">
										<ul>
											<logic:iterate id="posts" name="homeForm"
												property="listPostsJapaneseClass">
												<bean:define id="postsID" name="posts" property="postID"></bean:define>
												<li>
													<div class="col-lg-12">
														<span class="glyphicon glyphicon-stop"></span> <html:link
															action="/view-posts?postID=${postsID }">
															<bean:write property="title" name="posts" />
														</html:link>
													</div>
													<div class="col-lg-12">
														<hr>
													</div>
												</li>
											</logic:iterate>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6">
								<div class="panel panel-default mypanel">
									<div class="panel-heading">
										<div class="panel-title">
											<html:link action="/view-list-posts?category=TD"> Tuyển dụng</html:link>
										</div>
									</div>
									<div class="panel-body">
										<ul>
											<logic:iterate id="posts" name="homeForm"
												property="listPostsRecruitment">
												<bean:define id="postsID" name="posts" property="postID"></bean:define>
												<li>
													<div class="col-lg-12">
														<span class="glyphicon glyphicon-stop"></span> <html:link
															action="/view-posts?postID=${postID }">
															<bean:write property="title" name="posts" />
														</html:link>
													</div>
													<div class="col-lg-12">
														<hr>
													</div>
												</li>
											</logic:iterate>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="panel panel-default mypanel">
									<div class="panel-heading">
										<div class="panel-title">
											<html:link action="/view-list-posts?category=TLTK"> Tài liệu tham khảo</html:link>
										</div>
									</div>
									<div class="panel-body">
										<ul>
											<logic:iterate id="posts" name="homeForm"
												property="listPostsDocument">
												<bean:define id="postsID" name="posts" property="postID"></bean:define>
												<li>
													<div class="col-lg-12">
														<span class="glyphicon glyphicon-stop"></span> <html:link
															action="/view-posts?postID=${postsID }">
															<bean:write property="title" name="posts" />
														</html:link>
													</div>
													<div class="col-lg-12">
														<hr>
													</div>
												</li>
											</logic:iterate>
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