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
		.lesson-item {
			padding: 10px;
			border-bottom: 1px solid #ddd;	
		}
	</style>
</head>
<body>
	<div class="wrapper">
		<div class="include" data-include="header.jsp"></div>
		<div class="container main-container">
			<div class="row">
				<div class="main-content">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="panel-title">
								<ol class="breadcrumb">
									<li><a href="vocaLevel.html">Học từ vựng</a></li>
									<li><a href="">Bài 1- 25</a></li>
									<li class="active">Bài 1</li>
								</ol>	
							</div>
						</div>
						<div class="panel-body">
							<div class="panel panel-default">
								<div class="panel-body">
									<div class="row">
										<div class="col-lg-3">
											<input class="btn btn-default" type="button" value="Bài 1"/>		
										</div>
										<div class="col-lg-9">
											<div class="progress">
												<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width:60%">
													60%
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-offset-3 col-lg-9">
											<div class="row">
												<input class="col-lg-3" type="text" value="Tùy chỉnh" />
												<a href="vocaLessonLearn.html"><input  class="col-lg-3" type="button" value="Học những từ này" /></a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-3"><h5>28 từ</h5></div>
								<div class="col-lg-3"><span class="glyphicon glyphicon-eye-open"></span> <h5>Học</h5></div>
								<div class="col-lg-3"><span class="glyphicon glyphicon-tint"></span> <h5>Ôn tập</h5></div>
								<div class="col-lg-3"><button class="btn btn-default"><span class="glyphicon glyphicon-cog"> Bỏ qua</span> </button> </div>
							</div>
							<div class="panel panel-default">
								<div class="panel-body" style="padding:20px;">					
									<div class="row lesson-item">
										<div class="col-lg-4">watashi</div>
										<div class="col-lg-4">Tôi</div>
										<div class="col-lg-4"><span class="glyphicon glyphicon-tint"></span></div>
									</div>
									<div class="row lesson-item">
										<div class="col-lg-4">watashi</div>
										<div class="col-lg-4">Tôi</div>
										<div class="col-lg-4"><span class="glyphicon glyphicon-tint"></span></div>
									</div>
									<div class="row lesson-item">
										<div class="col-lg-4">watashi</div>
										<div class="col-lg-4">Tôi</div>
										<div class="col-lg-4"><span class="glyphicon glyphicon-tint"></span></div>
									</div>
								</div>
							</div>							
						</div>
					</div>	
				</div>
			</div>
		</div>
		<div id="footer"class="include" data-include="footer.jsp"></div>
	</div>
</body>
</html>