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
										<div class="panel-title">Tạo tài khoản giáo viên mới</div>							
									</div>
									<div class="panel-body">
										<!--Email làm tài khoản -->
										<div class="row">
											<input class="col-lg-offset-3 col-lg-5" type="text" placeholder="Mật khẩu" />
										</div>
										<div class="row">
											<input class="col-lg-offset-3 col-lg-5" type="text" placeholder="Nhập lại mật khẩu" />
										</div>										
									</div>
								</div>

								<div class="panel panel-default">
									<div class="panel-heading">
										<div class="panel-title">Thông tin</div>
									</div>
									<div class="panel-body teacher-info">
										<div class="row">
											<div class="col-lg-5">
												<h5 style="display:inline">Cập nhật ảnh đại diện :</h5>
												<input class="btn btn-default" type="button" value="Upload"/>
											</div>
											<div class="col-lg-7">
												<div class="row">
												<img src="image/avata-Katie.png" width="100px"; height="100px;">
												</div>
												<div>
													<h5>Xem trước</h5>
												</div>
											</div>
										</div>				
										<div class="row">
											<h5 class="col-lg-5"><span class="glyphicon glyphicon-user"></span> Họ, tên :</h5>
											<input class="col-lg-5" type="text" />
										</div>
										<div class="row">
											<h5 class="col-lg-5"><span class="glyphicon glyphicon-calendar"></span> Ngày sinh :</h5>
											<input class="col-lg-5" type="text" />
										</div>
										<div class="row">
											<h5 class="col-lg-5"><span class="glyphicon glyphicon-unchecked"></span> Giới tính :</h5>
											<input class="col-lg-5" type="text" />
										</div>
										<div class="row">
											<h5 class="col-lg-5"><span class="glyphicon glyphicon-earphone"></span> Số điện thoại :</h5>
											<input class="col-lg-5" type="text" />
										</div>
										<div class="row">
											<h5 class="col-lg-5"><span class="glyphicon glyphicon-envelope"></span> Email :</h5>
											<input class="col-lg-5" type="text" />
										</div>
										<div class="row">
											<h5 class="col-lg-5"><span class="glyphicon glyphicon-home"></span> Địa chỉ :</h5>
											<input class="col-lg-5" type="text" />
										</div>
										<div class="row">
											<h5 class="col-lg-5"><span class="glyphicon glyphicon-book"></span> Bằng cấp :</h5>
											<input class="col-lg-5" type="text" />
										</div>
										<div class="row">
											<h5 class="col-lg-5"><span class="glyphicon glyphicon-calendar"></span> Ngày kí hợp đồng :</h5>
											<input class="col-lg-5" type="text" />
										</div>
										<div class="row" style="text-align:center">			
											<input class="btn btn-info" type="button" value="Lưu" />
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