<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>${requestScope.sts_mesg}</center>
	<table border="1">
		<tr>
			<td>Id</td>
			<td>EMAIL</td>
			<td>User Name</td>
			<td>Role</td>
			<td>Actions</td>
			<td>Competitions</td>
			<td>Status</td>
			<td>Delete</td>
		</tr>
		
			<tr>
				<td>${requestScope.user.id}</td>
				<td>${requestScope.user.email}</td>
				<td>${requestScope.user.fname} ${requestScope.user.sname}</td>
				<td>${requestScope.user.role.role}</td>
				<td><c:forEach var="a" items="${requestScope.user.role.actions}">${a.action} </c:forEach></td>
				<td><c:forEach var="c" items="${requestScope.user.competitions}">${c.title} </c:forEach></td>
				<td>${requestScope.user.status.status}</td>
				<td><a href="<spring:url value="delete/${requestScope.user.id}"/>">Delete</a></td>
			</tr>
	</table>
	<spring:url var="url" value="admin_ok"/>
	<a href="${url}">Back To Admin Main Page</a>
</body>
</html>