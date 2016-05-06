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
	href="libs/MaterialDesign-Webfont-master/css/materialdesignicons.min.css"
	media="all">
<link rel="stylesheet" type="text/css"
	href="css/mycss/styleframehome.css">
<link rel="stylesheet" type="text/css"
	href="css/mycss/styleadminmanage.css">
<link rel="stylesheet" type="text/css" href="css/mycss/styleformconfirm.css">
<link rel="stylesheet" type="text/css" href="css/mycss/styletooltip.css">
<script src="js/jquery-2.2.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="libs/bootstrap-table-master/dist/bootstrap-table.min.js"></script>
<script src="js/myjs/form-confirm.js"></script>
<script src="js/myjs/includehtml.js"></script>

<script type="text/javascript">
	function showStudentForm(){
		$("#register-student").css("top","10%");
		$(".overflow").show();
	}
	function addNewStudent(){
		var action=$("#btn-submit").val();
		if("Lưu"==action){
			$("#btn-submit").val("Đăng ký");
			$("#title").html("Đăng ký học viên");
			var name=$("#studentName").val("");
			var email=$("#studentEmail").val("");
			var phoneNumber=$("#studentPhoneNumber").val("");
			var amountPaid=$("#studentAmountPaid").val("");
			$("#classFee-student").prop("readonly",false);
			$("#classFee-student").css("cursor","default");
		}
		showStudentForm();
	}
	function cancelRegister(){
		$("#register-student").css("top","-100%");
		$(".overflow").hide();
	}
	function updateStudentInfor(studentID){	
		$("#title").html("Thông tin học viên");
		$("#btn-submit").val("Lưu");
		$.ajax({
			type: "POST",
			url: "http://localhost:8080/WebQuyKhanh/admin-manage-student.do",
			data : "action=view&studentID="+studentID,
			dataType: "json",
			success : function(response){
				console.log("name="+response.name);
				$("#studentName").val(response.name);
				$("#studentEmail").val(response.email);
				$("#studentPhoneNumber").val(response.phoneNumber);
				$("#studentClass").val(response.classID);
				changeClass();
				$("#studentAmountPaid").val(response.amountPaid);
				$("#studentID").val(response.studentID);
			},
			error : function(errormessage){
				alert("error"+errormessage);
			},
		});
		showStudentForm();
	}
	function deleteStudent(studentID){
		var path="http://localhost:8080/WebQuyKhanh/admin-manage-student.do?action=delete&studentID="+studentID;
		var message="Bạn có chắc chắn muốn xóa học viên này ?";
		formConfirm(path, message);
	}
	function changeClass(){
		var classID=$("#studentClass").val();
		$("#classFee-student").val(classID);
		$("#classTime-student").val(classID);
	}
	$("#btn-submit").on("click",function(){
		var action=$(this).val();
		var studentID=$("#studentID").val();
		var name=$("#studentName").val();
		var email=$("#studentEmail").val();
		var phoneNumber=$("#studentPhoneNumber").val();
		var classID=$("#studentClass").val();
		var amountPaid=$("#studentAmountPaid").val();	
		if("Đăng ký"==action){
			
		}
		if("Lưu"==action){
			var student= new Object();
			student.studentID=studentID;
			student.name=name;
			student.email=email;
			student.phoneNumber=phoneNumber;
			student.classID=classID;
			student.amountPaid=amountPaid;
			
			$.ajax({
				type: "POST",
				url: "http://localhost:8080/WebQuyKhanh/admin-manage-student.do",
				data : "action=update&jsonStudent="+JSON.stringify(student),
				dataType: "json",
				success : function(response){
					
				},
				error : function(errormessage){
					
				},
			});
		}
	});
