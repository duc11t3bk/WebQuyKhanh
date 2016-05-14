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
					<li class="col-lg-12">
						<div class="col-lg-12">
							<html:link action="/teacher-update-infor">Thông tin cá nhân</html:link>
						</div>
						<div class="col-lg-12">
							<hr>
						</div>
					</li>
					<li class="col-lg-12">
						<div class="col-lg-12">
							<html:link action="/admin-manage-introduce"> Quản lí trang giới
									thiệu</html:link>
						</div>
						<div class="col-lg-12">
							<hr>
						</div>
					</li>
					<li class="col-lg-12">
						<div class="col-lg-12">
						<html:link action="/manage-posts">Quản lí bài đăng</html:link>
						</div>
						<div class="col-lg-12">
							<hr>
						</div>
					</li>
					<li class="col-lg-12">
						<div class="col-lg-12">
							<html:link action="/admin-manage-teacher">Quản lí giáo viên</html:link>
						</div>
						<div class="col-lg-12">
							<hr>
						</div>
					</li>
					<li class="col-lg-12">
						<div class="col-lg-12">
							<html:link action="/admin-manage-student">Quản lí học viên</html:link>
						</div>
						<div class="col-lg-12">
							<hr>
						</div>
					</li>
					<li class="col-lg-12">
						<div class="col-lg-12">
							<html:link action="/admin-manage-member">Quản lí thành viên</html:link>
						</div>
						<div class="col-lg-12">
							<hr>
						</div>
					</li>
					<li class="col-lg-12">
						<div class="col-lg-12">
							<html:link action="/admin-manage-class">Quản lí lớp</html:link>
						</div>
						<div class="col-lg-12">
							<hr>
						</div>
					</li>
					<li class="col-lg-12">
						<div class="col-lg-12">
							<a href="adminStatistic.html">Thống kê</a>
						</div>
						<div class="col-lg-12">
							<hr>
						</div>
					</li>
				</ul>
			</logic:equal>
			<logic:equal value="1" name="member" property="priority">
				<ul>
					<li class="col-lg-12">
						<div class="col-lg-12">
							<html:link action="/teacher-update-infor"> Thông tin cá
								nhân</html:link>
						</div>
						<div class="col-lg-12">
							<hr>
						</div>
					</li>
					<li class="col-lg-12">
						<div class="col-lg-12">
							<html:link action="/teacher-manage-schedule">Xem lịch giảng dạy </html:link>
						</div>
						<div class="col-lg-12">
							<hr>
						</div>		
					</li>
					<li class="col-lg-12">
						<div class="col-lg-12">
							<html:link action="/manage-posts">Quản lí bài đăng</html:link>
						</div>
						<div class="col-lg-12">
							<hr>
						</div>
					</li>
					<li class="col-lg-12">
						<div class="col-lg-12">
							<html:link action="/manage-student" >Quản lí học viên</html:link>
						</div>
						<div class="col-lg-12">
							<hr>
						</div>
					</li>
					<li class="col-lg-12">
						<div class="col-lg-12">
							<html:link action="/manage-level?action=vocabulary">Quản lí từ vựng</html:link>
						</div>
						<div class="col-lg-12">
							<hr>
						</div>
					</li>
					<li class="col-lg-12">
						<div class="col-lg-12">
							<html:link action="/manage-level?action=translate"> Quản lí dịch câu</html:link>
						</div>
						<div class="col-lg-12">
							<hr>
						</div>
					</li>
				</ul>
			</logic:equal>
		</div>
	</div>
</body>
</html>