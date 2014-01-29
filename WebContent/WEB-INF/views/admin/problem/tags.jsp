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
					<h3 class="page-header">Problem Management</h3>
					<ol class="breadcrumb">
						<li><a href="${pageContext.request.contextPath}/admin">Administration</a></li>
						<li><a
							href="${pageContext.request.contextPath}/admin/problem">Problem
								Management</a></li>
						<li class="active">Tags</li>
						<span class="pull-right admin_action"><a href="#"
							id="add_new_tag"><i class="fa fa-plus"></i> Add New Tag</a></span>
					</ol>

					<jsp:include page="/WEB-INF/views/admin/includes/messages.jsp" />

					<div class="table-responsive"></div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="col-sm-12 tag_box">
						<c:forEach var="tag" items="${requestScope.tags}" varStatus="i">
							<label class="badge problem_tag"> <span id="p_tag_${tag.id}"
								data_id="${tag.id}">${tag.tag}</span> <a href="#"
								class="btn-delete" action="${pageContext.request.contextPath}/admin/problem/tags/delete/${tag.id}"><i
									class="fa fa-minus"></i></a>
							</label>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>


		<div class="modal fade" id="modal_edit_tag" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">Edit Tag</h4>
					</div>
					<div class="modal-body">
						<form class="form-data" role="form" id="tag_form" method="post"
							action="${pageContext.request.contextPath}/admin/problem/tags/edit">
							<div class="form-group input-group">
								<span class="input-group-addon"><i class="fa fa-tag"></i></span>
								<input type="hidden" id="edit_tag_id" placeholder="Tag"
									name="id"> <input class="form-control"
									id="edit_tag_name" placeholder="Tag" name="tag">
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-primary">Save</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>


		<jsp:include page="/WEB-INF/views/admin/includes/before_body_end.jsp" />

		<script type="text/javascript">
			$(function() {
				$('.problem_tag span').click(function() {
					$('#edit_tag_id').val($(this).attr('data_id'));
					$('#edit_tag_name').val($(this).text());
					$('#modal_edit_tag').modal('show');
				});
				$('#add_new_tag').click(function() {
					$('#edit_tag_id').val('-1');
					$('#edit_tag_name').val('');
					$('#modal_edit_tag').modal('show');
					return false;
				});
			})
		</script>
</body>
</html>
