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
	<link rel="stylesheet" type="text/css" href="css/mycss/stylemanagevocatrans.css">	
	<script src="js/jquery-2.2.0.min.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/myjs/includehtml.js"></script>

</head>
<body>
	<div class="wrapper">
		<div class="include" data-include="header2.jsp"></div>
		<div class="container main-container2">
			<div class="row">
				<div class="content">
					<div class="col-lg-2">
						<div class="include" data-include="leftContentTeacher.jsp" ></div>
					</div>
					<div class="col-lg-10 main-content" style="z-index:1">
						<div class="panel panel-info">
							<div class="panel-heading">
								<div class="panel-title">
									<ol class="breadcrumb">
									  	<li><a href="#">Quản lí từ vựng</a></li>
									  	<li><a href=""> Bài 1 - Bài 25</a></li>	
									  	<li class="active">Bài 1</li>					
									</ol>
								</div>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-6">
										<button class="btn btn-default" style="padding:20px; margin-left:30px"><span class="glyphicon glyphicon-repeat"></span> Tải lại từ vựng </button>
									</div>
									<div class="col-lg-6">
										<button class="btn btn-default" style="padding:20px; margin-left:30px"><span class="glyphicon glyphicon-trash"></span> Xóa dữ liệu </button>
									</div>
								</div>
								<div class="row" style="margin-top:20px; height:100px">
									
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