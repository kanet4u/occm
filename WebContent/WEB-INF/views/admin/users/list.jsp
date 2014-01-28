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
					<h3 class="page-header">User Management</h3>
					<ol class="breadcrumb">
						<li><a href="${pageContext.request.contextPath}/admin">Administration</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/users">User
								Management</a></li>
						<span class="pull-right admin_action"><a
							href="${pageContext.request.contextPath}/admin/users/add"><i
								class="fa fa-plus"></i> Add New User</a></span>
					</ol>
				
					<jsp:include page="/WEB-INF/views/admin/includes/messages.jsp" />

					<div class="table-responsive">
						<table class="table table-striped table-hover data-table"
							id="users_table">
							<thead>
								<tr>
									<th>ID</th>
									<th class="col_username">Username</th>
									<th class="col_firstname visible-lg">Firstname</th>
									<th class="col_lastname visible-lg">Lastname</th>
									<th class="col_email">Email</th>
									<th class="col_role">Role</th>
									<th class="action col_status">Status</th>
									<th class="action col_edit">Edit</th>
									<th class="action col_delete">Delete</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td class="col_username"><a href="admin_add_user.html">shavkat</a></td>
									<td class="col_firstname visible-lg">Shavkat</td>
									<td class="col_lastname visible-lg">Khamidjanov</td>
									<td class="col_email">homidjonov@gmail.com</td>
									<td class="col_role">admin</td>
									<td class="action col_status"><b>a</b><a href="#"><i
											class="fa fa-check-square-o"></i></a></td>
									<td class="action col_edit"><a href="admin_user_edit.html"><i
											class="fa fa-edit"></i> </a></td>
									<td class="action col_delete"><a href="#"><i
											class="fa fa-minus-circle"></i></a></td>
								</tr>
								<tr class="status_disabled">
									<td>2</td>
									<td class="col_username"><a href="admin_add_user.html">vivek</a></td>
									<td class="col_firstname visible-lg">Vivek</td>
									<td class="col_lastname visible-lg">Yadav</td>
									<td class="col_email">vivekyadav@gmail.com</td>
									<td class="col_role">teacher</td>
									<td class="action col_status"><b>d</b><a href="#"><i
											class="fa fa-ban"></i></a></td>
									<td class="action col_edit"><a href="admin_user_edit.html"><i
											class="fa fa-edit"></i> </a></td>
									<td class="action col_delete"><a href="#"><i
											class="fa fa-minus-circle"></i></a></td>
								</tr>
								<tr>
									<td>1</td>
									<td class="col_username"><a href="admin_add_user.html">shavkat</a></td>
									<td class="col_firstname visible-lg">Shavkat</td>
									<td class="col_lastname visible-lg">Khamidjanov</td>
									<td class="col_email">homidjonov@gmail.com</td>
									<td class="col_role">admin</td>
									<td class="action col_status"><b>a</b><a href="#"><i
											class="fa fa-check-square-o"></i></a></td>
									<td class="action col_edit"><a href="admin_user_edit.html"><i
											class="fa fa-edit"></i> </a></td>
									<td class="action col_delete"><a href="#"><i
											class="fa fa-minus-circle"></i></a></td>
								</tr>
								<tr class="status_new">
									<td>2</td>
									<td class="col_username"><a href="admin_add_user.html">vivek</a></td>
									<td class="col_firstname visible-lg">Vivek</td>
									<td class="col_lastname visible-lg">Yadav</td>
									<td class="col_email">vivekyadav@gmail.com</td>
									<td class="col_role">teacher</td>
									<td class="action col_status"><b>n</b><a href="#"><i
											class="fa fa-info-circle"></i></a></td>
									<td class="action col_edit"><a href="admin_user_edit.html"><i
											class="fa fa-edit"></i> </a></td>
									<td class="action col_delete"><a href="#"><i
											class="fa fa-minus-circle"></i></a></td>
								</tr>
								<tr>
									<td>3</td>
									<td class="col_username"><a href="admin_add_user.html">nurzod</a></td>
									<td class="col_firstname visible-lg">Nurzod</td>
									<td class="col_lastname visible-lg">Karahanov</td>
									<td class="col_email">nurzodkarahanov@gmail.com</td>
									<td class="col_role">user</td>
									<td class="action col_status"><b>a</b><a href="#"><i
											class="fa fa-check-square-o"></i></a></td>
									<td class="action col_edit"><a href="admin_user_edit.html"><i
											class="fa fa-edit"></i> </a></td>
									<td class="action col_delete"><a href="#"><i
											class="fa fa-minus-circle"></i></a></td>
								</tr>
								<tr class="status_new">
									<td>4</td>
									<td class="col_username"><a href="admin_add_user.html">rahul</a></td>
									<td class="col_firstname visible-lg">Rahul</td>
									<td class="col_lastname visible-lg">Gupta</td>
									<td class="col_email">rahulgupta@gmail.com</td>
									<td class="col_role">user</td>
									<td class="action col_status"><b>n</b><a href="#"><i
											class="fa fa-info-circle"></i></a></td>
									<td class="action col_edit"><a href="admin_user_edit.html"><i
											class="fa fa-edit"></i> </a></td>
									<td class="action col_delete"><a href="#"><i
											class="fa fa-minus-circle"></i></a></td>
								</tr>
								<tr>
									<td>2</td>
									<td class="col_username"><a href="admin_add_user.html">vivek</a></td>
									<td class="col_firstname visible-lg">Vivek</td>
									<td class="col_lastname visible-lg">Yadav</td>
									<td class="col_email">vivekyadav@gmail.com</td>
									<td class="col_role">teacher</td>
									<td class="action col_status"><b>a</b><a href="#"><i
											class="fa fa-check-square-o"></i></a></td>
									<td class="action col_edit"><a href="admin_user_edit.html"><i
											class="fa fa-edit"></i> </a></td>
									<td class="action col_delete"><a href="#"><i
											class="fa fa-minus-circle"></i></a></td>
								</tr>
								<tr>
									<td>3</td>
									<td class="col_username"><a href="admin_add_user.html">nurzod</a></td>
									<td class="col_firstname visible-lg">Nurzod</td>
									<td class="col_lastname visible-lg">Karahanov</td>
									<td class="col_email">nurzodkarahanov@gmail.com</td>
									<td class="col_role">user</td>
									<td class="action col_status"><b>a</b><a href="#"><i
											class="fa fa-check-square-o"></i></a></td>
									<td class="action col_edit"><a href="admin_user_edit.html"><i
											class="fa fa-edit"></i> </a></td>
									<td class="action col_delete"><a href="#"><i
											class="fa fa-minus-circle"></i></a></td>
								</tr>
								<tr>
									<td>4</td>
									<td class="col_username"><a href="admin_add_user.html">rahul</a></td>
									<td class="col_firstname visible-lg">Rahul</td>
									<td class="col_lastname visible-lg">Gupta</td>
									<td class="col_email">rahulgupta@gmail.com</td>
									<td class="col_role">user</td>
									<td class="action col_status"><b>a</b><a href="#"><i
											class="fa fa-check-square-o"></i></a></td>
									<td class="action col_edit"><a href="admin_user_edit.html"><i
											class="fa fa-edit"></i> </a></td>
									<td class="action col_delete"><a href="#"><i
											class="fa fa-minus-circle"></i></a></td>
								</tr>
								<tr>
									<td>1</td>
									<td class="col_username"><a href="admin_add_user.html">shavkat</a></td>
									<td class="col_firstname visible-lg">Shavkat</td>
									<td class="col_lastname visible-lg">Khamidjanov</td>
									<td class="col_email">homidjonov@gmail.com</td>
									<td class="col_role">admin</td>
									<td class="action col_status"><b>a</b><a href="#"><i
											class="fa fa-check-square-o"></i></a></td>
									<td class="action col_edit"><a href="admin_user_edit.html"><i
											class="fa fa-edit"></i> </a></td>
									<td class="action col_delete"><a href="#"><i
											class="fa fa-minus-circle"></i></a></td>
								</tr>
								<tr class="status_disabled">
									<td>2</td>
									<td class="col_username"><a href="admin_add_user.html">vivek</a></td>
									<td class="col_firstname visible-lg">Vivek</td>
									<td class="col_lastname visible-lg">Yadav</td>
									<td class="col_email">vivekyadav@gmail.com</td>
									<td class="col_role">teacher</td>
									<td class="action col_status"><b>d</b><a href="#"><i
											class="fa fa-ban"></i></a></td>
									<td class="action col_edit"><a href="admin_user_edit.html"><i
											class="fa fa-edit"></i> </a></td>
									<td class="action col_delete"><a href="#"><i
											class="fa fa-minus-circle"></i></a></td>
								</tr>
								<tr>
									<td>1</td>
									<td class="col_username"><a href="admin_add_user.html">shavkat</a></td>
									<td class="col_firstname visible-lg">Shavkat</td>
									<td class="col_lastname visible-lg">Khamidjanov</td>
									<td class="col_email">homidjonov@gmail.com</td>
									<td class="col_role">admin</td>
									<td class="action col_status"><b>a</b><a href="#"><i
											class="fa fa-check-square-o"></i></a></td>
									<td class="action col_edit"><a href="admin_user_edit.html"><i
											class="fa fa-edit"></i> </a></td>
									<td class="action col_delete"><a href="#"><i
											class="fa fa-minus-circle"></i></a></td>
								</tr>
								<tr class="status_new">
									<td>2</td>
									<td class="col_username"><a href="admin_add_user.html">vivek</a></td>
									<td class="col_firstname visible-lg">Vivek</td>
									<td class="col_lastname visible-lg">Yadav</td>
									<td class="col_email">vivekyadav@gmail.com</td>
									<td class="col_role">teacher</td>
									<td class="action col_status"><b>n</b><a href="#"><i
											class="fa fa-info-circle"></i></a></td>
									<td class="action col_edit"><a href="admin_user_edit.html"><i
											class="fa fa-edit"></i> </a></td>
									<td class="action col_delete"><a href="#"><i
											class="fa fa-minus-circle"></i></a></td>
								</tr>
								<tr>
									<td>3</td>
									<td class="col_username"><a href="admin_add_user.html">nurzod</a></td>
									<td class="col_firstname visible-lg">Nurzod</td>
									<td class="col_lastname visible-lg">Karahanov</td>
									<td class="col_email">nurzodkarahanov@gmail.com</td>
									<td class="col_role">user</td>
									<td class="action col_status"><b>a</b><a href="#"><i
											class="fa fa-check-square-o"></i></a></td>
									<td class="action col_edit"><a href="admin_user_edit.html"><i
											class="fa fa-edit"></i> </a></td>
									<td class="action col_delete"><a href="#"><i
											class="fa fa-minus-circle"></i></a></td>
								</tr>
								<tr class="status_new">
									<td>4</td>
									<td class="col_username"><a href="admin_add_user.html">rahul</a></td>
									<td class="col_firstname visible-lg">Rahul</td>
									<td class="col_lastname visible-lg">Gupta</td>
									<td class="col_email">rahulgupta@gmail.com</td>
									<td class="col_role">user</td>
									<td class="action col_status"><b>n</b><a href="#"><i
											class="fa fa-info-circle"></i></a></td>
									<td class="action col_edit"><a href="admin_user_edit.html"><i
											class="fa fa-edit"></i> </a></td>
									<td class="action col_delete"><a href="#"><i
											class="fa fa-minus-circle"></i></a></td>
								</tr>
								<tr>
									<td>2</td>
									<td class="col_username"><a href="admin_add_user.html">vivek</a></td>
									<td class="col_firstname visible-lg">Vivek</td>
									<td class="col_lastname visible-lg">Yadav</td>
									<td class="col_email">vivekyadav@gmail.com</td>
									<td class="col_role">teacher</td>
									<td class="action col_status"><b>a</b><a href="#"><i
											class="fa fa-check-square-o"></i></a></td>
									<td class="action col_edit"><a href="admin_user_edit.html"><i
											class="fa fa-edit"></i> </a></td>
									<td class="action col_delete"><a href="#"><i
											class="fa fa-minus-circle"></i></a></td>
								</tr>
								<tr>
									<td>3</td>
									<td class="col_username"><a href="admin_add_user.html">nurzod</a></td>
									<td class="col_firstname visible-lg">Nurzod</td>
									<td class="col_lastname visible-lg">Karahanov</td>
									<td class="col_email">nurzodkarahanov@gmail.com</td>
									<td class="col_role">user</td>
									<td class="action col_status"><b>a</b><a href="#"><i
											class="fa fa-check-square-o"></i></a></td>
									<td class="action col_edit"><a href="admin_user_edit.html"><i
											class="fa fa-edit"></i> </a></td>
									<td class="action col_delete"><a href="#"><i
											class="fa fa-minus-circle"></i></a></td>
								</tr>
								<tr>
									<td>4</td>
									<td class="col_username"><a href="admin_add_user.html">rahul</a></td>
									<td class="col_firstname visible-lg">Rahul</td>
									<td class="col_lastname visible-lg">Gupta</td>
									<td class="col_email">rahulgupta@gmail.com</td>
									<td class="col_role">user</td>
									<td class="action col_status"><b>a</b><a href="#"><i
											class="fa fa-check-square-o"></i></a></td>
									<td class="action col_edit"><a href="admin_user_edit.html"><i
											class="fa fa-edit"></i> </a></td>
									<td class="action col_delete"><a href="#"><i
											class="fa fa-minus-circle"></i></a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/admin/includes/before_body_end.jsp" />
</body>
</html>
