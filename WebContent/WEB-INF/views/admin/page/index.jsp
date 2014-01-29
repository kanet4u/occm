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
					<h3 class="page-header">Content Management</h3>
					<ol class="breadcrumb">
						<li><a href="${pageContext.request.contextPath}/admin">Administration</a></li>
						<li class="active">Content Management</li>
						<span class="pull-right admin_action"><a
							href="${pageContext.request.contextPath}/admin/page/add"><i
								class="fa fa-plus"></i> Add New Content</a></span>
					</ol>

					<jsp:include page="/WEB-INF/views/admin/includes/messages.jsp" />

					<div class="table-responsive">
						<table class="table table-striped table-hover data-table"
							id="pages_table">
							<thead>
								<tr>
									<th style="width:30px">ID</th>
									<th class="col_title">Title</th>
									<th class="col_type">Type</th>
									<th class="col_created">Created</th>
									<th class="action col_status">Status</th>
									<th class="action col_edit">Edit</th>
									<th class="action col_delete">Delete</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="page" items="${requestScope.pages}"
									varStatus="i">
									<tr>
										<td>${page.id}</td>
										<td class="col_title"><a
											href="${pageContext.request.contextPath}/admin/page/edit/${page.id}">
												${page.title}</a></td>
										<td class="col_score">${page.type}</td>
										<td class="col_created">${page.created}</td>
										<td class="action col_status"><b>${page.status}</b><a
											href="${pageContext.request.contextPath}/admin/page/status/${page.id}"><i
												class="fa status-${page.status}"></i></a></td>
										<td class="action col_edit"><a
											href="${pageContext.request.contextPath}/admin/page/edit/${page.id}"><i
												class="fa fa-edit"></i> </a></td>
										<td class="action col_delete"><a class="btn-delete"
											href="#"
											action="${pageContext.request.contextPath}/admin/page/delete/${page.id}"><i
												class="fa fa-minus-circle"></i></a></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/admin/includes/before_body_end.jsp" />

	<script type="text/javascript">
		$(document).ready(function() {
			 $('#pages_table').dataTable({
		            "aoColumnDefs":[
		                { 'bSortable':false, 'aTargets':[5,6] }
		            ]
		        });
		        $('#pages_table_filter input').attr('placeholder', 'Search');
		        /* $('#pages_table th').css('width', 'auto'); */
		});
	</script>
</body>
</html>
