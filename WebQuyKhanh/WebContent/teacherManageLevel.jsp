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
<link rel="stylesheet" type="text/css" media="all"
	href="libs/MaterialDesign-Webfont-master/css/materialdesignicons.min.css">
<link rel="stylesheet" type="text/css"
	href="css/mycss/styleframehome.css">
<link rel="stylesheet" type="text/css"
	href="css/mycss/stylemanagejapanese.css">
<link rel="stylesheet" type="text/css" href="css/mycss/styleformconfirm.css">
<script src="js/jquery-2.2.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/myjs/includehtml.js"></script>
<script src="js/myjs/form-confirm.js" ></script>
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
		$("#add-level").on("click",function() {
			var levelName = $("#myLevelName").val();
			var action=$("#action").val();
			console.log("action"+action);
			var dataAjax;
			if(action=="vocabulary"){
				dataAjax="action=vocabulary&type=add-level&levelName="+levelName;
			}
			else{
				dataAjax="action=translate&type=add-level&levelName="+levelName;
			}
			$.ajax({
				type : "POST",
				url : "http://localhost:8080/WebQuyKhanh/manage-level.do",
				data : dataAjax,
				dataType : "json",
				success : function(response) {
					var jsonObject = response[0];
					var result = jsonObject.result;
					console.log("result"+result);
					if (result == "success") {
						$("#levelNameError").html(jsonObject.message);
						setTimeout(function(){
							window.location.href="http://localhost:8080/WebQuyKhanh/manage-level.do?action="+action;
						},1000);
					} else {
						$("#levelNameError").html(jsonObject.message);
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
	$(document).ready(function(){
		$("#add-lesson").on("click",function(){	
			var lessonName=$("#myLessonName").val();
			console.log("lesson name="+lessonName);
			var levelID=$("#mylevel").val();
			var action=$("#action").val();
			var dataAjax;
			if("vocabulary"==action){
				dataAjax="action="+action+"&type=add-lesson&lessonName="+lessonName+"&levelID="+levelID;
			}
			else{
				dataAjax="action="+action+"&type=add-lesson&lessonName="+lessonName+"&levelID="+levelID;
			}
			$.ajax({
				type : "POST",
				url : "http://localhost:8080/WebQuyKhanh/manage-level.do",
				data : dataAjax,
				dataType : "json",
				success : function(response){
					var jsonObject= response[0];
					var result= jsonObject.result;
					if(result=="success"){
						$("#lessonNameError").html(jsonObject.message);
						setTimeout(function(){
							window.location.href="http://localhost:8080/WebQuyKhanh/manage-level.do?action="+action;
						}, 1000);
					}
					if(result=="failed"){
						$("#lessonNameError").html(jsonObject.message);
					}
				},
				error : function(errormessage){
					alert("error :"+errormessage);
				}
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
<script type="text/javascript">
	function deleteLevel(action,levelID){
		var path="http://localhost:8080/WebQuyKhanh/manage-level.do?action="+action+"&type=delete&levelID="+levelID;
		console.log("action="+action+"levelID="+levelID);
		formConfirm(path,"Bạn có chắc chắn muốn xóa mục này ?");
	}
</script>
</head>
<body>
	<div class="wrapper">
		<html:hidden styleId="action" property="action" name="japaneseForm" />
		<!------------------------- Add new level -------------------------------->
		<div class="container">
			<div class="row">
				<div id="new-level" class="col-lg-offset-3 col-lg-6">
					<div class="panel panel-default">
						<div class="panel-body" style="padding-top: 0px">
							<div class="row" style="text-align: right">
								<span class="glyphicon glyphicon-remove" style="cursor: pointer"></span>
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
								<html:button styleId="add-level" styleClass="btn btn-default"
									property="btnSubmit">Tạo mục mới</html:button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!------------------------- Add new lesson -------------------------------->
		<div class="container">
			<div class="row">
				<div id="new-lesson" class="col-lg-offset-3 col-lg-6">
					<div class="panel panel-default">
						<div class="panel-body" style="padding-top: 0px">
								<div class="row" style="text-align: right">
									<span class="glyphicon glyphicon-remove"
										style="cursor: pointer"></span>
								</div>
								<div class="row">
									<label class="col-lg-3">Tên bài mới</label>
									<div class="col-lg-8">
										<html:text styleId="myLessonName" styleClass="form-control"
											property="lessonName" name="japaneseForm"></html:text>
										<html:hidden styleClass="form-control" styleId="mylevel"
											property="levelID" name="japaneseForm"/>
									</div>
								</div>
								<div class="row" style="text-align: center">
									<label id="lessonNameError" style="color: red"></label>
								</div>
								<div class="row" style="text-align: center; margin-top: 20px;">
									<html:button styleId="add-lesson" styleClass="btn btn-default" property="submit">Tạo bài mới</html:button>
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="header2.jsp"></jsp:include>
		<jsp:include page="form-confirm.jsp"></jsp:include>
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
									<div class="col-lg-3">
										<button id="createNew" class="btn-add-new"
											style="padding: 20px; margin-left: 30px">
											<span class="glyphicon glyphicon-new-window"></span> Tạo mục
											mới
										</button>
									</div>
									<div class="col-lg-6" style="text-align: center">
										<label style="color:red"><bean:write property="deleteLevelError" name="japaneseForm"/> </label>
									</div>
								</div>
	<!------------------------- List level -------------------------------->
								<logic:iterate id="level" name="japaneseForm"
									property="listLevel">
									<bean:define id="levelID" name="level" property="levelID"></bean:define>
									<bean:define id="action" name="japaneseForm" property="action" ></bean:define>
									<div class="row" style="margin-top: 20px">
										<div class="row">
											<div class="col-lg-offset-3 col-lg-6 myItem">
												<div class="col-lg-12" style="text-align:right;">
													<span class="glyphicon glyphicon-trash my-trash"
														style="font-size: 15px;" onclick="deleteLevel('${action }','${levelID }')"></span>
												</div>
												<div class="col-lg-12">
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
										</div>
		<!------------------------- List lesson -------------------------------->
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
													<bean:define id="lessonID" name="lesson" property="lessonID"></bean:define>
													<logic:equal value="${levelID }" name="lesson"
														property="levelID">
														<div class="col-lg-3" style="text-align: center;">
															<html:link action="/manage-lesson?action=${action }&lessonID=${lessonID }">
																<button class="btn-lesson">
																	<i class="mdi mdi-translate"></i>
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