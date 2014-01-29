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
			Competitions <small style="font-size: 11px;"><a href="">See
					Competitions FAQ</a></small>
		</h1>
		<jsp:include page="/WEB-INF/views/includes/messages.jsp" />
		<hr>
		
		<div style="min-height: 360px;">

			<table
				class="table table-responsive table-condensed table-striped table-hover ">
				<thead>
					<tr>
						<th>#</th>
						<th>Title</th>
						<th>Status</th>
						<th>Start Time</th>
						<th>End Time</th>
						<th>Duration</th>
						<th>Users Count</th>
						<th>Problems</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>


					<c:forEach var="comp" items="${requestScope.userCompetitions}"
						varStatus="i">
						<tr <c:if test="${comp.competition.status =='RUNNING'}">class="comp-running"</c:if>>

							<td>${comp.competition.id}</td>
							<td><a
								href="${pageContext.request.contextPath}/competition/${comp.competition.id}">${comp.competition.title}</a></td>

							<td><span class="label label-${comp.competition.status}">${comp.competition.status}</span></td>
							<c:if test="${comp.competition.isLimited}">
								<c:if test="${comp.competition.status =='RUNNING'}">
									<td colspan="2" class="counter"><h4>
											<i class="fa fa-spinner fa-spin"></i> <span id="counter"
												left="${comp.competition.timeLeftInSeconds}">${comp.competition.timeLeft}</span>
										</h4></td>
								</c:if>
								<c:if test="${comp.competition.status !='RUNNING'}">
									<td>${comp.competition.startTime}</td>
									<td>${comp.competition.startTime}</td>
								</c:if>
							</c:if>
							<c:if test="${!comp.competition.isLimited}">
								<td>Never Started</td>
								<td>Never Ending</td>
							</c:if>

							<c:if test="${comp.competition.duration != null}">
								<td>${comp.competition.duration}</td>
							</c:if>

							<td>${comp.competition.userCount}</td>
							<td>${comp.competition.problemCount}</td>

							<td><c:if test="${comp.competition.status =='RUNNING'}">
									<a
										href="${pageContext.request.contextPath}/competition/view/${comp.competition.id}">Attend</a>
								</c:if> <c:if test="${comp.competition.status =='ARCHIEVED'}">
									<a
										href="${pageContext.request.contextPath}/competition/view/${comp.competition.id}">View</a>
								</c:if> <c:if test="${comp.competition.status =='NEVERENDING'}">
									<a
										href="${pageContext.request.contextPath}/competition/view/${comp.competition.id}">Attend</a>
								</c:if></td>
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
			ticker("#counter");
		});

		
	</script>
</body>
</html>