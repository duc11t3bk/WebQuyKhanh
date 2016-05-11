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
	href="css/mycss/styleviewlistpost.css">
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
				<div class="content">
					<div class="col-lg-9 main-content">
						<div class="row">
							<div class="panel panel-default"
								style="background-color: transparent">
								<div class="panel-heading">
									<div class="panel-title">Du Học Nhật Bản</div>
								</div>
								<div class="panel-body" style="background-color: transparent;">
									<logic:iterate id="post" name="postsForm" property="posts">
										<bean:define id="imageName" name="post" property="image"></bean:define>
										<bean:define id="postID" name="post" property="postID"></bean:define>
										<div class="row my-post-item">
											<div class="col-lg-12">
												<div class="col-lg-5">
													<img alt="hinh" src="postsimage/${imageName }">
												</div>
												<div class="col-lg-7"
													style="position: relative; height: 100%; padding: 10px;">
													<div class="col-lg-12">
														<html:link action="/view-posts?postID=${postID }"><label style="cursor:pointer"><bean:write property="title" name="post" /></label></html:link> 
													</div>
													<div class="col-lg-12 my-content">
														<html:hidden styleClass="contentHidden" property="content" name="post"/>
													</div>
													<div class="col-lg-12"
														style="position: absolute; bottom: 0px; color: #9E9E9E">
														<div class="col-lg-6">
															<h6>
																<span class="glyphicon glyphicon-pencil"></span> <bean:write property="teacherName" name="post"/>
															</h6>
														</div>
														<div class="col-lg-6">
															<h6>
																<span class="glyphicon glyphicon-calendar"></span>
																<bean:write property="datePosted" name="post"/>
															</h6>
														</div>
													</div>
												</div>
											</div>
										</div>
									</logic:iterate>
								</div>
							</div>
						</div>
						<div class="row">
							<nav style="text-align:center">
							<ul class="pagination">
								<li><a href="#" arial-label="Previous"> <span
										arial-hidden="true">&laquo</span>
								</a></li>
								<bean:define id="currentPage" name="postsForm" property="page"></bean:define>
								<bean:define id="category" name="postsForm" property="category"></bean:define>
								<logic:iterate id="i" name="postsForm" property="pagination" >
									<logic:equal value="${currentPage }" name="i">
										<li class="active"><html:link action="/view-list-posts?category=${category }&page=${i }"><bean:write name="i"/> </html:link> </li>
									</logic:equal>
									<logic:notEqual value="${currentPage }" name="i">
										<li ><html:link action="/view-list-posts?category=${category }&page=${i }"><bean:write name="i"/> </html:link></li>
									</logic:notEqual>
								</logic:iterate>
								<li><a href="#" arial-label="Next"> <span
										arial-hidden="true">&raquo</span>
								</a></li>
							</ul>
							</nav>
						</div>
					</div>
					<div class="col-lg-3 include" data-include="rightcontent.jsp"></div>
				</div>
			</div>
		</div>
		<div id="footer" class="include" data-include="footer.jsp"></div>
	</div>
	<script type="text/javascript">
		var content=$(".my-content");
		var contentHidden=$(".contentHidden");
		for(var i=0; i<content.length; i++){
			var contentPost=$(contentHidden[i]).val();
			console.log(""+contentPost);
			$(content[i]).append(""+$(contentHidden[i]).val());
		}
	</script>
</body>
</html>