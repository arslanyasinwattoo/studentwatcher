<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav id="main-navbar" class="hidden-xs hidden-sm">
	<div class="nav hidden-xs">
		<div class="main-reorder pull-right">
			<a href="#"> <i class="fa fa-bars"></i>
			</a>
		</div>


		<div class="logo pull-left">
			<a href="">
				<figure>
					<img
						src="${pageContext.request.contextPath}/resources/img/logo1.png"
						class="light-logo" alt="Berg HTML Theme" />
					<img
						src="${pageContext.request.contextPath}/resources/img/logo2.png"
						class="dark-logo" alt="Berg HTML Theme" />
				</figure>
		</div>
		<div class="main-nav">

			<ul class="pull-right">

				<c:choose>
					<c:when test="${(Active=='1' && dashBoard=='1')}">

						<li><a href="${pageContext.request.contextPath}/swatcher.bnu"
							class="">Swatcher</a></li>

					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${(Active=='1' && dashBoard=='0')}">

						<li><a
							href="${pageContext.request.contextPath}/dashBoard.bnu" class="">DashBoard</a></li>

					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${(dashBoard=='1')}">
						<c:choose>
							<c:when
								test="${(role=='Admin' || role=='Teacher'||role=='Student' || role=='Parent')}">
								<li><a href="dashBoard.bnu" class=" active   ">home</a></li>
								<li></li>
								<c:choose>
									<c:when test="${(role=='Admin')}">
										<li><a href="" class="hover-subnav ">Manage Classes</a>
											<div class="subnav image-subnav">
												<ul class="subnav-wrapper">
													<li><a href="ManageClass.bnu?check=Add">Register
															Class</a></li>
													<li><a href="ManageClass.bnu?check=allocateHead">Allocate
															Class Head</a></li>
													<li><a href="ManageClass.bnu?check=allocateStudent">Allocate
															Students</a></li>
													<li><a href="ManageClass.bnu?check=viewClassStudent">View
															All Class Students</a></li>
													<li><a href="ManageClass.bnu?check=viewHead">View
															All Class Head</a></li>
													<li><a href="ManageClass.bnu?check=view">View All
															Classes</a></li>
												</ul>
											</div></li>

										<li><a href="" class="hover-subnav ">Manage Courses</a>
											<div class="subnav image-subnav">
												<ul class="subnav-wrapper">
													<li><a href="ManageCourse.bnu?check=Add">Register
															Course</a></li>

													<li><a href="ManageCourse.bnu?check=view">View All
															Courses</a></li>
												</ul>
											</div></li>
										<li><a href="" class="hover-subnav ">Manage Students</a>
											<div class="subnav image-subnav">
												<ul class="subnav-wrapper">
													<li><a href="ManageStudent.bnu?check=Add">Register
															Student</a></li>
													<li><a href="ManageStudent.bnu?check=classAttendence">Attendence</a>
													</li>
													<li><a href="ManageStudent.bnu?check=classResult">Exam
															Results</a></li>

													<li><a href="ManageStudent.bnu?check=viewStudents">View
															All Students</a></li>
													<li><a href="ManageStudent.bnu?check=viewParents">View
															All Parents</a></li>
													<li><a href="ManageStudent.bnu?check=viewAttClass">View
															Attendence</a></li>
													<li><a href="ManageStudent.bnu?check=viewRe">View
															Exam Results</a></li>
												</ul>
											</div></li>
										<li><a href="" class="hover-subnav ">Manage Teachers</a>
											<div class="subnav image-subnav">
												<ul class="subnav-wrapper">
													<li><a href="ManageTeacher.bnu?check=Add">Register
															Teacher</a></li>
													<li><a href="ManageTeacher.bnu?check=AllocateCourse">Allocate
															Courses</a></li>

													<li><a href="ManageTeacher.bnu?check=viewAllocated">View
															All Assigned Teachers</a></li>
													<li><a href="ManageTeacher.bnu?check=viewTeacher">View
															All Teachers</a></li>
												</ul>
											</div></li>
									</c:when>
								</c:choose>

							</c:when>
						</c:choose>
						<!-- 						///////////////==============Teacher==================//////////////////////////// -->

						<c:choose>
							<c:when test="${(role=='Teacher')}">
								<li><a href="" class="hover-subnav ">Classes</a>
									<div class="subnav image-subnav">
										<ul class="subnav-wrapper">
											<li><a href="ManageClass.bnu?check=viewHead">View
													All Class Head</a></li>
											<li><a href="ManageClass.bnu?check=viewClassStudent">View
													All Class Students</a></li>
											<li><a href="ManageClass.bnu?check=view">View All
													Classes</a></li>
										</ul>
									</div></li>

								<li><a href="" class="hover-subnav ">Courses</a>
									<div class="subnav image-subnav">
										<ul class="subnav-wrapper">

											<li><a href="ManageCourse.bnu?check=view">View All
													Courses</a></li>
										</ul>
									</div></li>
								<li><a href="" class="hover-subnav ">Students</a>
									<div class="subnav image-subnav">
										<ul class="subnav-wrapper">
											<c:choose>
												<c:when test="${(head=='true')}">
													<li><a href="ManageStudent.bnu?check=AddReview">Add
															Review</a></li>
												</c:when>
											</c:choose>
											<li><a href="ManageStudent.bnu?check=viewReview">View
													All Reviews</a></li>

											<li><a href="ManageStudent.bnu?check=viewStudents">View
													All Students</a></li>
											<li><a href="ManageStudent.bnu?check=viewParents">View
													All Parents</a></li>
											<li><a href="ManageStudent.bnu?check=viewAttClass">View
													Attendence</a></li>
											<li><a href="ManageStudent.bnu?check=viewRe">View
													Exam Results</a></li>
										</ul>
									</div></li>
								<li><a href="" class="hover-subnav ">Teachers</a>
									<div class="subnav image-subnav">
										<ul class="subnav-wrapper">
											<li><a href="ManageTeacher.bnu?check=viewAllocated">View
													All Assigned Teachers</a></li>
											<li><a href="ManageTeacher.bnu?check=viewTeacher">View
													All Teachers</a></li>
										</ul>
									</div></li>
							</c:when>
						</c:choose>
						<!-- ======================================Parents\Student============================= -->
						<c:choose>
							<c:when test="${(role=='Student'|| role=='Parent')}">
								<li><a href="" class="hover-subnav ">Classes</a>
									<div class="subnav image-subnav">
										<ul class="subnav-wrapper">
											<li><a href="ManageClass.bnu?check=viewHead">View
													All Class Head</a></li>
											<li><a href="ManageClass.bnu?check=viewClassStudent">View
													All Class Students</a></li>

											<li><a href="ManageClass.bnu?check=view">View All
													Classes</a></li>
										</ul>
									</div></li>

								<li><a href="" class="hover-subnav ">Courses</a>
									<div class="subnav image-subnav">
										<ul class="subnav-wrapper">
											<li><a href="ManageCourse.bnu?check=view">View All
													Courses</a></li>
										</ul>
									</div></li>
								<li><a href="" class="hover-subnav ">Students</a>
									<div class="subnav image-subnav">
										<ul class="subnav-wrapper">
											<c:choose>
												<c:when test="${(role=='Parent')}">

													<li><a
														href="viewReview.bnu?parentId=${userId}&amp;role=Parent">View
															All Reviews</a></li>
													<li><a
														href="viewAttendencePS.bnu?userId=${userId}&amp;role=Parent">View
															Attendence</a></li>
													<li><a
														href="viewResultPS.bnu?userId=${userId}&amp;role=Parent">View
															Exam Results</a></li>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${(role=='Student')}">
													<li><a
														href="viewAttendencePS.bnu?userId=${userId}&amp;role=Student">View
															Attendence</a></li>
													<li><a
														href="viewResultPS.bnu?userId=${userId}&amp;role=Student">View
															Exam Results</a></li>
												</c:when>
											</c:choose>

										</ul>
									</div></li>
								<li><a href="" class="hover-subnav ">Teachers</a>
									<div class="subnav image-subnav">
										<ul class="subnav-wrapper">
											<li><a href="ManageTeacher.bnu?check=viewAllocated">View
													All Assigned Teachers</a></li>
											<li><a href="ManageTeacher.bnu?check=viewTeacher">View
													All Teachers</a></li>
										</ul>
									</div></li>
							</c:when>
						</c:choose>
					</c:when>
				</c:choose>

				<c:choose>
					<c:when test="${(Active=='1')}">

						<li><a href="${pageContext.request.contextPath}/logout.bnu"
							class="">Logout</a></li>

					</c:when>
				</c:choose>
		</div>
	</div>
