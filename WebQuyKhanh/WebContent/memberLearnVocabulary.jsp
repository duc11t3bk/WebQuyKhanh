<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta name="author" content="Minh Duc" />
<title>Trung Tâm Du Học và Nhật Ngữ Quý Khanh</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="css/mycss/styleframehome.css">
<link rel="stylesheet" type="text/css"
	href="css/mycss/stylelearnjapanese.css">
<script src="js/jquery-2.2.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/myjs/includehtml.js"></script>

<script type="text/javascript">
	function a() {
		$.ajax({
			type : "POST",
			url : "",
			data : "http://localhost:8080/WebQuyKhanh/member-learn-vocabulary",
			dataType : "json",
			success : function(response) {

			},
			error : function(errormessage) {
				alert("error :" + errormessage);
			},
		});
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		var response = $("#dataResponse").val();
		console.log("jsonObject \n" + response);
		var jsonObject = JSON.parse(response);
		var primary_word = jsonObject.primary_word;
		var extra_word = jsonObject.extra_word;
		var QUESTION = 1;
		var formLearns = $(".form-learn");
		for (var i = 0; i < formLearns.length; i++) {
			$(formLearns[i]).css("display", "none");
		}
		$("#form-new-word").css("display","block");
	});
</script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header2.jsp"></jsp:include>
		<div class="container main-container2">
			<div class="main-content">
				<div class="row">
					<html:hidden styleId="dataResponse" property="dataResponse"
						name="learnJapaneseForm" />
					<div class="panel panel-success">
						<div class="panel-body learnProcess">
							<div class="row">
								<h5 class="col-lg-12">Học 5 từ mới : Bài 1</h5>
							</div>
							<div class="row">
								<div class="col-lg-2">
									<span class="glyphicon glyphicon-pause"></span>
								</div>
								<div class="col-lg-8">
									<div class="progress">
										<div class="progress-bar progress-bar-success"
											role="progressbar" aria-valuenow="60" aria-valuemin="0"
											aria-valuemax="100" style="width: 10%">10%</div>
									</div>
								</div>
								<div class="col-lg-2">
									<a href="vocaLessonOverview.html"><span
										class="glyphicon glyphicon-remove"></span></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row form-container">
					<div id="form-new-word" class="col-lg-12 form-learn">
						<div class="col-lg-offset-1 col-lg-10">
							<div class="col-lg-offset-1 col-lg-1">
								<span class="glyphicon glyphicon-volume-up my-volume"
									style="font-size: 50px;"></span>
							</div>
							<div class="col-lg-9">
								<div class="col-lg-12">
									<div class="col-lg-9" style="padding-left: 0px">
										<label style="font-size: 40px">Watashi</label>
									</div>
									<div class="col-lg-3">
										<div class="col-lg-12 btn-next">
											<div class="col-lg-12">
												<span style="font-size: 40px"
													class="glyphicon glyphicon-chevron-right"></span>
											</div>
											<label style="margin-top: 10px; font-size: 20px">Tiếp</label>
										</div>
									</div>
								</div>
								<div class="col-lg-12">
									<hr>
								</div>
								<div class="col-lg-12">
									<h5 style="font-size: 30px">Tôi</h5>
								</div>
								<div class="col-lg-12">
									<hr>
								</div>
							</div>
						</div>
					</div>
					<div id="form-question-vi-ja" class="col-lg-12 form-learn">
						<div class="col-lg-offset-1 col-lg-10">
							<div class="col-lg-12" style="margin-bottom: 20px">
								<div class="col-lg-offset-1 col-lg-1">
									<span class="glyphicon glyphicon-question-sign"
										style="font-size: 50px"></span>
								</div>
								<div class="col-lg-8">
									<label style="font-size: 50px">Tôi</label>
								</div>
								<div class="col-lg-2">
									<span class="glyphicon glyphicon-time" style="font-size: 50px"></span>
								</div>
							</div>
							<div class="col-lg-12"
								style="margin-bottom: 20px; margin-top: 50px;">
								<div class="col-lg-offset-2 col-lg-3 btn-answer">Item 1</div>
								<div class="col-lg-offset-1 col-lg-3 btn-answer">item 2</div>
							</div>
							<div class="col-lg-12" style="margin-bottom: 20px;">
								<div class="col-lg-offset-2 col-lg-3 btn-answer">Item 1</div>
								<div class="col-lg-offset-1 col-lg-3 btn-answer">item 2</div>
							</div>
							<div class="col-lg-12">
								<div class="col-lg-offset-4 col-lg-3 btn-answer">
									<div class="col-lg-3"
										style="padding-left: 0px; font-size: 20px">
										<span class="glyphicon glyphicon-repeat"></span>
									</div>
									Xem câu trả lời
								</div>
							</div>
						</div>
					</div>
					<div id="form-question-ja-vi" class="col-lg-12 form-learn">
						<div class="col-lg-offset-1 col-lg-10">
							<div class="col-lg-12" style="margin-bottom: 20px">
								<div class="col-lg-offset-1 col-lg-1">
									<span class="glyphicon glyphicon-question-sign"
										style="font-size: 50px"></span>
								</div>
								<div class="col-lg-8">
									<label style="font-size: 50px">Tôi</label>
								</div>
								<div class="col-lg-2">
									<span class="glyphicon glyphicon-time" style="font-size: 50px"></span>
								</div>
							</div>
							<div class="col-lg-12"
								style="margin-bottom: 20px; margin-top: 50px;">
								<div class="col-lg-12" style="margin-bottom: 10px;">
									<div class="col-lg-offset-3 col-lg-5 btn-answer">Item 1</div>
								</div>
								<div class="col-lg-12" style="margin-bottom: 10px;">
									<div class="col-lg-offset-3 col-lg-5 btn-answer">Item 1</div>
								</div>
								<div class="col-lg-12" style="margin-bottom: 10px;">
									<div class="col-lg-offset-3 col-lg-5 btn-answer">Item 1</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="col-lg-offset-4 col-lg-3 btn-answer">
									<div class="col-lg-3"
										style="padding-left: 0px; font-size: 20px">
										<span class="glyphicon glyphicon-repeat"></span>
									</div>
									Xem câu trả lời
								</div>
							</div>
						</div>
					</div>
					<div id="form-question-listen-1" class="col-lg-12 form-learn">
						<div class="col-lg-offset-1 col-lg-10">
							<div class="col-lg-12" style="margin-bottom: 20px">
								<div class="col-lg-offset-1 col-lg-1">
									<span class="glyphicon glyphicon-question-sign"
										style="font-size: 50px"></span>
								</div>
								<div class="col-lg-8">
									<div class="col-lg-12" style="text-align: center;">
										<span class="glyphicon glyphicon-volume-up my-volume-question"></span>
									</div>
									<div class="col-lg-12">
										<h5>Chọn câu trả lời đúng :</h5>
									</div>
								</div>
								<div class="col-lg-2">
									<span class="glyphicon glyphicon-time" style="font-size: 50px"></span>
								</div>
							</div>
							<div class="col-lg-12"
								style="margin-bottom: 20px; margin-top: 50px;">
								<div class="col-lg-offset-2 col-lg-3 btn-answer">Item 1</div>
								<div class="col-lg-offset-1 col-lg-3 btn-answer">item 2</div>
							</div>
							<div class="col-lg-12" style="margin-bottom: 20px;">
								<div class="col-lg-offset-2 col-lg-3 btn-answer">Item 1</div>
								<div class="col-lg-offset-1 col-lg-3 btn-answer">item 2</div>
							</div>
							<div class="col-lg-12">
								<div class="col-lg-offset-4 col-lg-3 btn-answer">
									<div class="col-lg-3"
										style="padding-left: 0px; font-size: 20px">
										<span class="glyphicon glyphicon-repeat"></span>
									</div>
									Xem câu trả lời
								</div>
							</div>
						</div>
					</div>
					<div id="form-question-listen-3" class="col-lg-12 form-learn">
						<div class="col-lg-offset-1 col-lg-10">
							<div class="col-lg-12">
								<div class="col-lg-offset-1 col-lg-1">
									<span class="glyphicon glyphicon-question-sign"
										style="font-size: 50px;"></span>
								</div>
								<div class="col-lg-6" style="font-size: 50px;">
									<label>Người kia, người đó (Cách nói lịch sự)</label>
								</div>
								<div class="col-lg-3">
									<div class="col-lg-12 btn-next">
										<div class="col-lg-12">
											<span style="font-size: 40px"
												class="glyphicon glyphicon-chevron-right"></span>
										</div>
										<label style="margin-top: 10px; font-size: 20px">Kiểm
											tra</label>
									</div>
								</div>
								<div class="col-lg-1">
									<span class="glyphicon glyphicon-time" style="font-size: 50px;"></span>
								</div>
							</div>
							<div class="col-lg-12" style="margin-top: 50px;">
								<div class="col-lg-12" style="text-align: center">
									<div class="col-lg-offset-1 col-lg-4">
										<span class="glyphicon glyphicon-volume-up my-volume-question"></span>
									</div>
									<div class="col-lg-4">
										<span class="glyphicon glyphicon-volume-up my-volume-question"></span>
									</div>
								</div>
								<div class="col-lg-12"
									style="text-align: center; margin-top: 20px;">
									<div class="col-lg-offset-1 col-lg-8">
										<span class="glyphicon glyphicon-volume-up my-volume-question"></span>
									</div>
								</div>
								<div class="col-lg-12" style="margin-top: 20px;">
									<div class="col-lg-offset-3 col-lg-4 btn-answer">
										<div class="col-lg-3"
											style="padding-left: 0px; font-size: 20px">
											<span class="glyphicon glyphicon-repeat"></span>
										</div>
										Xem câu trả lời
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="form-question-write" class="col-lg-12 form-learn">
						<div class="col-lg-offset-1 col-lg-10">
							<div class="col-lg-12">
								<div class="col-lg-offset-1 col-lg-1">
									<span class="glyphicon glyphicon-question-sign"
										style="font-size: 50px;"></span>
								</div>
								<div class="col-lg-6" style="font-size: 50px;">
									<label>Người kia, người đó (Cách nói lịch sự)</label>
								</div>
								<div class="col-lg-3">
									<div class="col-lg-12 btn-next">
										<div class="col-lg-12">
											<span style="font-size: 40px"
												class="glyphicon glyphicon-chevron-right"></span>
										</div>
										<label style="margin-top: 10px; font-size: 20px">Kiểm
											tra</label>
									</div>
								</div>
								<div class="col-lg-1">
									<span class="glyphicon glyphicon-time" style="font-size: 50px;"></span>
								</div>
							</div>
							<div class="col-lg-offset-1 col-lg-12">
								<h5>Nhập câu trả lời tiếng Nhật cho tiếng Việt ở trên</h5>
							</div>
							<div class="col-lg-12" style="margin-top: 20px;">
								<div class="col-lg-12">
									<div class="col-lg-10">
										<input type="text" class="text-answer">
									</div>
								</div>
								<div class="col-lg-12" style="margin-top: 20px;">
									<div class="col-lg-offset-3 col-lg-4 btn-answer">
										<div class="col-lg-3"
											style="padding-left: 0px; font-size: 20px">
											<span class="glyphicon glyphicon-repeat"></span>
										</div>
										Xem câu trả lời
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="footer">
			<jsp:include page="footer2.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>