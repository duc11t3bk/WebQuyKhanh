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
	<link rel="stylesheet" type="text/css" href="css/mycss/stylemanageclass.css">
	<script src="js/jquery-2.2.0.min.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/myjs/includehtml.js"></script>

	<script type="text/javascript">
		$(document).ready(function(){
			$("#addClass").on("click",function(){
				$("#new-class").css("top","30%");
				$(".overflow").show();
			});
		});
	</script>
</head>
<body>
	<div class="wrapper">
		<div class="container">
			<div class="row">
				<div id="new-class" class="col-lg-offset-2 col-lg-8">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="panel-title">Thêm lớp mới <span class="glyphicon glyphicon-remove pull-right" style="cursor:pointer"></span></div>
						</div>
						<div class="panel-body" style="padding-top:0px;">
							<div class="row">
								<h5 class="col-lg-3">Tên lớp :</h5>
								<input class="col-lg-6" type="text" />
							</div>
							<div class="row">
								<h5 class="col-lg-3">Học phí :</h5>
								<input class="col-lg-6" type="text" />
							</div>
							<div class="row" style="text-align:center">							
								<input class="btn btn-info" type="button" value="Lưu" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="include" data-include="header2.jsp"></div>
		<div class="container main-container2">
			<div class="row">
				<div class="content">
					<div class="col-lg-2">
						<div class="include" data-include="leftContentAdmin.jsp"></div>
					</div>
					<div class="col-lg-10 main-content">
						<div class="panel panel-info">
							<div class="panel-heading">
								<div class="panel-title">Quản lí lớp</div>
							</div>
							<div class="panel-body">
								<div class="row">
									<button id="addClass" class="btn btn-default" style="padding:20px; margin-left:30px"><span class="glyphicon glyphicon-new-window"></span> Thêm lớp mới </button>
								</div>
								<div class="row" style="margin-top:20px;">
									<h5 class="col-lg-5"><span class="glyphicon glyphicon-search"></span> Tìm kiếm :</h5>
									<input type="text" class="col-lg-5" placeholder="search" />
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