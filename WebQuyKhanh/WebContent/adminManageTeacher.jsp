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
<link rel="stylesheet" type="text/css"
	href="css/mycss/styleformconfirm.css">
<link rel="stylesheet" type="text/css"
	href="css/mycss/styleadminmanage.css">
<link rel="stylesheet" type="text/css" href="css/mycss/styletooltip.css">
<script src="js/jquery-2.2.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="libs/bootstrap-table-master/dist/bootstrap-table.min.js"></script>
<script src="js/myjs/includehtml.js"></script>
<script src="js/myjs/form-confirm.js"></script>
<style type="text/css">
.teacher-info h5 {
	display: inline;
}
</style>
<script type="text/javascript">
	function deleteTeacher(teacherID) {
		console.log("teacherID=" + teacherID);
		var path = "http://localhost:8080/WebQuyKhanh/admin-manage-teacher.do?action=delete&teacherID="
				+ teacherID;
		var message = "Bạn có chắc chắn muốn xóa thông tin giáo viên này ?";
		formConfirm(path, message);
	}
	function addNewTeacher() {
		$("#register-teacher").css("top", "20%");
		$(".overflow").show();
	}
	function cancelRegister() {
		$("#register-teacher").css("top", "-100%");
		$(".overflow").hide();
	}
	$(document).ready(function(){
		/**id same id of form register from header form need change id*/
		$("#btn-submit").on("click",function(){
			var name=$("#name-teacher").val();
			var email=$("#email-teacher").val();
			var password=$("#password-teacher").val();
			var retypePassword=$("#retypePassword-teacher").val();
			$("#nameError-teacher").html("");
			$("#emailError-teacher").html("");
			$("#passwordEror-teacher").html("");
			$("#retypePasswordError-teacher").html("");
			console.log(""+name+":"+email+":"+password+":"+retypePassword)
			var teacher= new Object();
			teacher.name=name;
			teacher.email=email;
			teacher.password=password;
			teacher.retypePassword=retypePassword;
			$.ajax({
				type: "POST",
				url : "http://localhost:8080/WebQuyKhanh/admin-manage-teacher.do",
				data : "dataRegister="+JSON.stringify(teacher),
				dataType: "json",
				success : function(response){
					console.log("runn respone");
					var object=response[0];
					var result=object.result;
					if("success"==result){
						$("#notify-teacher").val("Đăng ký thành công");
						setTimeout(function(){
							$("#name-teacher").val("");
							$("#email-teacher").val("");
							$("#password-teacher").val("");
							$("#retypePassword-teacher").val("");
							$("#register-teacher").css("top", "-100%");
							$(".overflow").hide();
							location.reload();
						}, 700);
					}
					console.log("result"+result);
					if("failed"==result){
						console.log(""+object.nameError);
						if(object.nameError!=null){
							$("#name-teacher").css("border-color","red");
							$("#nameError-teacher").html(""+object.nameError);	
						}
						if(object.emailError!=null){
							$("#email-teacher").css("border-color","red");
							$("#emailError-teacher").html(""+object.emailError);	
						}
						if(object.passwordError!=null){
							$("#password-teacher").css("border-color","red");
							$("#passwordError-teacher").html(""+object.passwordError);	
						}
						if(object.retypePasswordError!=null){
							$("#retypePassword-teacher").css("border-color","red");
							$("#retypePasswordError-teacher").html(""+object.retypePasswordError);	
						}
					}
				},
				error : function(errormessage){
					alert("error "+errormessage);
				}
			});
		});
		function resetStatus(){
			var toolTipText=$(".tooltiptext");
			for(var i=0 ;i<toolTipText.length; i++){
				$(toolTipText[i]).css("visibility","hidden");
				$(toolTipText[i]).css("opacity","0");
			}
			var formControl=$("#register-teacher .form-control");
			for(var i=0; i<formControl.length; i++){
				$(formControl[i]).css("border-color","#ccc");
			}
		}
		$("#name-teacher").focus(function(){
			resetStatus();
			$(this).css("border-color","#66afe9");
			$("#nameError-teacher").css("visibility","visible");
			$("#nameError-teacher").css("opacity","1");
			setTimeout(function(){
				$("#nameError-teacher").css("opacity","0");
				$("#nameError-teacher").css("visibility","hidden");
			}, 1500);
		});
		$("#email-teacher").focus(function(){
			resetStatus();
			$(this).css("border-color","#66afe9");
			$("#emailError-teacher").css("visibility","visible");
			$("#emailError-teacher").css("opacity","1");
			setTimeout(function(){
				$("#emailError-teacher").css("opacity","0");
				$("#emailError-teacher").css("visibility","hidden");
			}, 1500);
		});
		$("#password-teacher").focus(function(){
			resetStatus();
			$(this).css("border-color","#66afe9");
			$("#passwordError-teacher").css("visibility","visible");
			$("#passwordError-teacher").css("opacity","1");
			setTimeout(function(){
				$("#passwordError-teacher").css("opacity","0");
				$("#passwordError-teacher").css("visibility","hidden");
			}, 1500);
			
		});
		$("#retypePassword-teacher").focus(function(){
			resetStatus();
			$(this).css("border-color","#66afe9");
			$("#retypePasswordError-teacher").css("visibility","visible");
			$("#retypePasswordError-teacher").css("opacity","1");
			setTimeout(function(){
				$("#retypePasswordError-teacher").css("opacity","0");
				$("#retypePasswordError-teacher").css("visibility","hidden");
			}, 1500)			
		});
	});
