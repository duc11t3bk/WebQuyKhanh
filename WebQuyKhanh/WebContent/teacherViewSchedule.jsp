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
	href="libs/bootstrap-table-master/dist/bootstrap-table.min.css">
<link rel="stylesheet" type="text/css"
	href="css/mycss/styleframehome.css">
<link rel="stylesheet" type="text/css"
	href="css/mycss/stylezoomimage.css">
<script src="js/jquery-2.2.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="libs/bootstrap-table-master/dist/bootstrap-table.min.js"></script>
<script src="js/myjs/includehtml.js"></script>
<script src="js/myjs/zoom-image.js"></script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header2.jsp"></jsp:include>
		<div class="container main-container2">
			<jsp:include page="zoom-image.jsp"></jsp:include>
			<div class="row">
				<div class="content">
					<div class="col-lg-2">
						<jsp:include page="leftContentMenu.jsp"></jsp:include>
					</div>
					<div class="col-lg-10 main-content" style="z-index: 1">
						<div class="panel panel-info">
							<div class="panel-heading">
								<div class="panel-title" style="text-align: center">Xem
									lịch giảng dạy</div>
							</div>
							<div class="panel-body">
								<bean:define id="post" name="postsForm" property="post"></bean:define>
								<div class="row" style="text-align: center">
									<label style="font-size: 20px"><bean:write property="title" name="post"/> </label>
								</div>
								<div class="row" style="margin-top: 20px;">
									<div class="col-lg-12">
										<div class="col-lg-6">
											<label><span class="glyphicon glyphicon-pencil"></span> Người đăng: <bean:write property="teacherName" name="post"/> </label>
										</div>
										<div class="col-lg-6" style="text-align: center">
											<label><span class="glyphicon glyphicon-calendar"></span> Ngày đăng: <bean:write property="datePosted" name="post"/> </label>
										</div>
									</div>
								</div>
								<div class="row">
									<hr>
								</div>
								<div class="row">
									<div clas="col-lg-12" style="height: 500px; padding: 10px;">
									<bean:define id="imageName" name="post" property="image"></bean:define>
										<img id="image-small" alt="hinh" src="postsimage/${imageName }" width="100%"
											height="100%">
									</div>
								</div>
								<div class="row">
									<hr>
								</div>
								<div class="row" >
									<div class="col-lg-12" id="content">
										<html:hidden styleId="contentHidden" property="content" name="post"/>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="footer">
			<jsp:include page="footer2.jsp"></jsp:include>
		</div>
	</div>
	<script type="text/javascript">
		var content=$("#contentHidden").val();
		$("#content").append(""+content);
	</script>
</body>
</html>