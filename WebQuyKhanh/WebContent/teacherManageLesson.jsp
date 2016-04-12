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
	href="libs/bootstrap-table-master/dist/bootstrap-table.min.css">
<link rel="stylesheet" type="text/css" href="css/fileinput.min.css">
<link rel="stylesheet" type="text/css"
	href="css/mycss/styleframehome.css">
<link rel="stylesheet" type="text/css"
	href="css/mycss/stylemanagelesson.css">
<link rel="stylesheet" type="text/css" href="css/mycss/styleformconfirm.css">
<script src="js/jquery-2.2.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="libs/bootstrap-table-master/dist/bootstrap-table.min.js"></script>
<script src="js/fileinput.min.js"></script>
<script src="js/myjs/form-confirm.js"></script>
<script src="js/myjs/includehtml.js"></script>

<script type="text/javascript">
	function formUploadLesson(){
		$("#form-upload-lesson").css("top","5%");
		$(".overflow").show();
	}
	function deleteLesson(action, lessonID){
		var path="http://localhost:8080/WebQuyKhanh/manage-lesson.do?action="+action+"&submit=Xóa&lessonID="+lessonID;
		var message="Bạn có chắc chắn muốn xóa bài học này ?";
		formConfirm(path, message);
	}
</script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header2.jsp"></jsp:include>
		<jsp:include page="form-confirm.jsp"></jsp:include>
		<div class="container">
			<html:form action="/manage-lesson" enctype="multipart/form-data">
			<div class="row">
				<div id="form-upload-lesson" class="col-lg-offset-3 col-lg-6" style="padding: 0px; padding-bottom: 10px">
					<html:hidden property="action" />
					<html:hidden property="lessonID"/>
					<div class="col-lg-12">
						<label>Upload từ mới </label>		
					</div>
					<div class="col-lg-12" style="padding: 0px">
						<hr class="my-hr">
					</div>
					<div class="col-lg-12">
						<label>Chọn file Excel nội dung bên dưới </label>
					</div>
					<div class="col-lg-12" style="margin-top: 10px">
						<html:file styleId="input-1" property="fileExcel" styleClass="file"></html:file>
					</div>
					<div class="col-lg-12" style="margin-top:20px" >
						<label>Chọn file nghe bên dưới </label>
					</div>
					<div class="col-lg-12" style="margin-top: 10px;">
						<html:file property="fileAudio" multiple ></html:file>
					</div>
					<div class="col-lg-12" style="text-align: center; margin-top:20px;">
						<html:submit styleClass="btn-confirm" property="submit">Tải lên</html:submit>
					</div>
				</div>
			</div>
			</html:form>
		</div>
		<div class="container main-container2">
			<div class="row">
				<div class="content">
					<div class="col-lg-2">
						<jsp:include page="leftContentMenu.jsp"></jsp:include>
					</div>
					<div class="col-lg-10 main-content" style="z-index: 1">
						<div class="panel panel-info">
							<div class="panel-heading">
								<div class="panel-title">
									<ol class="breadcrumb">
										<bean:define id="action" property="action" name="japaneseForm"></bean:define>
										<bean:define id="lesson" name="japaneseForm" property="lesson"></bean:define>
										<bean:define id="lessonID" name="lesson" property="lessonID"></bean:define>
										<li><html:link action="/manage-level?action=${action }"> Quản lí từ vựng</html:link></li>
										<li><html:link action="/manage-level?action=${action }">
												<bean:write property="levelName" name="lesson" />
											</html:link></li>
										<li class="active"><bean:write property="lessonName"
												name="lesson" /></li>
									</ol>
								</div>
							</div>
							<div class="panel-body">
								<div class="row" style="margin-top: 10px">
									<div class="col-lg-6" >
										<button class="btn-add-new" onclick="formUploadLesson()"
											style="padding: 20px; margin-left: 30px">
											<span class="glyphicon glyphicon-repeat"></span> Tải lại từ
											vựng
										</button>
									</div>
									<div class="col-lg-6">
										<button class="btn-add-new"
											style="padding: 20px; margin-left: 30px" onclick="deleteLesson('${action}','${lessonID }')">
											<span class="glyphicon glyphicon-trash"></span> Xóa dữ liệu
										</button>
									</div>
								</div>
								<div class="row" style="margin-top: 20px;">
									<div class="col-lg-12">
									<div class="col-lg-12" style="border:1px solid #ddd; box-shadow: 3px 3px 5px #888888;">
										<table data-toggle="table" data-search="true"
											data-pagination="true" data-page-size="30"
											data-page-list="[30,60,All]" data-height="500">
											<thead>
												<tr>
													<th data-width="50%">Tiếng Nhật</th>
													<th data-width="50%">Tiếng Việt</th>
												</tr>
											</thead>
											<tbody>
												<logic:iterate id="data" name="japaneseForm"
													property="listData">
													<tr>
														<td><bean:write property="japanese" name="data" /></td>
														<td><bean:write property="vietnamese" name="data" /></td>
													</tr>
												</logic:iterate>
											</tbody>
										</table>
									</div>
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
	<script type="text/javascript">
		$("#input-1").fileinput({
			showUpload: false,
			browseLabel : "Chọn file tải lên",
		});
		$("#input-2").fileinput({
			showUpload: false,
			browseLabel : "Chọn file tải lên",
		});
	</script>
</body>
</html>