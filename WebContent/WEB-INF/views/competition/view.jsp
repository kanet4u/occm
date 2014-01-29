<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<h1>
			Competitions <small style="font-size: 11px;"><a href="">See
					Competitions FAQ</a></small>
		</h1>
		<jsp:include page="/WEB-INF/views/includes/messages.jsp" />
		<hr>
		
		
		<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
	</div>
	<!-- /container -->
	<jsp:include page="/WEB-INF/views/includes/before_body_end.jsp" />
	<script type="text/javascript">
		$(document).ready(function() {
			ticker("#counter");
		});

		
	</script>
</body>
</html>