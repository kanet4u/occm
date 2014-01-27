<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/includes/head.jsp" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/includes/navigation.jsp" />
	<div class="container">

		<div class="row" style="min-height: 50px;"></div>
		<div class="row" style="min-height: 400px;">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<div class="panel panel-default">
					<div class="panel-heading">Register</div>
					<div class="panel-body">
						<span class="part_border"><div class="info"></div></span>

						

						<span class="part_border"><div class="info"></div></span>

						<form:form method="post" modelAttribute="user" accept-charset="utf-8" role="form" 
							class="form-data" id="form_adminbox_login">
							<div id="messages-area">
							<div class="alert alert-danger alert-dismissable">
								<button aria-hidden="true" data-dismiss="alert" class="close"
									type="button">×</button>
								<form:errors path="*" />
							</div>

						</div>
							<div class="form-group input-group">
								<spring:message code="email.label" var="emailLabel" />
								<span class="input-group-addon"><i
									class="fa fa-user fa-fw"></i></span> <form:input type="text"
									class="form-control" placeholder="${emailLabel}" path="email"/>
							</div>
							<div class="form-group input-group">
								<spring:message code="password.label" var="passwordLabel" />
								<span class="input-group-addon"><i
									class="fa fa-key fa-fw"></i></span><form:input type="password"
									class="form-control" autocomplete="off" placeholder="${passwordLabel}" path="password"/>
							</div>
							<div class="form-group input-group">
								<spring:message code="fname.label" var="fnameLabel" />
								<span class="input-group-addon"><i
									class="fa fa-user fa-fw"></i></span><form:input type="text"
									class="form-control" placeholder="${fnameLabel}" path="fname"/>
							</div>
							<div class="form-group input-group">
								<spring:message code="sname.label" var="snameLabel" />
								<span class="input-group-addon"><i
									class="fa fa-user fa-fw"></i></span><form:input type="text"
									class="form-control" placeholder="${snameLabel}" path="sname"/>
							</div>
							
							<div class="form-group input-group">
								<div>
									<input type="submit" name="submit" style="margin-right: 10px"
										class="btn btn-primary" type="submit" value="<spring:message code="signup.label" />" />
								</div>
							</div>
						</form:form>
						<!--END PART [login_form]-->
					</div>
				</div>
			</div>
			<div class="col-lg-4"></div>
		</div>
		<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
	</div>
	<!-- /container -->
	<jsp:include page="/WEB-INF/views/includes/before_body_end.jsp" />
</body>
</html>
