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

		


		<div class="row">
			<div class="col-lg-2 col-md-1"></div>
			<div class="col-lg-8 col-md-10 col">
			<jsp:include page="/WEB-INF/views/includes/messages.jsp" />
				<div class="page-header">
					<h2 id="disable-responsive">${problem.title}</h2>
					<ul class="problem_meta">
						<li>time limit: <span class="badge">${problem.timeLimit}
								sec</span></li>
						<li>memory limit: <span class="badge">${problem.memoryLimit}
								kb</span></li>
						<li>success: <span class="badge">${problem.score} %</span></li>
						<li><a
							href="${pageContext.request.contextPath}/submission/problem/${problem.id}">submissions</a></li>
						<li><a
							href="${pageContext.request.contextPath}/discuss/problem/${problem.id}">discuss</a></li>
						<li><a
							href="${pageContext.request.contextPath}/problem/print/${problem.id}">printable</a></li>
						<li><a
							href="${pageContext.request.contextPath}/problem/report/${problem.id}">report</a></li>
					</ul>
				</div>
				<a
					href="${pageContext.request.contextPath}/problem/send/${problem.id}"
					class="pull-right"> <i class="fa fa-code"></i> Write Solution
				</a>
				<div class="clearfix"></div>
				<p>${problem.details}</p>
				<hr>

				<h4>Input</h4>

				<p>${problem.input1}</p>
				<hr>
				<h4>Output</h4>

				<p>${problem.output1}</p>
				<hr>

				<table class="table-responsive table-hover problem_samples">
					<thead>
						<tr>
							<th>Input</th>
							<th>Output</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><pre>${problem.input2}</pre></td>
							<td><pre>${problem.output2}</pre></td>
						</tr>
						<tr>
							<td><pre>${problem.input3}</pre></td>
							<td><pre>${problem.output3}</pre></td>
						</tr>

					</tbody>
				</table>

				<p>
					<span class="problem_meta">tags:</span>
					<c:forEach var="tag" items="${problem.tags}" varStatus="i">
						<a href="${pageContext.request.contextPath}/problem/tag/${tag.id}"
							class="badge">${tag.tag}</a>
					</c:forEach>
				</p>
			</div>
			<div class="col-lg-2 col-md-1"></div>
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