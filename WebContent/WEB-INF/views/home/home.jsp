<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/includes/head.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/views/includes/navigation.jsp" />
	<div class="container">
		<jsp:include page="/WEB-INF/views/includes/messages.jsp" />
		<!-- Main component for a primary marketing message or call to action -->
		<div class="jumbotron">
			<h1>Welcome to Coding!</h1>
			<h2>Howdy, ${sessionScope.activeUser.fname} ${sessionScope.activeUser.sname}
				!!!</h2>

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
		<hr>
		<footer>
			<div class="container">
				<div class="row">
					<ul class="list-inline">
						<li><a href="#">About</a></li>
						<li><a href="#">Guide</a></li>
						<li><a href="#">FAQ</a></li>
						<li><a href="#">Contacts</a></li>
						<li class="separator"></li>
						<li><a href="#">Problems Archive</a></li>
						<li><a href="#">Users Ranklist</a></li>
						<li><a href="#">Judge Status</a></li>
						<li class="separator"></li>
						<li><p>&copy; CDAC, ACTS 2013</p></li>
					</ul>
				</div>
			</div>
		</footer>
	</div>
	<!-- /container -->


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
