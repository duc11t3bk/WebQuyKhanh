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
				<div class="content">
					<div class="col-lg-9 main-content">
						<div class="panel panel-primary" style="background-color:transparent">
							<div class="panel-heading"> 
								<div class="panel-title">Thông tin cá nhân</div>
							</div>
							<div class="panel-body" style="background-color:transparent">
								<div class="panel panel-default" >
									<div class="panel-heading">
										<div class="panel-title">Đổi mật khẩu</div>
									</div>
									<div class="panel-body">
										<div class="row">								
											<input class="col-lg-offset-1 col-lg-10" type="text" placeholder="Mật khẩu hiện tại" />
										</div>
										<div class="row">								
											<input class="col-lg-offset-1 col-lg-10" type="text" placeholder="Nhập mật khẩu mới" />
										</div>
										<div class="row">								
											<input class="col-lg-offset-1 col-lg-10" type="text" placeholder="Xác nhận mật khẩu mới" />
										</div>
										<div class="row" style="text-align:center">
											<input class="btn btn-default" type="button" value="Đổi mật khẩu"/>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<div class="panel-title">Thông tin</div>
									</div>
									<div class="panel-body">
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
											<h5 class="col-lg-5" style="display:inline">Email:</h5>
											<input class="col-lg-5" type="text" value="nnnn@gmail.com" />
										</div>
										<div class="row">
											<h5 class="col-lg-5" style="display:inline"><span class="glyphicon glyphicon-earphone"></span> Số điện thoại:</h5>
											<input  class="col-lg-5" type="text" value="123456" />
										</div>
										<div class="row" style="text-align:center">
											<input class="btn btn-default" type="button" value="Lưu" />
										</div>										
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