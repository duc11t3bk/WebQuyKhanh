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
	href="css/mycss/styleformconfirm.css">
<link rel="stylesheet" type="text/css" href="css/fileinput.min.css">
<script src="js/jquery-2.2.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="libs/bootstrap-table-master/dist/bootstrap-table.min.js"></script>
<script src="js/fileinput.min.js"></script>
<script src="js/myjs/includehtml.js"></script>
<script src="js/myjs/form-confirm.js"></script>

<script type="text/javascript">
	function deleteImage(imageID){
		var path="http://localhost:8080/WebQuyKhanh/admin-manage-introduce.do?submit=delete&imgID="+imageID;
		var message="Bạn có chắc chắn muốn xóa ảnh này ?";
		formConfirm(path, message);
	}
</script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header2.jsp"></jsp:include>
		<jsp:include page="form-confirm.jsp"></jsp:include>
		<div class="container main-container2">
			<div class="row">
				<div class="content">
					<div class="col-lg-2">
						<jsp:include page="leftContentMenu.jsp"></jsp:include>
					</div>
					<div class="col-lg-10 main-content">
						<div class="panel panel-info">
							<div class="panel-heading">
								<div class="panel-title">Cập nhật trang giới thiệu</div>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-12" style="text-align: center">
										<label style="color : #5cb85c"><bean:write name="manageIntroduceForm" property="notifySuccess"/> </label>
										<label style="color : red"><bean:write name="manageIntroduceForm" property="notifyFailed"/> </label>
									</div>
									<html:form action="/admin-manage-introduce" enctype="multipart/form-data">
										<div class="col-lg-12"
											style="border: 1px solid #ddd; border-radius: 10px; padding: 10px;">
											<div class="col-lg-12">
												<div class="col-lg-3">
													<label><span
														class="glyphicon glyphicon-cloud-upload"></span> Tải ảnh
														lên </label>
												</div>
												<div class="col-lg-9">
													<html:file styleId="input-1" property="file"
														styleClass="file" accept="image/*"></html:file>
												</div>
											</div>
											<div class="col-lg-12"
												style="text-align: center; margin-top: 20px;">
												<html:submit styleClass="btn-add-new" property="submit">Tải lên</html:submit>
											</div>
										</div>
									</html:form>
								</div>
								<div class="row">
									<div class="col-lg-12"
										style="border: 1px solid #ddd; border-radius: 10px; padding: 10px; margin-top: 20px;">
										<html:form action="/admin-manage-introduce">
											<div class="col-lg-12">
												<div class="col-lg-6">
													<div class="col-lg-12">
														<label><span class="glyphicon glyphicon-picture"></span>Chọn
															ảnh banner bên trái </label>
													</div>
													<div class="col-lg-12">
														<html:select property="leftBanner" styleClass="form-control">
															<logic:iterate id="image" name="manageIntroduceForm" property="images">
																<bean:define id="imageID" name="image" property="imgID"></bean:define>
																<html:option value="${imageID }"><bean:write name="image" property="imgName"/> </html:option>
															</logic:iterate>
														</html:select>
													</div>
												</div>
												<div class="col-lg-6">
													<div class="col-lg-12">
														<label><span class="glyphicon glyphicon-picture"></span>Chọn
															ảnh banner bên phải </label>
													</div>
													<div class="col-lg-12">
														<html:select property="rightBanner" styleClass="form-control">
															<logic:iterate id="image" name="manageIntroduceForm" property="images">
																<bean:define id="imageID" name="image" property="imgID"></bean:define>
																<html:option value="${imageID }"><bean:write name="image" property="imgName"/> </html:option>
															</logic:iterate>
														</html:select>
													</div>
												</div>
											</div>
											<div class="col-lg-12"
												style="text-align: center; margin-top: 20px;">
												<html:submit styleClass="btn-add-new" property="submit">Lưu</html:submit>
											</div>
										</html:form>
									</div>
								</div>
								<div class="row" style="margin-top: 20px;">
									<div class="col-lg-12">
										<label><span class="glyphicon glyphicon-list"></span>
											Danh sách ảnh </label>
									</div>
									<div class="col-lg-12">
										<table data-toggle="table" data-pagination="true"
											data-search="true" data-page-size="8"
											data-page-list="[8,16,All]" data-height="600">
											<thead>
												<tr>
													<th>Xem trước</th>
													<th>Tên ảnh</th>
													<th>Trạng thái</th>
													<th>Xem</th>
													<th>Xóa</th>
												</tr>
											</thead>
											<tbody>
												<logic:iterate id="image" name="manageIntroduceForm" property="images">
													<bean:define id="imageName" name="image" property="imgName"></bean:define>
													<bean:define id="imageID" name="image" property="imgID"></bean:define>
													<tr>
														<td><img alt="hinh" src="image/${imageName }"
															height="80px"></td>
														<td><bean:write name="image" property="imgName"/> </td>
														<td><bean:write name="image" property="status"/> </td>
														<td>
															<span class="glyphicon glyphicon-new-window" style="font-size:20px; color:#337ab7; cursor: pointer"></span>
														</td>
														<td>
															<span class="glyphicon glyphicon-trash" style="font-size:20px; color:#337ab7; cursor: pointer" onclick="deleteImage('${imageID }')"></span>
														</td>
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
		<div id="footer">
			<jsp:include page="footer2.jsp"></jsp:include>
		</div>
	</div>
	<script type="text/javascript">
		$("#input-1").fileinput({
			showUpload : false,
			showRemove : false,
			browseLabel : "Chọn ảnh",
			previewFileType : "image",
		});
	</script>
</body>
</html>