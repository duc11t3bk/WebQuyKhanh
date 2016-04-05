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
								<html:form action="/create-new-posts"
										enctype="multipart/form-data">
									<div class="row">
										<label class="col-lg-3">Chọn mục :</label>
										<div class="col-lg-9">
											<html:select property="category" styleClass="dropdownlist">
												<html:option value="DHNB">Du học Nhật Bản</html:option>
												<html:option value="LHTN">Lớp học tiếng Nhật</html:option>
												<html:option value="TD">Tuyển dụng</html:option>
												<html:option value="TLTK">Tài liệu tham khảo</html:option>
											</html:select>
										</div>
									</div>
									<div class="row" style="margin-top: 10px">
										<label class="col-lg-3">Tiêu đề :</label>
										<div class="col-lg-9">
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
									<div class="row" style="margin-top: 10px">
										<label class="col-lg-3">Upload ảnh : </label>
										<div class="col-lg-9">
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
											<html:submit styleClass="btn btn-info">Đăng</html:submit>
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