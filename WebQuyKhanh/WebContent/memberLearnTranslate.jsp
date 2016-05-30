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
<link rel="stylesheet" type="text/css"
	href="css/mycss/stylelearnjapanese.css">
<script src="js/jquery-2.2.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/myjs/includehtml.js"></script>


<script type="text/javascript">
	$(document).ready(
			function() {
				var dataResponse = $("#dataResponse").val();
				console.log("response " + dataResponse);
				var jsonObject = JSON.parse(dataResponse);
				var sentences = jsonObject.sentences;
				var completes = new Array();
				var TOTAL_QUESTION = 0;
				var currentSentence = 0;
				for (var i = 0; i < sentences.length; i++) {
					completes.push(0);
				}
				/**start translate*/
				showQuestion();
				function showQuestion() {
					hideAllForm();
					$("#form-question-write").css("display","block");
					if (TOTAL_QUESTION < sentences.length) {
						$("#fq-write-vi").html(
								"" + sentences[currentSentence].vietnamese);
						$("#fq-write-answer").val("");
					} else {
						var jsonArray= new Array();
						for(var i=0; i<completes.length; i++){
							var jsonObject= new Object();
							jsonObject.data_id=sentences[i].data_id;
							jsonObject.japanese=sentences[i].japanese;
							jsonObject.vietnamese=sentences[i].vietnamese;
							jsonObject.complete=completes[i];
							jsonArray.push(jsonObject);
						}
						var jsonString= JSON.stringify(jsonArray);
						console.log("dataReceive" +jsonString);
						$("#dataReceive").val(""+jsonString);
						$("#form-submit").submit();
					}
					TOTAL_QUESTION+=1;
				}
				function hideAllForm(){
					var formLearn=$(".form-learn");
					for(var i=0; i<formLearn.length; i++){
						$(formLearn[i]).css("display","none");
					}
				}
				function showFormNewWord(){
					hideAllForm();
					$("#form-new-word").css("display","block");
					console.log(""+sentences[currentSentence].japanese);
					console.log(""+sentences[currentSentence].vietnamese);
					$("#fnw-ja").html(sentences[currentSentence].japanese);
					$("#fnw-vi").html(sentences[currentSentence].vietnamese);
				}
				$("#btn-check-write").on("click",function(){
					$("#fq-write-answer").removeClass("btn-answer-true");
					$("#fq-write-answer").removeClass("btn-answer-false");
					currentSentence+=1;
					showQuestion();
				});
				$("#fq-write-answer").on("keyup",function(){
					var data=$("#fq-write-answer").val();
					var answer=sentences[currentSentence].japanese;
					console.log("answer" +sentences[currentSentence].japanese);
					console.log("data equal"+(data==answer));
					if(data==answer){
						$(this).removeClass("btn-answer-false");
						$(this).addClass("btn-answer-true");
						var btn=this;
						setTimeout(function(){
							$(btn).removeClass("btn-answer-true");
							completes[currentSentence]+=5;
							currentSentence+=1;
							showQuestion();
						}, 1000);
					}
					else{
						$(this).addClass("btn-answer-false");
					}
				});
				var view_answers=$(".view-answer");
				for(var i=0; i<view_answers.length; i++){
					$(view_answers[i]).on("click",function(){
						showFormNewWord();
					});
				}
				$("#fnw-btn-next").on("click",function(){
					currentSentence+=1;
					showQuestion();
				});
			});
</script>
</head>
<body>
	<div class="wrapper">
		<div class="include" data-include="header2.jsp"></div>
		<div class="container main-container2">
			<div class="row">
				<div class="main-content">
					<div class="panel panel-success">
						<div class="panel-body learnProcess">
							<html:hidden styleId="dataResponse" property="dataResponse"
								name="learnJapaneseForm" />
							<bean:define id="lesson" name="learnJapaneseForm"
								property="lesson"></bean:define>
							<html:form styleId="form-submit" action="/member-learn-translate">
								<html:hidden styleId="dataReceive" property="dataReceive"/>
								<html:hidden property="lessonID"/>
								<html:hidden property="learnOption"/>
							</html:form>
							<div class="row">
								<h5 class="col-lg-12">
									Luyện dịch câu :
									<bean:write property="levelName" name="lesson" />
									-
									<bean:write property="lessonName" name="lesson" />
								</h5>
							</div>
							<div class="row">
								<div class="col-lg-2" style="text-align: right">
									<span class="glyphicon glyphicon-pause"></span>
								</div>
								<div class="col-lg-8">
									<div class="progress">
										<div id="my-progress"
											class="progress-bar progress-bar-success" role="progressbar"
											aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
											style="width: 10%">10%</div>
									</div>
								</div>
								<div class="col-lg-2">
									<span class="glyphicon glyphicon-remove"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div id="form-new-word" class="col-lg-12 form-learn">
					<div class="col-lg-offset-1 col-lg-10">
						<div class="col-lg-offset-2 col-lg-9">
							<div class="col-lg-12">
								<div class="col-lg-9" style="padding-left: 0px">
									<label style="font-size: 40px" id="fnw-ja"></label>
								</div>
								<div class="col-lg-3">
									<div class="col-lg-12 btn-next" id="fnw-btn-next">
										<div class="col-lg-12">
											<span style="font-size: 40px"
												class="glyphicon glyphicon-chevron-right"></span>
										</div>
										<label style="margin-top: 10px; font-size: 20px">Tiếp</label>
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<hr>
							</div>
							<div class="col-lg-12">
								<h5 style="font-size: 30px" id="fnw-vi">Tôi</h5>
							</div>
							<div class="col-lg-12">
								<hr>
							</div>
						</div>
					</div>
				</div>
				<div id="form-question-write" class="col-lg-12 form-learn">
					<div class="col-lg-offset-1 col-lg-10">
						<div class="col-lg-12">
							<div class="col-lg-offset-1 col-lg-1">
								<span class="glyphicon glyphicon-question-sign"
									style="font-size: 50px;"></span>
							</div>
							<div class="col-lg-6" style="font-size: 50px;">
								<label id="fq-write-vi">Người kia, người đó (Cách nói
									lịch sự)</label>
							</div>
							<div class="col-lg-3">
								<div id="btn-check-write" class="col-lg-12 btn-check">
									<div class="col-lg-12">
										<span style="font-size: 40px"
											class="glyphicon glyphicon-chevron-right"></span>
									</div>
									<label style="margin-top: 10px; font-size: 20px">Kiểm
										tra</label>
								</div>
							</div>
							<div class="col-lg-1">
								<span class="glyphicon glyphicon-time" style="font-size: 50px;"></span>
							</div>
						</div>
						<div class="col-lg-offset-1 col-lg-12">
							<h5>Nhập câu trả lời tiếng Nhật cho tiếng Việt ở trên</h5>
						</div>
						<div class="col-lg-12" style="margin-top: 20px;">
							<div class="col-lg-12">
								<div class="col-lg-10">
									<input id="fq-write-answer" type="text" class="text-answer">
								</div>
							</div>
							<div class="col-lg-12" style="margin-top: 20px;">
								<div class="col-lg-offset-3 col-lg-4 btn-answer view-answer">
									<div class="col-lg-3"
										style="padding-left: 0px; font-size: 20px">
										<span class="glyphicon glyphicon-repeat"></span>
									</div>
									Xem câu trả lời
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="footer" class="include" data-include="footer2.jsp"></div>
	</div>
</body>
</html>