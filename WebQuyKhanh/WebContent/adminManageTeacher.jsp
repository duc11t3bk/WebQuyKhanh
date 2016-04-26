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
<script src="js/jquery-2.2.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="libs/bootstrap-table-master/dist/bootstrap-table.min.js"></script>
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
								<div class="panel-title">Quản lí giáo viên</div>
							</div>
							<div class="panel-body">
								<div class="row">
									<a href="adminAddNewTeacher.jsp">
										<button class="btn-add-new"
											style="padding: 20px; margin-left: 30px">
											<span class="glyphicon glyphicon-new-window"></span> Thêm
											giáo viên mới
										</button>
									</a>
								</div>
								<div class="row" style="margin-top: 40px;">
									<div class="col-lg-12">
										<div class="col-lg-3">
											<label><span class="glyphicon glyphicon-list"></span>
												Danh sách giáo viên </label>
										</div>
										<div class="col-lg-offset-6 col-lg-3">
											<label style="margin-left: 55px;"><span
												class="glyphicon glyphicon-search"></span> Tìm kiếm </label>
										</div>
									</div>
								</div>
								<div class="row">
									<table data-toggle="table" data-pagination="true"
										data-search="true" data-page-size="8"
										data-page-list="[8,16,All]" data-height="500">
										<thead>
											<tr>
												<th data-width="30%">Họ, tên</th>
												<th data-width="15%">Ngày sinh</th>
												<th data-width="15%">Giới tính</th>
												<th data-width="20%">Số điện thoại</th>
												<th data-width="20%">Email</th>
											</tr>
										</thead>
										<tbody>
											<logic:iterate id="teacher" name="teacherForm" property="teachers">
												<tr>
													<td><bean:write name="teacher" property="name"/> </td>
													<td><bean:write name="teacher" property="dayOfBirth"/> </td>
													<logic:equal value="1" name="teacher" property="sex">
														<td>Nam </td>
													</logic:equal>
													<logic:equal value="0" name="teacher" property="sex">
														<td>Nữ　</td>
													</logic:equal>
													<td><bean:write name="teacher" property="phoneNumber"/> </td>
													<td><bean:write name="teacher" property="email"/> </td>
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