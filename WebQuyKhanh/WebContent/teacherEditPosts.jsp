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
<link rel="stylesheet" type="text/css" href="css/fileinput.css">
<script src="js/jquery-2.2.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/fileinput.js"></script>
<script src="libs/ckeditor/ckeditor.js"></script>
<script src="js/myjs/includehtml.js"></script>
<style type="text/css">
.teacher-info h5 {
	display: inline;
}
</style>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header2.jsp"></jsp:include>
		<div class="container main-container2">
			<div class="row">
				<div class="content">
					<div class="col-lg-2">
						<jsp:include page="leftContentMenu.jsp"></jsp:include>
					</div>
					<div class="col-lg-10 main-content">
						<div class="panel panel-info">
							<div class="panel-heading">
								<div class="panel-title">Thêm bài viết mới</div>
							</div>
							<div class="panel-body">
								<html:form action="/edit-posts" enctype="multipart/form-data">
									<html:hidden property="postID"/>
									<html:hidden property="image"/> 
									<div class="row" style="text-align:center">
										<label style="color:red"><bean:write name="postsForm" property="notification" /> </label>
									</div>
									<div class="row">
										<label class="col-lg-2">Chọn mục :</label>
										<div class="col-lg-3">
											<html:select property="category" styleClass="dropdownlist">
												<bean:define id="member" name="loginForm" property="member"></bean:define>
												<logic:equal value="3" name="member" property="priority">
													<html:option value="LGD">Lịch giảng dạy</html:option>
												</logic:equal>
												<html:option value="DHNB">Du học Nhật Bản</html:option>
												<html:option value="LHTN">Lớp học tiếng Nhật</html:option>
												<logic:equal value="3" name="member" property="priority">
													<html:option value="TD">Tuyển dụng</html:option>
												</logic:equal>
												<html:option value="TLTK">Tài liệu tham khảo</html:option>
											</html:select>
										</div>
										<div class="col-lg-3">
											<label><span class="glyphicon glyphicon-pencil"></span> Người đăng : </label>
											<html:text styleClass="form-control" property="teacherName" readonly="true" style="cursor:not-allowed"></html:text>					
										</div>
										<div class="col-lg-2">
											<label><span class="glyphicon glyphicon-calendar"></span>Ngày đăng : </label>
											<html:text styleClass="form-control" property="datePosted" readonly="true" style="cursor:not-allowed"></html:text>
										</div>
										<div class="col-lg-2">
											<label><span class="glyphicon glyphicon-eye-open"></span> Lượt xem : </label>
											<html:text styleClass="form-control" property="views" readonly="true" style="cursor:not-allowed"></html:text>
										</div>
									</div>
									<div class="row" style="margin-top: 10px">
										<label class="col-lg-2">Tiêu đề :</label>
										<div class="col-lg-10">
											<html:text property="title" styleClass="form-control"></html:text>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-offset-2 col-lg-10"
											style="text-align: center">
											<label style="color: red"><bean:write
													name="postsForm" property="titleError" /></label>
										</div>
									</div>
									<div class="row" style="margin-top: 10px;">
										<label class="col-lg-2">Ảnh bài viết :</label>
										<div class="col-lg-10">
											<bean:define id="image" name="postsForm" property="image"></bean:define>
											<html:img alt="hinh" src="postsimage/${image }" width="100%"
												height="100%" />
										</div>
									</div>
									<div class="row" style="margin-top: 10px">
										<label class="col-lg-2">Upload ảnh mới : </label>
										<div class="col-lg-10">
											<div class="col-lg-6" style="padding-left: 0px">
												<html:file property="file" styleClass="file"
													styleId="input-1" accept="image/*"></html:file>
											</div>
										</div>
									</div>
									<div class="row" style="margin-top: 20px;">
										<div class="col-lg-12">
											<div class="col-lg-2" style="padding-left: 0px;">
												<label>Nội dung :</label>
											</div>
											<div class="col-lg-10" style="text-align: center">
												<label style="color: red"><bean:write
														name="postsForm" property="contentError" /> </label>
											</div>
										</div>
										<div class="col-lg-12">
											<html:textarea styleId="editor1" property="content"
												style="width:100%"></html:textarea>
										</div>
									</div>
									<div class="row" style="text-align: center; margin-top: 20px">
										<html:submit property="submit" styleClass="btn btn-info">Lưu</html:submit>
									</div>
								</html:form>
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
			showUpload : false,
			showRemove : false,
			browseLabel : "Tải ảnh lên",
			PreviewFileType : "image",
		});

		CKEDITOR.replace("editor1");
	</script>
</body>
</html>