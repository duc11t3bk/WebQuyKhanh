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
<script type="text/javascript">
	function eventChangeClass(){
		var classID=$("#my-list-class").val();
		window.location.href="/WebQuyKhanh/manage-student.do?classID="+classID;
	}
</script>
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
					<div class="col-lg-10 main-content" style="z-index: 1">
						<div class="panel panel-info">
							<div class="panel-heading">
								<div class="panel-title">Thêm bài viết mới</div>
							</div>
							<div class="panel-body">
								<div class="row">
									<label class="col-lg-2">Chọn lớp</label>
									<div class="col-lg-2">
										<html:select styleId="my-list-class" property="classID" name="studentForm"
											styleClass="dropdownlist"
											onchange="eventChangeClass()">
											<logic:iterate id="classElement" name="studentForm"
												property="listClass">
												<bean:define id="classid" name="classElement"
													property="classID"></bean:define>
												<html:option value="${classid }">
													<bean:write name="classElement" property="className" />
												</html:option>
											</logic:iterate>
										</html:select>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<table data-toggle="table" data-search="true"
											data-pagination="true" data-page-size="10" data-height="500"
											data-page-list="[30,60,All]">
											<thead>
												<tr>
													<th>Họ, tên học viên</th>
													<th>Email</th>
													<th>Số điện thoại</th>
													<th>Lớp</th>
												</tr>
											</thead>
											<tbody>
												<logic:iterate id="student" name="studentForm"
													property="students">
													<tr>
														<td><bean:write property="name" name="student" /></td>
														<td><bean:write property="email" name="student" /></td>
														<td><bean:write property="phoneNumber" name="student" />
														</td>
														<td><bean:write property="className" name="student" />
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
</body>
</html>