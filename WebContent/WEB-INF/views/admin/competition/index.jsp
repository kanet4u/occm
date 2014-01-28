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
					<jsp:include page="/WEB-INF/views/admin/includes/messages.jsp" />
				</div>
				<div class="col-lg-12">
					<h3 class="page-header">
						Competition Management
						</h1>
						<ol class="breadcrumb">
							<li><a href="admin_index.html">Administration</a></li>
							<li class="active">Competition Management</li>
							<span class="pull-right admin_action"><a
								href="admin_competition_add.html"><i class="fa fa-plus"></i>
									Create Competition</a></span>
						</ol>


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
												href="${pageContext.request.contextPath}/admin/competition/edit/${comp.id}">${comp.title}</a></td>
											<%-- <td class="col_start ">${comp.startTime}</td>
											<td class="col_end ">${comp.endTime}</td> --%>
											<c:if test="${comp.isLimited}">
												<c:if test="${comp.status =='RUNNING'}">
													<td colspan="2" class="counter">
															<i class="fa fa-spinner fa-spin"></i> ${comp.timeLeft}
														</td>
												</c:if>
												<c:if test="${comp.status !='RUNNING'}">
													<td class="col_start ">${comp.startTime}</td>
													<td class="col_end ">${comp.startTime}</td>
												</c:if>
											</c:if>
											<c:if test="${!comp.isLimited}">
												<td class="col_start ">Never Stated</td>
												<td class="col_end ">Never Ending</td>
											</c:if>
											<td class="col_status"><c:if
													test="${comp.status =='RUNNING'}">
													<span class="label label-success"><spring:message
															code="competition.status.running" /></span>
												</c:if> <c:if test="${comp.status =='UPCOMMING'}">
													<span class="label label-info"><spring:message
															code="competition.status.upcomming" /></span>

												</c:if> <c:if test="${comp.status =='ARCHIEVED'}">
													<span class="label label-warning"><spring:message
															code="competition.status.archieved" /></span>

												</c:if> <c:if test="${comp.status =='NEVERENDING'}">
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
									<tr>
										<td>1</td>
										<td class="col_username"><a href="admin_add_user.html">Some
												Competition Title</a></td>
										<td class="col_start ">Jan 1, 2014 14:30</td>
										<td class="col_end ">Jan 1, 2014 14:30</td>
										<td class="col_status"><span class="label label-info">upcoming</span></td>
										<td class="action col_edit"><a href="#"><i
												class="fa fa-edit"></i> </a></td>
										<td class="action col_delete"><a href="#"><i
												class="fa fa-minus-circle"></i></a></td>
									</tr>
									<tr>
										<td>1</td>
										<td class="col_username"><a href="admin_add_user.html">Some
												Competition Title</a></td>
										<td class="col_start ">Jan 1, 2014 14:30</td>
										<td class="col_end ">Jan 1, 2014 14:30</td>
										<td class="col_status"><span class="label label-info">upcoming</span></td>
										<td class="action col_edit"><a href="#"><i
												class="fa fa-edit"></i> </a></td>
										<td class="action col_delete"><a href="#"><i
												class="fa fa-minus-circle"></i></a></td>
									</tr>
									<tr>
										<td>1</td>
										<td class="col_username"><a href="admin_add_user.html">Some
												Competition Title</a></td>
										<td class="col_start ">Jan 1, 2014 14:30</td>
										<td class="col_end ">Jan 1, 2014 14:30</td>
										<td class="col_status"><span class="label label-warning">archive</span></td>
										<td class="action col_edit"><a href="#"><i
												class="fa fa-edit"></i> </a></td>
										<td class="action col_delete"><a href="#"><i
												class="fa fa-minus-circle"></i></a></td>
									</tr>
									<tr>
										<td>1</td>
										<td class="col_username"><a href="admin_add_user.html">Some
												Competition Title</a></td>
										<td class="col_start ">Jan 1, 2014 14:30</td>
										<td class="col_end ">Jan 1, 2014 14:30</td>
										<td class="col_status"><span class="label label-info">upcoming</span></td>
										<td class="action col_edit"><a href="#"><i
												class="fa fa-edit"></i> </a></td>
										<td class="action col_delete"><a href="#"><i
												class="fa fa-minus-circle"></i></a></td>
									</tr>
									<tr>
										<td>1</td>
										<td class="col_username"><a href="admin_add_user.html">Some
												Competition Title</a></td>
										<td class="col_start ">Jan 1, 2014 14:30</td>
										<td class="col_end ">Jan 1, 2014 14:30</td>
										<td class="col_status"><span class="label label-warning">archive</span></td>
										<td class="action col_edit"><a href="#"><i
												class="fa fa-edit"></i> </a></td>
										<td class="action col_delete"><a href="#"><i
												class="fa fa-minus-circle"></i></a></td>
									</tr>
									<tr>
										<td>1</td>
										<td class="col_username"><a href="admin_add_user.html">Some
												Competition Title</a></td>
										<td class="col_start ">Jan 1, 2014 14:30</td>
										<td class="col_end ">Jan 1, 2014 14:30</td>
										<td class="col_status"><span class="label label-warning">archive</span></td>
										<td class="action col_edit"><a href="#"><i
												class="fa fa-edit"></i> </a></td>
										<td class="action col_delete"><a href="#"><i
												class="fa fa-minus-circle"></i></a></td>
									</tr>
									<tr>
										<td>1</td>
										<td class="col_username"><a href="admin_add_user.html">Some
												Competition Title</a></td>
										<td class="col_start ">Jan 1, 2014 14:30</td>
										<td class="col_end ">Jan 1, 2014 14:30</td>
										<td class="col_status"><span class="label label-info">upcoming</span></td>
										<td class="action col_edit"><a href="#"><i
												class="fa fa-edit"></i> </a></td>
										<td class="action col_delete"><a href="#"><i
												class="fa fa-minus-circle"></i></a></td>
									</tr>
									<tr>
										<td>1</td>
										<td class="col_username"><a href="admin_add_user.html">Some
												Competition Title</a></td>
										<td class="col_start ">Jan 1, 2014 14:30</td>
										<td class="col_end ">Jan 1, 2014 14:30</td>
										<td class="col_status"><span class="label label-warning">archive</span></td>
										<td class="action col_edit"><a href="#"><i
												class="fa fa-edit"></i> </a></td>
										<td class="action col_delete"><a href="#"><i
												class="fa fa-minus-circle"></i></a></td>
									</tr>
									<tr>
										<td>1</td>
										<td class="col_username"><a href="admin_add_user.html">Some
												Competition Title</a></td>
										<td class="col_start ">Jan 1, 2014 14:30</td>
										<td class="col_end ">Jan 1, 2014 14:30</td>
										<td class="col_status"><span class="label label-info">upcoming</span></td>
										<td class="action col_edit"><a href="#"><i
												class="fa fa-edit"></i> </a></td>
										<td class="action col_delete"><a href="#"><i
												class="fa fa-minus-circle"></i></a></td>
									</tr>
									<tr>
										<td>1</td>
										<td class="col_username"><a href="admin_add_user.html">Some
												Competition Title</a></td>
										<td class="col_start ">Jan 1, 2014 14:30</td>
										<td class="col_end ">Jan 1, 2014 14:30</td>
										<td class="col_status"><span class="label label-warning">archive</span></td>
										<td class="action col_edit"><a href="#"><i
												class="fa fa-edit"></i> </a></td>
										<td class="action col_delete"><a href="#"><i
												class="fa fa-minus-circle"></i></a></td>
									</tr>
									<tr>
										<td>1</td>
										<td class="col_username"><a href="admin_add_user.html">Some
												Competition Title</a></td>
										<td class="col_start ">Jan 1, 2014 14:30</td>
										<td class="col_end ">Jan 1, 2014 14:30</td>
										<td class="col_status"><span class="label label-warning">archive</span></td>
										<td class="action col_edit"><a href="#"><i
												class="fa fa-edit"></i> </a></td>
										<td class="action col_delete"><a href="#"><i
												class="fa fa-minus-circle"></i></a></td>
									</tr>
									<tr>
										<td>1</td>
										<td class="col_username"><a href="admin_add_user.html">Some
												Competition Title</a></td>
										<td class="col_start ">Jan 1, 2014 14:30</td>
										<td class="col_end ">Jan 1, 2014 14:30</td>
										<td class="col_status"><span class="label label-success">running</span></td>
										<td class="action col_edit"><a href="#"><i
												class="fa fa-edit"></i> </a></td>
										<td class="action col_delete"><a href="#"><i
												class="fa fa-minus-circle"></i></a></td>
									</tr>
									<tr>
										<td>1</td>
										<td class="col_username"><a href="admin_add_user.html">Some
												Competition Title</a></td>
										<td class="col_start ">Jan 1, 2014 14:30</td>
										<td class="col_end ">Jan 1, 2014 14:30</td>
										<td class="col_status"><span class="label label-info">upcoming</span></td>
										<td class="action col_edit"><a href="#"><i
												class="fa fa-edit"></i> </a></td>
										<td class="action col_delete"><a href="#"><i
												class="fa fa-minus-circle"></i></a></td>
									</tr>
									<tr>
										<td>1</td>
										<td class="col_username"><a href="admin_add_user.html">Some
												Competition Title</a></td>
										<td class="col_start ">Jan 1, 2014 14:30</td>
										<td class="col_end ">Jan 1, 2014 14:30</td>
										<td class="col_status"><span class="label label-info">upcoming</span></td>
										<td class="action col_edit"><a href="#"><i
												class="fa fa-edit"></i> </a></td>
										<td class="action col_delete"><a href="#"><i
												class="fa fa-minus-circle"></i></a></td>
									</tr>
									<tr>
										<td>1</td>
										<td class="col_username"><a href="admin_add_user.html">Some
												Competition Title</a></td>
										<td class="col_start ">Jan 1, 2014 14:30</td>
										<td class="col_end ">Jan 1, 2014 14:30</td>
										<td class="col_status"><span class="label label-warning">archive</span></td>
										<td class="action col_edit"><a href="#"><i
												class="fa fa-edit"></i> </a></td>
										<td class="action col_delete"><a href="#"><i
												class="fa fa-minus-circle"></i></a></td>
									</tr>
									<tr>
										<td>1</td>
										<td class="col_username"><a href="admin_add_user.html">Some
												Competition Title</a></td>
										<td class="col_start ">Jan 1, 2014 14:30</td>
										<td class="col_end ">Jan 1, 2014 14:30</td>
										<td class="col_status"><span class="label label-info">upcoming</span></td>
										<td class="action col_edit"><a href="#"><i
												class="fa fa-edit"></i> </a></td>
										<td class="action col_delete"><a href="#"><i
												class="fa fa-minus-circle"></i></a></td>
									</tr>
									<tr>
										<td>1</td>
										<td class="col_username"><a href="admin_add_user.html">Some
												Competition Title</a></td>
										<td class="col_start ">Jan 1, 2014 14:30</td>
										<td class="col_end ">Jan 1, 2014 14:30</td>
										<td class="col_status"><span class="label label-warning">archive</span></td>
										<td class="action col_edit"><a href="#"><i
												class="fa fa-edit"></i> </a></td>
										<td class="action col_delete"><a href="#"><i
												class="fa fa-minus-circle"></i></a></td>
									</tr>
									<tr>
										<td>1</td>
										<td class="col_username"><a href="admin_add_user.html">Some
												Competition Title</a></td>
										<td class="col_start ">Jan 1, 2014 14:30</td>
										<td class="col_end ">Jan 1, 2014 14:30</td>
										<td class="col_status"><span class="label label-warning">archive</span></td>
										<td class="action col_edit"><a href="#"><i
												class="fa fa-edit"></i> </a></td>
										<td class="action col_delete"><a href="#"><i
												class="fa fa-minus-circle"></i></a></td>
									</tr>
									<tr>
										<td>1</td>
										<td class="col_username"><a href="admin_add_user.html">Some
												Competition Title</a></td>
										<td class="col_start ">Jan 1, 2014 14:30</td>
										<td class="col_end ">Jan 1, 2014 14:30</td>
										<td class="col_status"><span class="label label-info">upcoming</span></td>
										<td class="action col_edit"><a href="#"><i
												class="fa fa-edit"></i> </a></td>
										<td class="action col_delete"><a href="#"><i
												class="fa fa-minus-circle"></i></a></td>
									</tr>
									<tr>
										<td>1</td>
										<td class="col_username"><a href="admin_add_user.html">Some
												Competition Title</a></td>
										<td class="col_start ">Jan 1, 2014 14:30</td>
										<td class="col_end ">Jan 1, 2014 14:30</td>
										<td class="col_status"><span class="label label-warning">archive</span></td>
										<td class="action col_edit"><a href="#"><i
												class="fa fa-edit"></i> </a></td>
										<td class="action col_delete"><a href="#"><i
												class="fa fa-minus-circle"></i></a></td>
									</tr>
									<tr>
										<td>1</td>
										<td class="col_username"><a href="admin_add_user.html">Some
												Competition Title</a></td>
										<td class="col_start ">Jan 1, 2014 14:30</td>
										<td class="col_end ">Jan 1, 2014 14:30</td>
										<td class="col_status"><span class="label label-info">upcoming</span></td>
										<td class="action col_edit"><a href="#"><i
												class="fa fa-edit"></i> </a></td>
										<td class="action col_delete"><a href="#"><i
												class="fa fa-minus-circle"></i></a></td>
									</tr>
									<tr>
										<td>1</td>
										<td class="col_username"><a href="admin_add_user.html">Some
												Competition Title</a></td>
										<td class="col_start ">Jan 1, 2014 14:30</td>
										<td class="col_end ">Jan 1, 2014 14:30</td>
										<td class="col_status"><span class="label label-warning">archive</span></td>
										<td class="action col_edit"><a href="#"><i
												class="fa fa-edit"></i> </a></td>
										<td class="action col_delete"><a href="#"><i
												class="fa fa-minus-circle"></i></a></td>
									</tr>
									<tr>
										<td>1</td>
										<td class="col_username"><a href="admin_add_user.html">Some
												Competition Title</a></td>
										<td class="col_start ">Jan 1, 2014 14:30</td>
										<td class="col_end ">Jan 1, 2014 14:30</td>
										<td class="col_status"><span class="label label-warning">archive</span></td>
										<td class="action col_edit"><a href="#"><i
												class="fa fa-edit"></i> </a></td>
										<td class="action col_delete"><a href="#"><i
												class="fa fa-minus-circle"></i></a></td>
									</tr>

								</tbody>
							</table>
						</div>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->


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
			$('#competitions_table_filter input').attr('placeholder', 'Search')
		});
	</script>
</body>
</html>
