<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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

						<div id="messages-area">
							<div class="alert alert-danger alert-dismissable">
								<button aria-hidden="true" data-dismiss="alert" class="close"
									type="button">×</button>
								<form:errors path="email" cssClass="error" />
							</div>

						</div>

						<span class="part_border"><div class="info"></div></span>

						<form:form method="post" modelAttribute="user" accept-charset="utf-8" role="form"> 
							class="form-data" id="form_adminbox_login">
							<div class="form-group">
								<input type="text" class="form-control"
									placeholder="Firstname, Lastname" name="username">
							</div>
							<div class="form-group input-group">
								<span class="input-group-addon"><i
									class="fa fa-user fa-fw"></i></span> <input type="text"
									class="form-control" placeholder="Login" name="email">
							</div>
							<div class="form-group input-group">
								<span class="input-group-addon"><i
									class="fa fa-envelope fa-fw"></i></span> <input type="text"
									class="form-control" placeholder="Email" name="email">
							</div>

							<div class="form-group input-group">
								<span class="input-group-addon"><i
									class="fa fa-key fa-fw"></i></span> <input type="password"
									name="password" class="form-control" autocomplite="off"
									placeholder="Password">
							</div>
							<div class="form-group input-group">
								<span class="input-group-addon"><i
									class="fa fa-repeat fa-fw"></i></span> <input type="password"
									name="password" class="form-control" autocomplite="off"
									placeholder="Password Confirmation">
							</div>

							<div class="form-group input-group">
								<div>
									<button name="submit" style="margin-right: 10px"
										class="btn btn-primary" type="submit" caption="Sign In">Sign
										Up</button>
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
