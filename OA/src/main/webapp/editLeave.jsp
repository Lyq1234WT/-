<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<meta charset="UTF-8">
		<title></title>
		
			<link rel="stylesheet" href="css/amazeui.min.css">
		<link rel="stylesheet" href="css/admin.css">
		<link rel="stylesheet" href="css/app.css">
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
						<form class="am-form am-form-horizontal" action="editNote" target="right" method="post" style="padding-top: 30px;">
							<input value="${note.nid}" name="nid" type="hidden">
							<input id="eid" required="" placeholder="" value="${emp.eid}" name="eid" type="hidden">
							<div class="am-form-group">
								<label for="realName" class="am-u-sm-3 am-form-label">
									申请人
								</label>
								<div class="am-u-sm-9">
									<input id="realName" required="" placeholder="请输入部门名称" value="${emp.realname}" name="realName" type="text">

								</div>
							</div>
							<div class="am-form-group">
								<label for="title" class="am-u-sm-3 am-form-label">
									请假标题
								</label>
								<div class="am-u-sm-9">
									<textarea rows="" cols="50" id="title" placeholder="请输入请假标题" name="title">${note.title}</textarea>
								</div>
							</div>
							<div class="am-form-group">
								<label for="context" class="am-u-sm-3 am-form-label">
									请假理由
								</label>
								<div class="am-u-sm-9">
									<textarea rows="" cols="50" id="context" placeholder="请输入请假理由" name="context">${note.context}</textarea>
								</div>
							</div>
							<div class="am-form-group">
								<label for="startDate" class="am-u-sm-3 am-form-label">
									开始时间
								</label>
								<div class="am-u-sm-9">
									<input type="text" id="startDate" name="startDate" value="<fmt:formatDate value='${note.startDate}' pattern="yyyy-MM-dd"/>" placeholder="请输入请假结束时间" />
								</div>
							</div>
							<div class="am-form-group">
								<label for="endDate" class="am-u-sm-3 am-form-label">
									结束时间
								</label>
								<div class="am-u-sm-9">
									<input type="text" id="endDate" value="<fmt:formatDate value='${note.endDate}' pattern="yyyy-MM-dd"/>" name="endDate" placeholder="请输入请假结束时间" />
								</div>
							</div>
							<div class="am-form-group">
								<label for="length" class="am-u-sm-3 am-form-label">
									请假时长(天)
								</label>
								<div class="am-u-sm-9">
									<input type="text" id="length" name="length" value="${note.length}" placeholder="请输入请假结束时间" />
								</div>
							</div>
							<div class="am-form-group">
								<div class="am-u-sm-9 am-u-sm-push-3">
									<input id="addRole" class="am-btn am-btn-success" value="修改请假" type="submit">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
