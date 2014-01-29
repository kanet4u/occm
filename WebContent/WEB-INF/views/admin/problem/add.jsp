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
					<h3 class="page-header">Edit User</h3>
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
					<form class="form-horizontal" role="form" method="post"
						action="/user/save">
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
											<select class="form-control" name="role" id="problem_alias"
												placeholder="Alias">
												<option value="A">A</option>
												<option value="B">B</option>
												<option value="C">C</option>
												<option value="D">D</option>
												<option value="E">E</option>
												<option value="F">F</option>
											</select>
										</div>

										<label for="problem_title"
											class="col-sm-2 control-label visible-xs">Title</label>

										<div class="col-sm-8">
											<input class="form-control" name="title" id="problem_title"
												placeholder="Title">
										</div>
									</div>

									<div class="form-group">
										<label for="problem_status" class="col-sm-2 control-label">Status</label>

										<div class="col-sm-2">
											<select class="form-control" name="role" id="problem_status">
												<option value="1">Enabled</option>
												<option value="0">Disabled</option>
											</select>
										</div>
										<label for="problem_time_limit"
											class="col-sm-2 control-label visible-xs">Time Limit</label>

										<div class="col-sm-3">
											<input class="form-control" name="time_limit"
												id="problem_time_limit" placeholder="Time Limit">
										</div>

										<label for="problem_memory_limit"
											class="col-sm-2 control-label visible-xs">Memory
											Limit</label>

										<div class="col-sm-3">
											<input class="form-control" name="time_limit"
												id="problem_memory_limit" placeholder="Memory Limit">
										</div>
										<label for="problem_level"
											class="col-sm-2 control-label visible-xs">Level</label>

										<div class="col-sm-2">
											<input class="form-control" name="time_limit"
												id="problem_level" placeholder="Level">
										</div>

									</div>

									<div class="form-group">
										<label for="problem_details" class="col-sm-2 control-label">Details</label>

										<div class="col-sm-10">
											<textarea class="form-control" name="details"
												id="problem_details" rows="12"
												placeholder="Problem Description"></textarea>
										</div>
									</div>

								</div>
								<div class="tab-pane " id="c_input">
									<div class="form-group">
										<label for="problem_input" class="col-sm-2 control-label">Input</label>

										<div class="col-sm-10">
											<textarea class="form-control" name="input"
												id="problem_input" rows="6" placeholder="Input Description"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="problem_output" class="col-sm-2 control-label">Output</label>

										<div class="col-sm-10">
											<textarea class="form-control" name="output"
												id="problem_output" rows="6"
												placeholder="Output Description"></textarea>
										</div>
									</div>

								</div>
								<div class="tab-pane " id="c_sample_1">
									<div class="form-group">
										<label for="problem_input_1" class="col-sm-2 control-label">Sample
											Input 1</label>

										<div class="col-sm-10">
											<textarea class="form-control code" name="input_1"
												id="problem_input_1" rows="6" placeholder="Sample Input 1"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="problem_output_1" class="col-sm-2 control-label">Sample
											Output 1</label>

										<div class="col-sm-10">
											<textarea class="form-control" name="output_1"
												id="problem_output_1" rows="6" placeholder="Sample Input 1"></textarea>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="c_sample_2">
									<div class="form-group">
										<label for="problem_input_2" class="col-sm-2 control-label">Sample
											Input 2</label>

										<div class="col-sm-10">
											<textarea class="form-control code" name="input_2"
												id="problem_input_2" rows="6" placeholder="Sample Input 2"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="problem_output_2" class="col-sm-2 control-label">Sample
											Output 2</label>

										<div class="col-sm-10">
											<textarea class="form-control" name="output_2"
												id="problem_output_2" rows="6" placeholder="Sample Input 2"></textarea>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="c_tags">
									<div class="form-group">

										<div class="col-sm-12 tag_box" style="min-height: 90px;">
											<label class="badge"> <input type="checkbox"
												name="tags[]" value="1"> <span class="">Dynamic
													Programming</span>
											</label> <label class="badge"> <input type="checkbox"
												name="tags[]" value="2"> <span class="">Arrays</span>
											</label> <label class="badge"> <input type="checkbox"
												name="tags[]" value="3"> <span class="">Extremal
													Programming</span>
											</label> <label class="badge"> <input type="checkbox"
												name="tags[]" value="1"> <span class="">Dynamic
													Programming</span>
											</label> <label class="badge"> <input type="checkbox"
												name="tags[]" value="2"> <span class="">Arrays</span>
											</label> <label class="badge"> <input type="checkbox"
												name="tags[]" value="3"> <span class="">Extremal
													Programming</span>
											</label> <label class="badge"> <input type="checkbox"
												name="tags[]" value="1"> <span class="">Dynamic
													Programming</span>
											</label> <label class="badge"> <input type="checkbox"
												name="tags[]" value="2"> <span class="">Arrays</span>
											</label> <label class="badge"> <input type="checkbox"
												name="tags[]" value="3"> <span class="">Extremal
													Programming</span>
											</label> <label class="badge"> <input type="checkbox"
												name="tags[]" value="1"> <span class="">Dynamic
													Programming</span>
											</label> <label class="badge"> <input type="checkbox"
												name="tags[]" value="2"> <span class="">Arrays</span>
											</label> <label class="badge"> <input type="checkbox"
												name="tags[]" value="3"> <span class="">Extremal
													Programming</span>
											</label> <label class="badge"> <input type="checkbox"
												name="tags[]" value="1"> <span class="">Dynamic
													Programming</span>
											</label> <label class="badge"> <input type="checkbox"
												name="tags[]" value="2"> <span class="">Arrays</span>
											</label> <label class="badge"> <input type="checkbox"
												name="tags[]" value="3"> <span class="">Extremal
													Programming</span>
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
							<button type="submit" class="btn btn-default">Save</button>
							<button type="submit" class="btn btn-default"
								onclick="return $('#continue').val(1)">Save & Continue
							</button>
						</div>
						<div class="clearfix"></div>

					</form>
				</div>
			</div>
		</div>


	</div>
	<jsp:include page="/WEB-INF/views/admin/includes/before_body_end.jsp" />



</body>
</html>
