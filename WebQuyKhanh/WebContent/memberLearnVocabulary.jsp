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
	function a() {
		$.ajax({
			type : "POST",
			url : "",
			data : "http://localhost:8080/WebQuyKhanh/member-learn-vocabulary",
			dataType : "json",
			success : function(response) {

			},
			error : function(errormessage) {
				alert("error :" + errormessage);
			},
		});
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		var lessonID=$("#lessonID").val();
		var response = $("#dataResponse").val();
		console.log("jsonObject \n" + response);
		var jsonObject = JSON.parse(response);
		var primary_word = jsonObject.primary_word;
		var extra_word = jsonObject.extra_word;
		var TOTAL_QUESTION = 0;
		var questions= new Array(0,0,0,0,0);
		var accuracy= new Array(0,0,0,0,0);
		var formLearns = ["#form-new-word","#form-question-vi-ja","#form-question-ja-vi",
		                  "#form-question-listen-1","#form-question-listen-3","#form-question-write"];
		

//		test form 1
// 		$(formLearns[0]).css("display","block");
// 		$("#fnw-ja").html(""+primary_word[0].japanese);
// 		$("#fnw-vi").html(""+primary_word[0].vietnamese);
// 		var audio=$("#fnw-audio")[0];
// 		$(audio).attr("src","japanese/audio/"+lessonID+"/"+primary_word[0].audio);
		
		function checkNumberExists(listNumber, number){
			for(var i=0; i<listNumber.length; i++ ){
				if(number==listNumber[i]){
					return false;
				}
			}
			return true;
		}
		function randomAnswer(currentWord,type){
			var answers= new Array();
			var listNumber= new Array();
			listNumber.push(currentWord);
			while(answers.length <3){
				var randomArray=Math.floor(Math.random()*2);
				if(randomArray==0){
					var randomWord=Math.floor(Math.random()*primary_word.length);
					if(checkNumberExists(listNumber, randomWord)){
						listNumber.push(randomWord);
						if(type=="vi"){
							answers.push(primary_word[randomWord].vietnamese);	
						}
						if(type=="ja"){
							answers.push(primary_word[randomWord].japanese);
						}
					}
				}
				else{
					var randomWord2=Math.floor(Math.random()*extra_word.length);
					if(checkNumberExists(listNumber, 5+randomWord2)){
						listNumber.push(5+randomWord2);
						if(type=="vi"){
							answers.push(extra_word[randomWord2].vietnamese);
						}
						if(type=="ja"){
							answers.push(extra_word[randomWord2].japanese);
						}
					}
				}
			}
			return answers;
		}
		
		function randomAnswerAudio(currentWord){
			var answers= new Array();
			var listNumber= new Array();
			listNumber.push(currentWord);
			while(answers.length<2){
				var randomWord=Math.floor(Math.random()*primary_word.length);
				if(checkNumberExists(listNumber,randomWord)){
					listNumber.push(randomWord);
					answers.push(primary_word[randomWord].audio);
				}
			}
			return answers;
		}
		
		function loadFormNewWord(currentWord){
			$(formLearns[questions[currentWord]]).css("display","block");
			$("#fnw-ja").html(""+primary_word[currentWord].japanese);
			$("#fnw-vi").html(""+primary_word[currentWord].vietnamese);
			var audio=$("#fnw-audio")[0];
			$(audio).attr("src","japanese/audio/"+lessonID+"/"+primary_word[currentWord].audio);
			questions[currentWord]+=1;
			TOTAL_QUESTION+=1;
		}
		function loadFormLearnNewWord(firstWord,secondWord,threeWord){
			var condition;
			if(threeWord==-1){
				condition= (questions[firstWord] <3) && (questions[secondWord]<3);
			}
			else{
				condition= (questions[firstWord] <6)&& (questions[secondWord] <6) && (questions[threeWord]<6);
			}
			console.log("condition"+condition);
			var currentWord=0;
			if(condition){
				if(threeWord==-1){
					currentWord=Math.floor((Math.random()*2)+firstWord);
					if(questions[currentWord]==3){
						if(currentWord==firstWord) {
							currentWord=secondWord;
						}
						else{
							currentWord=firstWord;
						}
					}
				}
				else{
					currentWord=Math.floor((Math.random()*3)+firstWord);
					if(questions[currentWord]==6){
						if(currentWord==firstWord){
							currentWord=secondWord;
						}
						else
						if(currentWord==secondWord){
							currentWord=threeWord;
						}
						else{
							currentWord=firstWord;
						}
					}
				}
				$(formLearns[questions[currentWord]]).css("display","block");
				switch(questions[currentWord]){
					case 1: {
						$("#fqvi-ja-vi").html(""+primary_word[currentWord].vietnamese);
						var answers=$(".fqvi-ja-answer");
						var listAnswers=randomAnswer(currentWord, "ja");
						var trueAnswers=Math.floor(Math.random()*4);
						$(answers[trueAnswers]).html(""+primary_word[currentWord].japanese);
						var j=0;
						for(var i=0; i<answers.length; i++){
							if(i!=trueAnswers){
								$(answers[i]).html(""+listAnswers[j]);
								j+=1;
							}
						}
						for(var i=0; i<answers.length; i++){
							$(answers[i]).on("click",function(){
								var data=$(this).html();
								if(primary_word[currentWord].japanese == data){
									console.log("true");
									accuracy[currentWord]+=1;
								}
								else{
									console.log("false");
								}
							});
						}
						questions[currentWord]+=1;
						TOTAL_QUESTION+=1;
						break;
					}
					case 2 : {
						$("#fqja-vi-ja").html(primary_word[currentWord].japanese);
						var answers=$(".fqja-vi-answer");
						var trueAnswer=Math.floor(Math.random()*answers.length);
						var listAnswer=randomAnswer(currentWord, "vi");
						$(answers[trueAnswer]).html(""+primary_word[currentWord].vietnamese);
						var j=0;
						for(var i=0; i<answers.length; i++){
							if(i!=trueAnswer){
								$(answers[i]).html(listAnswer[j]);
								j+=1;
							}
						}
						for(var i=0; i<answers.length; i++){
							$(answers[i]).on("click",function(){
								var data=$(this).html();
								if(data==primary_word[currentWord].vietnamese){
									console.log("true");
									accuracy[currentWord]+=1;
								}
								else{
									console.log("false");
								}
							});
						}
						questions[currentWord]+=1;
						TOTAL_QUESTION+=1;
						break;
					}
					case 3 : {
						var audio=$("#fq-listen-1-ja")[0];
						$(audio).attr("src","japanese/audio/"+lessonID+"/"+primary_word[currentWord].audio);
						var answers=$(".fq-listen-1-answer");
						var trueAnswer=Math.floor(Math.random()*answers.length);
						var listAnswer=randomAnswer(currentWord,"vi");
						$(answers[trueAnswer]).html(""+primary_word[currentWord].vietnamese);
						var j=0;
						for(var i=0; i<listAnswer.length; i++){
							if(i!=trueAnswer){
								$(answers[i]).html(""+listAnswer[j]);
								j+=1;
							}
						}
						for(var i=0; i<answers.length; i++){
							$(answers[i]).on("click",function(){
								var data=$(this).html();
								if(data==primary_word[currentWord].vietnamese){
									console.log("true");
									accuracy[currentWord]+=1;
								}
								else{
									console.log("false");
								}
							});
						}
						questions[currentWord]+=1;
						TOTAL_QUESTION+=1;
						break;
					}
					case 4 : {
						$("#fq-listen-3-vi").html(""+primary_word[currentWord].vietnamese);
						var answers=$(".fq-listen-3-answer");
						var trueAnswer=Math.floor(Math.random()*answers.length);
						var listAnswer=randomAnswerAudio(currentWord);
						var audio =$(answers[trueAnswer]).find("audio")[0];
						$(audio).attr("src","japanese/audio/"+lessonID+"/"+primary_word[currentWord].audio);
						var j=0;
						for(var i=0; i<answers.length; i++){
							if(i!=trueAnswer){
								var audioWrong=$(answers[i]).find("audio")[0];
								$(audioWrong).attr("src","japanese/audio/"+lessonID+"/"+listAnswer[j]);
								j+=1;
							}
						}
						for(var i=0; i<answers.length; i++){
							$(answers[i]).on("click",function(){
								for(var j=0; j<answers.length; j++){
									$(answers[j]).removeClass("my-volume-question-selected");
								}
								$(this).addClass("my-volume-question-selected");
								var data=primary_word[currentWord].audio;
								var audio=$(this).find("audio")[0];
								var src=$(audio).attr("src");
								src=src.substring(src.lastIndexOf("/")+1,src.length);
								if(data==src){
									console.log("true");
								}
								else{
									console.log("false");
								}
							});
						}
						questions[currentWord]+=1;
						TOTAL_QUESTION+=1;
						break;
					}
					case 5 : {
						$("fq-write-vi").html(""+primary_word[currentWord].vietnamese);
						questions[currentWord]+=1;
						TOTAL_QUESTION+=1;
						break;
					}
				}
			}
		}
		function showQuestion() {
			for (var i = 0; i < formLearns.length; i++) {
				$(formLearns[i]).css("display", "none");
			}
			if (TOTAL_QUESTION <= 25) {
				console.log("total question"+TOTAL_QUESTION);
				switch (TOTAL_QUESTION) {
				case 0: {
					loadFormNewWord(0);
					break;
				}
				case 1: {
					loadFormNewWord(1);
					break;
				}
				case 2:
				case 3:
				case 4:
				case 5: {
					loadFormLearnNewWord(0, 1, -1);
					break;
				}
				case 6: {
					loadFormNewWord(2);
					break;
				}
				case 7: {
					loadFormNewWord(3);
					break;
				}
				case 8:
				case 9:
				case 10:
				case 11: {
					loadFormLearnNewWord(2, 3, -1);
					break;
				}
				case 12: {
					loadFormNewWord(4);
					break;
				}
				case 13:
				case 14:
				case 15:
				case 16: {
					loadFormLearnNewWord(0, 1, -1);
					break;
				}
				case 17:
				case 18:
				case 19:
				case 20:
				case 21:
				case 22:
				case 23:
				case 24: {
					loadFormLearnNewWord(2, 3, 4);
					break;
				}
				}
			}
		}
		showQuestion();
		var btn_next=$(".btn-next");
		for(var i=0; i<btn_next.length; i++){
			$(btn_next[i]).on("click",function(){
				showQuestion();
				console.log("runnn");
			});
		}
	});

	$(document).ready(function() {
		var btn_volume = $(".my-volume");
		for (var i = 0; i < btn_volume.length; i++) {
			$(btn_volume[i]).on("click", function() {
				var tagName = $(this).prop("tagName");
				console.log("name" + tagName);
				var audio = $(this).find("audio")[0];
				audio.play();
			});
		}
		var btn_volume_question = $(".my-volume-question");
		for (var i = 0; i < btn_volume_question.length; i++) {
			$(btn_volume_question[i]).on("click", function() {
				var audio = $(this).find("audio")[0];
				audio.play();
			});
		}
	});
