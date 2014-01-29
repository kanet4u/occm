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
					<h3 class="page-header">Competition Management</h3>
					<ol class="breadcrumb">
						<li><a href="${pageContext.request.contextPath}/admin">Administration</a></li>
						<li><a
							href="${pageContext.request.contextPath}/admin/competition">Competition
								Management</a></li>
						<li class="active">Join Requests</li>
						<span class="pull-right admin_action"> <a
							href="${pageContext.request.contextPath}/admin/competition/request/approve/all"><i
								class="fa fa-check"></i> Approve All Requests</a>
						</span>
					</ol>

					<jsp:include page="/WEB-INF/views/admin/includes/messages.jsp" />

					<div class="table-responsive">
						<table class="table table-striped table-hover data-table"
							id="requests_table">
							<thead>
								<tr>
									<th style="width: 40px;">ID</th>
									<th class="col_title">Competition</th>
									<th class="col_user">Username</th>
									<th class="col_firstname">Firstname</th>
									<th class="col_lastname">Lastname</th>
									<th class="action col_approve">Approve</th>
									<th class="action col_delete">Delete</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="comp" items="${requestScope.userCompetitions}"
									varStatus="i">
									<tr>
										<td>${comp.id}</td>
										<td class="col_title"><a
											href="${pageContext.request.contextPath}/admin/competition/edit/${comp.id}">
												${comp.competition.title}</a></td>
										<td class="col_user"><a
											href="${pageContext.request.contextPath}/admin/user/edit/${comp.user.id}">
												${comp.user.email}</a></td>
										<td class="col_firstname">${comp.user.fname}</td>
										<td class="col_lastname">${comp.user.sname}</td>
										<td class="action col_approve"><a
											href="${pageContext.request.contextPath}/admin/competition/request/approve/${comp.id}"><i
												class="fa  fa-check-square"></i> </a></td>
										<td class="action col_delete"><a class="btn-delete"
											href="#"
											action="${pageContext.request.contextPath}/admin/competition/request/delete/${comp.id}"><i
												class="fa fa-minus-circle"></i></a></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/admin/includes/before_body_end.jsp" />

	<script type="text/javascript">
		$(document).ready(function() {
			$('#requests_table').dataTable({
				"aoColumnDefs" : [ {
					'bSortable' : false,
					'aTargets' : [ 5, 6 ]
				} ]
			});
			$('#requests_table_filter input').attr('placeholder', 'Search')
		});
	</script>
</body>
</html>
