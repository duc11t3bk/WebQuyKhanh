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
		.learnProcess{
			background-color :#baffc2;
		}
		.question {
			margin-bottom:20px;
		}
		.question span{
			font-size: 80px;
		}
		.question p{
			font-size: 30px;
		}
		body {
			background-image:none;
		}
		.answer{
			border:1px solid black;
			border-radius: 20px;
			height: 50px;
			margin-top: 20px;
			margin-bottom: 20px;
		}
	</style>
</head>
<body>
	<div class="wrapper">
		<div class="include" data-include="header2.jsp"></div>
		<div class="container main-container2">
			<div class="row">
				<div class="main-content">
					<div class="panel panel-success">
						<div class="panel-body learnProcess">
							<div class="row">
								<h5 class="col-lg-12">Luyện dịch câu : Bài 1</h5>
							</div>
							<div class="row">
								<div class="col-lg-2" style="text-align:right"><span class="glyphicon glyphicon-pause"></span></div>
								<div class="col-lg-8">
									<div class="progress">
										<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 10%">
											10%
										</div>
									</div>
								</div>
								<div class="col-lg-2">
									<span class="glyphicon glyphicon-remove"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12">	
						<div class="row">
							<div class="col-lg-2">
								<div class="mybtn">
									<span class="glyphicon glyphicon-chevron-left"></span>
									<p>Trước</p>
								</div>
							</div>
							<div class="col-lg-8">
								<div class="row question">
									<span class="col-lg-offset-1 col-lg-2 glyphicon glyphicon-question-sign"></span>
									<p class="col-lg-9">Tên tôi là Sakura</p>
								</div>
								<div class="row">
									Câu trả lời của bạn :
								</div>
							</div>
							<div class="col-lg-2">
								<div class="mybtn">
									<span class="glyphicon glyphicon-chevron-right"></span>
									<p>Tiếp</p>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-offset-1 col-lg-10 answer">
								
							</div>
						</div>
						<div class="row">
							<div class="col-lg-offset-1 col-lg-10">
								Câu trả lời :
							</div>
						</div>
						<div class="row">
							<div class="col-lg-offset-1 col-lg-10">
								<p>This is answer</p>
							</div>
						</div> 
					</div>
				</div>
			</div>
		</div>
		<div id="footer"class="include" data-include="footer2.jsp" style="color:black"></div>
	</div>
</body>
</html>