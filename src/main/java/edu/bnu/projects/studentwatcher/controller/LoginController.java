package edu.bnu.projects.studentwatcher.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.bnu.projects.studentwatcher.bean.AllocateCourse;
import edu.bnu.projects.studentwatcher.bean.Attendence;
import edu.bnu.projects.studentwatcher.bean.ClassHead;
import edu.bnu.projects.studentwatcher.bean.ClassStudent;
import edu.bnu.projects.studentwatcher.bean.Classes;
import edu.bnu.projects.studentwatcher.bean.Course;
import edu.bnu.projects.studentwatcher.bean.ExamResult;
import edu.bnu.projects.studentwatcher.bean.Grade;
import edu.bnu.projects.studentwatcher.bean.Parents;
import edu.bnu.projects.studentwatcher.bean.Review;
import edu.bnu.projects.studentwatcher.bean.User;
import edu.bnu.projects.studentwatcher.service.UserService;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;

	// ======================================================================
	// Login/logout
	// ======================================================================
	@RequestMapping(value = "/doLogin", method = RequestMethod.POST)
	public String doLogin(Model model,
			@RequestParam(value = "username") String username,
			@RequestParam(value = "password") String password,
			HttpSession session) {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		List<User> userList = new ArrayList<>();
		String url = "redirect:/index.jsp";
		// System.out.println(user.getUsername());
		// System.out.println(user.getPassword());
		int status = 1;
		// List<Role> roleList = new ArrayList<>();
		try {
			userList = userService.getAllUserForLogin();
			for (User user2 : userList) {
				// System.out.println(user2.getUsername());
				if (user2.getUsername().equalsIgnoreCase(user.getUsername())
						&& user2.getPassword().equals(user.getPassword())) {
					session.setAttribute("userId", user2.getUserId());
					session.setAttribute("userName", user2.getUsername());
					if (user2.getRole().equalsIgnoreCase("Admin")) {
						session.setAttribute("role", "Admin");
					} else if (user2.getRole().equalsIgnoreCase("Teacher")) {
						System.out.println("Teacher is here");
						session.setAttribute("role", "Teacher");
						List<ClassHead> heads = new ArrayList<>();
						heads = userService.getAllClassHead();
						for (ClassHead classHead : heads) {
							if (classHead.getTeacherId() == (int) session
									.getAttribute("userId")) {
								session.setAttribute("head", "true");
							}
						}
					} else if (user2.getRole().equalsIgnoreCase("Parent")) {
						session.setAttribute("role", "Parent");
					} else if (user2.getRole().equalsIgnoreCase("Student")) {
						session.setAttribute("role", "Student");
					}
					session.setAttribute("dashBoard", "0");
					session.setAttribute("Active", "1");

					System.out.println(session.getAttribute("role"));
					url = "redirect:/index.jsp";
					// url = "Home";
				} else {
					status = 0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("Status", status);
		return url;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String Logout(Model model, HttpSession session) {

		session.invalidate();

		return "redirect:/index.jsp";
	}

	// ======================================================================
	// Dashboard feature
	// ======================================================================
	@RequestMapping(value = "/dashBoard", method = RequestMethod.GET)
	public String dashBoard(Model model, @ModelAttribute User user,
			HttpSession session) {

		session.setAttribute("dashBoard", "1");

		return "Home";
	}

	@RequestMapping(value = "/swatcher", method = RequestMethod.GET)
	public String visitor(Model model, @ModelAttribute User user,
			HttpSession session) {

		session.setAttribute("dashBoard", "0");

		return "redirect:/index.jsp";
	}

	// ======================================================================
	// ManageClass
	// ======================================================================
	@RequestMapping(value = "/ManageClass", method = RequestMethod.GET)
	public String ManageClasses(Model model, HttpSession session, String check) {
		String url = "redirect:/dashBoard.bnu";
		List<Classes> classes = new ArrayList<>();
		List<User> users = new ArrayList<>();
		List<Grade> grade = new ArrayList<>();
		try {

			if (check.equalsIgnoreCase("Add")) {
				// users = userService.getAllPendingUsers();
				grade = userService.getAllGrades();
				model.addAttribute("grade", grade);
				// model.addAttribute("class", new Classes());
				model.addAttribute("checking", "Add");
			}
			if (check.equalsIgnoreCase("allocateHead")) {
				// model.addAttribute("allocateHead", new ClassHead());
				classes = userService.getAllClassesNonAllocated();
				for (Classes class2 : classes) {
					System.out.println("classes sestion" + class2.getSection());
				}
				users = userService.getAllTeachersNonHead();
				for (User user2 : users) {
					System.out.println("teacher name" + user2.getName());
				}
				model.addAttribute("classes", classes);
				model.addAttribute("users", users);
				model.addAttribute("checking", "allocateHead");

			}

			if (check.equalsIgnoreCase("allocateStudent")) {
				// model.addAttribute("allocateStudent", new ClassStudent());
				classes = userService.getAllClasses();
				users = userService.getAllStudentsNonAllocated();
				model.addAttribute("classes", classes);
				model.addAttribute("users", users);
				model.addAttribute("checking", "AllocateStudent");

			}
			if (check.equalsIgnoreCase("viewHead")) {
				List<ClassHead> classHeads = new ArrayList<>();
				classHeads = userService.getAllClassHead();
				classes = userService.getAllClasses();
				users = userService.getAllTeachersHead();
				for (ClassHead classHead : classHeads) {

					for (Classes classes1 : classes) {
						for (User teacher : users) {
							if (classes1.getClassesId() == classHead
									.getClassId()) {
								if (classHead.getTeacherId() == teacher
										.getUserId()) {
									classes1.setName(teacher.getName());
									classes1.setUsername(teacher.getUsername());
								}
							}

						}
					}
				}
				model.addAttribute("classes", classes);
				model.addAttribute("checking", "viewHead");

			}

			if (check.equalsIgnoreCase("viewClassStudent")) {
				List<Classes> classes2 = new ArrayList<>();
				classes2 = userService.getAllClasses();
				model.addAttribute("classes", classes2);
				model.addAttribute("checking", "classStudent");

			}

			if (check.equalsIgnoreCase("view")) {
				classes = userService.getAllClasses();
				model.addAttribute("classes", classes);
				model.addAttribute("checking", "view");

			}
			url = "ManageClass";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return url;
	}

	@RequestMapping(value = "/AddClass", method = RequestMethod.POST)
	public String AddClass(Model model,
			@RequestParam(value = "section") String section,
			@RequestParam(value = "gradeId") int gradeId, HttpSession session) {
		try {
			Classes classes = new Classes();
			classes.setGradeId(gradeId);
			classes.setSection(section);
			userService.addClass(classes);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/ManageClass.bnu?check=Add";
	}

	@RequestMapping(value = "/AllocateHead", method = RequestMethod.POST)
	public String AllocateHead(Model model,
			@RequestParam(value = "classId") int classId,
			@RequestParam(value = "teacherId") int userId, HttpSession session) {
		try {
			ClassHead classes = new ClassHead();
			classes.setClassId(classId);
			classes.setTeacherId(userId);
			userService.allocateHead(classes);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/ManageClass.bnu?check=allocateHead";
	}

	@RequestMapping(value = "/AllocateStudent", method = RequestMethod.POST)
	public String AllocateStudent(Model model,
			@RequestParam(value = "classId") int classId,
			@RequestParam(value = "studentId") int userId, HttpSession session) {
		try {
			ClassStudent classes = new ClassStudent();
			classes.setClassId(classId);
			classes.setStudentId(userId);
			userService.allocateStudent(classes);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/ManageClass.bnu?check=allocateStudent";
	}

	@RequestMapping(value = "/classStudent", method = RequestMethod.POST)
	public String classStudent(Model model,
			@RequestParam(value = "classId") int classId, HttpSession session) {
		try {
			List<ClassStudent> classStudents = new ArrayList<>();
			List<Classes> classes = new ArrayList<>();
			List<User> users = new ArrayList<>();
			classStudents = userService.getAllClassStudents(classId);
			classes = userService.getAllClasses();
			users = userService.getAllStudents();

			for (ClassStudent classStudent : classStudents) {

				for (Classes classes1 : classes) {
					for (User student : users) {
						if (classes1.getClassesId() == classStudent
								.getClassId()) {
							if (classStudent.getStudentId() == student
									.getUserId()) {
								System.out.println("Student name"
										+ student.getName());
								classStudent.setName(student.getName());
								classStudent.setUsername(student.getUsername());
								classStudent.setGradeId(classes1.getGradeId());
								classStudent.setSection(classes1.getSection());
							}
						}

					}
				}
			}
			model.addAttribute("classes", classStudents);
			model.addAttribute("checking", "viewClassStudent");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ManageClass";
	}

	// ======================================================================
	// ManageCourses
	// ======================================================================
	@RequestMapping(value = "/ManageCourse", method = RequestMethod.GET)
	public String ManageCourse(Model model, HttpSession session, String check) {
		String url = "redirect:/dashBoard.bnu";
		List<Course> course = new ArrayList<>();
		List<Grade> grade = new ArrayList<>();
		try {

			if (check.equalsIgnoreCase("Add")) {
				// users = userService.getAllPendingUsers();
				grade = userService.getAllGrades();
				model.addAttribute("grade", grade);
				// model.addAttribute("class", new Classes());
				model.addAttribute("checking", "Add");
			}

			if (check.equalsIgnoreCase("view")) {
				course = userService.getAllCourse();
				model.addAttribute("course", course);
				model.addAttribute("checking", "view");

			}
			url = "ManageCourse";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return url;
	}

	@RequestMapping(value = "/AddCourse", method = RequestMethod.POST)
	public String AddCourse(Model model,
			@RequestParam(value = "name") String name,
			@RequestParam(value = "gradeId") int gradeId,
			@RequestParam(value = "description") String description,
			HttpSession session) {
		try {
			Course course = new Course();
			course.setName(name);
			course.setGradeId(gradeId);
			course.setDescription(description);
			userService.addCourse(course);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/ManageCourse.bnu?check=Add";
	}

	// ======================================================================
	// ManageStudent
	// ======================================================================
	@RequestMapping(value = "/ManageStudent", method = RequestMethod.GET)
	public String ManageStudent(Model model, HttpSession session, String check) {
		String url = "redirect:/dashBoard.bnu";
		List<Course> courses = new ArrayList<>();
		List<User> users = new ArrayList<>();
		List<ClassStudent> students = new ArrayList<>();
		List<Parents> parents = new ArrayList<>();
		List<User> users2 = new ArrayList<>();

		try {

			if (check.equalsIgnoreCase("Add")) {
				model.addAttribute("checking", "Add");
			}
			if (check.equalsIgnoreCase("AddReview")) {
				System.out.println((int) session.getAttribute("userId"));
				students = userService.getAllStudentsForReview((int) session
						.getAttribute("userId"));
				users = userService.getAllStudents();
				List<User> list = new ArrayList<>();
				for (User user : users) {
					for (ClassStudent student : students) {
						System.out.println("user+" + user.getName());
						if (user.getUserId() == student.getStudentId()) {
							list.add(user);
							System.out.println("student+"
									+ student.getStudentId());
						}
					}
				}
				model.addAttribute("user", list);
				model.addAttribute("checking", "AddReview");
			}

			if (check.equalsIgnoreCase("viewReview")) {
				users = userService.getAllStudents();
				users2 = userService.getAllTeachers();
				List<Review> reviews = new ArrayList<>();
				reviews = userService.getAllReviewById((int) session
						.getAttribute("userId"));
				for (User user1 : users) {
					for (Review review : reviews) {
						if (review.getStudentId() == user1.getUserId()) {
							review.setStudentName(user1.getName());
						}
					}
				}
				for (User user1 : users2) {
					for (Review review : reviews) {
						if (review.getTeacherId() == user1.getUserId()) {
							review.setTeacherName(user1.getName());
						}
					}
				}
				model.addAttribute("review", reviews);
				model.addAttribute("checking", "viewReview");

			}
			if (check.equalsIgnoreCase("classAttendence")) {
				// model.addAttribute("allocateHead", new ClassHead());
				List<Classes> classes = new ArrayList<>();
				classes = userService.getAllClasses();
				model.addAttribute("classes", classes);
				model.addAttribute("checking", "classAttendence");

			}
			if (check.equalsIgnoreCase("classResult")) {
				// model.addAttribute("allocateHead", new ClassHead());
				List<Classes> classes = new ArrayList<>();
				classes = userService.getAllClasses();
				model.addAttribute("classes", classes);
				model.addAttribute("checking", "classResult");

			}
			List<User> list = new ArrayList<>();
			if (check.equalsIgnoreCase("viewStudents")) {
				users = userService.getAllStudents();
				parents = userService.getAllRelationShips();
				users2 = userService.getAllParents();
				for (Parents relation : parents) {
					for (User student : users) {
						for (User parent : users2) {
							if (relation.getParentId() == parent.getUserId()) {
								if (relation.getStudentId() == student
										.getUserId()) {
									User data = new User();
									data.setUserId(student.getUserId());
									data.setAddress(student.getAddress());
									data.setContactNo(student.getContactNo());
									data.setUsername(student.getUsername());
									data.setName(student.getName());
									data.setRole(student.getRole());
									data.setPassword(student.getPassword());
									data.setParentsId(parent.getUserId());
									data.setParentsAddress(parent.getAddress());
									data.setParentsContactNo(parent
											.getContactNo());
									data.setParentsUsername(parent
											.getUsername());
									data.setParentsName(parent.getName());
									list.add(data);
								}
							}
						}
					}

				}
				model.addAttribute("users", list);
				model.addAttribute("checking", "viewStudents");

			}
			if (check.equalsIgnoreCase("viewParents")) {
				users = userService.getAllStudents();
				parents = userService.getAllRelationShips();
				users2 = userService.getAllParents();
				for (Parents relation : parents) {
					for (User student : users) {
						for (User parent : users2) {
							if (relation.getParentId() == parent.getUserId()) {
								if (relation.getStudentId() == student
										.getUserId()) {
									User data = new User();
									data.setUserId(parent.getUserId());
									data.setAddress(parent.getAddress());
									data.setContactNo(parent.getContactNo());
									data.setUsername(parent.getUsername());
									data.setName(parent.getName());
									data.setRole(parent.getRole());
									data.setPassword(parent.getPassword());
									data.setParentsId(student.getUserId());
									data.setParentsAddress(student.getAddress());
									data.setParentsContactNo(student
											.getContactNo());
									data.setParentsUsername(student
											.getUsername());
									data.setParentsName(student.getName());
									list.add(data);
								}
							}
						}
					}

				}
				model.addAttribute("users", list);
				model.addAttribute("checking", "viewParents");

			}

			if (check.equalsIgnoreCase("viewAttClass")) {
				List<Classes> classes = new ArrayList<>();
				classes = userService.getAllClasses();
				model.addAttribute("classes", classes);
				model.addAttribute("checking", "viewAttClass");

			}

			if (check.equalsIgnoreCase("viewRe")) {
				List<Classes> classes = new ArrayList<>();
				classes = userService.getAllClasses();
				model.addAttribute("classes", classes);
				model.addAttribute("checking", "viewRe");
			}

			url = "ManageStudent";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return url;
	}

	@RequestMapping(value = "/AddReview", method = RequestMethod.POST)
	public String AddReview(Model model,
			@RequestParam(value = "studentId") int studentId,
			@RequestParam(value = "question1") String question1,
			@RequestParam(value = "question2") String question2,
			@RequestParam(value = "question3") String question3,
			@RequestParam(value = "question4") String question4,
			@RequestParam(value = "question5") String question5,
			@RequestParam(value = "description") String description,
			HttpSession session) {
		try {
			Review review = new Review();
			review.setStudentId(studentId);
			review.setTeacherId((int) session.getAttribute("userId"));
			review.setReviewQuestion1(question1);
			review.setReviewQuestion2(question2);
			review.setReviewQuestion3(question3);
			review.setReviewQuestion4(question4);
			review.setReviewQuestion5(question5);
			review.setReviewDescription(description);
			userService.addReview(review);
			System.out.println("Hello");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/ManageStudent.bnu?check=AddReview";
	}

	@RequestMapping(value = "/AddStudent", method = RequestMethod.POST)
	public String AddStudent(Model model,
			@RequestParam(value = "studentName") String sName,
			@RequestParam(value = "studentUserName") String sUserName,
			@RequestParam(value = "studentPassword") String sPassword,
			@RequestParam(value = "studentContactNo") String sContactNo,
			@RequestParam(value = "studentAddress") String sAddress,
			@RequestParam(value = "studentRole") String sRole,
			@RequestParam(value = "parentName") String pName,
			@RequestParam(value = "parentUserName") String pUserName,
			@RequestParam(value = "parentPassword") String pPassword,
			@RequestParam(value = "parentContactNo") String pContactNo,
			@RequestParam(value = "parentAddress") String pAddress,
			@RequestParam(value = "parentRole") String pRole,
			HttpSession session) {
		try {
			User user1 = new User();
			User user2 = new User();
			long studentId;
			long parentId;
			user1.setName(sName);
			user1.setUsername(sUserName);
			user1.setPassword(sPassword);
			user1.setContactNo(sContactNo);
			user1.setRole(sRole);
			user1.setAddress(sAddress);
			userService.addUser(user1);
			studentId = userService.getMaxId();

			user2.setName(pName);
			user2.setUsername(pUserName);
			user2.setPassword(pPassword);
			user2.setContactNo(pContactNo);
			user2.setRole(pRole);
			user2.setAddress(pAddress);
			userService.addUser(user2);
			parentId = userService.getMaxId();
			Parents parent = new Parents();
			parent.setParentId((int) parentId);
			parent.setStudentId((int) studentId);
			System.out.println("studentID" + studentId);
			System.out.println("parentID" + parentId);

			userService.addParent(parent);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/ManageCourse.bnu?check=Add";
	}

	@RequestMapping(value = "/Attendence", method = RequestMethod.POST)
	public String Attendence(Model model,
			@RequestParam(value = "classId") int classId, HttpSession session) {
		try {
			List<User> users = new ArrayList<>();
			users = userService.getAllusersClassStudents(classId);
			model.addAttribute("users", users);
			model.addAttribute("checking", "Attendence");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ManageStudent";
	}

	@RequestMapping(value = "/AddAttendence", method = RequestMethod.POST)
	public String AddAttendence(Model model,
			@RequestParam(value = "studentId") int studentId,
			@RequestParam(value = "attendenceDate") String date,
			@RequestParam(value = "status") String status, HttpSession session) {
		try {

			Attendence attendence = new Attendence();
			attendence.setStudentId(studentId);
			attendence.setStatus(status);

			attendence.setDate(date);
			System.out.println(date);

			userService.addAttendence(attendence);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/ManageStudent.bnu?check=classAttendence";
	}

	@RequestMapping(value = "/ExamResult", method = RequestMethod.POST)
	public String ExamResult(Model model,
			@RequestParam(value = "classId") int classId, HttpSession session) {
		try {
			ExamResult examResult = new ExamResult();
			List<User> users = new ArrayList<>();
			List<Course> courses = new ArrayList<>();
			users = userService.getAllusersClassStudents(classId);
			Classes classes = new Classes();
			classes = userService.getClassGrade(classId);
			courses = userService.getAllClassCourses(classes.getGradeId());

			model.addAttribute("courses", courses);
			model.addAttribute("users", users);
			model.addAttribute("checking", "ExamResult");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ManageStudent";
	}

	@RequestMapping(value = "/AddResult", method = RequestMethod.POST)
	public String AddResult(Model model,
			@RequestParam(value = "studentId") int studentId,
			@RequestParam(value = "courseId") int courseId,
			@RequestParam(value = "marks") String marks, HttpSession session) {
		try {
			ExamResult examResult = new ExamResult();
			examResult.setStudentId(studentId);
			examResult.setCourseId(courseId);
			examResult.setMarks(Integer.parseInt(marks));
			examResult.setAdminId((Integer) session.getAttribute("userId"));
			System.out.println("AdminID" + session.getAttribute("userId"));
			userService.addResult(examResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/ManageStudent.bnu?check=ExamResult";
	}

	@RequestMapping(value = "/ViewClassAttendence", method = RequestMethod.POST)
	public String viewAtt(Model model,
			@RequestParam(value = "classId") int classId,
			@RequestParam(value = "date") String date, HttpSession session) {
		try {
			List<Attendence> attendences = new ArrayList<>();
			List<User> user = new ArrayList<>();
			System.out.println(date);
			attendences = userService.getAllAttendenceByClassAndDate(classId,
					date);
			user = userService.getAllAllocatedStudents();
			for (User user2 : user) {
				for (Attendence attendence2 : attendences) {
					if (attendence2.getStudentId() == user2.getUserId()) {
						attendence2.setName(user2.getName());
						attendence2.setUsername(user2.getUsername());

					}

				}
			}

			model.addAttribute("attendence", attendences);
			model.addAttribute("checking", "viewAtt");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ManageStudent";
	}

	@RequestMapping(value = "/viewAttendence", method = RequestMethod.POST)
	public String viewAttendence(Model model,
			@RequestParam(value = "studentId") int studentId,
			HttpSession session) {
		try {
			List<Attendence> attendences = new ArrayList<>();
			List<User> user = new ArrayList<>();

			Attendence attendence = new Attendence();
			attendence.setStudentId(studentId);
			user = userService.getAllStudents();
			attendences = userService.getAllAttendenceBySId(attendence);
			User student = new User();
			for (User user2 : user) {
				if (user2.getUserId() == attendence.getStudentId()) {
					student.setUserId(user2.getUserId());
					student.setUsername(user2.getUsername());
					student.setName(user2.getName());
				}
			}
			// for (Attendence att : attendences) {
			// att.setDate(att.getDate());
			// }
			model.addAttribute("student", student);
			model.addAttribute("attendence", attendences);
			model.addAttribute("checking", "viewAttendence");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ManageStudent";
	}

	@RequestMapping(value = "/viewCourseResult", method = RequestMethod.POST)
	public String viewCourseResult(Model model,
			@RequestParam(value = "classId") int classId, HttpSession session) {
		try {
			List<Course> courses = new ArrayList<>();
			Classes classes = new Classes();
			classes = userService.getClassGrade(classId);
			System.out.println("classes.getgradeID()" + classes.getGradeId());
			courses = userService.getAllClassCourses(classes.getGradeId());
			model.addAttribute("classId", classId);
			model.addAttribute("course", courses);
			model.addAttribute("checking", "viewResult");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ManageStudent";
	}

	@RequestMapping(value = "/viewResult", method = RequestMethod.POST)
	public String viewResult(Model model,
			@RequestParam(value = "courseId") int courseId,
			@RequestParam(value = "classId") int classId, HttpSession session) {
		try {
			List<ExamResult> examResults = new ArrayList<>();
			List<User> user = new ArrayList<>();
			List<Course> courses = new ArrayList<>();
			examResults = userService.getAllExamResultsbyClassId(classId,
					courseId);
			user = userService.getAllAllocatedStudents();
			courses = userService.getAllCourse();
			for (User users : user) {
				for (Course course : courses) {
					for (ExamResult results : examResults) {
						if (users.getUserId() == results.getStudentId()) {
							results.setName(users.getName());
							results.setUsername(users.getUsername());
						}
						if (results.getCourseId() == course.getCourseId()) {
							results.setCourseName(course.getName());

						}
					}
				}
			}
			model.addAttribute("result", examResults);
			model.addAttribute("checking", "viewExamResult");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ManageStudent";
	}

	// ======================================================================
	// ManageTeacher
	// ======================================================================
	@RequestMapping(value = "/ManageTeacher", method = RequestMethod.GET)
	public String ManageTeacher(Model model, HttpSession session, String check) {
		String url = "redirect:/dashBoard.bnu";
		List<Course> courses = new ArrayList<>();
		List<User> users = new ArrayList<>();
		try {

			if (check.equalsIgnoreCase("Add")) {

				model.addAttribute("checking", "Add");
			}
			if (check.equalsIgnoreCase("AllocateCourse")) {
				courses = userService.getAllCourseNonAllocated();
				users = userService.getAllTeachers();
				model.addAttribute("courses", courses);
				model.addAttribute("users", users);
				model.addAttribute("checking", "AllocateCourse");

			}
			if (check.equalsIgnoreCase("viewAllocated")) {
				users = userService.getAllTeachersAssignedCourses();
				model.addAttribute("users", users);
				model.addAttribute("checking", "viewAllocated");

			}
			if (check.equalsIgnoreCase("viewTeacher")) {
				users = userService.getAllTeachers();
				model.addAttribute("users", users);
				model.addAttribute("checking", "viewTeacher");

			}
			url = "ManageTeacher";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return url;
	}

	@RequestMapping(value = "/AddTeacher", method = RequestMethod.POST)
	public String AddTeacher(Model model,
			@RequestParam(value = "Name") String tName,
			@RequestParam(value = "UserName") String tUserName,
			@RequestParam(value = "Password") String tPassword,
			@RequestParam(value = "ContactNo") String tContactNo,
			@RequestParam(value = "Address") String tAddress,
			@RequestParam(value = "Role") String tRole, HttpSession session) {
		try {
			User user1 = new User();
			user1.setName(tName);
			user1.setUsername(tUserName);
			user1.setPassword(tPassword);
			user1.setContactNo(tContactNo);
			user1.setRole(tRole);
			user1.setAddress(tAddress);
			userService.addUser(user1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/ManageTeacher.bnu?check=Add";
	}

	@RequestMapping(value = "/viewAllocatedCourses", method = RequestMethod.POST)
	public String viewAllocatedCourses(Model model,
			@RequestParam(value = "teacherId") int teacherId,
			HttpSession session) {
		try {
			User teacher = new User();
			List<User> users = new ArrayList<>();
			List<Course> courses = new ArrayList<>();
			List<AllocateCourse> allocateCourses = new ArrayList<>();
			allocateCourses = userService
					.getallAllocatedCoursesByTeacherId(teacherId);
			courses = userService.getAllCourse();
			users = userService.getAllTeachers();

			for (User user : users) {
				if (user.getUserId() == teacherId) {
					teacher.setUsername(user.getUsername());
					teacher.setName(user.getName());
					teacher.setUserId(user.getUserId());
				}
			}
			for (AllocateCourse allocateCourse : allocateCourses) {
				for (Course course : courses) {
					if (allocateCourse.getCourseId() == course.getCourseId()) {
						allocateCourse.setCourseName(course.getName());
						allocateCourse.setDescription(course.getDescription());
						allocateCourse.setGradeId(course.getGradeId());
					}
				}
			}

			model.addAttribute("teacher", teacher);
			model.addAttribute("allocatedCourses", allocateCourses);
			model.addAttribute("checking", "view");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ManageTeacher";
	}

	@RequestMapping(value = "/AllocateCourse", method = RequestMethod.POST)
	public String AllocateCourse(Model model,
			@RequestParam(value = "courseId") int courseId,
			@RequestParam(value = "teacherId") int userId, HttpSession session) {
		try {
			AllocateCourse allocateCourse = new AllocateCourse();
			allocateCourse.setCourseId(courseId);
			allocateCourse.setTeacherId(userId);
			allocateCourse.setAdminId((Integer) session.getAttribute("userId"));
			userService.allocateCourse(allocateCourse);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/ManageTeacher.bnu?check=AllocateCourse";
	}

	@RequestMapping(value = "/viewReview", method = RequestMethod.GET)
	public String viewReview(Model model,
			@RequestParam(value = "parentId") int parentId,
			@RequestParam(value = "role") String role, HttpSession session) {
		try {
			List<User> users = new ArrayList<>();
			List<User> users2 = new ArrayList<>();
			List<Review> reviews = new ArrayList<>();
			List<Parents> parents = new ArrayList<>();
			users = userService.getAllStudents();
			users2 = userService.getAllTeachers();
			User student = new User();
			parents = userService.getAllRelationShips();
			for (Parents parents2 : parents) {
				if (parentId == parents2.getParentId()) {
					student.setUserId(parents2.getStudentId());
				}
			}
			reviews = userService.getAllReviewByStudentId(student.getUserId());
			for (User user1 : users) {
				for (Review review : reviews) {
					if (review.getStudentId() == user1.getUserId()) {
						review.setStudentName(user1.getName());
					}
				}
			}
			for (User user1 : users2) {
				for (Review review : reviews) {
					if (review.getTeacherId() == user1.getUserId()) {
						review.setTeacherName(user1.getName());
					}
				}
			}
			model.addAttribute("review", reviews);
			model.addAttribute("checking", "viewReview");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ManageStudent";
	}

	@RequestMapping(value = "/viewAttendencePS", method = RequestMethod.GET)
	public String viewAttendenceps(Model model,
			@RequestParam(value = "userId") int userId,
			@RequestParam(value = "role") String role, HttpSession session) {
		try {
			List<User> users = new ArrayList<>();
			List<User> users2 = new ArrayList<>();
			List<Attendence> attendences = new ArrayList<>();
			List<Parents> parents = new ArrayList<>();
			users = userService.getAllStudents();
			User student = new User();
			parents = userService.getAllRelationShips();
			if (role.equalsIgnoreCase("Parent")) {
				for (Parents parents2 : parents) {
					if (userId == parents2.getParentId()) {
						student.setUserId(parents2.getStudentId());
					}
				}
			} else if (role.equalsIgnoreCase("Student")) {
				student.setUserId(userId);
			}

			Attendence attendence = new Attendence();
			attendence.setStudentId(student.getUserId());
			users2 = userService.getAllStudents();
			attendences = userService.getAllAttendenceBySId(attendence);
			student = new User();
			for (User user2 : users2) {
				if (user2.getUserId() == attendence.getStudentId()) {
					student.setUserId(user2.getUserId());
					student.setUsername(user2.getUsername());
					student.setName(user2.getName());
				}
			}
			model.addAttribute("student", student);
			model.addAttribute("attendence", attendences);
			model.addAttribute("checking", "viewAttendence");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ManageStudent";
	}

	@RequestMapping(value = "/viewResultPS", method = RequestMethod.GET)
	public String viewResultps(Model model,
			@RequestParam(value = "userId") int userId,
			@RequestParam(value = "role") String role, HttpSession session) {
		try {
			List<User> users = new ArrayList<>();
			List<User> users2 = new ArrayList<>();
			List<Course> courses = new ArrayList<>();
			List<ExamResult> examResults = new ArrayList<>();
			List<Parents> parents = new ArrayList<>();
			users = userService.getAllStudents();
			User student = new User();
			parents = userService.getAllRelationShips();
			if (role.equalsIgnoreCase("Parent")) {
				for (Parents parents2 : parents) {
					if (userId == parents2.getParentId()) {
						student.setUserId(parents2.getStudentId());
					}
				}
			} else if (role.equalsIgnoreCase("Student")) {
				student.setUserId(userId);
			}
			ExamResult examResult = new ExamResult();
			examResult.setStudentId(student.getUserId());
			examResults = userService.getAllExamResultsBySId(examResult);
			users2 = userService.getAllStudents();
			courses = userService.getAllCourse();
			student = new User();
			for (User user2 : users2) {
				if (user2.getUserId() == examResult.getStudentId()) {
					student.setUserId(user2.getUserId());
					student.setUsername(user2.getUsername());
					student.setName(user2.getName());
				}
			}
			for (Course course : courses) {
				for (ExamResult results : examResults) {
					if (results.getCourseId() == course.getCourseId()) {
						results.setCourseName(course.getName());
					}
				}
			}
			model.addAttribute("student", student);
			model.addAttribute("result", examResults);
			model.addAttribute("checking", "viewExamResultPS");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ManageStudent";
	}
}