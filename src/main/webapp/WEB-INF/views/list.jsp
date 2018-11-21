<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script type="text/javascript" src="/static/js/jquery-3.3.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 搭建显示界面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary">新增</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<th>#</th>
						<th>empName</th>
						<th>gender</th>
						<th>email</th>
						<th>deptName</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${pageInfo.list}" var="emp">
						<tr>
							<td>${emp.empId}</td>
							<td>${emp.empName}</td>
							<td>${emp.gendar=="M"?"男":"女"}</td>
							<td>${emp.email}</td>
							<td>${emp.department.deptName}</td>
							<td>
								<button class="btn btn-primary btn-sm">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑
								</button>
								<button class="btn btn-danger btn-sm">
									<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
								</button>
							</td>
						</tr>
					</c:forEach>

				</table>
			</div>
		</div>
		<!-- 显示分页信息 -->
		<div class="row">
			<!-- 分页信息 -->
			<div class="col-md-6">
			当前${pageInfo.pageNum}页，总${pageInfo.pages}页，总${pageInfo.total}条记录
			</div>
			<!-- 分页条信息 -->
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a href="/ssm/emps?pn=1">首页</a></li>
					<c:if test="${pageInfo.hasPreviousPage}">
						<li><a href="/ssm/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span>
						</a></li>					
					</c:if>
					<c:forEach items="${pageInfo.navigatepageNums}" var="pageNum">
						<c:if test="${pageNum==pageInfo.pageNum}">
							<li class="active"><a href="#">${pageNum}</a></li>
						</c:if>
						<c:if test="${pageNum!=pageInfo.pageNum}">
							<li><a href="/ssm/emps?pn=${pageNum}">${pageNum}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageInfo.hasNextPage}">
						<li><a href="/ssm/emps?pn=${pageInfo.pageNum+1}" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					<li><a href="/ssm/emps?pn=${pageInfo.pages}">末页</a></li>
				</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>