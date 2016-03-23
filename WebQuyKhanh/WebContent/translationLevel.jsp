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
		.level {
			padding: 20px;
			border: 1px solid black ;
			border-radius: 8px;
			text-align: center;
			margin:30px;
		}
		.level:hover {
			padding: 40px;
			border: 2px solid #337AB7;
			cursor: pointer;
		}
	</style>
</head>
<body>
	<div class="wrapper">
		<div class="include" data-include="header.jsp"></div>
		<div class="container main-container">
			<div class="row">
				<div class="content">
					<div class="col-lg-9 main-content">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<div class="panel-title">
									<ol class="breadcrumb">
										<li><a href="#">Luyện dịch câu</a></li>
									</ol>
								</div>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-offset-2 col-lg-8 level">
										<h2> Giáo trình Mina No Nihongo</h2>
										<a href="translationLevelLesson.html"><h5> Bài 1 - 25 Giáo trình Mina no Nihongo</h5></a>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-offset-2 col-lg-8 level">
										<h2> Giáo trình Mina No Nihongo</h2>
										<h5> Bài 26 - 50 Giáo trình Mina no Nihongo</h5>
									</div>
								</div>	
							</div>							
						</div>
					</div>
					<div class="col-lg-3 include" data-include="rightcontent.jsp"></div>
				</div>
			</div>
		</div>
		<div id="footer"class="include" data-include="footer.jsp"></div>
	</div>
</body>
</html>