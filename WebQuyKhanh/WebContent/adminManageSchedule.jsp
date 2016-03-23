<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8"/>
	<meta name="author" content="Minh Duc" />
	<title>Trung Tâm Du Học và Nhật Ngữ Quý Khanh</title>

	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="css/mycss/styleframehome.css">

	<script src="js/jquery-2.2.0.min.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/myjs/includehtml.js"></script>
	<style type="text/css">
		.teacher-info h5{
			display: inline;
		}
	</style>
</head>
<body>
	<div class="wrapper">
		<div class="include" data-include="header2.jsp"></div>
		<div class="container main-container2">
			<div class="row">
				<div class="content">
					<div class="col-lg-2">
						<div class="include" data-include="leftContentAdmin.jsp" ></div>
					</div>
					<div class="col-lg-10 main-content">
						<div class="panel panel-info">
							<div class="panel-heading">
								<div class="panel-title">Cập nhật trang giới thiệu</div>
							</div>
							<div class="panel-body">
								<div class="row">
									<h5 class="col-lg-2">Chọn phòng :</h5>
									<input class="col-lg-2" type="text" value="Chọn phòng" />
								</div>
								<div class="row">
									This is body
								</div>
							</div>
						</div>						
					</div>
				</div>
			</div>
		</div>
		<div id="footer" class="include" data-include="footer2.jsp"></div>
	</div>
</body>
</html>