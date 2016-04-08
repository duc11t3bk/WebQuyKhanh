<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!----- Form-confirm  ----->
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
								<label id="form-confirm-message">Bạn có chắc chắn muốn xóa bài viết này ?</label>
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
</body>
</html>