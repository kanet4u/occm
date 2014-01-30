<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<nav class="navbar navbar-default navbar-static-top" role="navigation"
	style="margin-bottom: 0">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".sidebar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand"
			href="${pageContext.request.contextPath}/admin">Administration</a>
	</div>
	<ul class="nav navbar-top-links navbar-right">
		<li><a href="${pageContext.request.contextPath}/home"><i
				class="fa fa-home"></i> Home</a></li>
		<c:if test="${sessionScope.activeUser != null}">
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown"><i class="fa fa-user fa-fw"></i> <b
					class="caret"></b></a>
				<ul class="dropdown-menu dropdown-user">
					<li><a
						href="${pageContext.request.contextPath}/admin/user/edit/${sessionScope.activeUser.id}"><i
							class="fa fa-user fa-fw"></i> User Profile</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/settings"><i
							class="fa fa-gear fa-fw"></i> Settings</a></li>
					<li class="divider"></li>
					<li><a href="${pageContext.request.contextPath}/admin/logout"><i
							class="fa fa-sign-out fa-fw"></i> Logout</a></li>
				</ul></li>
		</c:if>
	</ul>

</nav>


<nav class="navbar-default navbar-static-side" role="navigation">
	<div class="sidebar-collapse">
		<ul class="nav" id="side-menu">
			<li class="sidebar-search">
				<div class="input-group custom-search-form">
					<input type="text" class="form-control" placeholder="Search...">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">
							<i class="fa fa-search"></i>
						</button>
					</span>
				</div> <!-- /input-group -->
			</li>
			<li><a href="${pageContext.request.contextPath}/admin"><i
					class="fa fa-dashboard fa-fw"></i> Dashboard</a></li>
			<li class="${requestScope.usersactive}"><a
				href="${pageContext.request.contextPath}/admin/user"><i
					class="fa fa-users fa-fw active"></i> Users<span class="fa arrow"></span></a>
				<ul class="nav nav-second-level ">
					<li><a href="${pageContext.request.contextPath}/admin/user">Users
							List</a> <a href="${pageContext.request.contextPath}/admin/user/add">Add
							User</a> <a href="${pageContext.request.contextPath}/admin/user/roles">Roles</a></li>
				</ul></li>
			
			<li class="${requestScope.compactive}"><a href="${pageContext.request.contextPath}/admin/competition"><i
					class="fa fa-tasks fa-fw"></i> Competitions <span class="fa arrow"></span></a>
				<ul class="nav nav-second-level ">
					<li><a href="${pageContext.request.contextPath}/admin/competition">Competitions List</a> <a
						href="${pageContext.request.contextPath}/admin/competition/request">Join Requests</a> <a
						href="${pageContext.request.contextPath}/admin/competition/add">Add Competition</a></li>
				</ul></li>
			<li class="${requestScope.problemsactive}"><a
				href="${pageContext.request.contextPath}/admin/problem"><i class="fa fa-superscript fa-fw"></i>
					Problems <span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="${pageContext.request.contextPath}/admin/problem">Problems List</a> <a
						href="${pageContext.request.contextPath}/admin/problem/add">Add Problem</a><a
						href="${pageContext.request.contextPath}/admin/problem/tests">Test Cases</a><a
						href="${pageContext.request.contextPath}/admin/problem/tests/add">Add Test Case</a> <a
						href="${pageContext.request.contextPath}/admin/problem/tags">Problem Tags</a></li>
				</ul></li>
			<li><a href="${pageContext.request.contextPath}/admin/submission"><i
					class="fa fa-code fa-fw"></i> Submission</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/page"><i
					class="fa fa-file-text fa-fw"></i> Pages & Posts </a></li>
			<li><a href="${pageContext.request.contextPath}/admin/bugreport"><i
					class="fa fa-bug fa-fw"></i> Bug Reports</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/settings"><i class="fa fa-wrench fa-fw"></i>
					Settings</a></li>


		</ul>
		<!-- /#side-menu -->
	</div>
	<!-- /.sidebar-collapse -->
</nav>
<!-- /.navbar-static-side -->
