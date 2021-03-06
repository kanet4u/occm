<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
					<h3 class="page-header">Create Competition</h3>
					<ol class="breadcrumb">
						<li><a href="${pageContext.request.contextPath}/admin">Administration</a></li>
						<li><a
							href="${pageContext.request.contextPath}/admin/competition">Competition
								Management</a></li>
						<li class="active">Add Competition</li>
					</ol>
				</div>
				<div class="col-lg-12">
					<jsp:include page="/WEB-INF/views/admin/includes/messages.jsp" />
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<form:form class="form-horizontal" role="form" method="post"
						modelAttribute="competition">
						<form:errors path="*"></form:errors>
						<ul class="nav nav-tabs">
							<li class="active"><a href="#c_details" data-toggle="tab">Details</a></li>
							<li><a href="#c_problems" data-toggle="tab">Problems</a></li>
							<li><a href="#c_students" data-toggle="tab">Student</a></li>
						</ul>

						<div class="panel-body">
							<input type="hidden" name="id" id="competition_id"
								value="${competition.id}">

							<div class="tab-content">
								<div class="tab-pane active" id="c_details">
									<div class="form-group">
										<label for="competition_title" class="col-sm-2 control-label ">Title</label>

										<div class="col-sm-10">
											<input class="form-control" name="title"
												id="competition_title" placeholder="Competition Title"
												value="${competition.title}" />
										</div>

									</div>
									<div class="form-group">
										<label for="competition_start_time"
											class="col-sm-2 control-label">Start Time</label>

										<div class="col-sm-5">
											<div class="input-group date" id="start_time_picker">
												<input class="form-control" name="startTime"
													id="competition_start_time" placeholder="Start Time"
													value="<fmt:formatDate pattern="MM/dd/yyyy HH:mm a" value="${competition.startTime}" />" />
												<span class="input-group-addon"><span
													class="fa fa-calendar"></span> </span>
											</div>

										</div>
										<label for="competition_end_time"
											class="col-sm-2 control-label visible-xs">End Time</label>

										<div class="col-sm-5">
											<div class="input-group date" id="end_time_picker">
												<input class="form-control" name="endTime"
													id="competition_end_time" placeholder="End Time"
													value="<fmt:formatDate pattern="MM/dd/yyyy HH:mm a" value="${competition.endTime}" />" />
												<span class="input-group-addon"><span
													class="fa fa-calendar"></span> </span>
											</div>
										</div>
									</div>
									

									<div class="form-group">
										<label for="competition_details"
											class="col-sm-2 control-label">Details</label>

										<div class="col-sm-10">
											<textarea class="form-control" name="details"
												id="competition_details" placeholder="Description">${competition.details}</textarea>
										</div>
									</div>

									
								</div>
								<div class="tab-pane" id="c_students">
									<table class="table table-striped table-hover data-table"
										id="users_table">
										<thead>
											<tr>
												<th class="col_email">ID</th>
												<th class="col_email">Email</th>
												<th class="col_firstname hidden-sm">Firstname</th>
												<th class="col_lastname hidden-sm">Lastname</th>
												<th class="col_status">Joined</th>
												<th class="action col_edit">Edit</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${userList}" var="u">
											<tr>
												<td class="col_username"><label> <input
														type="checkbox" class="action_select" name="users" value="${u.id}" />
												</label></td>
												<td class="col_email hidden-sm">${u.email}</td>
												<td class="col_firstname hidden-sm">${u.fname}</td>
												<td class="col_lastname hidden-sm"> ${u.sname}</td>
												<td class="action col_status"><b>a</b><a href="#"><i
														class="fa fa-check-square-o"></i></a></td>
												<td class="action col_edit"><a
													href="admin_user_edit.html"><i class="fa fa-edit"></i>
												</a></td>
											</tr>
										</c:forEach>
											

										</tbody>
									</table>

								</div>
								<div class="tab-pane" id="c_problems">
									<table class="table table-striped table-hover data-table"
										id="problems_table">
										<thead>
											<tr>
												<th class="col_title">Title</th>
												<th class="col_id ">ID</th>
												<th class="col_alias">Alias</th>
												<th class="col_level">Level</th>
												<th class="action col_joined">Joined</th>
												<th class="action col_edit">Edit</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${problemList}" var="p">
												<tr>
													<td class="col_title"><label> <input
															type="checkbox" class="action_select" name="problems"
															value="${p.id}" />${p.title }
													</label></td>
													<td class="col_id">${p.id}</td>
													<td class="col_alias">${p.alias}</td>
													<td class="col_level">${p.level}</td>
													<td class="action col_status"><b>y</b><a href="#"><i
															class="fa fa-check-square-o"></i></a></td>
													<td class="action col_edit"><a
														href="admin_user_edit.html"><i class="fa fa-edit"></i>
													</a></td>
												</tr>
											</c:forEach>


										</tbody>
									</table>

								</div>
							</div>


							<hr>
							<input type="hidden" name="continue" id="continue" value="0">

							<div class="btn-group pull-right">
								<button type="reset" class="btn btn-default"
									onclick="return confirm('Do you want to reset changes')">Reset
								</button>
								<button type="button" class="btn btn-default btn-delete"
									action="some/delete/action">Delete</button>
								<button type="submit" class="btn btn-success" value="Save" >Save Item</button>
							</div>
							<div class="clearfix"></div>

						</div>
					</form:form>
				</div>
			</div>


		</div>
	</div>
	<jsp:include page="/WEB-INF/views/admin/includes/before_body_end.jsp" />
	<script type="text/javascript">
		//http://eonasdan.github.io/bootstrap-datetimepicker
		$(function() {
			$('#start_time_picker, #end_time_picker').datetimepicker();
		});
	</script>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('#users_table').dataTable({
								"aoColumnDefs" : [ {
									'bSortable' : false,
									'aTargets' : [ 5 ]
								} ]
							});
							$('#problems_table').dataTable({
								"aoColumnDefs" : [ {
									'bSortable' : false,
									'aTargets' : [ 5 ]
								} ]
							});

							$(
									'#users_table_filter input, #problems_table_filter input')
									.attr('placeholder', 'Search');

							$('').attr('placeholder', 'Search')
							$('#users_table th,#problems_table th').css(
									'width', 'auto');

						});
	</script>
</body>
</html>
