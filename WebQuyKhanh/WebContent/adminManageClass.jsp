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
<link rel="stylesheet" type="text/css" href="libs/MaterialDesign-Webfont-master/css/materialdesignicons.min.css">
<link rel="stylesheet" type="text/css" href="css/mycss/styleformconfirm.css">
<link rel="stylesheet" type="text/css"
	href="css/mycss/styleframehome.css">
<link rel="stylesheet" type="text/css"
	href="css/mycss/stylemanageclass.css">
<link rel="stylesheet" type="text/css"
	href="css/mycss/styleadminmanage.css">
<link rel="stylesheet" type="text/css" href="css/mycss/styletooltip.css">
<script src="js/jquery-2.2.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="libs/bootstrap-table-master/dist/bootstrap-table.min.js"></script>
<script src="js/myjs/form-confirm.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		function resetStatus(){
			var toolTipText=$(".tooltiptext");
			for(var i=0 ;i<toolTipText.length; i++){
				$(toolTipText[i]).css("visibility","hidden");
				$(toolTipText[i]).css("opacity","0");
			}
			var formControl=$("#form-add-new-class .form-control");
			for(var i=0; i<formControl.length; i++){
				$(formControl[i]).css("border-color","#ccc");
			}
		}
		$("#className").focus(function(){
			resetStatus();
			$(this).css("border-color","#66afe9");
			$("#classNameError").css("visibility","visible");
			$("#classNameError").css("opacity","1");
			setTimeout(function(){
				$("#classNameError").css("opacity","0");
				$("#classNameError").css("visibility","hidden");
			}, 1500);
		});
		$("#classFee").focus(function(){
			resetStatus();
			$(this).css("border-color","#66afe9");
			$("#classFeeError").css("visibility","visible");
			$("#classFeeError").css("opacity","1");
			setTimeout(function(){
				$("#classFeeError").css("opacity","0");
				$("#classFeeError").css("visibility","hidden");
			}, 1500);
		});
		$("#classTime").focus(function(){
			resetStatus();
			$(this).css("border-color","#66afe9");
			$("#classTimeError").css("visibility","visible");
			$("#classTimeError").css("opacity","1");
			setTimeout(function(){
				$("#classTimeError").css("opacity","0");
				$("#classTimeError").css("visibility","hidden");
			}, 1500);
		});
		$("#classRoom").focus(function(){
			resetStatus();
			$(this).css("border-color","#66afe9");
			$("#classRoomError").css("visibility","visible");
			$("#classRoomError").css("opacity","1");
			setTimeout(function(){
				$("#classRoomError").css("opacity","0");
				$("#classRoomError").css("visibility","hidden");
			}, 1500);
		});
		
		//submit data
		$("#btn-submit").on("click",function(){
			var action=$(this).val();
			var className=$("#className").val();
			var classFee=$("#classFee").val();
			var classTime=$("#classTime").val();
			var classRoom=$("#classRoom").val();
			var myClass= new Object();
			myClass.className=className;
			myClass.classFee=classFee;
			myClass.classTime=classTime;
			myClass.classRoom=classRoom;
			if("Thêm mới"==action){
				$.ajax({
					type: "POST",
					url : "http://localhost:8080/WebQuyKhanh/admin-manage-class.do",
					data : "action=add&jsonData="+JSON.stringify(myClass),
					dataType : "json",
					success : function(response){
						var jsonObject=response[0];
						var result=response[0].result;
						if("success"==result){
							$("#classNotify").html("Thêm mới thành công !");
							setTimeout(function(){
								window.location.reload();
							}, 1000);
						}
						if("failed"==result){
							if(jsonObject.classNameError!=null){
								$("#className").css("border-color","red");
								$("#classNameError").html(""+jsonObject.classNameError);
							}
							if(jsonObject.classFeeError!=null){
								$("#classFee").css("border-color","red");
								$("#classFeeError").html(""+jsonObject.classFeeError);
							}
							if(jsonObject.classTimeError!=null){
								$("#classTime").css("border-color","red");
								$("#classTimeError").html(""+jsonObject.classTimeError);
							}
							if(jsonObject.classRoomError!=null){
								$("#classRoom").css("border-color","red");
								$("#classRoomError").html(""+jsonObject.classRoomError);
							}
						}
					},
					error : function(errormessage){
						alert("error" +errormessage);
					},
				});
			}
			if("Lưu"==action){
				myClass.classID=$("#classID").val();
				$.ajax({
					type: "POST",
					url : "http://localhost:8080/WebQuyKhanh/admin-manage-class.do",
					data : "action=update&jsonData="+JSON.stringify(myClass),
					dataType : "json",
					success : function(response){
						var jsonObject=response[0];
						var result=response[0].result;
						if("success"==result){
							$("#classNotify").html("Lưu thành công !");
							setTimeout(function(){
								window.location.reload();
							}, 1000);
						}
						if("failed"==result){
							if(jsonObject.classNameError!=null){
								$("#className").css("border-color","red");
								$("#classNameError").html(""+jsonObject.classNameError);
							}
							if(jsonObject.classFeeError!=null){
								$("#classFee").css("border-color","red");
								$("#classFeeError").html(""+jsonObject.classFeeError);
							}
							if(jsonObject.classTimeError!=null){
								$("#classTime").css("border-color","red");
								$("#classTimeError").html(""+jsonObject.classTimeError);
							}
							if(jsonObject.classRoomError!=null){
								$("#classRoom").css("border-color","red");
								$("#classRoomError").html(""+jsonObject.classRoomError);
							}
						}
					},
					error : function(errormessage){
						alert("error" +errormessage);
					},
				});
			}
		});
	});
	function cancelRegister() {
		$("#form-add-new-class").css("top", "-100%");
		$(".overflow").hide();
	}
	function showClassForm(){
		$("#form-add-new-class").css("top", "20%");
		$(".overflow").show();
	}
	function addNewClass(){
		var action=$("#btn-submit").val();
		if("Lưu"==action){
			$("#btn-submit").val("Thêm mới");
			$("#title").html("Thêm lớp mới");
			$("#className").val("");
			$("#classFee").val("");
			$("#classTime").val("");
			$("#classRoom").val("");
		}
		$("#classFee").val("");
		showClassForm();
	}
	function updateClassInfor(classID){
		$("#btn-submit").val("Lưu");
		$("#title").html("Xem thông tin lớp");
		$.ajax({
			type : "POST",
			url : "http://localhost:8080/WebQuyKhanh/admin-manage-class.do",
			data : "action=view&classID="+classID,
			dataType: "json",
			success : function(response){
				var classID=response.classID;
				var className=response.className;
				var classFee=response.classFee;
				var classTime=response.classTime;
				var classRoom=response.classRoom;				
				$("#classID").val(classID);
				$("#className").val(className);
				$("#classFee").val(classFee);
				$("#classTime").val(classTime);
				$("#classRoom").val(classRoom);		
			},
			error : function(errormessage){
				alert("error "+ errormessage);
			},
		});
		showClassForm();
	}
	function deleteClass(classID){
		var path="http://localhost:8080/WebQuyKhanh/admin-manage-class.do?action=delete&classID="+classID;
		var message="Bạn có chắc chắn muốn xóa lớp học này ?";
		formConfirm(path, message);
	}
