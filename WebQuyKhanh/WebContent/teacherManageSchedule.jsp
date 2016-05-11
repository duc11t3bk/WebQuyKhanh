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
								<div class="panel-title">Xem lịch giảng dạy</div>
							</div>
							<div class="panel-body">
								<table  data-toggle="table" data-pagination="true" data-search="true"
										data-page-size="8" data-page-list="[8,16,All]" data-height="500"
									>
									<thead>
										<tr>
											<th data-width="40%">Tiêu đề</th>
											<th data-width="15%">Người đăng</th>
											<th data-width="15%">Chuyên mục</th>
											<th data-width="15%">Ngày đăng</th>
											<th data-width="15%">Xem</th>
										</tr>
									</thead>
									<tbody>
										<logic:iterate id="post" name="postsForm" property="posts">
											<tr>
												<bean:define id="postID" name="post" property="postID"></bean:define>
												<td><bean:write property="title" name="post"/> </td>
												<td><bean:write property="teacherName" name="post"/> </td>
												<td><bean:write property="category" name="post"/> </td>
												<td><bean:write property="datePosted" name="post"/> </td>
												<td>
													<html:link action="/teacher-view-schedule?postID=${postID }" style="font-size:20px;" ><span class="glyphicon glyphicon-new-window"></span> </html:link>
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
		<div id="footer">
			<jsp:include page="footer2.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>