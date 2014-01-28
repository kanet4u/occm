<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Online Code Competition</a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class=" hidden-sm active"><a href="${pageContext.request.contextPath}">Home</a></li>
				<li class=" hidden-sm"><a href="${pageContext.request.contextPath}/page/guide">Guide</a></li>
				<li><a href="${pageContext.request.contextPath}/competition">Competitions</a></li>
				<li><a href="${pageContext.request.contextPath}/judge">Judge Status</a></li>
			</ul>


			<c:if test="${sessionScope.activeUser == null}">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#" data-toggle="modal"
						data-target="#modal_sign_in"> <i class="fa fa-sign-in"></i>
							Sign In
					</a></li>
					<li><a href="${pageContext.request.contextPath}/home/register"><i
							class="fa fa-user"></i> Register</a></li>
				</ul>
			</c:if>

			<c:if test="${sessionScope.activeUser != null}">
				<ul class="nav navbar-nav navbar-right">
					<!--<li><a href="#">Link</a></li>-->
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><i class="fa fa-user"></i> My Account <b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath}/account/inbox"><i class="fa fa-envelope-o"></i> Inbox</a></li>
							<li><a href="${pageContext.request.contextPath}/account/submissions"><i class="fa fa-code"></i> Submissions</a></li>
							<li class="divider"></li>
							<li><a href="${pageContext.request.contextPath}/account/settings"><i class="fa fa-gear"></i> Settings</a></li>
							<li><a href="${pageContext.request.contextPath}/home/logout"><i class="fa fa-power-off"></i> Logout</a></li>
						</ul></li>
				</ul>
			</c:if>

		</div>
	</div>
</div>