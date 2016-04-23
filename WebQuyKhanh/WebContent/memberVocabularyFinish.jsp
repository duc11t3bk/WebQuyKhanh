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
</head>
<body>
	<div class="wrapper">
		<div class="include" data-include="header.jsp"></div>
		<div class="container main-container">
			<div class="row">
				<div class="main-content">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<bean:define id="lesson" name="learnJapaneseForm"
								property="lesson"></bean:define>
							<bean:define id="lessonID" name="lesson" property="lessonID"></bean:define>
							<div class="panel-title">
								<ol class="breadcrumb">
									<li><html:link
											action="/member-manage-level?action=vocabulary">Học từ vựng </html:link></li>
									<li><html:link
											action="/member-manage-level?action=vocabulary">
											<bean:write name="lesson" property="levelName" />
										</html:link></li>
									<li class="active"><bean:write name="lesson"
											property="lessonName" /></li>
								</ol>
							</div>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-offset-1 col-lg-5">
									<div class="panel panel-default">
										<div class="panel-body">
											<div class="row">
												<h5 class="col-lg-offset-1 col-lg-8">
													<span class="glyphicon glyphicon-ok"></span> Số câu đúng
												</h5>
												<h5 class="col-lg-3">
													:
													<bean:write property="trueAnswers" name="learnJapaneseForm" />
													/25
												</h5>
											</div>
											<div class="row">
												<h5 class="col-lg-offset-1 col-lg-8">
													<span class="glyphicon glyphicon-time"></span> Tốc độ
												</h5>
												<h5 class="col-lg-3">:</h5>
											</div>
											<div class="row">
												<h5 class="col-lg-offset-1 col-lg-8">
													<span class="glyphicon glyphicon-flash"></span> Độ chính
													xác
												</h5>
												<h5 class="col-lg-3">
													:
													<bean:write property="accuracy" name="learnJapaneseForm" />
													%
												</h5>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-3">
									<html:link action="/member-manage-lesson?lessonID=${lessonID }">
										<div class="col-lg-12 btn-next">
											<div class="col-lg-12">
												<span style="font-size: 40px"
													class="glyphicon glyphicon-chevron-right"></span>
											</div>
											<label style="margin-top: 10px; font-size: 20px">Tiếp</label>
										</div>
									</html:link>
								</div>
							</div>
							<div class="row">
								<label style="margin-right: 10px;"> Những từ bạn đã học</label>
							</div>
							<div class="row">
								<div class="panel panel-default">
									<div class="panel-body">
										<div class="row">
											<div class="col-lg-4">
												<label>Tiếng Nhật</label>
											</div>
											<div class="col-lg-4">
												<label>Tiếng Việt</label>
											</div>
											<div class="col-lg-4">
												<label>Khả năng ghi nhớ</label>
											</div>
										</div>
										<logic:iterate id="japaneseData" name="learnJapaneseForm"
											property="listData" indexId="index">
											<div class="row">
												<div class="col-lg-4">
													<h5>
														<bean:write property="japanese" name="japaneseData" />
													</h5>
												</div>
												<div class="col-lg-4">
													<h5>
														<bean:write property="vietnamese" name="japaneseData" />
													</h5>
												</div>
												<bean:define id="wordStatus"
													property="listWordStatus[${index }]"
													name="learnJapaneseForm"></bean:define>
												<bean:define id="accuracy" name="wordStatus"
													property="accuracy"></bean:define>
												<div class="col-lg-4">
													<div class="progress">
														<div class="progress-bar progress-bar-success"
															role="progressbar" aria-valuenow="${accuracy }"
															aria-valuemin="0" aria-valuemax="100%"
															style="width:${accuracy}%">
															<bean:write property="accuracy" name="wordStatus" />
															%
														</div>
													</div>
												</div>
											</div>
										</logic:iterate>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="footer" class="include" data-include="footer.jsp"></div>
	</div>
</body>
</html>