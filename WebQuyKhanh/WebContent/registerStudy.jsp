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
	href="css/mycss/styleframehome.css">
<link rel="stylesheet" type="text/css" href="css/mycss/styletooltip.css">
<script src="js/jquery-2.2.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/myjs/includehtml.js"></script>
<style type="text/css">
.form-register-study .col-lg-12 {
	margin-bottom: 10px;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		function resetStatus() {
			var toolTipText = $(".tooltiptext");
			for (var i = 0; i < toolTipText.length; i++) {
				$(toolTipText[i]).css("visibility", "hidden");
				$(toolTipText[i]).css("opacity", "0");
			}
			var formControl = $("#form-register-study .form-control");
			for (var i = 0; i < formControl.length; i++) {
				$(formControl[i]).css("border-color", "#ccc");
			}
		}
		$("#emailRT").focus(function(){
			resetStatus();
			$(this).css("border-color", "#66afe9");
			$("#emailRTError").css("visibility","visible");
			$("#emailRTError").css("opacity","1");
			setTimeout(function(){
				$("#emailRTError").css("opacity","0");
				$("#emailRTError").css("visibility","hidden");
			}, 1500);
		});
		$("#phoneNumberRT").focus(function(){
			resetStatus();
			$(this).css("border-color", "#66afe9");
			$("#phoneNumberRTError").css("visibility","visible");
			$("#phoneNumberRTError").css("opacity","1");
			setTimeout(function(){
				$("#phoneNumberRTError").css("opacity","0");
				$("#phoneNumberRTError").css("visibility","hidden");
			}, 1500);
		});
		$("#classRT").focus(function(){
			resetStatus();
			$(this).css("border-color", "#66afe9");
			$("#classRTError").css("visibility","visible");
			$("#classRTError").css("opacity","1");
			setTimeout(function(){
				$("#classRTError").css("opacity","0");
				$("#classRTError").css("visibility","hidden");
			}, 1500);
		});
		
		$("#btn-submit").on("click",function(){
			var email=$("#emailRT").val();
			var phoneNumber=$("#phoneNumberRT").val();
			var classID=$("#classRT").val();
			console.log("email"+email+"phone"+phoneNumber+"class"+classID);
			$.ajax({
				type : "POST",
				url : "register-study.do",
				data : "action=registerstudy&submit=true&email="+email+"&phoneNumber="+phoneNumber+"&classID="+classID,
				dataType : "json",
				success : function(response){
					var jsonObject= response[0];
					var result=jsonObject.result;
					if("success"==result){
						$("#notify").html("Bạn đã đăng ký học thành công, chúng tôi sẽ liên lạc với bạn sớm nhất có thể. Cảm ơn !");
						setTimeout(function(){
							window.location.href="home.do";
						}, 1500);
					}
					else{
						if(jsonObject.emailError!=null){
							$("#emailRT").css("border-color","red");
							$("#emailRTError").html(""+jsonObject.emailError);
						}
						if(jsonObject.phoneNumberError!=null){
							$("#phoneNumberRT").css("border-color","red");
							$("#phoneNumberRTError").html(""+jsonObject.phoneNumberError);
						}
					}
				},
				error : function(errormessage){
					alert("error" +errormessage);
				},
			});
		});
	});
</script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="container" style="margin-top: 50px;">
			<div class="row">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<logic:iterate id="posts" name="registerStudyForm"
							property="listPostsNews" indexId="index">
							<logic:equal value="0" name="index">
								<li data-target="#myCarousel" data-slide-to="${index }"
									class="active"></li>
							</logic:equal>
							<logic:notEqual value="0" name="index">
								<li data-target="#myCarousel" data-slide-to="${index }"></li>
							</logic:notEqual>
						</logic:iterate>
					</ol>
					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<logic:iterate id="posts" name="registerStudyForm"
							property="listPostsNews" indexId="index">
							<bean:define id="imageName" name="posts" property="image"></bean:define>
							<bean:define id="postID" name="posts" property="postID"></bean:define>
							<logic:equal value="0" name="index">
								<div class="item active">
									<html:link action="/view-posts?postID=${postID }">
										<img src="postsimage/${imageName }" alt="Hinh">
									</html:link>
									<div class="carousel-caption">
										<bean:write name="posts" property="title" />
									</div>
								</div>
							</logic:equal>
							<logic:notEqual value="0" name="index">
								<div class="item">
									<html:link action="/view-posts?postID=${postID }">
										<img src="postsimage/${imageName }" alt="Hinh">
									</html:link>
									<div class="carousel-caption">
										<bean:write name="posts" property="title" />
									</div>
								</div>
							</logic:notEqual>
						</logic:iterate>
					</div>
					<!-- Controls -->
					<a class="left carousel-control" href="#myCarousel" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
		<div class="container main-container">
			<div class="row">
				<div class="content">
					<div class="col-lg-9 main-content">
						<div class="row">
							<div class="panel panel-default mypanel">
								<div class="panel-heading">
									<div class="panel-title">Đăng ký học</div>
								</div>
								<div class="panel-body">
									<div class="row" style="text-align: center; font-size: 20px;">
										<label> Thông tin đăng ký </label>
									</div>
									<div class="row" style="text-align: center; color : #5cb85c" >
										<label id="notify"></label>
									</div>
									<div class="row">
										<hr>
									</div>	
									<div class="row form-register-study">
										<html:form action="/register-study">
											<div class="col-lg-12">
												<div class="col-lg-3">
													<label><span class="glyphicon glyphicon-envelope"></span>
														Email</label>
												</div>
												<div class="col-lg-6 mytooltip">
													<html:text styleId="emailRT" property="email"
														styleClass="form-control my-text-input"></html:text>
													<span id="emailRTError" class="tooltiptext"> Mời bạn nhập email ! </span>
												</div>
											</div>
											<div class="col-lg-12">
												<div class="col-lg-3">
													<label><span class="glyphicon glyphicon-phone"></span>
														Số điện thoại </label>
												</div>
												<div class="col-lg-6 mytooltip">
													<html:text styleId="phoneNumberRT" property="phoneNumber"
														styleClass="form-control my-text-input"></html:text>
													<span id="phoneNumberRTError" class="tooltiptext"> Mời bạn nhập số điện thoại ! </span>
												</div>
											</div>
											<div class="col-lg-12">
												<div class="col-lg-3">
													<label><span class="glyphicon glyphicon-book"></span>
														Chọn lớp </label>
												</div>
												<div class="col-lg-6 mytooltip">
													<html:select styleId="classRT" property="classID"
														styleClass="form-control my-text-input">
														<logic:iterate id="myClass" name="registerStudyForm"
															property="listClass">
															<bean:define id="classID" name="myClass"
																property="classID"></bean:define>
															<html:option value="${classID }">
																<bean:write property="className" name="myClass" /> : <bean:write
																	property="classTime" name="myClass" />
															</html:option>
														</logic:iterate>
													</html:select>
													<span id="classRTError" class="tooltiptext"> Mời bạn chọn lớp !</span>
												</div>
											</div>
											<div class="col-lg-12" style="text-align: center">
												<button id="btn-submit" type="button" class="my-btn">
													Đăng ký học</button>
											</div>
										</html:form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<jsp:include page="rightcontent.jsp"></jsp:include>
					</div>
				</div>
			</div>
		</div>
		<div id="footer">
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>