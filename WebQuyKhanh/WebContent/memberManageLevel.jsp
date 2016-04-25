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
<link rel="stylesheet" type="text/css" href="libs/MaterialDesign-Webfont-master/css/materialdesignicons.min.css">
<link rel="stylesheet" type="text/css"
	href="css/mycss/styleframehome.css">
<link rel="stylesheet" type="text/css"
	href="css/mycss/stylemanagejapanese.css">
<script src="js/jquery-2.2.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/myjs/includehtml.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var myitem = $(".myItem");
		var listlesson = $(".list-lesson");
		for (var j = 0; j < listlesson.length; j++) {
			$(listlesson[j]).slideUp();
		}
		for (var i = 0; i < myitem.length; i++) {
			$(myitem[i]).on("click", function() {
				var listlesson = $(".list-lesson");
				for (var j = 0; j < listlesson.length; j++) {
					$(listlesson[j]).slideUp();
				}
				var divParent = $(this).parent().parent();
				var divLesson = $(divParent).find(".list-lesson")[0];
				var display = $(divLesson).css("display");
				if (display == "none") {
					$(divLesson).slideDown();
				} else {
					$(divLesson).slideUp();
				}
			});
		}
	});
</script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="container main-container">
			<div class="row">
				<div class="content">
					<div class="col-lg-9 main-content">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<div class="panel-title">
									<ol class="breadcrumb">
										<logic:equal value="vocabulary" name="japaneseForm" property="action">
											<li><a href="#">Học từ vựng</a></li>
										</logic:equal>
										<logic:equal value="translate" name="japaneseForm" property="action">
											<li><a href="#">Luyện dịch câu</a></li>
										</logic:equal>
									</ol>
								</div>
							</div>
							<div class="panel-body">
								<logic:iterate id="level" name="japaneseForm"
									property="listLevel">
									<bean:define id="levelID" name="level" property="levelID"></bean:define>
									<div class="row" style="margin-top: 20px">
										<div class="row">
											<div class="col-lg-offset-3 col-lg-6 myItem">
												<div class="col-lg-12">
													<div class="col-lg-2">
														<label><span class="glyphicon glyphicon-book"
															style="font-size: 30px"></span> </label>
													</div>
													<div class="col-lg-10" style="margin-top: 5px">
														<h4><bean:write property="levelName" name="level"/> </h4>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-12 list-lesson"
											style="border: 1px solid black; border-radius: 4px;">
											<div class="col-lg-12"
												style="margin-bottom: 10px; height: 30px;">
												<div class="col-lg-offset-3 col-lg-6 btn-add-lesson">
													<span class="glyphicon glyphicon-plus"></span>
												</div>
											</div>
											<div class="col-lg-12"
												style="margin-top: 20px; margin-bottom: 10px;">
												<logic:iterate id="lesson" name="japaneseForm" property="listLesson">
													<bean:define id="lessonID" property="lessonID" name="lesson"></bean:define>
													<logic:equal value="${levelID }" property="levelID" name="lesson" >
														<div class="col-lg-3" style="text-align: center;">
															<html:link action="/member-manage-lesson?lessonID=${lessonID }">
																<button class="btn-lesson">
																	<i class="mdi mdi-translate"></i>
																	<bean:write property="lessonName" name="lesson"/> 
																</button>
															</html:link>
														</div>
													</logic:equal>
												</logic:iterate>
											</div>
										</div>
									</div>
								</logic:iterate>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<jsp:include page="rightcontent.jsp"></jsp:include>
					</div>
				</div>
			</div>
		</div>
		<div id="footer">
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>