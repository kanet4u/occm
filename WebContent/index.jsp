<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Online Code Competition Manager</title>
	<base href="${pageContext.request.contextPath}/static/landing/">
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="css/stylish-portfolio.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
</head>

<body>

    <!-- Side Menu -->
    <a id="menu-toggle" href="#" class="btn btn-primary btn-lg toggle"><i class="fa fa-bars"></i></a>
    <div id="sidebar-wrapper">
        <ul class="sidebar-nav">
            <a id="menu-close" href="#" class="btn btn-default btn-lg pull-right toggle"><i class="fa fa-times"></i></a>
            <li class="sidebar-brand"><a href="${pageContext.request.contextPath}">OCCM</a>
            </li>
            <li><a href="#top">Home</a>
            </li>
            <li><a href="#about">About</a>
            </li>
            <li><a href="#services">Services</a>
            </li>
            <li><a href="#portfolio">Portfolio</a>
            </li>
            <li><a href="#contact">Contact</a>
            </li>
        </ul>
    </div>
    <!-- /Side Menu -->

    <!-- Full Page Image Header Area -->
    <div id="top" class="header">
        <div class="vert-text">
            <h1 style="color: greenyellow; background: rgba(0,0,0,0.4);">Online Code Competition Manager</h1>
            <h3 style="color: paleturquoise; background: rgba(0,0,0,0.4);">
                <em>We</em> help you create world class,
                <em>Coding</em> Competitions Online</h3>
            <a href="#about" class="btn btn-default btn-lg">Find Out More</a>
        </div>
    </div>
    <!-- /Full Page Image Header Area -->

    <!-- Intro -->
    <div id="about" class="intro">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3 text-center">
                    <h2>OCCM is the most elegant and user friendly of it's kind</h2>
                    <p class="lead">It will really help all those coding event managers how have to scale up the level of audience to serve. OCCM will help creating efficiently smooth management of coding events. We also provide a lot of customization features to make OCCM as your own. For more details <a href="#portfolio">Features</a>.</p>
                </div>
            </div>
        </div>
    </div>
    <!-- /Intro -->

    <!-- Services -->
    <div id="services" class="services">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4 text-center">
                    <h2>Our Services</h2>
                    <hr>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2 col-md-offset-2 text-center">
                    <div class="service-item">
                        <i class="service-icon fa fa-rocket"></i>
                        <h4>Get, Set, Go...</h4>
                        <p>Create new Competition Events and Configure the Problem Sets. Then let us release it to our audience. Now sit back and enjoy.</p>
                    </div>
                </div>
                <div class="col-md-2 text-center">
                    <div class="service-item">
                        <i class="service-icon fa fa-magnet"></i>
                        <h4>Attract Great Coders</h4>
                        <p>We release your event to our high ranking audience and challenge them to crack. You will get so much great response which you never got anywhere else.</p>
                    </div>
                </div>
                <div class="col-md-2 text-center">
                    <div class="service-item">
                        <i class="service-icon fa fa-shield"></i>
                        <h4>Shield</h4>
                        <p>No need for you to worry about security and protection of your event. We have our tested shield at your service on all times.</p>
                    </div>
                </div>
                <div class="col-md-2 text-center">
                    <div class="service-item">
                        <i class="service-icon fa fa-pencil"></i>
                        <h4>Enjoy Coding</h4>
                        <p>We serve our Coders by providing a standard smooth Coding Competition Environment. This helps them to care less about understanding the system and code more.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /Services -->

    <!-- Callout -->
    <div class="callout">
        <div class="vert-text">
            <h1>Get Larger and Smooter</h1>
        </div>
    </div>
    <!-- /Callout -->

    <!-- Portfolio -->
    <div id="portfolio" class="portfolio">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4 text-center">
                    <h2>Our Work</h2>
                    <hr>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-md-offset-2 text-center">
                    <div class="portfolio-item">
                        <a href="#">
                            <img class="img-portfolio img-responsive" src="static/landing/img/portfolio-1.jpg">
                        </a>
                        <h4>Cityscape</h4>
                    </div>
                </div>
                <div class="col-md-4 text-center">
                    <div class="portfolio-item">
                        <a href="#">
                            <img class="img-portfolio img-responsive" src="static/landing/img/portfolio-2.jpg">
                        </a>
                        <h4>Is That On Fire?</h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-md-offset-2 text-center">
                    <div class="portfolio-item">
                        <a href="#">
                            <img class="img-portfolio img-responsive" src="static/landing/img/portfolio-3.jpg">
                        </a>
                        <h4>Stop Sign</h4>
                    </div>
                </div>
                <div class="col-md-4 text-center">
                    <div class="portfolio-item">
                        <a href="#">
                            <img class="img-portfolio img-responsive" src="static/landing/img/portfolio-4.jpg">
                        </a>
                        <h4>Narrow Focus</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /Portfolio -->

    <!-- Call to Action -->
    <div class="call-to-action">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3 text-center">
                    <h3>Impossible to resist.</h3>
                    <a href="#contact" class="btn btn-lg btn-default">Contact Us</a>
                    <a href="${pageContext.request.contextPath}/home" class="btn btn-lg btn-primary">Try OCCM for Free</a>
                </div>
            </div>
        </div>
    </div>
    <!-- /Call to Action -->

    <!-- Map -->
    <div id="contact" class="map">
        <iframe width="100%" height="100%" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.co.in/maps?f=q&source=s_q&hl=en&geocode=&q=CDAC+ACTS,+Laxmi+Road,+Sanewadi,+Aundh,+Pune,+Maharashtra&aq=0&oq=cdac+acts+pune&sll=18.815426,76.775144&sspn=12.623044,21.643066&vpsrc=0&ie=UTF8&hq=CDAC+ACTS,&hnear=Laxmi+Rd,+Sanewadi,+Aundh,+Pune,+Maharashtra+411007&t=m&z=16&iwloc=A&amp;output=embed"></iframe>
        <br />
        <small>
            <a href="https://maps.google.co.in/maps?f=q&source=s_q&hl=en&geocode=&q=CDAC+ACTS,+Laxmi+Road,+Sanewadi,+Aundh,+Pune,+Maharashtra&aq=0&oq=cdac+acts+pune&sll=18.815426,76.775144&sspn=12.623044,21.643066&vpsrc=0&ie=UTF8&hq=CDAC+ACTS,&hnear=Laxmi+Rd,+Sanewadi,+Aundh,+Pune,+Maharashtra+411007&t=m&z=16&iwloc=A"></a>
        </small>
        </iframe>
    </div>
    <!-- /Map -->

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3 text-center">
                    <ul class="list-inline">
                        <li><i class="fa fa-facebook fa-3x"></i>
                        </li>
                        <li><i class="fa fa-twitter fa-3x"></i>
                        </li>
                        <li><i class="fa fa-dribbble fa-3x"></i>
                        </li>
                    </ul>
                    <div class="top-scroll">
                        <a href="#top"><i class="fa fa-circle-arrow-up scroll fa-4x"></i></a>
                    </div>
                    <hr>
                    <p>Copyright &copy; CDAC, ACTS, Pune 2013</p>
                </div>
            </div>
        </div>
    </footer>
    <!-- /Footer -->

    <!-- JavaScript -->
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>

    <!-- Custom JavaScript for the Side Menu and Smooth Scrolling -->
    <script>
    $("#menu-close").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });
    </script>
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });
    </script>
    <script>
    $(function() {
        $('a[href*=#]:not([href=#])').click(function() {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {

                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                if (target.length) {
                    $('html,body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
        });
    });
    </script>

</body>

</html>
