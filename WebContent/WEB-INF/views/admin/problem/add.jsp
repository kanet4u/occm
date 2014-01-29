<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
					<h3 class="page-header">Add Problem</h3>
					<ol class="breadcrumb">
						<li><a href="admin_index.html">Administration</a></li>
						<li><a href="admin_users.html">Problem Management</a></li>
						<li class="active">Add Problem</li>
					</ol>
				</div>
				<div class="col-lg-12">
					<jsp:include page="/WEB-INF/views/admin/includes/messages.jsp" />

				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<form:form class="form-horizontal" role="form" method="post"
						modelAttribute="problem">
						<div id="messages-area">
							<div class="alert alert-success alert-dismissable">
								<button aria-hidden="true" data-dismiss="alert" class="close"
									type="button">×</button>
								<form:errors path="*"></form:errors>
							</div>
						</div> 
						<ul class="nav nav-tabs">
							<li class="active"><a href="#c_details" data-toggle="tab">Details</a></li>
							<li><a href="#c_input" data-toggle="tab">Input</a></li>
							<li><a href="#c_sample_1" data-toggle="tab">Sample <span
									class="badge">1</span></a></li>
							<li><a href="#c_sample_2" data-toggle="tab">Sample <span
									class="badge">2</span></a></li>
							<li><a href="#c_tags" data-toggle="tab">Problem <span
									class="badge">Tags</span></a></li>
						</ul>
						<div class="panel-body">
							<div class="tab-content">
								<div class="tab-pane active" id="c_details">
									<div class="form-group">
										<label for="problem_alias" class="col-sm-2 control-label">Alias</label>

										<div class="col-sm-2">
											<form:select path="alias" class="form-control"
												id="problem_alias" placeholder="Alias">
												<form:options items="${aliasList}" />
											</form:select>
											<%-- 
											<form:select class="form-control" path="alias"
												id="problem_alias" placeholder="Alias">
												<option value="A">A</option>
												<option value="B">B</option>
												<option value="C">C</option>
												<option value="D">D</option>
												<option value="E">E</option>
												<option value="F">F</option>
											</form:select> --%>
										</div>

										<label for="problem_title"
											class="col-sm-2 control-label visible-xs">Title</label>

										<div class="col-sm-8">
											<form:input class="form-control" path="title"
												id="problem_title" placeholder="Title"
												value="${problem.title}" />
										</div>
									</div>

									<div class="form-group">
										<label for="problem_status" class="col-sm-2 control-label">Status</label>

										<div class="col-sm-2">
											<form:select path="status" class="form-control"
												id="problem_status">
												<form:options items="${statusList}" />
											</form:select>
											<%-- 
											<form:select class="form-control" path="status"
												id="problem_status">
												<option value="1">Enabled</option>
												<option value="0">Disabled</option>
											</form:select> --%>
										</div>
										<label for="problem_time_limit"
											class="col-sm-2 control-label visible-xs">Time Limit</label>

										<div class="col-sm-3">
											<form:input class="form-control" path="timeLimit"
												id="problem_time_limit" placeholder="Time Limit"
												value="${problem.timeLimit}" />
										</div>

										<label for="problem_memory_limit"
											class="col-sm-2 control-label visible-xs">Memory
											Limit</label>

										<div class="col-sm-3">
											<form:input class="form-control" path="memoryLimit"
												id="problem_memory_limit" placeholder="Memory Limit"
												value="${problem.memoryLimit}" />
										</div>
										<label for="problem_level"
											class="col-sm-2 control-label visible-xs">Level</label>

										<div class="col-sm-2">
											<form:input class="form-control" path="level"
												id="problem_level" placeholder="Level"
												value="${problem.level}" />
										</div>

									</div>
									<div class="form-group">
										<label for="problem_competition"
											class="col-sm-2 control-label">Details</label>

										<div class="col-sm-10">
											<form:select class="form-control" path="competition" items="${competitionList}" 
												id="problem_competition" itemLabel="title" itemValue="id" />
												<%--
												<option value="1">Some</option>
											</select>
											 --%>
										</div>
									</div>

									<div class="form-group">
										<label for="problem_details" class="col-sm-2 control-label">Details</label>

										<div class="col-sm-10">
											<textarea class="form-control" name="details"
												id="problem_details" rows="12"
												placeholder="Problem Description">${problem.details}</textarea>
										</div>
									</div>

								</div>
								<div class="tab-pane " id="c_input">
									<div class="form-group">
										<label for="problem_input1" class="col-sm-2 control-label">Input
											1</label>

										<div class="col-sm-10">
											<textarea class="form-control" name="input1"
												id="problem_input1" rows="6"
												placeholder="Input1 Description">${problem.input1}</textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="problem_output1" class="col-sm-2 control-label">Output
											1</label>

										<div class="col-sm-10">
											<textarea class="form-control" name="output1"
												id="problem_output1" rows="6"
												placeholder="Output1 Description">${problem.output1}</textarea>
										</div>
									</div>

								</div>
								<div class="tab-pane " id="c_sample_1">
									<div class="form-group">
										<label for="problem_input_1" class="col-sm-2 control-label">Sample
											Input 1</label>

										<div class="col-sm-10">
											<textarea class="form-control code" name="input2"
												id="problem_input_1" rows="6" placeholder="Sample Input 1">${problem.input2}</textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="problem_output_2" class="col-sm-2 control-label">Sample
											Output 1</label>

										<div class="col-sm-10">
											<textarea class="form-control" name="output2"
												id="problem_output_2" rows="6" placeholder="Sample Input 1">${problem.output2}</textarea>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="c_sample_2">
									<div class="form-group">
										<label for="problem_input_2" class="col-sm-2 control-label">Sample
											Input 2</label>

										<div class="col-sm-10">
											<textarea class="form-control code" name="input3"
												id="problem_input_2" rows="6" placeholder="Sample Input 2">${problem.input3}</textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="problem_output_2" class="col-sm-2 control-label">Sample
											Output 2</label>

										<div class="col-sm-10">
											<textarea class="form-control" name="output3"
												id="problem_output_2" rows="6" placeholder="Sample Input 2">${problem.output3}</textarea>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="c_tags">
									<div class="form-group">

										<div class="col-sm-12 tag_box" style="min-height: 90px;">

											<form:checkboxes items="${tagsList}" path="tags"
												delimiter='<span></span>' element='label class="badge"'
												itemLabel="tag" itemValue="id" />
											<label class="badge"> <input type="checkbox"
												name="tags[]" value="1"> <span class="">Static
													CheckBox</span>
											</label>

										</div>
									</div>

								</div> 
							</div>
						</div>
						<input type="hidden" name="continue" id="continue" value="0">

						<div class="btn-group pull-right">
							<button type="reset" class="btn btn-default"
								onclick="return confirm('Do you want to reset changes')">Reset
							</button>
							<button type="button" class="btn btn-danger btn-delete"
								action="some/delete/action">Delete</button>
							<input type="submit" class="btn btn-default" value="Save" />
							<button type="submit" class="btn btn-default"
								onclick="return $('#continue').val(1)">Save & Continue
							</button>
						</div>
						<div class="clearfix"></div>

					</form:form>
				</div>
			</div>
		</div>


	</div>
	<jsp:include page="/WEB-INF/views/admin/includes/before_body_end.jsp" />



</body>
</html>
