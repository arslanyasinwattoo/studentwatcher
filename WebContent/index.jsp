<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
<title>StudentWatcher</title>
<meta name="description"
	content="Sprint is free website template, responsive bootstrap, HTML5 CSS3 layout that can be used for any website.">
<meta name="viewport" content="width=device-width">

<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css-home/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css-home/normalize.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css-home/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css-home/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css-home/templatemo_misc.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css-home/templatemo_style.css">

<script
	src="${pageContext.request.contextPath}/resources/js-home/vendor/modernizr-2.6.2.min.js"></script>

</head>
<body>

	<div id="front">
		<div class="site-header">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-sm-6 col-xs-6">
						<div id="templatemo_logo">
							<h1>
								<a rel="nofollow" href="" title="HTML5 Template">Watcher</a>
							</h1>
						</div>
						<!-- /.logo -->
					</div>
					<!-- /.col-md-4 -->
					<div class="col-md-8 col-sm-6 col-xs-6">
						<a href="#" class="toggle-menu"><i class="fa fa-bars"></i></a>
						<div class="main-menu">
							<ul>
								<c:choose>
									<c:when test="${(Active=='1' && dashBoard=='0')}">
										<li><a href="" onclick="window.location='dashBoard.bnu'">DashBoard</a></li>
									</c:when>
								</c:choose>
								<li><a href="#front">Home</a></li>
								<li><a href="#services">Services</a></li>
								<c:choose>
									<c:when test="${(Active=='1' && dashBoard=='0')}">

										<li><a href="" onclick="window.location='logout.bnu'">Logout</a></li>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${(Active=='0' && dashBoard=='0')}">
										<li><a href="#contact">login</a></li>
									</c:when>

									<c:when test="${(Active==null)}">
										<li><a href="#contact">login</a></li>
									</c:when>
								</c:choose>
							</ul>
						</div>
						<!-- /.main-menu -->
					</div>
					<!-- /.col-md-8 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-md-12">
						<div class="responsive">
							<div class="main-menu">
								<ul>
									<li><a href="#front">Home</a></li>
									<li><a href="#services">Services</a></li>
									<li><a href="#products">Products</a></li>
									<li><a href="#contact">Contact</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.container -->
		</div>
		<!-- /.site-header -->
	</div>
	<!-- /#front -->

	<div class="site-slider">
		<ul class="bxslider">
			<li><img
				src="${pageContext.request.contextPath}/resources/images-home/slider/slide1.jpg"
				alt="slider image 1">
				<div class="container">
					<div class="row">
						<div class="col-md-12 text-right">
							<div class="slider-caption">
								<h2>HTML5 CSS3 Template</h2>
							</div>
						</div>
					</div>
				</div></li>
			<li><img
				src="${pageContext.request.contextPath}/resources/images-home/slider/slide2.jpg"
				alt="slider image 2">
				<div class="container caption-wrapper">
					<div class="slider-caption">
						<h2>Using Bootstrap Framework</h2>
					</div>
				</div></li>
			<li><img
				src="${pageContext.request.contextPath}/resources/images-home/slider/slide3.jpg"
				alt="slider image 3">
				<div class="container">
					<div class="row">
						<div class="col-md-12 text-right">
							<div class="slider-caption">
								<h2>Mobile Ready Website</h2>
							</div>
						</div>
					</div>
				</div></li>
			<li><img
				src="${pageContext.request.contextPath}/resources/images-home/slider/slide4.jpg"
				alt="slider image 4">
				<div class="container">
					<div class="row">
						<div class="col-md-12 text-right">
							<div class="slider-caption">
								<h2>Responsive Layout</h2>
							</div>
						</div>
					</div>
				</div></li>
			<li><img
				src="${pageContext.request.contextPath}/resources/images-home/slider/slide5.jpg"
				alt="slider image 5">
				<div class="container">
					<div class="row">
						<div class="col-md-12 text-right">
							<div class="slider-caption">
								<h2>Download and use it for free</h2>
							</div>
						</div>
					</div>
				</div></li>
		</ul>
		<!-- /.bxslider -->
		<div class="bx-thumbnail-wrapper">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div id="bx-pager">
							<a data-slide-index="0" href=""><img
								src="${pageContext.request.contextPath}/resources/images-home/slider/thumb1.jpg"
								alt="image 1" /></a> <a data-slide-index="1" href=""><img
								src="${pageContext.request.contextPath}/resources/images-home/slider/thumb2.jpg"
								alt="image 2" /></a> <a data-slide-index="2" href=""><img
								src="${pageContext.request.contextPath}/resources/images-home/slider/thumb3.jpg"
								alt="image 3" /></a> <a data-slide-index="3" href=""><img
								src="${pageContext.request.contextPath}/resources/images-home/slider/thumb4.jpg"
								alt="image 4" /></a> <a data-slide-index="4" href=""><img
								src="${pageContext.request.contextPath}/resources/images-home/slider/thumb5.jpg"
								alt="image 5" /></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.site-slider -->

	<div id="services" class="content-section">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<div class="service-item">
						<span class="service-icon first"></span>
						<h3>Easy Customization</h3>
						<p>Cras congue orci at diam condimentum, in dignissim tellus
							elementum. Praesent id mauris eu urna vehicula rutrum sed in
							elit. Sed sed urna porta, viverra lacus in.</p>
					</div>
					<!-- /.service-item -->
				</div>
				<!-- /.col-md-3 -->
				<div class="col-md-3 col-sm-6">
					<div class="service-item">
						<span class="service-icon second"></span>
						<h3>Web Design</h3>
						<p>Nulla in nunc elit. Etiam porttitor nibh et felis molestie
							fermentum. Ut quis diam porttitor, dictum dolor in, volutpat
							nulla. Phasellus egestas eu lacus eu pharetra.</p>
					</div>
					<!-- /.service-item -->
				</div>
				<!-- /.col-md-3 -->
				<div class="col-md-3 col-sm-6">
					<div class="service-item">
						<span class="service-icon third"></span>
						<h3>High Quality</h3>
						<p>
							Sprint is <a rel="nofollow" href="http://www.templatemo.com">free
								responsive template</a> using HTML5 CSS3 based on Bootstrap
							framework. Feel free to download, edit and use it for your
							websites.
						</p>
					</div>
					<!-- /.service-item -->
				</div>
				<!-- /.col-md-3 -->
				<div class="col-md-3 col-sm-6">
					<div class="service-item">
						<span class="service-icon fourth"></span>
						<h3>Professional Design</h3>
						<p>Morbi id nisi enim. Ut congue interdum pharetra facilisi.
							Aenean consectetur pellentesque mauris nec ornare. Nam tortor
							justo, rutrum ut condimentum.</p>
					</div>
					<!-- /.service-item -->
				</div>
				<!-- /.col-md-3 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /#services -->


	<c:choose>
		<c:when test="${(Active==null)}">
			<div id="contact" class="content-section">
				<div class="container">
					<div class="row">
						<div class="col-md-12 text-center">
							<h1 class="section-title">Login</h1>
						</div>
						<!-- /.col-md-12 -->
					</div>
					<!-- /.row -->
					<div class="row">
						<div class="col-md-offset-2 col-md-8 text-center bigger-text">
							<p>If you Do not have a login credentials yet Kindly pay a
								Vist to our Admin or School Head</p>
						</div>
						<!-- 				<div class="col-md-6 col-sm-6"> -->
						<!-- 					<div id="map"></div> -->
						<!-- 				</div> -->
						<!-- /.col-md-6 -->
						<div class="col-md-6 col-sm-6">
							<div class="row contact-form">
								<form action="${pageContext.request.contextPath}/doLogin.bnu"
									method="POST">
									<fieldset class="col-md-6 col-sm-6">
										<input type="text" name="username" id="username"
											placeholder="UserName">
									</fieldset>
									<fieldset class="col-md-6 col-sm-6">
										<input type="password" name="password" id="password"
											placeholder="password">
									</fieldset>
									<fieldset class="col-md-12">
										<input type="submit" name="send" value="Login" id="submit"
											class="button">
									</fieldset>
								</form>
							</div>
							<!-- /.contact-form -->
						</div>
						<!-- /.col-md-6 -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container -->
			</div>
			<!-- /#products -->
		</c:when>
	</c:choose>


	<div class="site-footer">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-sm-6">
					<span>Copyright &copy; 2084 <a href="#">SudentWatcher</a></span>
				</div>
				<!-- /.col-md-6 -->
				<div class="col-md-6 col-sm-6">
					<ul class="social">
						<li><a href="#" class="fa fa-facebook"></a></li>
						<li><a href="#" class="fa fa-twitter"></a></li>
						<li><a href="#" class="fa fa-instagram"></a></li>
						<li><a href="#" class="fa fa-linkedin"></a></li>
						<li><a href="#" class="fa fa-rss"></a></li>
					</ul>
				</div>
				<!-- /.col-md-6 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /.site-footer -->


	<script
		src="${pageContext.request.contextPath}/resources/js-home/vendor/jquery-1.10.1.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="${pageContext.request.contextPath}/resources/js-home/vendor/jquery-1.10.1.min.js"><\/script>')
	</script>
	<script
		src="${pageContext.request.contextPath}/resources/js-home/jquery.easing-1.3.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js-home/bootstrap.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js-home/plugins.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js-home/main.js"></script>
	<!--  Free HTML5 Template by http://www.templatemo.com -->
</body>
</html>