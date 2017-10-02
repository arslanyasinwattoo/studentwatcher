
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
												action="${pageContext.request.contextPath}/AddClass.bnu"
												method="POST">
												<div class="col-md-6">
													<div class="form-group">
														<select name="gradeId"'>
															<option label="Select Grade" />
															<c:forEach items="${grade}" var="list">
																<option value="${list.gradeId}" label="${list.gradeNo}" />
															</c:forEach>
														</select>
													</div>

													<div class="form-group">
														<input type="text" name="section"
															class="form-control contact-form " placeholder="Section" />
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
							<c:when test="${(checking=='allocateHead')}">
								<div class="row">
									<div class="col-xs-12 menu-category sticky-header">
										<h2>Allocate Head</h2>
									</div>
								</div>
								<div class="contact-content container section-padding">
									<div class="row">
										<div class="col-xs-12 col-md-7">

											<form
												action="${pageContext.request.contextPath}/AllocateHead.bnu"
												method="POST">
												<div class="col-md-6">
													<div class="form-group">
														<select name="classId"'>
															<option label="Select Class" />
															<c:forEach items="${classes}" var="list">
																<option value="${list.classesId}"
																	label="${list.gradeId} - ${list.section}" />
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
												<span>Note: if class list or Teacher list is empty
													then all classes\Teachers has been assigned class\heads</span>

												<div class="col-md-6">
													<div class="form-group text-right button-submit btn-submit">
														<button type="submit" class="btn btn-dark button-send">Allocate
															Head</button>
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
							<c:when test="${(checking=='AllocateStudent')}">

								<div class="row">
									<div class="col-xs-12 menu-category sticky-header">
										<h2>Allocate Student</h2>
									</div>
								</div>
								<div class="contact-content container section-padding">
									<div class="row">
										<div class="col-xs-12 col-md-7">

											<form
												action="${pageContext.request.contextPath}/AllocateStudent.bnu"
												method="POST">
												<div class="col-md-6">
													<div class="form-group">
														<select name="classId"'>
															<option label="Select Class" />
															<c:forEach items="${classes}" var="list">
																<option value="${list.classesId}"
																	label="${list.gradeId} - ${list.section}" />
															</c:forEach>
														</select>
													</div>
													<div class="form-group">
														<select name="studentId"'>
															<option label="Select Student" />
															<c:forEach items="${users}" var="list">
																<option value="${list.userId}" label="${list.name}" />
															</c:forEach>
														</select>
													</div>
													<span>Note: if no Students are being shown then All
														the students have been allocated to classes </span>
												</div>

												<div class="col-md-6">
													<div class="form-group text-right button-submit btn-submit">
														<button type="submit" class="btn btn-dark button-send">Allocate
															Student</button>
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
							<c:when test="${(checking=='classStudent')}">

								<div class="row">
									<div class="col-xs-12 menu-category sticky-header">
										<h2>Classes</h2>
									</div>
								</div>
								<div class="contact-content container section-padding">
									<div class="row">
										<div class="col-xs-12 col-md-7">

											<form
												action="${pageContext.request.contextPath}/classStudent.bnu"
												method="POST">
												<div class="col-md-6">
													<div class="form-group">
														<select name="classId"'>
															<option label="Select Class" />
															<c:forEach items="${classes}" var="list">
																<option value="${list.classesId}"
																	label="${list.gradeId} - ${list.section}" />
															</c:forEach>
														</select>
													</div>
													<div class="col-md-6">
														<div
															class="form-group text-right button-submit btn-submit">
															<button type="submit" class="btn btn-dark button-send">View
																Students</button>
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
												<h2>All Classses</h2>
											</div>
										</div>
										<!-- End .title -->
										<div class="content">
											<table class="table table-striped">
												<thead>
													<tr>
														<th>ID</th>
														<th>Grade</th>
														<th>Section</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${classes}" var="classes">
														<tr>
															<td>${classes.classesId}</td>
															<td>${classes.gradeId}</td>
															<td>${classes.section}</td>
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
							<c:when test="${(checking=='viewHead')}">
								<div class="span6">
									<div class="box paint color_25">
										<div class="row">
											<div class="col-xs-12 menu-category sticky-header">
												<h2>Class Heads</h2>
											</div>
										</div>
										<!-- End .title -->
										<div class="content">
											<table class="table table-striped">
												<thead>
													<tr>
														<th>ID</th>
														<th>Name</th>
														<th>UserName</th>
														<th>Grade</th>
														<th>Section</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${classes}" var="classes">
														<tr>
															<td>${classes.classesId}</td>
															<td>${classes.name}</td>
															<td>${classes.username}</td>
															<td>${classes.gradeId}</td>
															<td>${classes.section}</td>
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
							<c:when test="${(checking=='viewClassStudent')}">
								<div class="span6">
									<div class="box paint color_25">
										<div class="row">
											<div class="col-xs-12 menu-category sticky-header">
												<h2>Class Students</h2>
											</div>
										</div>
										<!-- End .title -->
										<div class="content">
											<table class="table table-striped">
												<thead>
													<tr>
														<th>ID</th>
														<th>Name</th>
														<th>UserName</th>
														<th>Grade</th>
														<th>Section</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${classes}" var="classes">
														<tr>
															<td>${classes.classStudentId}</td>
															<td>${classes.name}</td>
															<td>${classes.username}</td>
															<td>${classes.gradeId}</td>
															<td>${classes.section}</td>
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