</script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header2.jsp"></jsp:include>
		<jsp:include page="form-confirm.jsp"></jsp:include>
		<div class="container" id="admin-manage-register">
			<div class="row">
				<div class="col-lg-offset-2 col-lg-8 form-register" id="register-student">
					<div class="row" style="text-align: right">
						<span id="my-remove" class="glyphicon glyphicon-remove" onclick="cancelRegister()"></span>
					</div>
					<div class="row" style="text-align: center">
						<label id="title" style="font-size: 20px;">Đăng ký học viên mới</label>
					</div>
					<div class="row">
						<hr>
					</div>
					<html:form action="/admin-manage-student">
						<html:hidden styleId="studentID" property="studentID" />
						<div class="row">
							<div class="col-lg-12">
								<div class="col-lg-3">
									<label><span class="glyphicon glyphicon-user"></span>
										Tên học viên</label>
								</div>
								<div class="col-lg-9 mytooltip">
									<html:text styleId="studentName" property="name" styleClass="form-control"></html:text>
									
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="col-lg-3">
									<label><span class="glyphicon glyphicon-envelope"></span>
										Email</label>
								</div>
								<div class="col-lg-9">
									<html:text styleId="studentEmail" property="email" styleClass="form-control"></html:text>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="col-lg-3">
									<label><span class="glyphicon glyphicon-phone"></span>
										Số điện thoại</label>
								</div>
								<div class="col-lg-9">
									<html:text styleId="studentPhoneNumber" property="phoneNumber" styleClass="form-control"></html:text>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="col-lg-3">
									<label><i class="mdi mdi-book-plus"></i> Chọn lớp</label>
								</div>
								<div class="col-lg-9">
									<html:select styleId="studentClass" property="classID" styleClass="form-control" onchange="changeClass()" >
										<logic:iterate id="myClass" property="listClass" name="studentForm">
											<bean:define id="classID" name="myClass" property="classID"></bean:define>
											<html:option value="${classID }"><bean:write name="myClass" property="className"/> </html:option>
										</logic:iterate>
									</html:select>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12" style="padding: 0px;">
								<div class="col-lg-6" style="padding: 0px;">
									<div class='col-lg-3'>
										<label><i class="mdi mdi-currency-usd"></i> Học phí</label>
									</div>
									<div class="col-lg-9">
										<html:select styleId="classFee-student" property="classFee" styleClass="form-control" disabled="true" >
											<logic:iterate id="myClass" name="studentForm" property="listClass">
												<bean:define id="classID2" name="myClass" property="classID"></bean:define>
												<html:option value="${classID2 }"><bean:write name="myClass" property="classFee"/> </html:option>
											</logic:iterate>
										</html:select>
									</div>
								</div>
								<div class="col-lg-6" style="padding: 0px;">
									<div class="col-lg-3">
										<label><span class="glyphicon glyphicon-calendar"></span> Lịch học</label>
									</div>
									<div class="col-lg-9">
										<html:select styleId="classTime-student" property="classTime" styleClass="form-control" disabled="true" >
											<logic:iterate id="myClass" name="studentForm" property="listClass">
												<bean:define id="classID3" name="myClass" property="classID"></bean:define>
												<html:option value="${classID3 }"><bean:write name="myClass" property="classTime"/> </html:option>
											</logic:iterate>
										</html:select>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class='col-lg-3'>
									<label><i class="mdi mdi-currency-usd"></i> Số tiền đã
										nộp</label>
								</div>
								<div class="col-lg-9">
									<html:text styleId="studentAmountPaid" property="amountPaid" styleClass="form-control" ></html:text>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12"
								style="text-align: center; margin-top: 20px;">
								<input id="btn-submit" type="button" class="my-btn" value="Đăng ký">
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
								<div class="panel-title">Quản lí học viên</div>
							</div>
							<div class="panel-body">
								<div class="row">
									<button class="btn-add-new" onclick="addNewStudent()"
										style="padding: 20px; margin-left: 30px">
										<span class="glyphicon glyphicon-new-window"></span> Thêm học
										viên mới
									</button>
								</div>
								<div class="row" style="margin-top: 20px;">
									<div class="col-lg-12">
										<div class="col-lg-3">
											<label><span class="glyphicon glyphicon-list"></span>
												Danh sách học viên</label>
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
												<th>Tên học viên</th>
												<th>Email</th>
												<th>Số điện thoại</th>
												<th>Tên lớp</th>
												<th>Học phí đã đóng</th>
												<th>Xem</th>
												<th>Xóa</th>
											</tr>
										</thead>
										<tbody>
											<logic:iterate id="student" name="studentForm" property="students">
												<tr>
													<td><bean:write property="name" name="student"/> </td>
													<td><bean:write property="email" name="student"/> </td>
													<td><bean:write property="phoneNumber" name="student"/> </td>
													<td><bean:write property="className" name="student"/> </td>
													<td><bean:write property="amountPaid" name="student"/> </td>
													<bean:define id="studentID" name="student" property="studentID" ></bean:define>
													<td>
														<html:link href="#x" style="font-size:20px;" onclick="updateStudentInfor('${studentID }')">
															<span class="glyphicon glyphicon-new-window"></span>
														</html:link> 
													</td>
													<td>
														<html:link href="#x" style="font-size:20px;" onclick="deleteStudent('${studentID }')">
															<span class="glyphicon glyphicon-trash"></span>
														</html:link>
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
		<div id="footer">
			<jsp:include page="footer2.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>