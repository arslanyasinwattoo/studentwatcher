
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
												action="${pageContext.request.contextPath}/AddStudent.bnu"
												method="POST">
												<div class="col-md-6">

													<h1>Student Info</h1>
													<div class="form-group">
														<input type="text" name="studentName"
															class="form-control contact-form " placeholder="Name" />
													</div>


													<div class="form-group">
														<input type="text" name="studentUserName"
															class="form-control contact-form " placeholder="UserName" />
													</div>
													<div class="form-group">
														<input type="text" name="studentPassword"
															class="form-control contact-form " placeholder="Password" />
													</div>
													<div class="form-group">
														<input type="text" name="studentContactNo"
															class="form-control contact-form "
															placeholder="ContactNo" />
													</div>
													<div class="form-group">
														<input type="text" name="studentAddress"
															class="form-control contact-form " placeholder="Address" />
													</div>

													<input type="hidden" name="studentRole" value="Student" />
												</div>
												<div class="col-md-6">

													<h1>Parent Info</h1>
													<div class="form-group">
														<input type="text" name="parentName"
															class="form-control contact-form " placeholder="Name" />
													</div>


													<div class="form-group">
														<input type="text" name="parentUserName"
															class="form-control contact-form " placeholder="UserName" />
													</div>
													<div class="form-group">
														<input type="text" name="parentPassword"
															class="form-control contact-form " placeholder="Password" />
													</div>
													<div class="form-group">
														<input type="text" name="parentContactNo"
															class="form-control contact-form "
															placeholder="ContactNo" />
													</div>
													<div class="form-group">
														<input type="text" name="parentAddress"
															class="form-control contact-form " placeholder="Address" />
													</div>

													<input type="hidden" name="parentRole" value="Parent" />
												</div>
										</div>
									</div>
								</div>

								<div class="col-md-6">
									<div class="form-group text-right button-submit btn-submit">
										<button type="submit" class="btn btn-dark button-send">ADD
											Record</button>
										<div class="message-success alert-success alert hidden">
											<i class="fa fa-check"></i>
										</div>
									</div>
								</div>

								</form>
					</div>
				</div>

				</c:when>
				</c:choose>

				<c:choose>
					<c:when test="${(checking=='AddReview')}">
						<div class="row">
							<div class="col-xs-12 menu-category sticky-header">
								<h2>Review</h2>
							</div>
						</div>
						<div class="contact-content container section-padding">
							<div class="row">
								<div class="col-xs-12 col-md-7">

									<form action="${pageContext.request.contextPath}/AddReview.bnu"
										method="POST">
										<div class="col-md-6">

											<div class="form-group">
												<select name="studentId">
													<option label="Select Student" />
													<c:forEach items="${user}" var="list">
														<option value="${list.userId}" label="${list.name}" />
													</c:forEach>
												</select> <span>Note:if student list is emptye then All
													students have been given Reviews </span>
											</div>
											<div class="form-group">
												<span>1)Problem Solving Skills</span> <select
													name="question1">
													<option label="Select option" />
													<option value="Developing" label="Developing" />
													<option value="Good" label="Good" />
													<option value="Superior" label="Superior" />

												</select>
											</div>
											<div class="form-group">
												<span>2)Interest in Work</span> <select name="question2">
													<option label="Select option" />
													<option value="Developing" label="Developing" />
													<option value="Good" label="Good" />
													<option value="Superior" label="Superior" />

												</select>
											</div>
											<div class="form-group">
												<span>3)Ethical Behaviour</span> <select name="question3">
													<option label="Select option" />
													<option value="Developing" label="Developing" />
													<option value="Good" label="Good" />
													<option value="Superior" label="Superior" />

												</select>
											</div>
											<div class="form-group">
												<span>4)Written Communications</span> <select
													name="question4">
													<option label="Select option" />
													<option value="Developing" label="Developing" />
													<option value="Good" label="Good" />
													<option value="Superior" label="Superior" />

												</select>
											</div>
											<div class="form-group">
												<span>5)Oral Communications</span> <select name="question5">
													<option label="Select option" />
													<option value="Developing" label="Developing" />
													<option value="Good" label="Good" />
													<option value="Superior" label="Superior" />

												</select>
											</div>
											<div class="form-group">
												<input type="text" name="description"
													class="form-control contact-form " placeholder="Comments" />
											</div>



											<div class="col-md-6">
												<div class="form-group text-right button-submit btn-submit">
													<button type="submit" class="btn btn-dark button-send">ADD
														Review</button>
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
					<c:when test="${(checking=='viewReview')}">
						<div class="span6">
							<div class="box paint color_25">
								<div class="row">
									<div class="col-xs-12 menu-category sticky-header">
										<h2>Reviews</h2>
									</div>
								</div>
								<!-- End .title -->
								<div class="content">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>ID</th>
												<th>Teacher Name</th>
												<th>Student Name</th>
												<th>Problem Solving</th>
												<th>Interest In work</th>
												<th>Ethical Behavior</th>
												<th>Written communication</th>
												<th>Oral communication</th>
												<th>Comments</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${review}" var="list">
												<tr>
													<td>${list.reviewId}</td>
													<td>${list.teacherName}</td>
													<td>${list.studentName}</td>
													<td>${list.reviewQuestion1}</td>
													<td>${list.reviewQuestion2}</td>
													<td>${list.reviewQuestion3}</td>
													<td>${list.reviewQuestion4}</td>
													<td>${list.reviewQuestion5}</td>
													<td>${list.reviewDescription}</td>

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
					<c:when test="${(checking=='classAttendence')}">
						<div class="row">
							<div class="col-xs-12 menu-category sticky-header">
								<h2>Attendence</h2>
							</div>
						</div>
						<div class="contact-content container section-padding">
							<div class="row">
								<div class="col-xs-12 col-md-7">

									<form
										action="${pageContext.request.contextPath}/Attendence.bnu"
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
												<div class="form-group text-right button-submit btn-submit">
													<button type="submit" class="btn btn-dark button-send">Attendence</button>
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
					<c:when test="${(checking=='viewAttClass')}">
						<div class="row">
							<div class="col-xs-12 menu-category sticky-header">
								<h2>Attendence</h2>
							</div>
						</div>
						<div class="contact-content container section-padding">
							<div class="row">
								<div class="col-xs-12 col-md-7">

									<form
										action="${pageContext.request.contextPath}/ViewClassAttendence.bnu"
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
												<input type="date" name="date" min="2000-01-02"><br>
												<br>
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
					<c:when test="${(checking=='Attendence')}">
						<div class="row">
							<div class="col-xs-12 menu-category sticky-header">
								<h2>Attendence</h2>
							</div>
						</div>
						<div class="contact-content container section-padding">
							<div class="row">
								<div class="col-xs-12 col-md-7">

									<form
										action="${pageContext.request.contextPath}/AddAttendence.bnu"
										method="POST">
										<div class="col-md-6">
											<div class="form-group">
												<select name="studentId"'>
													<option label="Select Student" />
													<c:forEach items="${users}" var="list">
														<option value="${list.userId}"
															label="${list.name} - ${list.username}" />
													</c:forEach>
												</select>
											</div>
											<div class="form-group">
												<input type="date" name="attendenceDate" min="2000-01-02"><br>
												<br>
											</div>

										</div>
										<div class="form-group">
											<select name="status"'>
												<option label="Select Status" />
												<option value="Present" label="Present" />
												<option value="Absent" label="Absent" />
											</select>
										</div>

										<div class="col-md-6">
											<div class="form-group text-right button-submit btn-submit">
												<button type="submit" class="btn btn-dark button-send">Save</button>
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
					<c:when test="${(checking=='classResult')}">
						<div class="row">
							<div class="col-xs-12 menu-category sticky-header">
								<h2>Exam Result</h2>
							</div>
						</div>
						<div class="contact-content container section-padding">
							<div class="row">
								<div class="col-xs-12 col-md-7">

									<form
										action="${pageContext.request.contextPath}/ExamResult.bnu"
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
												<div class="form-group text-right button-submit btn-submit">
													<button type="submit" class="btn btn-dark button-send">Exam
														Result</button>
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
					<c:when test="${(checking=='ExamResult')}">

						<div class="row">
							<div class="col-xs-12 menu-category sticky-header">
								<h2>ExamResult</h2>
							</div>
						</div>
						<div class="contact-content container section-padding">
							<div class="row">
								<div class="col-xs-12 col-md-7">

									<form action="${pageContext.request.contextPath}/AddResult.bnu"
										method="POST">
										<div class="col-md-6">
											<div class="form-group">
												<select name="studentId"'>
													<option label="Select Student" />
													<c:forEach items="${users}" var="list">
														<option value="${list.userId}"
															label="${list.name} - ${list.username}" />
													</c:forEach>
												</select>
											</div>
											<div class="form-group">
												<select name="courseId"'>
													<option label="Select Course" />
													<c:forEach items="${courses}" var="list">
														<option value="${list.courseId}"
															label="${list.name}-${list.gradeId}" />
													</c:forEach>
												</select>
											</div>
											<div class="form-group">
												<input type="text" name="marks"
													class="form-control contact-form " placeholder="Marks" />
											</div>
										</div>

										<div class="col-md-6">
											<div class="form-group text-right button-submit btn-submit">
												<button type="submit" class="btn btn-dark button-send">Save
													Result</button>
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
				<%-- 				<c:choose> --%>
				<%-- 					<c:when test="${(checking=='viewAtt')}"> --%>
				<!-- 						<div class="row"> -->
				<!-- 							<div class="col-xs-12 menu-category sticky-header"> -->
				<!-- 								<h2>Select Student For checking Attendence</h2> -->
				<!-- 							</div> -->
				<!-- 						</div> -->
				<!-- 						<div class="contact-content container section-padding"> -->
				<!-- 							<div class="row"> -->
				<!-- 								<div class="col-xs-12 col-md-7"> -->

				<!-- 									<form -->
				<%-- 										action="${pageContext.request.contextPath}/viewAttendence.bnu" --%>
				<!-- 										method="POST"> -->
				<!-- 										<div class="col-md-6"> -->
				<!-- 											<div class="form-group"> -->
				<!-- 												<select name="studentId"'> -->
				<!-- 													<option label="Select Student" /> -->
				<%-- 													<c:forEach items="${users}" var="list"> --%>
				<%-- 														<option value="${list.userId}" --%>
				<%-- 															label="${list.name} - ${list.username}" /> --%>
				<%-- 													</c:forEach> --%>
				<!-- 												</select> -->
				<!-- 											</div> -->
				<!-- 											<div class="col-md-6"> -->
				<!-- 												<div class="form-group text-right button-submit btn-submit"> -->
				<!-- 													<button type="submit" class="btn btn-dark button-send">View</button> -->
				<!-- 													<div class="message-success alert-success alert hidden"> -->
				<!-- 														<i class="fa fa-check"></i> -->
				<!-- 													</div> -->
				<!-- 												</div> -->
				<!-- 											</div> -->
				<!-- 									</form> -->
				<!-- 								</div> -->
				<!-- 							</div> -->
				<!-- 						</div> -->
				<%-- 					</c:when> --%>
				<%-- 				</c:choose> --%>
				<c:choose>
					<c:when test="${(checking=='viewRe')}">
						<div class="row">
							<div class="col-xs-12 menu-category sticky-header">
								<h2>Select Class for Exam Result</h2>
							</div>
						</div>
						<div class="contact-content container section-padding">
							<div class="row">
								<div class="col-xs-12 col-md-7">

									<form
										action="${pageContext.request.contextPath}/viewCourseResult.bnu"
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
												<div class="form-group text-right button-submit btn-submit">
													<button type="submit" class="btn btn-dark button-send">View
														courses</button>
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
					<c:when test="${(checking=='viewStudents')}">
						<div class="span6">
							<div class="box paint color_25">
								<div class="row">
									<div class="col-xs-12 menu-category sticky-header">
										<h2>All Students</h2>
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

												<c:choose>
													<c:when test="${(role=='Admin')}">
														<th>Password</th>
													</c:when>
												</c:choose>
												<th>ParentId</th>
												<th>ParentName</th>
												<th>ParentUserName</th>
												<th>ParentContactNo</th>
												<th>ParentAddress</th>
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

													<c:choose>
														<c:when test="${(role=='Admin')}">
															<td>${list.password}</td>
														</c:when>
													</c:choose>
													<td>${list.parentsId}</td>
													<td>${list.parentsName}</td>
													<td>${list.parentsUsername}</td>
													<td>${list.parentsContactNo}</td>
													<td>${list.parentsAddress}</td>
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
					<c:when test="${(checking=='viewParents')}">
						<div class="span6">
							<div class="box paint color_25">
								<div class="row">
									<div class="col-xs-12 menu-category sticky-header">
										<h2>All Parents</h2>
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

												<c:choose>
													<c:when test="${(role=='Admin')}">
														<th>Password</th>
													</c:when>
												</c:choose>
												<th>StudentsId</th>
												<th>StudentsName</th>
												<th>StudentsUserName</th>
												<th>StudentsContactNo</th>
												<th>StudentsAddress</th>
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
													<c:choose>
														<c:when test="${(role=='Admin')}">

															<td>${list.password}</td>
														</c:when>
													</c:choose>
													<td>${list.parentsId}</td>
													<td>${list.parentsName}</td>
													<td>${list.parentsUsername}</td>
													<td>${list.parentsContactNo}</td>
													<td>${list.parentsAddress}</td>
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
					<c:when test="${(checking=='viewAtt')}">
						<div class="span6">
							<div class="box paint color_25">
								<div class="row">
									<div class="col-xs-12 menu-category sticky-header">
										<h2>Attendence</h2>
									</div>
								</div>
								<!-- End .title -->
								<div class="content">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>ID</th>
												<th>Date(YYYY-MM-DD)</th>
												<th>Name</th>
												<th>Username</th>
												<th>Status</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${attendence}" var="list">
												<tr>
													<td>${list.attendenceId}</td>
													<td>${list.date}</td>
													<td>${list.name}</td>
													<td>${list.username}</td>
													<td>${list.status}</td>
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
					<c:when test="${(checking=='viewAttendence')}">
						<div class="span6">
							<div class="box paint color_25">
								<div class="row">
									<div class="col-xs-12 menu-category sticky-header">
										<h2>Attendence of---${student.name}---${student.username}</h2>
									</div>
								</div>
								<!-- End .title -->
								<div class="content">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>ID</th>
												<th>Date(YYYY-MM-DD)</th>
												<th>Status</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${attendence}" var="list">
												<tr>
													<td>${list.attendenceId}</td>
													<td>${list.date}</td>
													<td>${list.status}</td>
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
					<c:when test="${(checking=='viewResult')}">

						<div class="row">
							<div class="col-xs-12 menu-category sticky-header">
								<h2>ExamResult</h2>
							</div>
						</div>
						<div class="contact-content container section-padding">
							<div class="row">
								<div class="col-xs-12 col-md-7">

									<form
										action="${pageContext.request.contextPath}/viewResult.bnu"
										method="POST">

										<div class="form-group">
											<select name="courseId"'>
												<option label="Select Course" />
												<c:forEach items="${course}" var="list">
													<option value="${list.courseId}"
														label="${list.name}-${list.gradeId}" />
												</c:forEach>
											</select>
										</div>
										<input type="hidden" name="classId" value="${classId}">
										<div class="col-md-6">
											<div class="form-group text-right button-submit btn-submit">
												<button type="submit" class="btn btn-dark button-send">View
													Result</button>
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
					<c:when test="${(checking=='viewExamResult')}">
						<div class="span6">
							<div class="box paint color_25">
								<div class="row">
									<div class="col-xs-12 menu-category sticky-header">
										<h2>Exam Results</h2>
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
												<th>Course</th>
												<th>Marks</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${result}" var="list">
												<tr>
													<td>${list.examResultId}</td>
													<td>${list.name}</td>
													<td>${list.username}</td>
													<td>${list.courseName}</td>
													<td>${list.marks}</td>
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
					<c:when test="${(checking=='viewExamResultPS')}">
						<div class="span6">
							<div class="box paint color_25">
								<div class="row">
									<div class="col-xs-12 menu-category sticky-header">
										<h2>Exam Results of ${student.name}---${student.username}</h2>
									</div>
								</div>
								<!-- End .title -->
								<div class="content">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>ID</th>
												<th>Course</th>
												<th>Marks</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${result}" var="list">
												<tr>
													<td>${list.examResultId}</td>
													<td>${list.courseName}</td>
													<td>${list.marks}</td>
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