</script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header2.jsp"></jsp:include>
		<jsp:include page="form-confirm.jsp"></jsp:include>
		<div class="container" id="admin-manage-register">
			<div class="row">
				<div class="col-lg-offset-3 col-lg-6 form-register" id="register-teacher">
					<div class="row" style="text-align: right;">
						<span id="my-remove" class="glyphicon glyphicon-remove" onclick="cancelRegister()"></span>
					</div>
					<div class="row" style="text-align: center">
						<label style="font-size: 20px;">Đăng ký tài khoản giáo
							viên</label>
					</div>
					<div class="row" style="text-align: center">
						<label id="notify-teacher" style="color : #4CAF50"></label>
					</div>
					<div class="row">
						<hr>
					</div>
					<html:form action="/admin-manage-teacher">
						<div class="row">
							<div class="col-lg-12">
								<div class="col-lg-3">
									<label><span class="glyphicon glyphicon-user"></span>
										Họ, tên</label>
								</div>
								<div class="col-lg-9 mytooltip">
									<html:text styleId="name-teacher" property="name" styleClass="form-control"></html:text>
									<span id="nameError-teacher" class="tooltiptext">Mời bạn nhập họ, tên !</span>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="col-lg-3">
									<label><span class="glyphicon glyphicon-envelope"></span>
										Email</label>
								</div>
								<div class="col-lg-9 mytooltip">
									<html:text styleId="email-teacher" property="email" styleClass="form-control"></html:text>
									<span id="emailError-teacher" class="tooltiptext">Mời bạn nhập email !</span>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="col-lg-3">
									<label><span class="glyphicon glyphicon-lock"></span>
										Mật khẩu</label>
								</div>
								<div class="col-lg-9 mytooltip">
									<html:password styleId="password-teacher" property="password" styleClass="form-control"></html:password>
									<span id="passwordError-teacher" class="tooltiptext">Mời bạn nhập mật khẩu !</span>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="col-lg-3">
									<label><span class="glyphicon glyphicon-lock"></span>
										Nhập lại mật khẩu</label>
								</div>
								<div class="col-lg-9 mytooltip">
									<html:password styleId="retypePassword-teacher" property="retypePassword" styleClass="form-control"></html:password>
									<span id="retypePasswordError-teacher" class="tooltiptext">Bạn hãy nhập lại mật khẩu !</span>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12" style="text-align: center">
								<input type="button" class="my-btn" value="Đăng ký" id="btn-submit">
							</div>
						</div>
					</html:form>
				</div>
			</div>
		</div>
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
									<button class="btn-add-new" onclick="addNewTeacher()"
										style="padding: 20px; margin-left: 30px">
										<span class="glyphicon glyphicon-new-window"></span> Thêm giáo
										viên mới
									</button>
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
												<th data-width="40%">Họ, tên</th>
												<th data-width="10%">Ngày sinh</th>
												<th data-width="10%">Giới tính</th>
												<th data-width="10%">Số điện thoại</th>
												<th data-width="10%">Email</th>
												<th data-width="10%">Xem</th>
												<th data-width="10%">Xóa</th>
											</tr>
										</thead>
										<tbody>
											<logic:iterate id="teacher" name="teacherForm"
												property="teachers">
												<tr>
													<td><bean:write name="teacher" property="name" /></td>
													<td><bean:write name="teacher" property="dayOfBirth" />
													</td>
													<logic:equal value="1" name="teacher" property="sex">
														<td>Nam</td>
													</logic:equal>
													<logic:equal value="0" name="teacher" property="sex">
														<td>Nữ</td>
													</logic:equal>
													<td><bean:write name="teacher" property="phoneNumber" />
													</td>
													<td><bean:write name="teacher" property="email" /></td>
													<bean:define id="memberID" name="teacher"
														property="memberID"></bean:define>
													<bean:define id="teacherID" name="teacher"
														property="teacherID"></bean:define>
													<td><html:link
															action="/teacher-update-infor?memberID=${memberID }"
															style="font-size:20px;">
															<span class="glyphicon glyphicon-new-window"></span>
														</html:link></td>
													<td><html:link href="#x" style="font-size:20px;"
															onclick="deleteTeacher('${teacherID }')">
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