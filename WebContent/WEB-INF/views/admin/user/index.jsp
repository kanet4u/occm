<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/admin/includes/head.jsp" />
</head>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/admin/includes/navigation.jsp" />
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header">User Management</h3>
					<ol class="breadcrumb">
						<li><a href="${pageContext.request.contextPath}/admin">Administration</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/user">User
								Management</a></li>
						<span class="pull-right admin_action"><a
							href="${pageContext.request.contextPath}/admin/user/add"><i
								class="fa fa-plus"></i> Add New User</a></span>
					</ol>

					<jsp:include page="/WEB-INF/views/admin/includes/messages.jsp" />

					<div class="table-responsive">
						<table class="table table-striped table-hover data-table"
							id="users_table">
							<thead>
								<tr>
									<th>ID</th>
									<th class="col_email">Email</th>
									<th class="col_firstname visible-lg">Firstname</th>
									<th class="col_lastname visible-lg">Lastname</th>
									<th class="col_role">Role</th>
									<th class="action col_status">Status</th>
									<th class="action col_edit">Edit</th>
									<th class="action col_delete">Delete</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="user" items="${requestScope.users}"
									varStatus="i">
									<tr class="comp-running">
										<td>${user.id}</td>
										<td class="col_email"><a
											href="${pageContext.request.contextPath}/admin/user/edit/${user.id}">${user.email}</a>
										</td>
										<td class="col_firstname visible-lg">${user.fname}</td>
										<td class="col_lastname visible-lg">${user.sname}</td>
										<td class="col_role"><a
											href="${pageContext.request.contextPath}/admin/roles/edit/${user.role.id}">${user.role.role}</a></td>
										<td class="action col_status"><b>${user.status.status}</b><a
											href="${pageContext.request.contextPath}/admin/user/status/${user.id}"><i
												class="fa status-${user.status.status}"></i></a></td>
										<td class="action col_edit"><a
											href="${pageContext.request.contextPath}/admin/user/edit/${user.id}"><i
												class="fa fa-edit"></i> </a></td>
										<td class="action col_delete"><a
											href="${pageContext.request.contextPath}/admin/user/delete/${user.id}"><i
												class="fa fa-minus-circle"></i></a></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/admin/includes/before_body_end.jsp" />

		<script type="text/javascript">
			$(document).ready(function() {
				$('#users_table').dataTable({
					"aoColumnDefs" : [ {
						'bSortable' : false,
						'aTargets' : [ 6, 7 ]
					} ]
				});
				$('#users_table_filter input').attr('placeholder', 'Search')
			});
		</script>
</body>
</html>