</script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header2.jsp"></jsp:include>
		<div class="container main-container2">
			<div class="main-content">
				<div class="row">
					<html:hidden styleId="dataResponse" property="dataResponse"
						name="learnJapaneseForm" />
					<html:hidden styleId="lessonID" property="lessonID" name="learnJapaneseForm"/>
					<div class="panel panel-success">
						<div class="panel-body learnProcess">
							<div class="row">
								<h5 class="col-lg-12">Học 5 từ mới : Bài 1</h5>
							</div>
							<div class="row">
								<div class="col-lg-2">
									<span class="glyphicon glyphicon-pause"></span>
								</div>
								<div class="col-lg-8">
									<div class="progress">
										<div class="progress-bar progress-bar-success"
											role="progressbar" aria-valuenow="60" aria-valuemin="0"
											aria-valuemax="100" style="width: 10%">10%</div>
									</div>
								</div>
								<div class="col-lg-2">
									<a href="vocaLessonOverview.html"><span
										class="glyphicon glyphicon-remove"></span></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row form-container">
					<div id="form-new-word" class="col-lg-12 form-learn">
						<div class="col-lg-offset-1 col-lg-10">
							<div class="col-lg-offset-1 col-lg-1">
								<span class="glyphicon glyphicon-volume-up my-volume"
									style="font-size: 50px;"><audio id="fnw-audio"></audio></span>													 
							</div>
							<div class="col-lg-9">
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
					<div id="form-question-vi-ja" class="col-lg-12 form-learn">
						<div class="col-lg-offset-1 col-lg-10">
							<div class="col-lg-12" style="margin-bottom: 20px">
								<div class="col-lg-offset-1 col-lg-1">
									<span class="glyphicon glyphicon-question-sign"
										style="font-size: 50px"></span>
								</div>
								<div class="col-lg-7">
									<label id="fqvi-ja-vi" style="font-size: 50px" >Tôi</label>
								</div>
								<div class="col-lg-2">
									<div class="col-lg-12 btn-next" id="fqvi-ja-next">
										<div class="col-lg-12">
											<span style="font-size: 40px"
												class="glyphicon glyphicon-chevron-right"></span>
										</div>
										<label style="margin-top: 10px; font-size: 20px">Tiếp</label>
									</div>
								</div>
								<div class="col-lg-1">
									<span class="glyphicon glyphicon-time" style="font-size: 50px"></span>
								</div>
							</div>
							<div class="col-lg-12"
								style="margin-bottom: 20px; margin-top: 50px;">
								<div class="col-lg-offset-2 col-lg-3 btn-answer fqvi-ja-answer">Item 1</div>
								<div class="col-lg-offset-1 col-lg-3 btn-answer fqvi-ja-answer">item 2</div>
							</div>
							<div class="col-lg-12" style="margin-bottom: 20px;">
								<div class="col-lg-offset-2 col-lg-3 btn-answer fqvi-ja-answer">Item 1</div>
								<div class="col-lg-offset-1 col-lg-3 btn-answer fqvi-ja-answer">item 2</div>
							</div>
							<div class="col-lg-12">
								<div id="fqvi-ja-view-answer" class="col-lg-offset-4 col-lg-3 btn-answer">
									<div class="col-lg-3"
										style="padding-left: 0px; font-size: 20px">
										<span class="glyphicon glyphicon-repeat"></span>
									</div>
									Xem câu trả lời
								</div>
							</div>
						</div>
					</div>
					<div id="form-question-ja-vi" class="col-lg-12 form-learn">
						<div class="col-lg-offset-1 col-lg-10">
							<div class="col-lg-12" style="margin-bottom: 20px">
								<div class="col-lg-offset-1 col-lg-1">
									<span class="glyphicon glyphicon-question-sign"
										style="font-size: 50px"></span>
								</div>
								<div class="col-lg-7">
									<label id="fqja-vi-ja" style="font-size: 50px">Tôi</label>
								</div>
								<div class="col-lg-2">
									<div class="col-lg-12 btn-next" id="fqja-vi-next">
										<div class="col-lg-12">
											<span style="font-size: 40px"
												class="glyphicon glyphicon-chevron-right"></span>
										</div>
										<label style="margin-top: 10px; font-size: 20px">Tiếp</label>
									</div>
								</div>
								<div class="col-lg-1">
									<span class="glyphicon glyphicon-time" style="font-size: 50px"></span>
								</div>
							</div>
							<div class="col-lg-12"
								style="margin-bottom: 20px; margin-top: 50px;">
								<div class="col-lg-12" style="margin-bottom: 10px;">
									<div class="col-lg-offset-3 col-lg-5 btn-answer fqja-vi-answer">Item 1</div>
								</div>
								<div class="col-lg-12" style="margin-bottom: 10px;">
									<div class="col-lg-offset-3 col-lg-5 btn-answer fqja-vi-answer">Item 1</div>
								</div>
								<div class="col-lg-12" style="margin-bottom: 10px;">
									<div class="col-lg-offset-3 col-lg-5 btn-answer fqja-vi-answer">Item 1</div>
								</div>
								<div class="col-lg-12" style="margin-bottom: 10px;">
									<div class="col-lg-offset-3 col-lg-5 btn-answer fqja-vi-answer">Item 1</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div  class="col-lg-offset-4 col-lg-3 btn-answer">
									<div class="col-lg-3"
										style="padding-left: 0px; font-size: 20px">
										<span class="glyphicon glyphicon-repeat"></span>
									</div>
									<h5 id="fqja-vi-view-answer">Xem câu trả lời</h5>
								</div>
							</div>
						</div>
					</div>
					<div id="form-question-listen-1" class="col-lg-12 form-learn">
						<div class="col-lg-offset-1 col-lg-10">
							<div class="col-lg-12" style="margin-bottom: 20px">
								<div class="col-lg-offset-1 col-lg-1">
									<span class="glyphicon glyphicon-question-sign"
										style="font-size: 50px"></span>
								</div>
								<div class="col-lg-7">
									<div class="col-lg-12" style="text-align: center;">
										<span class="glyphicon glyphicon-volume-up my-volume-question">
											<audio id="fq-listen-1-ja"></audio>
										</span>
									</div>
									<div class="col-lg-12">
										<h5>Chọn câu trả lời đúng :</h5>
									</div>
								</div>
								<div class="col-lg-2">
									<div class="col-lg-12 btn-next" id="fq-listen-1-next">
										<div class="col-lg-12">
											<span style="font-size: 40px"
												class="glyphicon glyphicon-chevron-right"></span>
										</div>
										<label style="margin-top: 10px; font-size: 20px">Tiếp</label>
									</div>
								</div>
								<div class="col-lg-1">
									<span class="glyphicon glyphicon-time" style="font-size: 50px"></span>
								</div>
							</div>
							<div class="col-lg-12"
								style="margin-bottom: 20px; margin-top: 50px;">
								<div class="col-lg-offset-2 col-lg-3 btn-answer fq-listen-1-answer">Item 1</div>
								<div class="col-lg-offset-1 col-lg-3 btn-answer fq-listen-1-answer">item 2</div>
							</div>
							<div class="col-lg-12" style="margin-bottom: 20px;">
								<div class="col-lg-offset-2 col-lg-3 btn-answer fq-listen-1-answer">Item 1</div>
								<div class="col-lg-offset-1 col-lg-3 btn-answer fq-listen-1-answer">item 2</div>
							</div>
							<div class="col-lg-12">
								<div class="col-lg-offset-4 col-lg-3 btn-answer">
									<div class="col-lg-3"
										style="padding-left: 0px; font-size: 20px">
										<span class="glyphicon glyphicon-repeat"></span>
									</div>
									Xem câu trả lời
								</div>
							</div>
						</div>
					</div>
					<div id="form-question-listen-3" class="col-lg-12 form-learn">
						<div class="col-lg-offset-1 col-lg-10">
							<div class="col-lg-12">
								<div class="col-lg-offset-1 col-lg-1">
									<span class="glyphicon glyphicon-question-sign"
										style="font-size: 50px;"></span>
								</div>
								<div class="col-lg-6" style="font-size: 50px;">
									<label id="fq-listen-3-vi">Người kia, người đó (Cách nói lịch sự)</label>
								</div>
								<div class="col-lg-3">
									<div class="col-lg-12 btn-next">
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
							<div class="col-lg-12" style="margin-top: 50px;">
								<div class="col-lg-12" style="text-align: center">
									<div class="col-lg-offset-1 col-lg-4">
										<span class="glyphicon glyphicon-volume-up my-volume-question fq-listen-3-answer ">
											<audio></audio>
										</span>
									</div>
									<div class="col-lg-4">
										<span class="glyphicon glyphicon-volume-up my-volume-question fq-listen-3-answer ">
											<audio></audio>
										</span>
									</div>
								</div>
								<div class="col-lg-12"
									style="text-align: center; margin-top: 20px;">
									<div class="col-lg-offset-1 col-lg-8">
										<span class="glyphicon glyphicon-volume-up my-volume-question fq-listen-3-answer ">
											<audio></audio>
										</span>
									</div>
								</div>
								<div class="col-lg-12" style="margin-top: 20px;">
									<div class="col-lg-offset-3 col-lg-4 btn-answer">
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
					<div id="form-question-write" class="col-lg-12 form-learn">
						<div class="col-lg-offset-1 col-lg-10">
							<div class="col-lg-12">
								<div class="col-lg-offset-1 col-lg-1">
									<span class="glyphicon glyphicon-question-sign"
										style="font-size: 50px;"></span>
								</div>
								<div class="col-lg-6" style="font-size: 50px;">
									<label id="fq-write-vi">Người kia, người đó (Cách nói lịch sự)</label>
								</div>
								<div class="col-lg-3">
									<div class="col-lg-12 btn-next">
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
									<div class="col-lg-offset-3 col-lg-4 btn-answer">
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
		</div>
		<div id="footer">
			<jsp:include page="footer2.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>