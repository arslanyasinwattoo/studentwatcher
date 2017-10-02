<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:template>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/search.css">

	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script>
		// 		$(function() {

		// 			var availableTags = [ "ActionScript", "AppleScript", "Asp",
		// 					"BASIC", "C", "C++", "Clojure", "COBOL", "ColdFusion",
		// 					"Erlang", "Fortran", "Groovy", "Haskell", "Java",
		// 					"JavaScript", "Lisp", "Perl", "PHP", "Python", "Ruby",
		// 					"Scala", "Scheme" ];

		// 			//	var availableTags = [ foreach'name', ];
		// 			// 			$("#tags").autocomplete({
		// 			// 				source : availableTags
		// 			// 			});
		// 			$("#tags").autocomplete({
		// 				source : availableTags
		// 			});
		// 		});

		function getData(f) {
			var url = "${pageContext.request.contextPath}/AjaxData.bnu?name="
					+ '-' + f + '-';
			$.get(url, function(data) {

				// 					var availableTags = [  
				// 					                 for ( var d in obj) {
				// 					                	 if (obj.hasOwnProperty(prop)) {
				// 					                         alert(d + " = " + obj[d]);
				// 					                	 }
				// 									}      
				// 					                       "" ];

				//	var availableTags = [ foreach'name', ];

				document.getElementById("name").innerHTML = data;
				var d = $("#mtr").val();
				//alert(d);
				$("#search").autocomplete({
					source : d.split(","),
					select : function(a, b) {
						$(this).val(b.item.value);
						// 						alert(b.item.value);
						$(".searchform1").submit();
					}
				});
			});
		}
	</script>
	<header id="home2" class="main-section home hidden-xs">
		<div class="home-fullscreen">
			<div class="container-fluid">
				<div class="basic-info">
					<div class="clearfix">
						<!-- 						<div class="ui-widget"> -->
						<!-- 							<label for="tags">Tags: </label> <input id="tags"> -->
						<!-- 						</div> -->
						<div id="wrap">
							<form action="Search.bnu" autocomplete="on">
								<input id="search" name="name" type="text"
									onkeypress="getData(this.value)"
									placeholder="What're we looking for ?"><input
									id="search_submit" value="Rechercher" type="submit">
							</form>
						</div>
					</div>
					<span id="name"> </span>
					<div class="open-daily yo-anim yo-anim-fade"
						data-animation-delay="200">
						<span class="day"><a href="#">Usman Abdul Ghafoor</a></span>
					</div>
					<div class="open-daily yo-anim yo-anim-fade"
						data-animation-delay="400">
						<span class="day"><a href="#">Usama Ahmad</a></span>
					</div>
					<div class="simple-contact yo-anim yo-anim-fade"
						data-animation-delay="600">
						<span class="address"><a href="#">Feroz Farooq</a></span>
					</div>
					<div class="simple-contact yo-anim yo-anim-fade"
						data-animation-delay="800">
						<span class="mobile"><a href="#">Salman Tariq</a></span> <span
							class="email"><a href="#">FYP 2</a></span>
					</div>
					<ul class="social-icon yo-anim yo-anim-fade"
						data-animation-delay="1000">
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
						<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
						<li><a href="#"><i class="fa fa-youtube"></i></a></li>
					</ul>
					<nav class="custom-navigation hidden-xs">
						<a href="#" id="arrow-left" class="prev"><i
							class="arrow-left-open"></i></a> <a href="#" id="arrow-right"
							class="next"><i class="arrow-right-open"></i></a>
					</nav>
				</div>
			</div>
			<section class="item hidden-xs">

				<div class="slider-wrapper">
					<div class="home-parallax opacity-120">

						<div id="slides">
							<ul class="slides-container">
								<li><img
									src="${pageContext.request.contextPath}/resources/img/abc.jpg"
									data-src="" alt=""></li>
								<li><img
									src="${pageContext.request.contextPath}/resources/img/3.jpg"
									data-src="" alt=""></li>
								<li><img
									src="${pageContext.request.contextPath}/resources/img/7.jpg"
									data-src="" alt=""></li>
								<li><img
									src="${pageContext.request.contextPath}/resources/img/10.jpg"
									data-src="" alt=""></li>
							</ul>
						</div>
					</div>
				</div>




			</section>
		</div>
	</header>
</t:template>