</nav>
<div id="mobile-nav" class="visible-xs visible-sm">
	<header>
		<div class="container-fluid">
			<ul class="menu-header">
				<li class="pull-left"><a href="index.html" class="logo">
						<figure>
							<img
								src="${pageContext.request.contextPath}/resources/img/logo2.png"
								alt="Berg HTML Theme" />
						</figure>
				</a></li>
				<li class="reorder pull-right"><a href="#" title=""><i
						class="fa fa-bars"></i></a></li>
			</ul>
		</div>
	</header>
	<div class="" id="flyout-container">
		<ul id="mobile-navbar" class="nav flyout-menu main-nav nav-height">
			<li class="nav-item"><a title="" href="index.html">homE</a></li>
			<li class="nav-item">
				<ul class="subnav">
					<li></li>
					<li></li>
					<li></li>
				</ul>
			</li>
			<li class="nav-item"><a title="" href="restaurant.html">Restaurant</a>
			</li>
			<li class="nav-item"><a title="" href="menu.html" class="">Menu</a>
				<span class="open-children"><i class="fa fa-angle-down"></i></span>
				<ul class="subnav">
					<li><a href="menu.html" title=""><span>Menu 1</span></a></li>
					<li><a href="menu2.html" title=""><span>Menu 2</span></a></li>
				</ul></li>
			<li class="nav-item"><a title="" href="reservation.html">Reservation</a>
			</li>
			<li class="nav-item"><a title="" href="contact.html">Contact</a>
			</li>
			<li class="nav-item"><a title="" href="shop.html">Shop</a></li>
			<li class="nav-item"><a title="" href="gallery.html">Gallery</a>
			</li>
		</ul>
	</div>
</div>

<!-- <div id="wrap"> -->
<!-- 	<form action="" autocomplete="on"> -->
<!-- 		<input id="search" name="search" type="text" -->
<!-- 			placeholder="What're we looking for ?"><input -->
<!-- 			id="search_submit" value="Rechercher" type="submit"> -->
<!-- 	</form> -->
<!-- </div> -->