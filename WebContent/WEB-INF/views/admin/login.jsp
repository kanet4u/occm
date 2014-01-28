<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<title>OCCM Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<base href="${pageContext.request.contextPath}/static/home/">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">

</head>
<body class="user_login">
	<div class="container">
		<div class="row" style="min-height: 50px;"></div>
		<div class="row" style="min-height: 400px;">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<div class="panel panel-default">
					<div class="panel-heading">Login to Dashboard</div>
					<div class="panel-body">
						<span class="part_border"><div class="info"></div></span>

						<div id="messages-area">
							<div class="alert alert-danger alert-dismissable">
								<button aria-hidden="true" data-dismiss="alert" class="close"
									type="button">×</button>
								Username or password is incorrect.
							</div>
						</div>

						<span class="part_border"><div class="info"></div></span>

						<form accept-charset="utf-8" action="" method="post" role="form"
							class="form-data" id="form_adminbox_login">
							<div class="form-group input-group">
								<span class="input-group-addon"><i
									class="fa fa-user fa-fw"></i></span> <input type="text"
									class="form-control" placeholder="Username" name="email">
							</div>

							<div class="form-group input-group">
								<span class="input-group-addon"><i
									class="fa fa-key fa-fw"></i></span> <input type="password"
									name="password" class="form-control" autocomplite="off"
									placeholder="Password">
							</div>

							<div class="form-group input-group">
								<div>
									<button name="submit" style="margin-right: 10px"
										class="btn btn-primary" type="submit" caption="Sign In">Sign
										In</button>
									<a style="margin-left: 10px" class="text-muted" href="">Forgot
										Password<i class="fa fa-question-circle"></i>
									</a>
								</div>
							</div>
						</form>
						<!--END PART [login_form]-->
					</div>
				</div>
			</div>
			<div class="col-lg-4"></div>
		</div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
