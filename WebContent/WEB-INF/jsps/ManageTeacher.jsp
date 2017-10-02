
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<t:template>
	<div class="open-daily yo-anim yo-anim-fade"
		data-animation-delay="1000">
		<section id="contact" class="section-scroll main-section">
			<section id="menu" class="section-scroll main-section menu">
				<div class="container-fluid menu-content mixitup">
					<div class="mix starters" data-myorder="2">
						<div class="row">
							<div class="col-xs-12 menu-category sticky-header">
								<h2></h2>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12 menu-category sticky-header">
								<h2></h2>
							</div>
						</div>

						<!-- 	<section id="contact" class="section-scroll main-section"> -->
						<c:choose>
							<c:when test="${(checking=='Add')}">
								<div class="row">
									<div class="col-xs-12 menu-category sticky-header">
										<h2>Teacher</h2>
									</div>
								</div>
								<div class="contact-content container section-padding">
									<div class="row">
										<div class="col-xs-12 col-md-7">

											<form
												action="${pageContext.request.contextPath}/AddTeacher.bnu"
												method="POST">
												<div class="col-md-6">
													<div class="form-group">
														<input type="text" name="Name"
															class="form-control contact-form " placeholder="Name" />
													</div>
													<div class="form-group">
														<input type="text" name="UserName"
															class="form-control contact-form " placeholder="UserName" />
													</div>
													<div class="form-group">
														<input type="text" name="Password"
															class="form-control contact-form " placeholder="Password" />
													</div>
													<div class="form-group">
														<input type="text" name="ContactNo"
															class="form-control contact-form "
															placeholder="ContactNo" />
													</div>
													<div class="form-group">
														<input type="text" name="Address"
															class="form-control contact-form " placeholder="Address" />
													</div>

													<input type="hidden" name="Role" value="Teacher" />
												</div>
										</div>

										<div class="col-md-6">
											<div class="form-group text-right button-submit btn-submit">
												<button type="submit" class="btn btn-dark button-send">ADD
													Teacher</button>
												<div class="message-success alert-success alert hidden">
													<i class="fa fa-check"></i>
												</div>
											</div>
										</div>

										</form>
									</div>
								</div>
					</div>
					</c:when>
					</c:choose>


					<c:choose>
						<c:when test="${(checking=='AllocateCourse')}">
							<div class="row">
								<div class="col-xs-12 menu-category sticky-header">
									<h2>Allocate Course</h2>
								</div>
							</div>
							<div class="contact-content container section-padding">
								<div class="row">
									<div class="col-xs-12 col-md-7">

										<form
											action="${pageContext.request.contextPath}/AllocateCourse.bnu"
											method="POST">
											<div class="col-md-6">
												<div class="form-group">
													<select name="courseId"'>
														<option label="Select Course" />
														<c:forEach items="${courses}" var="list">
															<option value="${list.courseId}"
																label="${list.name} - ${list.gradeId}" />
														</c:forEach>
													</select>
												</div>
												<div class="form-group">
													<select name="teacherId"'>
														<option label="Select Teacher" />
														<c:forEach items="${users}" var="list">
															<option value="${list.userId}" label="${list.name}" />
														</c:forEach>
													</select>
												</div>

											</div>
											<span>Note:if course list is empty then all courses
												has been assigned</span>
											<div class="col-md-6">
												<div class="form-group text-right button-submit btn-submit">
													<button type="submit" class="btn btn-dark button-send">Allocate
														Course</button>
													<div class="message-success alert-success alert hidden">
														<i class="fa fa-check"></i>
													</div>
												</div>
											</div>

										</form>
									</div>
								</div>
							</div>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${(checking=='viewAllocated')}">
							<div class="row">
								<div class="col-xs-12 menu-category sticky-header">
									<h2>Select Teacher For checking Allocated Courses</h2>
								</div>
							</div>
							<div class="contact-content container section-padding">
								<div class="row">
									<div class="col-xs-12 col-md-7">

										<form
											action="${pageContext.request.contextPath}/viewAllocatedCourses.bnu"
											method="POST">
											<div class="col-md-6">
												<div class="form-group">
													<select name="teacherId"'>
														<option label="Select Teacher" />
														<c:forEach items="${users}" var="list">
															<option value="${list.userId}"
																label="${list.name} - ${list.username}" />
														</c:forEach>
													</select>
												</div>
												<div class="col-md-6">
													<div class="form-group text-right button-submit btn-submit">
														<button type="submit" class="btn btn-dark button-send">View</button>
														<div class="message-success alert-success alert hidden">
															<i class="fa fa-check"></i>
														</div>
													</div>
												</div>
										</form>
									</div>
								</div>
							</div>
						</c:when>
					</c:choose>

					<c:choose>
						<c:when test="${(checking=='view')}">
							<div class="span6">
								<div class="box paint color_25">
									<div class="row">
										<div class="col-xs-12 menu-category sticky-header">
											<h2>Allocated Courses For
												---${teacher.name}---${teacher.username}</h2>
										</div>
									</div>
									<!-- End .title -->
									<div class="content">
										<table class="table table-striped">
											<thead>
												<tr>
													<th>ID</th>
													<th>Name</th>
													<th>Grade</th>
													<th>Description</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${allocatedCourses}" var="list">
													<tr>
														<td>${list.allocateCourseId}</td>
														<td>${list.courseName}</td>
														<td>${list.gradeId}</td>
														<td>${list.description}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>

						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${(checking=='viewTeacher')}">
							<div class="span6">
								<div class="box paint color_25">
									<div class="row">
										<div class="col-xs-12 menu-category sticky-header">
											<h2>All Teachers</h2>
										</div>
									</div>
									<!-- End .title -->
									<div class="content">
										<table class="table table-striped">
											<thead>
												<tr>
													<th>ID</th>
													<th>Name</th>
													<th>ContactNo</th>
													<th>Address</th>
													<th>UserName</th>
													<th>Password</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${users}" var="list">
													<tr>
														<td>${list.userId}</td>
														<td>${list.name}</td>
														<td>${list.contactNo}</td>
														<td>${list.address}</td>
														<td>${list.username}</td>
														<td>${list.password}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</c:when>
					</c:choose>


				</div>
			</section>
		</section>

	</div>
</t:template>


