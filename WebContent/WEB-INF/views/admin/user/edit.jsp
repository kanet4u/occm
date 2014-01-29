<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
					<h3 class="page-header">
						Edit User
						</h1>
						<ol class="breadcrumb">
							<li><a href="admin_index.html">Administration</a></li>
							<li><a href="admin_users.html">User Management</a></li>
							<li class="active">Add User</li>
						</ol>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<form:form class="form-horizontal" role="form" method="post" modelAttribute="user">
						<div class="panel panel-default">
							<div class="panel-heading">User Details</div>
							<div class="panel-body">
								<div class="form-group">
									<label for="user_username" class="col-sm-2 control-label ">Firstname</label>

									<div class="col-sm-5">
										<input type="email" class="form-control" name="fname"
											id="user_fname" placeholder="Firstname">
									</div>
									<label for="user_lname"
										class="col-sm-2 control-label visible-xs">Lastname</label>

									<div class="col-sm-5">
										<input type="email" class="form-control" name="lname"
											id="user_lname" placeholder="Lastname">
									</div>
								</div>
								<!-- <div class="form-group">
									<label for="user_username" class="col-sm-2 control-label">Username</label>

									<div class="col-sm-10">
										<input type="email" class="form-control" name="username"
											id="user_username" placeholder="Username">
									</div>
								</div> -->

								<div class="form-group">
									<label for="user_email" class="col-sm-2 control-label">Email</label>

									<div class="col-sm-10">
										<input type="email" class="form-control" name="email"
											id="user_email" placeholder="Username">
									</div>
								</div>

								<div class="form-group">
									<label for="user_password" class="col-sm-2 control-label">Password</label>

									<div class="col-sm-10">
										<input type="text" class="form-control" id="user_password"
											name="password" placeholder="Password">

									</div>

								</div>

								<div class="form-group">
									<label for="user_status" class="col-sm-2 control-label ">Status</label>

									<div class="col-sm-5">
										<form:select class="form-control" path="status" id="user_status" items="${statusList}" /><%-- 
											<option value="1">Enabled</option>
											<option value="0">Disabled</option>
										</select>  --%>
									</div>
								</div>
								<div class="form-group">
									<label for="user_role" class="col-sm-2 control-label">Role</label>

									<div class="col-sm-5">
										<form:select class="form-control" path="role" id="user_role" items="${roleList}" /><%-- 
											<option value="admin">Admin</option>
											<option value="teacher">Teacher</option>
											<option value="user">User</option>
										</select>  --%>
									</div>
								</div>
								<input type="hidden" name="continue" id="continue" value="0">
							</div>
							<div class="panel-footer">
								<div class="btn-group pull-right">
									<button type="reset" class="btn btn-default"
										onclick="return confirm('Do you want to reset changes')">Reset
									</button>
									<button type="submit" class="btn btn-default">Save</button>
									<button type="submit" class="btn btn-success"
										onclick="return $('#continue').val(1)">Save &
										Continue</button>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</form:form>
				</div>
			</div>


		</div>
	</div>
	<jsp:include page="/WEB-INF/views/admin/includes/before_body_end.jsp" />


</body>
</html>

