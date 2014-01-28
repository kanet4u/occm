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
						<span class="pull-right admin_action"><a
							href="${pageContext.request.contextPath}/admin/competition/add"><i
								class="fa fa-plus"></i> Add Competition</a></span>
					</ol>

					<jsp:include page="/WEB-INF/views/admin/includes/messages.jsp" />

					<div class="table-responsive">
						<table class="table table-striped table-hover data-table"
							id="competitions_table">
							<thead>
								<tr>
									<th>ID</th>
									<th class="col_title">Title</th>
									<th class="col_start">Start</th>
									<th class="col_end">End</th>
									<th class="col_status">Status</th>
									<th class="col_edit">Edit</th>
									<th class="col_delete">Delete</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="comp" items="${requestScope.userCompetitions}"
									varStatus="i">
									<tr>
										<td>${comp.id}</td>
										<td class="col_username"><a
											href="${pageContext.request.contextPath}/admin/competition/edit/${comp.id}">
												${comp.title}</a></td>

										<c:if test="${!comp.isLimited}">
											<td class="col_start ">${comp.startTime}</td>
											<td class="col_end ">${comp.endTime}</td>
										</c:if>
										<c:if test="${comp.isLimited}">
											<td class="col_start ">Never Stated</td>
											<td class="col_end ">Never Ending</td>
										</c:if>
										<td class="col_status"><c:if
												test="${comp.status =='RUNNING'}">
												<b>0</b>
												<span class="label label-success"><spring:message
														code="competition.status.running" /></span>
											</c:if> <c:if test="${comp.status =='UPCOMMING'}">
												<b>1</b>
												<span class="label label-info"><spring:message
														code="competition.status.upcomming" /></span>

											</c:if> <c:if test="${comp.status =='ARCHIEVED'}">
												<b>2</b>
												<span class="label label-warning"><spring:message
														code="competition.status.archieved" /></span>

											</c:if> <c:if test="${comp.status =='NEVERENDING'}">
												<b>3</b>
												<span class="label label-danger"><spring:message
														code="competition.status.neverending" /></span>

											</c:if></td>
										<td class="action col_edit"><a
											href="${pageContext.request.contextPath}/admin/competition/edit/${comp.id}"><i
												class="fa fa-edit"></i> </a></td>
										<td class="action col_delete"><a
											href="${pageContext.request.contextPath}/admin/competition/delete/${comp.id}"><i
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
				$('#competitions_table').dataTable({
					"aoColumnDefs" : [ {
						'bSortable' : false,
						'aTargets' : [ 5, 6 ]
					} ]
				});
				$('#competitions_table input').attr('placeholder', 'Search')
			});
		</script>
</body>
</html>