</script>
</head>
<body>
	<div class="wrapper">
		<div class="container" id="admin-manage-register">
			<div class="row">
				<div class="col-lg-offset-3 col-lg-6 form-register" id="form-add-new-class">
					<div class="row" style="text-align: right;">
						<span id="my-remove" class="glyphicon glyphicon-remove" onclick="cancelRegister()"></span>
					</div>
					<div class="row" style="text-align: center">
						<label id="title" style="font-size: 20px;" >Thêm lớp mới</label>
					</div>
					<div class="row" style="text-align: center">
						<label id="classNotify" style="color: #4CAF50"></label>
					</div>
					<div class="row">
						<hr>
					</div>
					<html:form action="/admin-manage-class">
						<html:hidden styleId="classID" property="classID" />
						<div class="row">
							<div class="col-lg-12">
								<div class="col-lg-3">
									<label><span class="mdi mdi-book-plus"></span> Tên lớp</label>
								</div>
								<div class="col-lg-9 mytooltip">
									<html:text styleId="className" styleClass="form-control" property="className"></html:text>
									<span id="classNameError" class="tooltiptext">Mời bạn nhập tên lớp !</span>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="col-lg-3">
									<label><span class="mdi mdi-currency-usd"></span>Học phí </label>
								</div>
								<div class="col-lg-9 mytooltip">
									<html:text styleId="classFee" styleClass="form-control" property="classFee"></html:text>
									<span id="classFeeError" class="tooltiptext">Mời bạn nhập học phí !</span>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="col-lg-3">
									<label><span class="glyphicon glyphicon-time"></span> Thời gian học</label>	
								</div>
								<div class="col-lg-9 mytooltip">
									<html:text styleId="classTime" styleClass="form-control" property="classTime"></html:text>
									<span id="classTimeError" class="tooltiptext">Mời bạn nhập thời gian học !</span>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="col-lg-3">
									<label><span class="glyphicon glyphicon-home"></span> Phòng học</label>
								</div>
								<div class="col-lg-9 mytooltip">
									<html:text styleId="classRoom" styleClass="form-control" property="classRoom"></html:text>
									<span id="classRoomError" class="tooltiptext">Mời bạn nhập phòng học !</span>
								</div>
							</div>
						</div>
						<div class="row" style="text-align: center">
							<input id="btn-submit" type="button" class="my-btn" value="Thêm mới">
						</div>
					</html:form>
				</div>
			</div>
		</div>
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
								<div class="panel-title">Quản lí lớp</div>
							</div>
							<div class="panel-body">
								<div class="row">
									<button id="addClass" class="btn-add-new" onclick="addNewClass()"
										style="padding: 20px; margin-left: 30px">
										<span class="glyphicon glyphicon-new-window"></span> Thêm lớp
										mới
									</button>
								</div>
								<div class="row" style="margin-top: 20px;">
									<div class="col-lg-12">
										<div class="col-lg-3">
											<label><span class="glyphicon glyphicon-list"></span> Danh Sách Lớp Học </label>	
										</div>
										<div class="col-lg-offset-6 col-lg-3">
											<label><span class="glyphicon glyphicon-search"></span> Tìm kiếm </label>
										</div>
									</div>
								</div>
								<div class="row">
									<table	data-toggle="table" data-pagination="true" data-search="true"
											data-page-size="8" data-page-list="[8,16,All]" data-height="500" 
										>
										<thead>
											<tr>
												<th>Tên lớp </th>
												<th>Học phí </th>
												<th>Thời gian học</th>
												<th>Phòng học</th>
												<th>Xem</th>
												<th>Xóa</th>
											</tr>	
										</thead>
										<tbody>
											<logic:iterate id="myClass" name="classForm" property="listClass">
												<tr>
													<td><bean:write property="className" name="myClass"/> </td>
													<td><bean:write property="classFee" name="myClass"/> </td>
													<td><bean:write property="classTime" name="myClass"/> </td>
													<td><bean:write property="classRoom" name="myClass"/> </td>
													<bean:define id="classID" name="myClass" property="classID"></bean:define>
													<td>
														<html:link href="#x" style="font-size:20px;" onclick="updateClassInfor('${classID }')"><span class="glyphicon glyphicon-new-window"></span></html:link>
													</td>
													<td>
														<html:link href="#x" style="font-size:20px;" onclick="deleteClass('${classID }')"><span class="glyphicon glyphicon-trash"></span> </html:link>
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