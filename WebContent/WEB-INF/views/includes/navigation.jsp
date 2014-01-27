<div class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Online Code Competition</a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class=" hidden-sm active"><a href="#">Home</a></li>
				<li class=" hidden-sm"><a href="#about">Guide</a></li>
				<li><a href="page_competitions.html">Competitions</a></li>
				<li><a href="page_judge_status.html">Judge Status</a></li>
			</ul>
			
			//not logged
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#" data-toggle="modal"
					data-target="#modal_sign_in"> <i class="fa fa-sign-in"></i>
						Sign In
				</a></li>
				<li><a href="${pageContext.request.contextPath}/home/register"><i class="fa fa-user"></i>
						Register</a></li>
			</ul>
			
			//logged
			<ul class="nav navbar-nav navbar-right">
                <!--<li><a href="#">Link</a></li>-->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> My Account <b
                            class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#"><i class="fa fa-envelope-o"></i> Inbox</a></li>
                        <li><a href="#"><i class="fa fa-code"></i> Submissions</a></li>
                        <li class="divider"></li>
                        <li><a href="#"><i class="fa fa-gear"></i> Settings</a></li>
                        <li><a href="#"><i class="fa fa-power-off"></i> Logout</a></li>
                    </ul>
                </li>
            </ul>
            
		</div>
	</div>
</div>