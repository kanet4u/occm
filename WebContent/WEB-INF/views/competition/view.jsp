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
			${competition.title} <small style="font-size: 11px;"><a
				href="${pageContext.request.contextPath}/page/faq#competitions">See
					Competitions FAQ</a></small>
		</h1>
		<jsp:include page="/WEB-INF/views/includes/messages.jsp" />
		<hr>

		<div class="row ">
			
			<div class="col-lg-8 col-md-8">
				<table
					class="table table-responsive table-condensed table-striped problem_list">
					<thead>
						<tr>
							<th>#</th>
							<th>Title</th>
							<th>Time</th>
							<th>Score</th>
							<th>Result</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="problem" items="${problems}"
							varStatus="i">
							<tr>
								<td>${ problem.alias}</td>
								<td><a
									href="${pageContext.request.contextPath}/problem/view/${problem.id}">${problem.title}</a></td>
								<td>${problem.timeLimit}</td>
								<td>${problem.score}</td>
								<td><a href="page_judge_status.html"><span
										class="label label-success">SC</span></a></td>
								<td><a href="${pageContext.request.contextPath}/problem/send/${problem.id}">Coding</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="col-lg-4 col-md-4">
				<c:if test="${competition.status =='RUNNING'}">
					<div class="bs-callout bs-callout-success ">
						<h2 style="text-align: center;">
							<i class="fa fa-spinner fa-spin"></i><span id="counter"
								left="${competition.timeLeftInSeconds}">${competition.timeLeft}</span>
						</h2>
					</div>
				</c:if>
				<div class="bs-callout bs-callout-info">
					${competition.details}
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
	</div>
	<!-- /container -->
	<jsp:include page="/WEB-INF/views/includes/before_body_end.jsp" />
	<script type="text/javascript">
		$(document).ready(function() {
			ticker("#counter");
		});
	</script>
</body>
</html>