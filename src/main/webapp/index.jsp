<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

<!-- Modal -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">新增员工</h4>
      </div>
      <div class="modal-body">
      	<form class="form-horizontal">
		  <div class="form-group">
		    <label for="emptName" class="col-sm-2 control-label">员工姓名</label>
		    <div class="col-sm-10">
		      <input type="email" class="form-control" id="emptName" placeholder="emptName">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="email" class="col-sm-2 control-label">邮箱</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control" id="email" placeholder="example@example.com">
		    </div>
		  </div>
		   <div class="form-group">
		    <label for="gendar" class="col-sm-2 control-label">性别</label>
		    <div class="col-sm-10">
		      <label class="radio-inline">
			  <input type="radio" name="gendar" id="gendar1" value="M" checked> 男
			</label>
			<label class="radio-inline">
			  <input type="radio" name="gendar" id="gendar2" value="F"> 女
			</label>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="dId" class="col-sm-2 control-label">部门</label>
		    <div class="col-sm-4">
		    	<select class="form-control" id="showSelect"></select>
		    </div>
		  </div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary">提交</button>
      </div>
    </div>
  </div>
</div>

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
				<button class="btn btn-primary" id="emp_add_model_btn">新增</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all" /></th>
							<th>#</th>
							<th>empName</th>
							<th>gender</th>
							<th>email</th>
							<th>deptName</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
		</div>
		<!-- 显示分页信息 -->
		<div class="row">
			<!-- 分页信息 -->
			<div class="col-md-6" id="page_info_area"></div>
			<!-- 分页条信息 -->
			<div class="col-md-6" id="page_nav_area">
				<%-- 	<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a href="/ssm/emps?pn=1">首页</a></li>
					<c:if test="${pageInfo.hasPreviousPage}">
						<li><a href="/ssm/emps?pn=${pageInfo.pageNum-1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
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
						<li><a href="/ssm/emps?pn=${pageInfo.pageNum+1}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					<li><a href="/ssm/emps?pn=${pageInfo.pages}">末页</a></li>
				</ul>
				</nav> --%>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			to_page(1);
		});
		
		function to_page(pn){
			$.ajax({
				url : "${APP_PATH}/emps",
				data : "pn="+pn,
				type : "get",
				success : function(result) {
					//1.解析并显示员工数据
					build_emps_table(result);
					//2.解析并显示分页信息
					bulid_page_info(result);
					//3.解析显示分页条数据
					build_page_nav(result);
				}
			});
		}

		function build_emps_table(result) {
			$("#emps_table tbody").empty();
			var emps = result.map.pageInfo.list;
			$.each(
							emps,
							function(index, item) {
								var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
								var empIdTd = $("<td></td>").append(item.empId);
								var empNameTd = $("<td></td>").append(
										item.empName);
								var genderTd = $("<td></td>").append(
										item.gender == 'M' ? "男" : "女");
								var emailTd = $("<td></td>").append(item.email);
								var deptNameTd = $("<td></td>").append(
										item.department.deptName);
								var editBtn = $("<button></button>")
										.addClass(
												"btn btn-primary btn-sm edit_btn")
										.append(
												$("<span></span>")
														.addClass(
																"glyphicon glyphicon-pencil"))
										.append("编辑");
								//为编辑按钮添加一个自定义的属性，来表示当前员工id
								editBtn.attr("edit-id", item.empId);
								var delBtn = $("<button></button>")
										.addClass(
												"btn btn-danger btn-sm delete_btn")
										.append(
												$("<span></span>")
														.addClass(
																"glyphicon glyphicon-trash"))
										.append("删除");
								//为删除按钮添加一个自定义的属性来表示当前删除的员工id
								delBtn.attr("del-id", item.empId);
								var btnTd = $("<td></td>").append(editBtn)
										.append(" ").append(delBtn);
								//var delBtn = 
								//append方法执行完成以后还是返回原来的元素
								$("<tr></tr>").append(checkBoxTd).append(
										empIdTd).append(empNameTd).append(
										genderTd).append(emailTd).append(
										deptNameTd).append(btnTd).appendTo(
										"#emps_table tbody");
							});
		}
		//解析显示分页信息
		function bulid_page_info(result) {
			$("#page_info_area").empty();
			$("#page_info_area").append(
					"当前" + result.map.pageInfo.pageNum + "页，总"
							+ result.map.pageInfo.pages + "页，总"
							+ result.map.pageInfo.total + "条记录");
		}

		//解析显示分页条数据
		function build_page_nav(result) {
			//page_nav_area
			$("#page_nav_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			//构建元素
			var firstPageLi = $("<li></li>").append(
					$("<a></a>").append("首页").attr("href", "#"));
			var prePageLi = $("<li></li>").append(
					$("<a></a>").append("&laquo;"));
			if (result.map.pageInfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				//为元素添加点击翻页的事件
				firstPageLi.click(function() {
					to_page(1);
				});
				prePageLi.click(function() {
					to_page(result.map.pageInfo.pageNum - 1);
				});
			}

			var nextPageLi = $("<li></li>").append(
					$("<a></a>").append("&raquo;"));
			var lastPageLi = $("<li></li>").append(
					$("<a></a>").append("末页").attr("href", "#"));
			if (result.map.pageInfo.hasNextPage == false) {
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			} else {
				nextPageLi.click(function() {
					to_page(result.map.pageInfo.pageNum + 1);
				});
				lastPageLi.click(function() {
					to_page(result.map.pageInfo.pages);
				});
			}

			//添加首页和前一页 的提示
			ul.append(firstPageLi).append(prePageLi);
			//1,2，3遍历给ul中添加页码提示
			$.each(result.map.pageInfo.navigatepageNums, function(index,
					item) {

				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (result.map.pageInfo.pageNum == item) {
					numLi.addClass("active");
				}
				numLi.click(function() {
					to_page(item);
				});
				ul.append(numLi);
			});
			//添加下一页和末页 的提示
			ul.append(nextPageLi).append(lastPageLi);

			//把ul加入到nav
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		}
		
		$("#emp_add_model_btn").click(function(){
			//返回部门信息
			getDept();
			$('#empAddModal').modal({
				backdrop:"static"
			});
		});
		function getDept(){
			$.ajax({
				url : "${APP_PATH}/depts",
				type : "get",
				success : function(result) {
					console.log(result);
					//$("#showSelect").append()
					//{"code":100,"msg":"处理成功","map":{"depts":[{"deptId":1,"deptName":"testdept"},{"deptId":2,"deptName":"开发部"},{"deptId":3,"deptName":"测试部"}]}}
					$.each(result.map.depts,function(){
						var opentionEle=$("<option></option>").append(this.deptName).attr("value",this.deptId);
						opentionEle.appendTo("#showSelect");
					});
				}
			});
		}
		
	</script>
</body>
</html>