<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
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
		<div class="include" data-include="header2.jsp"></div>
		<div class="container main-container2">
			<div class="row">
				<div class="main-content">
					<div class="panel panel-success">
						<div class="panel-body learnProcess">
							<div class="row">
								<h5 class="col-lg-12">Học 5 từ mới : Bài 1</h5>
							</div>
							<div class="row">
								<div class="col-lg-2"><span class="glyphicon glyphicon-pause"></span></div>
								<div class="col-lg-8">
									<div class="progress">
										<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 10%">
											10%
										</div>
									</div>
								</div>
								<div class="col-lg-2">
									<a href="vocaLessonOverview.html"><span class="glyphicon glyphicon-remove"></span></a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="col-lg-1"></div>	
						<div class="col-lg-10" style="background-color:white; height:300px;"></div>
					</div>
				</div>
			</div>
		</div>
		<div id="footer"class="include" data-include="footer2.jsp"></div>
	</div>
</body>
</html>