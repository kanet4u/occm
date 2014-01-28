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
		<c:if test="${sessionScope.firstVisit.visit}">
			<c:if test="${sessionScope.msgCode != null}">
				<div id="messages-area">
					<c:if test="${sessionScope.msgCode == 'FAILURE'}">
						<div class="alert alert-danger alert-dismissable">
							<button aria-hidden="true" data-dismiss="alert" class="close"
								type="button">Ã—</button>
							${sessionScope.msgText}
						</div>
					</c:if>
					<c:if test="${requestScope.msgCode == 'SUCCESS'}">
						<div class="alert alert-success alert-dismissable">
							<button aria-hidden="true" data-dismiss="alert" class="close"
								type="button">Ã—</button>
							${sessionScope.msgText}
						</div>
					</c:if>
				</div>
			</c:if>
		</c:if>
		<h1>
			Competitions <small style="font-size: 11px;"><a href="">See
					Competitions FAQ</a></small>
		</h1>
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
						<tr class="comp-running">

							<td>${comp.competition.id}</td>
							<td><a
								href="${pageContext.request.contextPath}/competition/${comp.competition.id}">${comp.competition.title}</a></td>

							<td><c:if test="${comp.competition.status =='RUNNING'}">
									<span class="label label-success"><spring:message
											code="competition.status.running" /></span>
								</c:if> <c:if test="${comp.competition.status =='UPCOMMING'}">
									<span class="label label-info"><spring:message
											code="competition.status.upcomming" /></span>

								</c:if> <c:if test="${comp.competition.status =='ARCHIEVED'}">
									<span class="label label-warning"><spring:message
											code="competition.status.archieved" /></span>

								</c:if> <c:if test="${comp.competition.status =='NEVERENDING'}">
									<span class="label label-danger"><spring:message
											code="competition.status.neverending" /></span>

								</c:if></td>
							<c:if test="${comp.competition.isLimited}">
								<c:if test="${comp.competition.status =='RUNNING'}">
									<td colspan="2" class="counter"><h4>
											<i class="fa fa-spinner fa-spin"></i>
											${comp.competition.timeLeft}
										</h4></td>
								</c:if>
								<c:if test="${comp.competition.status !='RUNNING'}">
									<td>${comp.competition.startTime}</td>
									<td>${comp.competition.startTime}</td>
								</c:if>
							</c:if>
							<c:if test="${!comp.competition.isLimited}">
								<td>Never Stated</td>
								<td>Never Ending</td>
							</c:if>

							<c:if test="${comp.competition.duration != null}">
								<td>${comp.competition.duration}</td>
							</c:if>

							<td>${comp.competition.userCount}</td>
							<td>${comp.competition.problemCount}</td>

							<td><c:if test="${comp.competition.status =='RUNNING'}">
									<a
										href="${pageContext.request.contextPath}/competition/attend/${comp.competition.id}">Attend</a>
								</c:if> <c:if test="${comp.competition.status =='ARCHIEVED'}">
									<a
										href="${pageContext.request.contextPath}/competition/view/${comp.competition.id}">view</a>
								</c:if> <c:if test="${comp.competition.status =='NEVERENDING'}">
									<a
										href="${pageContext.request.contextPath}/competition/attend/${comp.competition.id}">Attend</a>
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
</body>
</html>