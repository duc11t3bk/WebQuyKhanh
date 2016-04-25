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
	href="css/mycss/stylemanagejapanese.css">
<script src="js/jquery-2.2.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="libs/bootstrap-table-master/dist/bootstrap-table.min.js"></script>
<script src="js/myjs/includehtml.js"></script>
<style type="text/css">
.lesson-item {
	padding: 10px;
	border-bottom: 1px solid #ddd;
}
</style>
<script type="text/javascript">
	function eventChangeOption() {
		var learnOption = $("#learnOption").val();
		console.log("learn Option" + learnOption);
		if(learnOption=="review"){	
			console.log("run ajax");
			$.ajax({
				type : "POST",
				url : "http://localhost:8080/WebQuyKhanh/member-manage-lesson.do?lessonID=les00000011&learnOption="+learnOption,
				dataType : "json",
				success : function(response){
					var result=response[0].result;
					console.log("result"+result);
					if(result=="can_review"){
						$("#btn-submit").prop("disabled",false);
					}
					if(result=="cant_review"){
						$("#notify").html("Bạn phải học thuộc ít nhất năm từ trước khi ôn tập");
						$("#btn-submit").prop("disabled",true);
						$("#btn-submit").css("cursor","not-allowed");
					}
				},
				error : function(errormessage){
					alert("error "+errormessage);
				},
			});
		}
		if(learnOption=="learn"){
			console.log("not run ajax");
			$("#notify").html("");
			$("#btn-submit").prop("disabled",false);
			$("#btn-submit").css("cursor","pointer");
		}
	};
</script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="container main-container">
			<bean:define id="lesson" name="japaneseForm" property="lesson"></bean:define>
			<div class="row" style="margin-top: 20px;">
				<div class="main-content">
					<div class="panel panel-primary"
						style="box-shadow: 3px 3px 10px #888888;">
						<div class="panel-body">
							<logic:equal value="voca" name="lesson" property="category">
								<ol class="breadcrumb">
									<li><html:link
											action="/member-manage-level?action=vocabulary">Học từ vựng</html:link></li>
									<li><html:link
											action="/member-manage-level?action=vocabulary">
											<bean:write property="levelName" name="lesson" />
										</html:link></li>
									<li class="active"><bean:write property="lessonName"
											name="lesson" /></li>
								</ol>
							</logic:equal>
							<logic:equal value="tran" name="lesson" property="category">
								<ol class="breadcrumb">
									<li><html:link action="/member-manage-level?action=translate">Luyện dịch câu</html:link></li>
									<li><html:link action="/member-manage-level?action=translate">
											<bean:write property="levelName" name="lesson" />
										</html:link></li>
									<li class="active"><bean:write property="lessonName"
											name="lesson" /></li>
								</ol>
							</logic:equal>
							<div class="panel panel-default"
								style="box-shadow: 3px 3px 10px #888888">
								<div class="panel-body">
									<div class="row">
										<div class="col-lg-3">
											<button class="btn-add-new">
												<bean:write property="lessonName" name="lesson" />
											</button>
										</div>
										<div class="col-lg-9">
											<bean:define id="lessonStatus" name="japaneseForm"
												property="lessonStatus"></bean:define>
											<bean:define id="lessonComplete" name="lessonStatus"
												property="complete"></bean:define>
											<div class="progress">
												<div class="progress-bar progress-bar-success"
													role="progressbar" aria-valuenow="${lessonComplete }"
													aria-valuemin="0" aria-valuemax="100"
													style="width:${lessonComplete}%">
													<bean:write property="complete" name="lessonStatus" />
													%
												</div>
											</div>
											<div>
												<label id="notify" style="color: red"></label>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-offset-3 col-lg-9">
											<div class="row">
												<bean:define id="lessonID" name="lesson" property="lessonID"></bean:define>
												<logic:equal value="vocabulary" property="action" name="japaneseForm">
													<html:form action="/member-learn-vocabulary">
														<html:hidden property="lessonID" name="lesson" />
														<div class="col-lg-3" style="padding: 0px">
															<html:select styleId="learnOption"
																styleClass="dropdownlist" onchange="eventChangeOption()"
																property="learnOption" style="width:100%">
																<html:option value="learn">Học mới</html:option>
																<html:option value="review">Ôn tập</html:option>
															</html:select>
														</div>
														<html:submit styleId="btn-submit" property="submit"
															styleClass="col-lg-3 btn-learn">Học những từ này</html:submit>
													</html:form>
												</logic:equal>
												<logic:equal value="translate" property="action" name="japaneseForm">
													<html:form action="/member-learn-translate">
														<html:hidden property="lessonID" name="lesson" />
														<div class="col-lg-3" style="padding: 0px">
															<html:select styleId="learnOption"
																styleClass="dropdownlist" onchange="eventChangeOption()"
																property="learnOption" style="width:100%">
																<html:option value="learn">Học mới</html:option>
																<html:option value="review">Ôn tập</html:option>
															</html:select>
														</div>
														<html:submit styleId="btn-submit" property="submit"
															styleClass="col-lg-3 btn-learn">Dịch những câu này</html:submit>
													</html:form>
												</logic:equal>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row"
								style="margin-bottom: 10px; margin-top: 10px; text-align: center">
								<div class="col-lg-3">
									<label> <bean:write property="totalData" name="lesson" />
										từ
									</label>
								</div>
								<div class="col-lg-3">
									<span class="glyphicon glyphicon-eye-open"></span> <label>Học</label>
								</div>
								<div class="col-lg-3">
									<span class="glyphicon glyphicon-tint"></span> <label>Ôn
										tập</label>
								</div>
								<!-- 						<div class="col-lg-3">
									<button class="btn btn-default">
										<span class="glyphicon glyphicon-cog"></span> Bỏ qua
									</button>
								</div> -->
							</div>
							<div class="panel panel-default"
								style="box-shadow: 3px 3px 10px #888888">
								<div class="panel-body" style="padding: 20px;">
									<table data-toggle="table">
										<thead>
											<tr>
												<th data-width="30%">Tiếng Nhật</th>
												<th data-width="30%">Tiếng Việt</th>
												<th data-width="40%">Trạng thái</th>
											</tr>
										</thead>
										<tbody>
											<logic:iterate id="data" name="japaneseForm"
												property="listData" indexId="index">
												<tr>
													<td><bean:write property="japanese" name="data" /></td>
													<td><bean:write property="vietnamese" name="data" /></td>
													<bean:define id="wordStatus" name="japaneseForm"
														property="listWordStatus[${index }]"></bean:define>
													<bean:define id="accuracy" name="wordStatus"
														property="accuracy"></bean:define>
													<logic:equal value="100" property="accuracy"
														name="wordStatus">
														<td><span class="glyphicon glyphicon-tint"></span></td>
													</logic:equal>
													<logic:equal value="0" property="accuracy"
														name="wordStatus">
														<td><span class="glyphicon glyphicon-eye-open"></span>
														</td>
													</logic:equal>
													<logic:notEqual value="100" property="accuracy"
														name="wordStatus">
														<logic:notEqual value="0" property="accuracy"
															name="wordStatus">
															<td>
																<div class="progress">
																	<div class="progress-bar progress-bar-success"
																		role="progressbar" aria-valuenow="${accuracy }"
																		aria-valuemin="0" aria-valuemax="100"
																		style="width: ${accuracy}% ">
																		<bean:write property="accuracy" name="wordStatus" />
																		%
																	</div>
																</div>
															</td>
														</logic:notEqual>
													</logic:notEqual>
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
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>