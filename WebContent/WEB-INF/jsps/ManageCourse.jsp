
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
										<h2>Class</h2>
									</div>
								</div>
								<div class="contact-content container section-padding">
									<div class="row">
										<div class="col-xs-12 col-md-7">

											<form
												action="${pageContext.request.contextPath}/AddCourse.bnu"
												method="POST">
												<div class="col-md-6">
													<div class="form-group">
														<input type="text" name="name"
															class="form-control contact-form " placeholder="Name" />
													</div>

													<div class="form-group">
														<select name="gradeId"'>
															<option label="Select Grade" />
															<c:forEach items="${grade}" var="list">
																<option value="${list.gradeId}" label="${list.gradeNo}" />
															</c:forEach>
														</select>
													</div>
													<div class="form-group">
														<input type="text" name="description"
															class="form-control contact-form "
															placeholder="Description" />
													</div>


												</div>

												<div class="col-md-6">
													<div class="form-group text-right button-submit btn-submit">
														<button type="submit" class="btn btn-dark button-send">ADD
															Class</button>
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
												<h2>All Courses</h2>
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
													<c:forEach items="${course}" var="course">
														<tr>
															<td>${course.courseId}</td>
															<td>${course.name}</td>
															<td>${course.gradeId}</td>
															<td>${course.description}</td>
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


