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
<link rel="stylesheet" type="text/css"
	href="css/mycss/styleframehome.css">
<link rel="stylesheet" type="text/css" href="css/mycss/styleformconfirm.css">
<script src="js/jquery-2.2.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="libs/bootstrap-table-master/dist/bootstrap-table.min.js"></script>
<script src="js/myjs/form-confirm.js"></script>

<script type="text/javascript">
	function addNewMember() {
		$("#form-register").css("top", "20%");
		$(".overflow").show();
	}
	function deleteMember(memberID){
		var path="http://localhost:8080/WebQuyKhanh/admin-manage-member.do?action=delete&memberID="+memberID;
		var message="Bạn có chắc chắn muốn xóa thành viên này ?";
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
								<div class="panel-title">Quản lí thành viên</div>
							</div>
							<div class="panel-body">
								<div class="row">
									<button class="btn-add-new" onclick="addNewMember()"
										style="padding: 20px; margin-left: 30px">
										<span class="glyphicon glyphicon-new-window"></span> Thêm
										thành viên mới
									</button>
								</div>
								<div class="row" style="margin-top: 20px;">
									<div class="col-lg-12">
										<div class="col-lg-3">
											<label><span class="glyphicon glyphicon-list"></span>
												Danh sách thành viên</label>
										</div>
										<div class="col-lg-offset-6 col-lg-3">
											<label><span class="glyphicon glyphicon-search"></span>
												Tìm kiếm </label>
										</div>
									</div>
								</div>
								<div class="row">
									<table data-toggle="table" data-search="true"
										data-pagination="true" data-page-size="8"
										data-page-list="[8,16,All]" data-height="500">
										<thead>
											<tr>
												<th>Email</th>
												<th>Số điện thoại</th>
												<th>Mật khẩu</th>
												<th>Ngày tham gia</th>
												<th>Xem</th>
												<th>Chỉnh sửa</th>
											</tr>
										</thead>
										<tbody>
											<logic:iterate id="member" name="memberForm"
												property="members">
												<tr>
													<td><bean:write property="email" name="member" /></td>
													<td><bean:write property="phoneNumber" name="member" />
													</td>
													<td><bean:write property="password" name="member" /></td>
													<td><bean:write property="dateattended" name="member" />
													</td>
													<bean:define id="memberID" name="member" property="memberID"></bean:define>
													<td><html:link action="/member-update-infor?memberID=${memberID }" style="font-size:20px;">
															<span class="glyphicon glyphicon-new-window"></span>
														</html:link></td>
													<td><html:link href="#x" onclick="deleteMember('${memberID }')" style="font-size:20px;">
															<span class="glyphicon glyphicon-trash"></span>
														</html:link></td>
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
		<div id="footer">
			<jsp:include page="footer2.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>