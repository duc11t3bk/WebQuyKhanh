<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<title>Trung Tâm Du Học và Nhật Ngữ Quý Khanh</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/mycss/stylerightcontent.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<script src="js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#datepicker").datepicker();
	});
</script>
</head>
<body>
	<div class="panel panel-primary" style="margin-top: 20px">
		<div class="panel-heading">
			<div class="panel-title">Đăng ký học</div>
		</div>
		<div class="panel-body" style="text-align: center">
			<div class="row">
				<input type="text" value="" placeholder="Email" />
			</div>
			<div class="row">
				<input type="text" value="" placeholder="Số điện thoại" />
			</div>
			<div class="row">
				<input type="text" value="" placeholder="Chọn lớp" />
			</div>
			<div class="row">
				<input type="submit" value="Đăng ký" />
			</div>
		</div>
	</div>
	<div id="datepicker" style="margin: auto"></div>
	<div class="panel panel-primary" style="margin-top: 20px">
		<div class="panel-heading">
			<div class="panel-title">Top học viên xuất sắc</div>
		</div>
		<div class="panel-body">
			<div id="myCarousel-right" class="carousel slide"
				data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel-right" data-slide-to="0"
						class="active"></li>
					<li data-target="#myCarousel-right" data-slide-to="1"></li>
					<li data-target="#myCarousel-right" data-slide-to="2"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="image/phusi3.jpg" alt="Hinh">
						<div class="carousel-caption">...</div>
					</div>
					<div class="item">
						<img src="image/image2.jpg" alt="Hinh">
						<div class="carousel-caption"></div>
					</div>
					<div class="item">
						<img src="image/image1.jpg" alt="Hinh">
						<div class="carousel-caption"></div>
					</div>
				</div>

				<!-- Controls -->
				<a class="left carousel-control" href="#myCarousel-right"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel-right"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</div>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<div class="panel-title">Thống kê</div>
		</div>
		<div class="panel-body">
			<p>Tổng số lượt truy cập : 123</p>
			<p>Số lượt truy cập hôm nay: 123</p>
			<p>Thành viên: 123</p>
		</div>
	</div>
</body>
</html>