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
					<h3 class="page-header">Create Test Case</h3>
					<ol class="breadcrumb">
						<li><a href="${pageContext.request.contextPath}/admin">Administration</a></li>
						<li><a
							href="${pageContext.request.contextPath}/admin/problem">Problem
								Management</a></li>
						<li><a
							href="${pageContext.request.contextPath}/admin/problem/tests">Test
								Cases</a></li>
						<li class="active">Add Test Case</li>
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
						</ul>

						<div class="panel-body">
							<input type="hidden" name="id" id="competition_id"
								value="${test.id}"> <input type="hidden" name="id"
								id="competition_id" value="${test.problem.id}">
							<div class="tab-content">
								<div class="tab-pane active" id="c_details">
									<div class="form-group">
										<label for="problem_id" class="col-sm-2 control-label ">Title</label>

										<div class="col-sm-10">
											<select id="problem_id" class="form-control" name="problem_id">
												<c:forEach items="${problems}" var="problem">
													<option value="${problem.id }" 
													<c:if test="${problem.id == test.problem.id}">selected="selected"</c:if>
													
													>${problem.title }</option>
												</c:forEach>
											</select>
										</div>

									</div>


									<div class="form-group">
										<label for="Input" class="col-sm-2 control-label">Input</label>

										<div class="col-sm-10">
											<textarea class="form-control" name="input" id="Input" rows="6"
												placeholder="Input Data">${test.input}</textarea>
										</div>
									</div>

									<div class="form-group">
										<label for="Output" class="col-sm-2 control-label">Output</label>

										<div class="col-sm-10">
											<textarea class="form-control" name="output" id="Output" rows="6"
												placeholder="Output Data">${test.output}</textarea>
										</div>
									</div>


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
								<button type="submit" class="btn btn-success" value="Save">Save
									Item</button>
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
		
	</script>
</body>
</html>
