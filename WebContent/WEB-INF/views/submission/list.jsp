<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/includes/head.jsp" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/includes/navigation.jsp" />

	<div class="container">
		<h1>
			Judge Status <small style="font-size: 11px;"><a href="">See
					Submissions FAQ</a></small>
		</h1>
		<jsp:include page="/WEB-INF/views/includes/messages.jsp" />
		<hr>
		<div class="breadcrumb-area">
			
			<ol class="breadcrumb">
				<li>Show</li>
				<li class="active"><a href="#" class="badge">15</a></li>
				<li><a href="#">30</a></li>
				<li><a href="#">50</a></li>
				<li><a href="#">100</a></li>
				<li>per page</li>
				<!-- <i class="fa fa-spinner fa-spin pull-right"></i>   -->
			</ol>
		</div>
		<div style="min-height: 360px;">
			<div class="table-responsive">
				<table class="table table-hover table-bordered table-striped">
					<thead>
						<tr>
							<th>#</th>
							<th>User</th>
							<th class="hidden-xs hidden-sm">Computation</th>
							<th>Problem</th>
							<th>Language</th>
							<th>Status</th>
							<th>Runtime</th>
							<th>Score</th>
							<th class="hidden-xs hidden-sm">Created</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="sub" items="${requestScope.submissions}"
							varStatus="i">
							<tr>
								<td>${sub.id}</td>
								<td><a
									href="${pageContext.request.contextPath}/submission/user/${sub.user.id}">
										${sub.user.email}</a></td>
								<td class="hidden-xs hidden-sm"><a
									href="${pageContext.request.contextPath}/submission/competition/${sub.competition.id}">
										${sub.competition.title}</a></td>
								<td><a
									href="${pageContext.request.contextPath}/submission/problem/${sub.problem.id}">
										${sub.problem.id}</a></td>
								

								<td><a
									href="${pageContext.request.contextPath}/submission/language/${sub.language.id}">
										${sub.language.name}</a></td>

								<td><span class="label label-${sub.status.severity}">${sub.status.alias}</span></td>
								<td>${sub.runtime}</td>
								<td>${sub.score}</td>
								<td class="hidden-xs hidden-sm">${sub.creationTime}</td>
							</tr>
						</c:forEach>


					</tbody>

				</table>


			</div>
			<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
		</div>
		<!-- /container -->
		<jsp:include page="/WEB-INF/views/includes/before_body_end.jsp" />
		<script type="text/javascript">
			$(document).ready(function() {
				refreshPage(4000);
			});
		</script>
</body>
</html>