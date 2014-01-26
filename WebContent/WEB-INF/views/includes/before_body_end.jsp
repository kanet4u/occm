
<div class="modal fade" id="modal_sign_in" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Sign In</h4>
			</div>
			<div class="modal-body">

				<div class="alert alert-danger" id="message_login" style="display:none"></div>


				<form class="form-data" role="form" id="login_form"
					action="${pageContext.request.contextPath}/REST/account/login">
					<div class="form-group input-group">
						<span class="input-group-addon"><i class="fa fa-user fa-fw"></i></span>
						<input type="email" class="form-control" id="inputEmail3"
							placeholder="Username" name="username">
					</div>
					<div class="form-group input-group">
						<span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
						<input type="password" class="form-control" id="inputPassword3"
							placeholder="Password" name="password">
					</div>
					<div class="form-group">
						<button id="btn_login" class="btn btn-primary" name="submit"
							style="margin-right: 10px" type="submit" caption="Sign In">Sign
							In</button>
						<a href="">Forgot Password <i class="fa fa-question-circle"></i></a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- /.modal -->

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<script src="js/scripts.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>