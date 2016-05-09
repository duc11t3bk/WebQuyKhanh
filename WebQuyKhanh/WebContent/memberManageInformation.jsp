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
<script src="js/myjs/includehtml.js"></script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="container main-container">
			<div class="row">
				<div class="content">
					<div class="col-lg-9 main-content">
						<div class="panel panel-primary"
							style="background-color: transparent">
							<div class="panel-heading">
								<div class="panel-title">Thông tin cá nhân</div>
							</div>
							<div class="panel-body" style="background-color: transparent">
								<div class="panel panel-default">
									<div class="panel-heading">
										<div class="panel-title">Đổi mật khẩu</div>
									</div>
									<div class="panel-body">
										<html:form action="/member-update-infor">
											<html:hidden property="memberID" name="memberForm"/>
											<div class="row">
												<div class="col-lg-2">
													<label><span class="glyphicon glyphicon-lock"></span>
														Mật khẩu hiện tại </label>
												</div>
												<div class="col-lg-9 ">
													<html:password styleClass="form-control" property="password"></html:password>
												</div>
											</div>
											<div class="row" style="text-align: center">
												<label style="color: red"> <bean:write
														name="memberForm" property="passwordError" />
												</label>
											</div>
											<div class="row">
												<div class="col-lg-2">
													<label><span
														class="glyphicon glyphicon-question-sign"></span> Nhập mật
														khẩu mới </label>
												</div>
												<div class="col-lg-9">
													<html:password styleClass="form-control" property="newPassword"></html:password>
												</div>
											</div>
											<div class="row" style="text-align: center">
												<label style="color: red"> <bean:write
														name="memberForm" property="newPasswordError" />
												</label>
											</div>
											<div class="row">
												<div class="col-lg-2">
													<label><span
														class="glyphicon glyphicon-question-sign"></span> Xác nhận
														mật khẩu mới</label>
												</div>
												<div class="col-lg-9">
													<html:password styleClass="form-control"
														property="retypePassword"></html:password>
												</div>
											</div>
											<div class="row" style="text-align: center">
												<label style="color: red"> <bean:write
														name="memberForm" property="retypePasswordError" />
												</label>
											</div>
											<div class="row" style="text-align: center">
												<html:submit property="submit" styleClass="btn btn-default">Đổi mật khẩu</html:submit>
											</div>
										</html:form>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<div class="panel-title">Thông tin</div>
									</div>
									<div class="panel-body">
										<html:form action="/member-update-infor" enctype="multipart/form-data">
											<html:hidden property="memberID" name="memberForm"/>
											<div class="row">
												<div class="col-lg-5">
													<label><span class="glyphicon glyphicon-user"></span>
														Cập nhật ảnh đại diện : </label>
												</div>
												<div class="col-lg-4">
													<html:file styleId="input-1" styleClass="file"
														property="file" accept="image/*"></html:file>
												</div>
											</div>
											<div class="row" style="margin-top: 50px;">
												<div class="col-lg-5">
													<label><span class="glyphicon glyphicon-envelope"></span>
														Email :</label>
												</div>
												<div class="col-lg-5">
													<html:text styleClass="form-control" property="email"
														disabled="true">
													</html:text>
												</div>
											</div>
											<div class="row">
												<div class="col-lg-5">
													<label> <span class="glyphicon glyphicon-earphone"></span>
														Số điện thoại:
													</label>
												</div>
												<div class="col-lg-5">
													<html:text property="phoneNumber" styleClass="form-control">
													</html:text>
												</div>
											</div>
											<div class="row" style="text-align: center">
												<html:submit styleClass="btn btn-default" property="submit">Lưu</html:submit>
											</div>
										</html:form>
									</div>
								</div>
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
	<script type="text/javascript">
		$("#input-1").fileinput({
			showUpload : false,
			showRemove : false,
			browseLabel : "Duyệt ảnh đại diện",
			previewFileType : "image",
		});
	</script>
</body>
</html>