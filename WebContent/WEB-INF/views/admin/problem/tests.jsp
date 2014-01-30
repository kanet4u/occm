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
					<h3 class="page-header">Test Case Management</h3>
					<ol class="breadcrumb">
						<li><a href="${pageContext.request.contextPath}/admin">Administration</a></li>
						<li><a
							href="${pageContext.request.contextPath}/admin/problem">Problem
								Management</a></li>
						<li class="active">Problem Test Cases</li>
						<span class="pull-right admin_action"><a
							href="${pageContext.request.contextPath}/admin/problem/tests/add"><i
								class="fa fa-plus"></i> Add Test Case</a></span>
					</ol>

					<jsp:include page="/WEB-INF/views/admin/includes/messages.jsp" />

					<div class="table-responsive">
						<table class="table table-striped table-hover data-table"
							id="tests_table">
							<thead>
								<tr>
									<th>ID</th>
									<th class="col_problem">Problem</th>
									
									<th class="action col_edit">Edit</th>
									<th class="action col_delete">Delete</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="test" items="${requestScope.tests}"
									varStatus="i">
									<tr class="comp-running">
										<td>${test.id}</td>
										
										<td class="col_title visible-lg visible-md"><a
											href="${pageContext.request.contextPath}/admin/problem/edit/${problem.id}">
												${test.problem.title}</a></td>
										
										<td class="action col_edit"><a
											href="${pageContext.request.contextPath}/admin/problem/tests/edit/${test.id}"><i
												class="fa fa-edit"></i> </a></td>
										<td class="action col_delete"><a class="btn-delete"
											href="#"
											action="${pageContext.request.contextPath}/admin/problem/tests/delete/${test.id}"><i
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
			$('#tests_table').dataTable({
				"aoColumnDefs" : [ {
					'bSortable' : false,
					'aTargets' : [ 2,3 ]
				} ]
			});
			$('#tests_table_filter input').attr('placeholder', 'Search')
		});
	</script>
</body>
</html>
