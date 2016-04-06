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
					<li><a href="adminManagePersonal.html">Thông tin cá nhân</a></li>
					<li><a href="adminManageIntroduce.html">Quản lí trang giới
							thiệu</a></li>
					<li><a href="adminManageDocumentation.html">Quản lí tài
							liệu</a></li>
					<li><a href="adminManagePost.html">Quản lí bài đăng</a></li>
					<li><a href="adminManageSchedule.html">Quản lí thời khóa
							biểu</a></li>
					<li><a href="adminManageTeacher.html">Quản lí giáo viên</a></li>
					<li><a href="adminManageStudent.html">Quản lí học viên</a></li>
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
					<li><a href="teacherManageVocaTrans.jsp">Quản lí từ vựng</a>
						<ul class="submenu">
							<li><a href="teacherManageVocaTransLesson.html">Bài 1 -
									Bài 25</a>
								<ul class="sub-submenu">
									<li><a href="teacherManageVocaTransLessonEdit.html">Bài
											1</a></li>
									<li><a href="">Bài 2</a></li>
								</ul></li>
							<li><a href="">Bài 26 - Bài 30</a>
								<ul class="sub-submenu">
									<li><a href="">Bài 1</a></li>
									<li><a href="">Bài 2</a></li>
								</ul></li>
						</ul></li>
					<li><a href="">Quản lí dịch câu</a>
						<ul class="submenu">
							<li><a href="">Bài 1 - Bài 25</a></li>
							<li><a href="">Bài 26 - Bài 30</a></li>
						</ul></li>
				</ul>
			</logic:equal>
		</div>
	</div>
</body>
</html>