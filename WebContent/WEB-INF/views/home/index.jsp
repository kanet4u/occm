<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/includes/head.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/views/includes/navigation.jsp" />
	<div class="container">
		<div class="jumbotron">
			<h1>Welcome to Coding!</h1>

			<p>Here is our Online Code Competition Management System and you
				can enjoy with it forever, read some information, read problem,
				write solution, test submission, win competition!</p>

			<p>What, when, how? Read below...</p>

			<p>
				<a class="btn btn-lg btn-primary" href="../../components/#navbar"
					role="button">Take a Tour &raquo;</a>
			</p>
		</div>

		<div class="row">
			<div class="col-lg-4">
				<h2>Updates</h2>
				<p>Donec id elit non mi porta gravida at eget metus. Fusce
					dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
					ut fermentum massa justo sit amet risus. Etiam porta sem malesuada
					magna mollis euismod. Donec sed odio dui.</p>

				<p>
					<a role="button" href="#" class="btn btn-default">Read Updates
						&raquo;</a>
				</p>
			</div>
			<div class="col-lg-4">
				<h2>Archives</h2>

				<p>Donec id elit non mi porta gravida at eget metus. Fusce
					dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
					ut fermentum massa justo sit amet risus. Etiam porta sem malesuada
					magna mollis euismod. Donec sed odio dui.</p>

				<p>
					<a role="button" href="#" class="btn btn-default">View Problems
						&raquo;</a>
				</p>
			</div>
			<div class="col-lg-4">
				<h2>Top Coders</h2>

				<p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in,
					egestas eget quam. Vestibulum id ligula porta felis euismod semper.
					Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum
					nibh, ut fermentum massa.</p>

				<p>
					<a role="button" href="#" class="btn btn-default">View Coders
						&raquo;</a>
				</p>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
	</div>
	<!-- /container -->
<jsp:include page="/WEB-INF/views/includes/before_body_end.jsp" />
</body>
</html>
