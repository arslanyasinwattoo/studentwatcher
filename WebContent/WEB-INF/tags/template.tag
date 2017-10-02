<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Watcher</title>
<meta name="description" content="">
<meta name="msapplication-tap-highlight" content="yes" />

<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1, minimum-scale=1.0, maximum-scale=1.0, minimal-ui" />
<link
	href='http://fonts.googleapis.com/css?family=Cabin:400,400italic,500,600,700'
	rel='stylesheet' type='text/css'>
<!-- <link -->
<!-- 	href='http://fonts.googleapis.com/css?familimgy=Open+Sans:300italic,400italic,400,300,600,700,800&amp;subset=latin,latin-ext' -->
<!-- 	rel='stylesheet' type='text/css'> -->
<!-- <link rel="stylesheet" -->
<%-- 	href="${pageContext.request.contextPath}/resources/css/search.css"> --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/logsign.css">
<!--		 Place favicon.ico and apple-touch-icon.png in the root directory -->
<link
	href="${pageContext.request.contextPath}/resources/css/iconFont.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/metro-bootstrap.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/custom.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-2.1.0.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/js/modernizr-2.6.2.min.js"></script>
<script type='text/javascript'
	src='https://maps.googleapis.com/maps/api/js?sensor=false&#038;ver=3.0'></script>

</head>
<body class="intro-fullscreen fixed-footer scroll-down yo-anim-enabled">

	<!--content-->
	<div id="navbar">
		<%@include file="/WEB-INF/mainjsps/navbar.jsp"%>
	</div>

	<!-- 	<div id="header"> -->
	<%@include file="/WEB-INF/mainjsps/header.jsp"%>
	<!-- 	</div> -->

	<!-- 	<div id="body"> -->
	<!-- 	<div class="nav hidden-xs"> -->
	<!-- 	<div class="open-daily yo-anim yo-anim-fade" -->
	<!-- 		data-animation-delay="1000"> -->
	<!-- 		<section id="contact" class="section-scroll main-section"> -->
	
	<jsp:doBody />
	<!-- 		</section> -->
	<!-- 	</div> -->

	<!-- 	</div> -->

	<!-- 	<div id="footer"> -->
	<%@include file="/WEB-INF/mainjsps/footer.jsp"%>
	<!-- 	</div> -->
	<div class="gallery-wrapper"></div>

	<div id="preloader">
		<div id="status">
			<div class="loading-wrapper">
				<img
					src="${pageContext.request.contextPath}/resources/img/logo2.png"
					alt="Loading" />
			</div>
		</div>
		<div id="status-loaded"></div>
	</div>

	<script
		src="${pageContext.request.contextPath}/resources/js/browser.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.ba-throttle-debounce.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.smooth-scroll.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/matchmedia.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/enquire.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.velocity.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/waypoints.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.mb.YTPlayer.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.parallaxify.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.imagesloaded.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.unveil.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.superslides.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.fullPage.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.mixitup.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>