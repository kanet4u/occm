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
					<h3 class="page-header">Submission Management</h3>
					<ol class="breadcrumb">
						<li><a href="${pageContext.request.contextPath}/admin">Administration</a></li>
						<li class="admin">Submission Management</li>
					</ol>

					<jsp:include page="/WEB-INF/views/admin/includes/messages.jsp" />

					<div class="table-responsive">
						<table class="table table-striped table-hover data-table"
							id="submissions_table">
							<thead>
								<tr>
									<th>ID</th>
									<th class="col_competition visible-lg">Competition</th>
									<th class="col_user">User</th>
									<th class="col_problem_id">Problem</th>
									<th class="col_language">Language</th>
									<th class="col_status">Status</th>
									<th class="col_runtime">Runtime</th>
									<th class="col_score">Score</th>
									<th class="col_created visible-lg">Created</th>
									<th class="action col_edit">Edit</th>
									<th class="action col_delete">Delete</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="submission" items="${requestScope.submissions}"
									varStatus="i">
									<tr>
										<td>${submission.id}</td>
										<td class="col_competition visible-lg"><a
											href="${pageContext.request.contextPath}/admin/competition/edit/${submission.competition.id}">
												${submission.competition.title}</a></td>
										<td class="col_user"><a
											href="${pageContext.request.contextPath}/admin/user/edit/${submission.user.id}">
												${submission.user.email}</a></td>
										<td class="col_problem_id"><a
											href="${pageContext.request.contextPath}/admin/problem/edit/${submission.problem.id}">
												${submission.problem.id}</a></td>
										<td class="col_language">${submission.language.name}</td>

										<td class="action col_status"><b>${submission.status.code}</b>
										<span class='label label-${submission.status.severity}'>#${submission.status.alias}</span></td>

										<td class="col_runtime">${submission.runtime}</td>
										<td class="col_score">${submission.score}</td>
										<td class="col_created visible-lg">${submission.creationTime}</td>
										<td class="action col_edit"><a
											href="${pageContext.request.contextPath}/admin/submission/edit/${submission.id}"><i
												class="fa fa-code"></i> </a></td>
										
										<td class="action col_delete"><a class="btn-delete"
											href="#"
											action="${pageContext.request.contextPath}/admin/submission/delete/${submission.id}"><i
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
			$('#submissions_table').dataTable({
				"aoColumnDefs" : [ {
					'bSortable' : false,
					'aTargets' : [ 5, 6, 7 ]
				} ]
			});
			$('#submissions_table_filter input').attr('placeholder', 'Search');
		});
	</script>
</body>
</html>
