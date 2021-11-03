<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page pageEncoding="UTF-8" %>
<html>
<head>
	<meta charset="UTF-8">
		<title></title>
		
		<link rel="stylesheet" href="css/amazeui.min.css">
		<link rel="stylesheet" href="css/admin.css">
		<style>
			.admin-main{
				padding-top: 0px;
			}
		</style>
	</head>
	<body>
		
		<div class="am-cf admin-main">
			<!-- content start -->
			<div class="admin-content">
				<div class="admin-content-body">
					<div class="am-g">
						<form class="am-form am-form-horizontal" action="depdateDepartp" onsubmit="return checkSub()" method="get" target="right" style="padding-top: 30px;">
							<input value="${d.did}" name="did" type="hidden">
							<div class="am-form-group">
								<label for="dname" class="am-u-sm-3 am-form-label">
									部门名称
								</label>
								<div class="am-u-sm-9" >
									<input id="dName" required="" placeholder="请输入部门名称" value="${d.dname}" name="dname" type="text">
									<small id="helpRole">输入部门名称。</small>
								</div>
							</div>
							<div class="am-form-group">
								<label for="duty" class="am-u-sm-3 am-form-label">
									部门职责
								</label>
								<div class="am-u-sm-9">
									<textarea id="duty" rows="" cols="50" placeholder="请输入部门职责" name="duty">${d.duty}</textarea>
									<small>输入部门职责。</small>
								</div>
							</div>
							<div class="am-form-group">
								<div class="am-u-sm-9 am-u-sm-push-3">
									<input id="addRole" class="am-btn am-btn-success" value="编辑部门" type="submit">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<script src="js/jquery-2.1.0.js"></script>
	<script>
		var bDName = false;
		var bDuty = false;
		$(function(){
			$("#dName").change(function () {
				if($("#dName").val().trim().length > 0){
					bDName = true;
				}
			});

			$("#duty").change(function () {
				if($("#duty").val().trim().length > 0){
					bDuty = true;
				}
			});
		});

		function checkSub(){
			if(bDName || bDuty){
				return true;
			}else{
				return false;
			}
		}
	</script>
	</body>
</html>
