<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Online Code Competition</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<!-- Fixed navbar -->
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Online Code Competition</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="hidden-sm active"><a href="#">Home</a></li>
                <li class="hidden-sm"><a href="#about">Guide</a></li>
                <li><a href="page_competitions.html">Competitions</a></li>
                <li><a href="page_judge_status.html">Judge Status</a></li>
                <li ><a href="page_user_ratings.html">Ranklist</a></li>
            </ul>
            <!-- <form role="form" class="navbar-form navbar-right">
                 <div class="form-group">
                     <input type="text" class="form-control" placeholder="Login">
                 </div>
                 <div class="form-group">
                     <input type="password" class="form-control" placeholder="Password">
                 </div>
                 <button class="btn btn-primary" type="submit">Sign in</button>
             </form>-->
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
        <!--/.nav-collapse -->
    </div>
</div>

<div class="container">
    <div id="messages-area">
        <div class="alert alert-success alert-dismissable">
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            You logged in successfully.
        </div>
    </div>
    <!-- Main component for a primary marketing message or call to action -->
    <div class="jumbotron">
        <h1>Welcome to Coding!</h1>

        <p>Here is our Online Code Competition Management System and you can enjoy with it forever, read some
            information, read problem, write solution, test submission, win competition!</p>

        <p>What, when, how? Read below...</p>

        <p>
            <a class="btn btn-lg btn-primary" href="../../components/#navbar" role="button">Take a Tour &raquo;</a>
        </p>
    </div>

    <div class="row">
        <div class="col-lg-4">
            <h2>Updates</h2>

            <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris
                condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis
                euismod. Donec sed odio dui. </p>

            <p><a role="button" href="#" class="btn btn-default">Read Updates &raquo;</a></p>
        </div>
        <div class="col-lg-4">
            <h2>Archives</h2>

            <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris
                condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis
                euismod. Donec sed odio dui. </p>

            <p><a role="button" href="#" class="btn btn-default">View Problems &raquo;</a></p>
        </div>
        <div class="col-lg-4">
            <h2>Top Coders</h2>

            <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula
                porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut
                fermentum massa.</p>

            <p><a role="button" href="#" class="btn btn-default">View Coders &raquo;</a></p>
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
