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
	href="css/mycss/stylemanagejapanese.css">
<script src="js/jquery-2.2.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/myjs/includehtml.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#createNew").on("click", function() {
			$("#new-level").css("top", "30%");
			$(".overflow").show();
		});
	});
</script>
<script type="text/javascript">
	function createNewLesson(levelID) {
		console.log("levelID=" + levelID);
		$("#new-lesson").css("top", "30%");
		$(".overflow").show();
		$("#mylevel").val(levelID);
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#form-level").submit(function(e) {
			e.preventDefault();
			var levelName = $("#myLevelName").val();
			var form=this;
			var action=$("#action").val();
			console.log("action"+action);
			var dataAjax;
			if(action=="vocabulary"){
				dataAjax="action=vocabulary&type=validatelevel&levelName=" + levelName;
			}
			else{
				dataAjax="action=translate&type=validatelevel&levelName="+levelName;
			}
			$.ajax({
				type : "POST",
				url : "http://localhost:8080/WebQuyKhanh/manage-japanese.do",
				data : dataAjax,
				dataType : "json",
				success : function(response) {
					var jsonObject = response[0];
					var result = jsonObject.result;
					console.log("result"+result);
					if (result == "success") {
						$(form).submit();
					} else {
						$("#levelNameError").html(jsonObject.levelNameError);
					}
				},
				error : function(errormessage) {
					alert("error" + errormessage);
				},
			});
		});
	});
</script>
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
		<html:hidden styleId="action" property="action" name="japaneseForm" />
		<div class="container">
			<div class="row">
				<div id="new-level" class="col-lg-offset-3 col-lg-6">
					<div class="panel panel-default">
						<div class="panel-body" style="padding-top: 0px">
							<html:form styleId="form-level" action="/manage-japanese">
								<div class="row" style="text-align: right">
									<span class="glyphicon glyphicon-remove"
										style="cursor: pointer"></span>
								</div>
								<div class="row">
									<label class="col-lg-3">Tên mục mới</label>
									<div class="col-lg-8">
										<html:text styleId="myLevelName" styleClass="form-control"
											property="levelName" name="japaneseForm"></html:text>
									</div>
								</div>
								<div class="row" style="text-align: center">
									<label id="levelNameError" style="color: red"></label>
								</div>
								<div class="row" style="text-align: center; margin-top: 20px;">
									<html:submit styleClass="btn btn-default" property="submit">Tạo mục mới</html:submit>
								</div>
							</html:form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div id="new-lesson" class="col-lg-offset-3 col-lg-6">
					<div class="panel panel-default">
						<div class="panel-body" style="padding-top: 0px">
							<html:form action="/manage-japanese">
								<div class="row" style="text-align: right">
									<span class="glyphicon glyphicon-remove"
										style="cursor: pointer"></span>
								</div>
								<div class="row">
									<label class="col-lg-3">Tên bài mới</label>
									<div class="col-lg-8">
										<html:text styleId="myLessonName" styleClass="form-control"
											property="lessonName"></html:text>
										<html:hidden styleClass="form-control" styleId="mylevel"
											property="levelID" />
									</div>
								</div>
								<div class="row" style="text-align: center">
									<label id="lessonNameError" style="color: red"></label>
								</div>
								<div class="row" style="text-align: center; margin-top: 20px;">
									<html:submit styleClass="btn btn-default" property="submit">Tạo bài mới</html:submit>
								</div>
							</html:form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="header2.jsp"></jsp:include>
		<div class="container main-container2">
			<div class="row">
				<div class="content">
					<div class="col-lg-2">
						<jsp:include page="leftContentMenu.jsp"></jsp:include>
					</div>
					<div class="col-lg-10 main-content" style="z-index: 1">
						<div class="panel panel-info">
							<div class="panel-heading">
								<div class="panel-title">Quản lí từ vựng</div>
							</div>
							<div class="panel-body">
								<div class="row">
									<button id="createNew" class="btn-add-new"
										style="padding: 20px; margin-left: 30px">
										<span class="glyphicon glyphicon-new-window"></span> Tạo mục
										mới
									</button>
								</div>
								<!-- Lis level -->
								<logic:iterate id="level" name="japaneseForm"
									property="listLevel">
									<bean:define id="levelID" name="level" property="levelID"></bean:define>
									<div class="row" style="margin-top: 20px">
										<div class="row">
											<div class="col-lg-offset-3 col-lg-6 myItem">
												<div class="col-lg-2">
													<label><span class="glyphicon glyphicon-book"
														style="font-size: 30px"></span> </label>
												</div>
												<div class="col-lg-10" style="margin-top: 5px">
													<h4>
														<bean:write property="levelName" name="level" />
													</h4>
												</div>
											</div>
										</div>
										<!-- List lesson -->
										<div class="col-lg-12 list-lesson"
											style="border: 1px solid black; border-radius: 4px;">
											<div class="col-lg-12"
												style="margin-bottom: 10px; height: 30px;">
												<div class="col-lg-offset-3 col-lg-6 btn-add-lesson"
													onclick="createNewLesson('${levelID}')">
													<span class="glyphicon glyphicon-plus"></span>
												</div>
											</div>
											<div class="col-lg-12"
												style="margin-top: 20px; margin-bottom: 10px;">
												<logic:iterate id="lesson" name="japaneseForm"
													property="listLesson">
													<logic:equal value="${levelID }" name="lesson"
														property="levelID">
														<div class="col-lg-3" style="text-align: center;">
															<html:link href="#x">
																<button class="btn-lesson">
																	<span class="glyphicon glyphicon-file"></span>
																	<bean:write property="lessonName" name="lesson" />
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
				</div>
			</div>
		</div>
		<div id="footer">
			<jsp:include page="footer2.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>