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
<body class="problem_editor">
	<jsp:include page="/WEB-INF/views/includes/navigation.jsp" />

	<div class="container">

		<jsp:include page="/WEB-INF/views/includes/messages.jsp" />
		<div class="row">
			<div class="col-lg-2 col-md-1 col-sm-0"></div>
			<div class="col-lg-8 col-md-10 col-sm-12 col">

				<div id="editor_area" class="">
					<div id="editor_toolbar">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-default"> <input type="checkbox"
								id="btn_full_screen"> <i class="fa fa-arrows-alt"></i>
							</label> <label class="btn btn-default"> <input type="checkbox"
								id="btn_terminal"> <i class="fa fa-terminal"></i>

							</label>
						</div>
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-default" id="btn_new_code"
								data-toggle="modal" data-target="#modal_new_solution"><i
								class="fa fa-file-o"></i></label>
						</div>
						<div class="btn-group" data-toggle="buttons" id="theme_group">
							<label class="btn btn-default active"> <input
								type="radio" name="theme" id="theme_chrome" checked="checked"
								value="chrome"> <i class="fa fa-square-o"></i>
							</label> <label class="btn btn-default"> <input type="radio"
								name="theme" id="theme_ambiance" value="ambiance"> <i
								class="fa fa-square"></i>
							</label>
						</div>

						<div class="btn-group">
							<label class="btn btn-default" id="btn_font_size"><i
								class="fa fa-text-height"></i></label> <label class="btn btn-default"
								id="btn_undo"><i class="fa fa-undo"></i></label> <label
								class="btn btn-default" id="btn_redo"><i
								class="fa fa-repeat"></i></label>
						</div>


						<div class="btn-group" data-toggle="buttons" id="language_group">
							<c:forEach var="language" items="${languages}" varStatus="i">
								<label class="btn btn-default"> <input type="radio"
									name="language" id="language_${language.code}"
									value="${language.id}"> ${language.name}
								</label>
							</c:forEach>
						</div>

						<div class="btn-group">
							<label class="btn btn-default" data-toggle="modal"
								data-target="#modal_run_solution">Run <i
								class="fa fa-play"></i>
							</label> <label class="btn btn-default" data-toggle="modal"
								data-target="#modal_submit_solution">Submit <i
								class="fa fa-fast-forward"></i>
							</label>
						</div>
					</div>
					<pre id="editor"></pre>
					<pre id="terminal">Code result here...</pre>
				</div>

			</div>
			<div class="col-lg-2 col-md-1 col-sm-0"></div>
		</div>

		<div class="row">
			<div class="col-lg-2 col-md-1 col-sm-0"></div>
			<div class="col-lg-8 col-md-10 col-sm-12 col">
				<div class="page-header">
					<h2 id="disable-responsive">${problem.title}</h2>
					<ul class="problem_meta">
						<li>time limit: <span class="badge">${problem.timeLimit}
								sec</span></li>
						<li>memory limit: <span class="badge">${problem.memoryLimit}
								kb</span></li>
						<li>success: <span class="badge">${problem.score} %</span></li>
						<li><a
							href="${pageContext.request.contextPath}/submission/problem/${problem.id}">submissions</a></li>
						<li><a
							href="${pageContext.request.contextPath}/discuss/problem/${problem.id}">discuss</a></li>
						<li><a
							href="${pageContext.request.contextPath}/problem/print/${problem.id}">printable</a></li>
						<li><a
							href="${pageContext.request.contextPath}/problem/report/${problem.id}">report</a></li>
					</ul>
				</div>

				<p>${problem.details}</p>
				<hr>

				<h4>Input</h4>

				<p>${problem.input1}</p>
				<hr>
				<h4>Output</h4>

				<p>${problem.output1}</p>
				<hr>

				<table class="table-responsive table-hover problem_samples">
					<thead>
						<tr>
							<th>Input</th>
							<th>Output</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><pre>${problem.input2}</pre></td>
							<td><pre>${problem.output2}</pre></td>
						</tr>
						<tr>
							<td><pre>${problem.input3}</pre></td>
							<td><pre>${problem.output3}</pre></td>
						</tr>

					</tbody>
				</table>

				<p>
					<span class="problem_meta">tags:</span>
					<c:forEach var="tag" items="${problem.tags}" varStatus="i">
						<a href="${pageContext.request.contextPath}/problem/tag/${tag.id}"
							class="badge">${tag.tag}</a>
					</c:forEach>
				</p>
			</div>
			<div class="col-lg-2 col-md-1 col-sm-0"></div>
		</div>
		<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
	</div>

	<div class="modal fade" id="modal_new_solution" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Create New Solution</h4>
				</div>
				<div class="modal-body">
					<form class="form-data form-horizontal" role="form"
						id="new_solution_form">
						<div class="radio">
							<label> <input type="radio" name="new_solution"
								id="optionsRadios1" value="c" checked> Solution in <span
								class="label label-success">C</span>
							</label>
						</div>
						<div class="radio">
							<label> <input type="radio" name="new_solution"
								id="optionsRadios2" value="cpp"> Solution in <span
								class="label label-success">C++</span>
							</label>
						</div>
						<div class="radio">
							<label> <input type="radio" name="new_solution"
								id="optionsRadios3" value="java"> Solution in <span
								class="label label-success">Java</span>
							</label>
						</div>
						<!-- <div class="radio">
							<label> <input type="radio" name="new_solution"
								id="optionsRadios4" value="python"> Solution in <span
								class="label label-success">Python</span>
							</label>
						</div> -->
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary"
						onclick="createNewSolution(false)">Create</button>
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="modal_run_solution" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Test Solution</h4>
				</div>
				<div class="modal-body">
					<form class="form-data form-horizontal" role="form"
						id="run_solution_form">
						<div class="form-group">
							<textarea class="form-control" id="run_input" rows="5"
								placeholder="Enter sample input here..."></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-primary"
						onclick="runSolution()">Run Solution</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="modal_submit_solution" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<form class="" id="submit_solution_form" method="post" >
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">Submit Solution</h4>
					</div>
					<div class="modal-body">
						<p>Do you want to submit the solution?</p>
						<input type="hidden" id="submit_language" name="language">
						<input type="hidden" id="submit_code" name="code">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-primary">Submit
							Solution</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<!-- /container -->
	<jsp:include page="/WEB-INF/views/includes/before_body_end.jsp" />

	<script src="ace/src-min-noconflict/ace.js" type="text/javascript"
		charset="utf-8"></script>

	<script>
		var editor = ace.edit("editor");
		var fontSize = 12;
		var language = "java";
		var code = {
			java : "import java.util.Scanner;\nimport java.io.PrintWriter;\n\npublic class Problem {\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        PrintWriter writer = new PrintWriter(System.out);\n\n        int i = scanner.nextInt();\n        writer.println(i);\n        writer.flush();\n    }\n}",
			cpp : "#include <iostream>\n\nusing namespace std;\n\nint main()\n{\n    cout << \"Hello world!\" << endl;\n    return 0;\n}\n",
			c : "#include <stdio.h>\n#include <stdlib.h>\n\nint main()\n{\n    printf(\"Hello world!\");\n    return 0;\n}\n",
			python : ""
		};
		var key;//generate csrf key here

		$(document)
				.ready(
						function() {
							editor
									.setTheme("ace/theme/"
											+ $(
													"#theme_group input[checked='checked']")
													.val().toString());
							createNewSolution(language);
							$("#language_group input").on(
									'change',
									function() {
										editor.getSession().setMode(
												"ace/mode/" + this.value);
									});
							$("#theme_group input").on('change', function() {
								editor.setTheme("ace/theme/" + this.value);
							});
							$("#btn_full_screen").on(
									'change',
									function() {
										if (this.checked) {
											$("#editor_area").addClass(
													'full_screen');
											$("body").addClass(
													'full_screen_open');
										} else {
											$("#editor_area").removeClass(
													'full_screen');
											$("body").removeClass(
													'full_screen_open');
										}
									});
							$("#btn_terminal").on('change', function() {
								if (this.checked)
									$("#terminal").show();
								else
									$("#terminal").hide();
							});
							$("#btn_undo").on('click', function() {
								editor.undo();
							});
							$("#btn_redo").on(
									'click',
									function() {
										editor.redo();
										editor.gotoLine(editor.selection
												.getCursor().row + 1);
									});
							$("#btn_font_size")
									.on(
											'click',
											function() {
												fontSize += 2;
												if (fontSize > 24)
													fontSize = 12;
												document
														.getElementById('editor').style.fontSize = fontSize
														+ 'px';
											});

							$('#submit_solution_form').submit(function() {
								$('#submit_language').val($('input[name="language"]').val());
								$('#submit_code').val(editor.getValue());
							});
						});
	</script>
</body>
</html>