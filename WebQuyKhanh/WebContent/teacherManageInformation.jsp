<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
								<div class="panel-title">Thông tin cá nhân</div>
							</div>
							<div class="panel-body">
								<div class="panel panel-default">
									<div class="panel-heading">
										<div class="panel-title">Đổi mật khẩu</div>
									</div>
									<div class="panel-body">
										<html:form action="/teacher-update-infor">
											<div class="row">
												<div class="col-lg-3">
													<label><span class="glyphicon glyphicon-lock"></span>Mật
														khẩu hiện tại :</label>
												</div>
												<div class="col-lg-7">
													<html:password styleClass="form-control"
														property="password"></html:password>
												</div>
											</div>
											<div class="row" style="text-align: center">
												<label style="color: red"><bean:write
														name="teacherForm" property="passwordError" /> </label>
											</div>
											<div class="row">
												<div class="col-lg-3">
													<label><span
														class="glyphicon glyphicon-question-sign"></span>Nhập mật
														khẩu mới</label>
												</div>
												<div class="col-lg-7">
													<html:password styleClass="form-control"
														property="newPassword"></html:password>
												</div>
											</div>
											<div class="row" style="text-align: center">
												<label style="color: red"><bean:write
														name="teacherForm" property="newPasswordError" /> </label>
											</div>
											<div class="row">
												<div class="col-lg-3">
													<label><span
														class="glyphicon glyphicon-question-sign"></span>Xác nhận
														mật khẩu mới </label>
												</div>
												<div class="col-lg-7">
													<html:password styleClass="form-control"
														property="retypePassword"></html:password>
												</div>
											</div>
											<div class="row" style="text-align: center">
												<label style="color: red"><bean:write
														name="teacherForm" property="retypePasswordError" /> </label>
											</div>
											<div class="row" style="text-align: center; margin-top: 10px">
												<html:submit styleClass="btn btn-info" property="submit">Đổi mật khẩu</html:submit>
											</div>
										</html:form>
									</div>
								</div>

								<div class="panel panel-default">
									<div class="panel-heading">
										<div class="panel-title">Thông tin</div>
									</div>
									<div class="panel-body teacher-info">
										<html:form action="/teacher-update-infor"
											enctype="multipart/form-data">
											<div class="row">
												<div class="col-lg-5">
													<label>Cập nhật ảnh đại diện : </label>
												</div>
												<div class="col-lg-4">
													<html:file styleId="input-1" property="file"
														styleClass="file" accept="image/*"></html:file>
												</div>
											</div>
											<div class="row" style="margin-top: 30px">
												<div class="col-lg-5">
													<label><span class="glyphicon glyphicon-user"></span>
														Họ, tên :</label>
												</div>
												<div class="col-lg-5">
													<html:text styleClass="form-control" property="name"></html:text>
												</div>
											</div>
											<div class="row" style="text-align: center">
												<label style="color: red"><bean:write
														name="teacherForm" property="nameError" /> </label>
											</div>
											<div class="row">
												<div class="col-lg-5">
													<label><span class="glyphicon glyphicon-calendar"></span>
														Ngày sinh :</label>
												</div>
												<div class="col-lg-5">
													<html:text styleClass="form-control" property="dayOfBirth"></html:text>
												</div>
											</div>
											<div class="row" style="text-align: center">
												<label style="color: red"><bean:write
														name="teacherForm" property="dayOfBirthError" /> </label>
											</div>
											<div class="row">
												<div class="col-lg-5">
													<label><span class="glyphicon glyphicon-unchecked"></span>
														Giới tính :</label>
												</div>
												<div class="col-lg-5">
													<div class="col-lg-3">
														<html:radio property="sex" value="1">Nam</html:radio>
													</div>
													<div class="col-lg-3">
														<html:radio property="sex" value="0">Nữ</html:radio>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-lg-5">
													<label><span class="glyphicon glyphicon-earphone"></span>
														Số điện thoại :</label>
												</div>
												<div class="col-lg-5">
													<html:text styleClass="form-control" property="phoneNumber"></html:text>
												</div>
											</div>
											<div class="row" style="text-align: center">
												<label style="color: red"><bean:write
														name="teacherForm" property="phoneNumberError" /> </label>
											</div>
											<div class="row">
												<div class="col-lg-5">
													<label><span class="glyphicon glyphicon-envelope"></span>
														Email :</label>
												</div>
												<div class="col-lg-5">
													<html:text styleClass="form-control" property="email"
														disabled="true"></html:text>
												</div>
											</div>
											<div class="row">
												<div class="col-lg-5">
													<label><span class="glyphicon glyphicon-home"></span>
														Địa chỉ : </label>
												</div>
												<div class="col-lg-5">
													<html:text styleClass="form-control" property="address"></html:text>
												</div>
											</div>
											<div class="row" style="text-align: center">
												<label style="color: red"><bean:write
														name="teacherForm" property="addressError" /> </label>
											</div>
											<div class="row">
												<div class="col-lg-5">
													<label><span class="glyphicon glyphicon-book"></span>
														Bằng cấp : </label>
												</div>
												<div class="col-lg-5">
													<html:text styleClass="form-control" property="certificate"></html:text>
												</div>
											</div>
											<div class="row" style="text-align: center">
												<label style="color: red"><bean:write
														name="teacherForm" property="certificateError" /> </label>
											</div>
											<div class="row">
												<div class="col-lg-5">
													<label><span class="glyphicon glyphicon-calendar"></span>
														Ngày kí hợp đồng :</label>
												</div>
												<div class="col-lg-5">
													<html:text styleClass="form-control"
														property="dayOfContract"></html:text>
												</div>
											</div>
											<div class="row" style="text-align: center">
												<label style="color: red"><bean:write
														name="teacherForm" property="dayOfContractError" /> </label>
											</div>
											<div class="row" style="text-align: center; margin-top: 10px">
												<html:submit styleClass="btn btn-info" property="submit">Lưu</html:submit>
											</div>
										</html:form>
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
			showUpload : false,
			showRemove : false,
			browseLabel : "Duyệt ảnh đại diện",
			previewFileType : "image",
		});
	</script>
</body>
</html>