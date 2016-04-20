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
						<div class="row">
							<div class="panel panel-primary" style="background-color:transparent">
								<div class="panel-heading">
									<div class="panel-title">Error Page</div>
								</div>
								<div class="panel-body" style="background-color:transparent">
									<div class="panel panel-primary" >
											<div class="panel-heading">
												<div class="panel-title">Item 1</div>
											</div>
											<div class="panel-body">
												Content item 1
											</div>
									</div>
									<div class="panel panel-primary">
											<div class="panel-heading">
												<div class="panel-title">Item 1</div>
											</div>
											<div class="panel-body">
												Content item 1
											</div>
									</div>
									<div class="panel panel-primary">
											<div class="panel-heading">
												<div class="panel-title">Item 1</div>
											</div>
											<div class="panel-body">
												Content item 1
											</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<nav style="text-align:center">
								<ul class="pagination">
									<li>
										<a href="#" arial-label="Previous">
											<span arial-hidden="true">&laquo</span>
										</a>
									</li>
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li>
										<a href="#" arial-label="Next">
											<span arial-hidden="true">&raquo</span>
										</a>
									</li>
								</ul>
							</nav>
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