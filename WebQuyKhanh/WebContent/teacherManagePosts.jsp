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
<script src="js/jquery-2.2.0.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="libs/bootstrap-table-master/dist/bootstrap-table.min.js"></script>
<script src="js/myjs/includehtml.js"></script>
<style type="text/css">
.teacher-info h5 {
	display: inline;
}
</style>
<script type="text/javascript">
	function deletePost(postID){
		console.log("postID :"+postID);
		$("#form-confirm").css("top","20%");
		$(".overflow").show();
		$("#ok").on("click",function(){
			window.location.href="/WebQuyKhanh/edit-posts.do?postID="+postID+"&action=delete";
			console.log("url"+window.location.href);
		});
		$("#cancel").on("click",function(){
			$("#form-confirm").css("top","-300px");
			$(".overflow").hide();
		});
	}
</script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header2.jsp"></jsp:include>
		<div class="overflow"></div>
		<div class="container" style="margin-top: 50px">
			<div class="row">
				<div class="col-lg-offset-4 col-lg-5" id="form-confirm">
					<div class="panel panel-primary">
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-2">
									<span class="glyphicon glyphicon-question-sign"
										style="font-size: 50px"></span>
								</div>
								<div class="col-lg-10" style="margin-top: 15px">
									<label>Bạn có chắc chắn muốn xóa bài viết này ?</label>
								</div>
							</div>
							<div class="row">
								<hr style="border: 3px solid #337ab7">
							</div>
							<div class="row" style="text-align: center">
								<div class="col-lg-offset-2 col-lg-4">
									<label><button id="ok" class="btn-confirm">
											<span class="glyphicon glyphicon-ok"></span> Có
										</button></label>
								</div>
								<div class="col-lg-4">
									<label><button id="cancel" class="btn-confirm">
											<span class="glyphicon glyphicon-remove"></span> Không
										</button></label>
								</div>
							</div>
						</div>
					</div>
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
								<div class="panel-title">Quản lí bài đăng</div>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-12">
										<html:link href="teacherCreateNewPosts.jsp">
											<button class="btn-add-new">
												<span class="glyphicon glyphicon-new-window"></span> Thêm
												bài viết mới
											</button>
										</html:link>
									</div>
								</div>

								<div class="row" style="margin-top: 40px;">
									<label class="col-lg-5"><span
										class="glyphicon glyphicon-list"></span> Danh sách bài viết </label>
									<div class="col-lg-offset-4 col-lg-3">
										<label class="col-lg-offset-2 col-lg-10"> <span
											class="glyphicon glyphicon-search"></span> Tìm kiếm :
										</label>
									</div>
								</div>
								<div class="row">
									<table data-toggle="table" data-pagination="true"
										data-page-size="4" data-page-list="[4,8,All]"
										data-search="true" data-height="500">
										<thead>
											<tr>
												<th data-width="40%">Tiêu đề</th>
												<th data-width="8%">Người đăng</th>
												<th data-width="8%">Ngày đăng</th>
												<th data-width="8%">Lượt xem</th>
												<th data-width="8%">Chỉnh sửa</th>
												<th data-width="8%">Xóa</th>
											</tr>
										</thead>
										<tbody>
											<logic:iterate id="post" name="postsForm" property="posts">
												<tr>
													<td><bean:write property="title" name="post" /></td>
													<td><bean:write property="teacherName" name="post" /></td>
													<td><bean:write property="datePosted" name="post" /></td>
													<td><bean:write property="views" name="post" /></td>
													<bean:define id="postID" name="post" property="postID"></bean:define>
													<td><html:link
															action="/edit-posts?postID=${postID }&action=edit">
															<span style="font-size: 20px;"
																class="glyphicon glyphicon-edit"></span>
														</html:link></td>
													<td><html:link href="#x" onclick="deletePost('${postID }')">
															<span style="font-size: 20px;"
																class="glyphicon glyphicon-trash"></span>
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