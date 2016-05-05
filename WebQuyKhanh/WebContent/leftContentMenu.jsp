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
<title></title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/mycss/styleleftcontent.css">
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-body left-menu" style="padding: 0px">
			<bean:define id="member" name="loginForm" property="member"
				scope="session"></bean:define>
			<logic:equal value="3" name="member" property="priority">
				<ul>
					<li><html:link action="/teacher-update-infor">Thông tin cá nhân</html:link></li>
					<li><a href="adminManageIntroduce.html">Quản lí trang giới
							thiệu</a></li>
					<li><html:link action="/manage-posts">Quản lí bài đăng</html:link></li>
					<li><a href="adminManageSchedule.html">Quản lí thời khóa
							biểu</a></li>
					<li><html:link action="/admin-manage-teacher">Quản lí giáo viên</html:link></li>
					<li><html:link action="/admin-manage-student">Quản lí học viên</html:link></li>
					<li><a href="adminManageMember.html">Quản lí thành viên</a></li>
					<li><a href="adminManageClass.html">Quản lí lớp</a></li>
					<li><a href="adminStatistic.html">Thống kê</a></li>
				</ul>
			</logic:equal>
			<logic:equal value="1" name="member" property="priority">
				<ul>
					<li><a href="teacherManageInformation.html">Thông tin cá
							nhân</a></li>
					<li><a href="teacherViewSchedule.html">Xem thời khóa biểu</a></li>
					<li><html:link action="/manage-posts">Quản lí bài đăng</html:link>
					</li>
					<li><html:link action="/manage-student" >Quản lí học viên</html:link></li>
					<li><html:link action="/manage-level?action=vocabulary">Quản lí từ vựng</html:link>
					</li>
					<li><html:link action="/manage-level?action=translate"> Quản lí dịch câu</html:link>
					</li>
				</ul>
			</logic:equal>
		</div>
	</div>
</body>
</html>