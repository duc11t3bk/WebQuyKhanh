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
							<div class="row">
								<div class="col-lg-offset-1 col-lg-5">
									<div class="panel panel-primary">
										<div class="panel-body">
											<div class="row">
												<h5 class="col-lg-offset-1 col-lg-8"><span class="glyphicon glyphicon-ok"></span> Số câu đúng</h5>
												<h5 class="col-lg-3"> : 5</h5>
											</div>
											<div class="row">
												<h5 class="col-lg-offset-1 col-lg-8"><span class="glyphicon glyphicon-time"></span> Tốc độ</h5>
												<h5 class="col-lg-3"> : 5</h5>
											</div>
											<div class="row">
												<h5 class="col-lg-offset-1 col-lg-8"><span class="glyphicon glyphicon-flash"></span> Độ chính xác</h5>
												<h5 class="col-lg-3"> : 5</h5>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-3">
									<button class="btn btn-default"><span class="glyphicon glyphicon-chevron-right"></span> Tiếp</button> 
								</div>
							</div>
							<div class="row">Những từ bạn đã học</div>
							<div class="row">
								<div class="panel panel-default">
									<div class="panel-body">
										<div class="row">
											<div class="col-lg-3"><h5>Khả năng ghi nhớ</h5></div>
											<div class="col-lg-3"><h5>Tiếng Nhật</h5></div>
											<div class="col-lg-3"><h5>Tiếng Việt</h5></div>
											<div class="col-lg-3"><h5>Độ chính xác</h5></div>
										</div>
										<div class="row">
											<div class="col-lg-3">
												<div class="progress">
													<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100%" style="width:80%">80%</div>
												</div>
											</div>
											<div class="col-lg-3"><h5>Watashi</h5></div>
											<div class="col-lg-3"><h5>tôi</h5></div>
											<div class="col-lg-3"><h5>7/8</h5></div>
										</div>
										<div class="row">
											<div class="col-lg-3">
												<div class="progress">
													<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100%" style="width:80%">80%</div>
												</div>
											</div>
											<div class="col-lg-3"><h5>Watashi</h5></div>
											<div class="col-lg-3"><h5>tôi</h5></div>
											<div class="col-lg-3"><h5>7/8</h5></div>
										</div>
										<div class="row">
											<div class="col-lg-3">
												<div class="progress">
													<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100%" style="width:80%">80%</div>
												</div>
											</div>
											<div class="col-lg-3"><h5>Watashi</h5></div>
											<div class="col-lg-3"><h5>tôi</h5></div>
											<div class="col-lg-3"><h5>7/8</h5></div>
										</div>
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