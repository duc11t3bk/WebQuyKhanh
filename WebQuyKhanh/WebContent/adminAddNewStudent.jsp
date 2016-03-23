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
						<div class="include" data-include="leftContentAdmin.jsp"></div>
					</div>
					<div class="col-lg-10 main-content">
						<div class="panel panel-info">
							<div class="panel-heading">
								<div class="panel-title">Thông tin cá nhân</div>
							</div>
							<div class="panel-body">
								<div class="panel panel-default">
									<div class="panel-heading">
										<div class="panel-title">Tạo tài khoản học viên mới</div>							
									</div>
									<div class="panel-body">
										<div class="row">
											<h5 class="col-lg-3"><span class="gkyphicon glyphicon-user"></span> Họ, tên :</h5>
											<input class=" col-lg-5" type="text" placeholder="Họ, tên" />
										</div>
										<div class="row">
											<h5 class="col-lg-3"><span class="glyphicon glyphicon-envelope"></span> Email :</h5>
											<input class="col-lg-5" type="text" placeholder="Email" />
										</div>
										<div class="row">
											<h5 class="col-lg-3"><span class="glyphicon glyphicon-earphone"></span> Số điện thoại :</h5>
											<input class="col-lg-5" type="text" placeholder="Nhập số điện thoại" />
										</div>
										<div class="row">
											<h5 class="col-lg-3"><span class="glyphicon glyphicon-hand-right"></span> Chọn lớp :</h5>
											<input class="col-lg-5" type="text" placeholder="Chọn lớp" />
										</div>
										<div class="row">
											<h5 class="col-lg-3"><span class="glyphicon glyphicon-usd"></span> Số tiền phải đóng :</h5>
											<input class=" col-lg-5" type="text" placeholder="Số tiền phải đóng" />
										</div>
										<div class="row">
											<h5 class="col-lg-3"><span class="glyphicon glyphicon-usd"></span> Số tiền đóng :</h5>
											<input class="col-lg-5" type="text" placeholder="Số tiền đóng" />
										</div>
										<div class="row">
											<input class="btn btn-info col-lg-offset-4 col-lg-3" type="button" value="Thêm học viên" />
										</div>
										<div class="row">
											<input class="btn btn-info col-lg-offset-4 col-lg-3" type="button" value="Lưu chỉnh sửa" />
										</div>												
									</div>
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