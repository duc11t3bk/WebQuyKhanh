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
<link rel="stylesheet" type="text/css" href="css/mycss/stylezoomimage.css">
<script src="js/jquery-2.2.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/myjs/includehtml.js"></script>
<script src="js/myjs/zoom-image.js"></script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="zoom-image.jsp"></jsp:include>
		<div class="container" style="margin-top: 50px;">
			<div class="row">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<logic:iterate id="posts" name="postsForm" property="listPostsNews" indexId="index">
							<logic:equal value="0" name="index">
								<li data-target="#myCarousel" data-slide-to="${index }" class="active"></li>
							</logic:equal>
							<logic:notEqual value="0" name="index">
								<li data-target="#myCarousel" data-slide-to="${index }" ></li>
							</logic:notEqual>
						</logic:iterate>
					</ol>
					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<logic:iterate id="posts" name="postsForm" property="listPostsNews" indexId="index">
							<bean:define id="imageName" name="posts" property="image"></bean:define>
							<bean:define id="postID" name="posts" property="postID"></bean:define>
							<logic:equal value="0" name="index">
								<div class="item active">
									<html:link action="/view-posts?postID=${postID }"><img src="postsimage/${imageName }" alt="Hinh"></html:link>
									<div class="carousel-caption"><bean:write name="posts" property="title"/> </div>
								</div>
							</logic:equal>
							<logic:notEqual value="0" name="index">
								<div class="item">
									<html:link action="/view-posts?postID=${postID }"><img src="postsimage/${imageName }" alt="Hinh"></html:link>
									<div class="carousel-caption"><bean:write name="posts" property="title"/></div>
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
						<div class="row">
							<div class="panel panel-default mypanel">
								<bean:define id="post" name="postsForm" property="post"></bean:define>
								<div class="panel-heading">
									<div class="panel-title"><bean:write property="categoryName" name="post"/> </div>
								</div>
								<div class="panel-body" style="padding: 20px;">
									<div class="row" style="text-align: left;">
										<div class="col-lg-12">
											<label><bean:write property="title" name="post"/> </label>
										</div>
									</div>
									<div class="row">
										<bean:define id="imageName" name="post" property="image"></bean:define>
										<div class="col-lg-12" style="width: 100%; height: 300px;">
											<img id="image-small" class="postsimage" src="postsimage/${imageName }">
										</div>
									</div>
									<div class="row" style="margin-top: 20px;">
										<div class="col-lg-12" id="content">
											<html:hidden styleId="contentHidden" property="content" name="post"/>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-12">
											<div class="col-lg-6">
												<a class="btn btn-default" href="#x"><span
													class="glyphicon glyphicon-thumbs-up"></span> Like</a> <span>500</span>
											</div>
											<div class="col-lg-6" style="color:#9E9E9E">
												<div class="col-lg-6"><h5 style="text-align: right"><span class="glyphicon glyphicon-calendar"></span> <bean:write property="datePosted" name="post"/> </h5></div>
												<div class="col-lg-6"><h5 style="text-align: right"><span class="glyphicon glyphicon-pencil"></span> <bean:write property="teacherName" name="post"/> </h5></div>
											</div>
										</div>
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
	<script type="text/javascript">
		var content=$("#contentHidden").val();
		$("#content").append(""+content);
	</script>
</body>
</html>