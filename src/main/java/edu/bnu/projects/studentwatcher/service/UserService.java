package edu.bnu.projects.studentwatcher.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import edu.bnu.projects.studentwatcher.dao.GenericDao;

@Service
public class UserService {
	@Autowired
	private GenericDao genericDao;

	// login
	@SuppressWarnings("unchecked")
	public List<User> getAllUserForLogin() throws Exception {

		String sql = "Select * From user";
		return (List<User>) genericDao.findAll(sql, User.class);
	}

	// --------------------------------------------------------------
	// ManageClasses
	// --------------------------------------------------------------
	@SuppressWarnings("unchecked")
	public List<Classes> getAllClasses() throws Exception {

		String sql = "Select * From classes";
		return (List<Classes>) genericDao.findAll(sql, Classes.class);
	}

	@SuppressWarnings("unchecked")
	public List<Classes> getAllClassesNonAllocated() throws Exception {

		String sql = "SELECT * FROM classes c WHERE NOT EXISTS(SELECT * FROM class_head h WHERE c.classes_id=h.class_id)";
		return (List<Classes>) genericDao.findAll(sql, Classes.class);
	}

	@SuppressWarnings("unchecked")
	public Classes getClassGrade(int classId) throws Exception {

		String sql = "Select * From classes where classes_id=?";
		return (Classes) genericDao.findById(sql, Classes.class, (long) classId);
	}

	@SuppressWarnings("unchecked")
	public List<Grade> getAllGrades() throws Exception {

		String sql = "Select * From grade";
		return (List<Grade>) genericDao.findAll(sql, Grade.class);
	}

	@SuppressWarnings("unchecked")
	public List<User> getAllTeachers() throws Exception {

		String sql = "Select * From user where role='Teacher'";
		return (List<User>) genericDao.findAll(sql, User.class);
	}

	@SuppressWarnings("unchecked")
	public List<User> getAllTeachersNonHead() throws Exception {

		String sql = "SELECT * FROM USER u WHERE NOT EXISTS(SELECT * FROM class_head h WHERE u.user_id=h.teacher_id) AND u.role='Teacher'";
		return (List<User>) genericDao.findAll(sql, User.class);
	}

	@SuppressWarnings("unchecked")
	public List<User> getAllTeachersHead() throws Exception {

		String sql = "SELECT * FROM USER u WHERE  EXISTS(SELECT * FROM class_head h WHERE u.user_id=h.teacher_id) AND u.role='Teacher'";
		return (List<User>) genericDao.findAll(sql, User.class);
	}

	@SuppressWarnings("unchecked")
	public List<User> getAllStudents() throws Exception {

		String sql = "Select * From user where role='Student'";
		return (List<User>) genericDao.findAll(sql, User.class);
	}

	@SuppressWarnings("unchecked")
	public List<ClassStudent> getAllClassStudents() throws Exception {

		String sql = "Select * From class_student ";
		return (List<ClassStudent>) genericDao.findAll(sql, ClassStudent.class);
	}

	@SuppressWarnings("unchecked")
	public List<User> getAllParents() throws Exception {

		String sql = "Select * From user where role='Parent'";
		return (List<User>) genericDao.findAll(sql, User.class);
	}

	public boolean addClass(Classes classes) throws Exception {
		String sql = "Insert into classes (section,grade_id)values (:section,:gradeId)";
		int n = genericDao.insertOrUpdate(sql, classes);
		return n > 0;
	}

	public boolean allocateHead(ClassHead classes) throws Exception {
		String sql = "Insert into class_head (class_id,teacher_id)values (:classId,:teacherId)";
		int n = genericDao.insertOrUpdate(sql, classes);
		return n > 0;
	}

	public boolean allocateStudent(ClassStudent classes) throws Exception {
		String sql = "Insert into class_student (student_id,class_id)values (:studentId,:classId)";
		int n = genericDao.insertOrUpdate(sql, classes);
		return n > 0;
	}

	// --------------------------------------------------------------
	// ManageCourse
	// --------------------------------------------------------------

	@SuppressWarnings("unchecked")
	public List<Course> getAllCourse() throws Exception {

		String sql = "Select * From course";
		return (List<Course>) genericDao.findAll(sql, Course.class);
	}

	@SuppressWarnings("unchecked")
	public List<Course> getAllClassCourses(int gradeId) throws Exception {

		String sql = "SELECT * FROM course c WHERE EXISTS(SELECT * FROM classes cl WHERE cl.grade_id=c.grade_id )AND c.grade_id=?";
		return (List<Course>) genericDao.findAll(sql, Course.class, gradeId);
	}

	public boolean addCourse(Course course) throws Exception {
		String sql = "Insert into course (name,description,grade_id)values (:name,:description,:gradeId)";
		int n = genericDao.insertOrUpdate(sql, course);
		return n > 0;
	}

	// --------------------------------------------------------------
	// ManageStudent
	// --------------------------------------------------------------
	public boolean addUser(User user) throws Exception {
		String sql = "Insert into user (username,password,name,role,contact_no,address)values (:username,:password,:name,:role,:contactNo,:address)";
		int n = genericDao.insertOrUpdate(sql, user);
		return n > 0;
	}

	@SuppressWarnings("unchecked")
	public Long getMaxId() throws Exception {

		String sql = "SELECT MAX(user_id) FROM user";
		return genericDao.findId(sql);
	}

	public boolean addParent(Parents parent) throws Exception {
		String sql = "Insert into parents (parent_id,student_id)values (:parentId,:studentId)";
		int n = genericDao.insertOrUpdate(sql, parent);
		return n > 0;
	}

	@SuppressWarnings("unchecked")
	public List<User> getAllAllocatedStudents() throws Exception {

		String sql = "SELECT u.user_id,u.name,u.username FROM USER u JOIN class_student s ON s.student_id=u.user_id  WHERE u.role='Student'";
		return (List<User>) genericDao.findAll(sql, User.class);
	}

	public boolean addAttendence(Attendence attendence) throws Exception {
		String sql = "Insert into attendence (student_id,date,status)values (:studentId,:date,:status)";
		int n = genericDao.insertOrUpdate(sql, attendence);
		return n > 0;
	}

	public boolean addResult(ExamResult examResult) throws Exception {
		String sql = "Insert into exam_result (student_id,marks,course_id,admin_id)values (:studentId,:marks,:courseId,:adminId)";
		int n = genericDao.insertOrUpdate(sql, examResult);
		return n > 0;
	}

	@SuppressWarnings("unchecked")
	public List<Parents> getAllRelationShips() throws Exception {

		String sql = "Select * From parents ";
		return (List<Parents>) genericDao.findAll(sql, Parents.class);
	}

	@SuppressWarnings("unchecked")
	public List<ExamResult> getAllExamResultsBySId(ExamResult examResult)
			throws Exception {
		String sql = "Select * From exam_result where student_id=? ";
		return (List<ExamResult>) genericDao.findAll(sql, ExamResult.class,
				examResult.getStudentId());
	}

	@SuppressWarnings("unchecked")
	public List<ExamResult> getAllExamResultsbyClassId(int classId, int courseId)
			throws Exception {
		String sql = "SELECT * FROM exam_result e WHERE EXISTS(SELECT * FROM class_student s WHERE e.student_id=s.student_id AND s.class_id=?)AND e.course_id=?";
		return (List<ExamResult>) genericDao.findAll(sql, ExamResult.class,
				classId, courseId);
	}

	@SuppressWarnings("unchecked")
	public List<Attendence> getAllAttendenceBySId(Attendence attendence)
			throws Exception {
		// TODO Auto-generated method stub
		String sql = "Select * From attendence where student_id=? ORDER BY date";
		return (List<Attendence>) genericDao.findAll(sql, Attendence.class,
				attendence.getStudentId());
	}

	@SuppressWarnings("unchecked")
	public List<Attendence> getAllAttendenceByClassAndDate(int classId,
			String date) throws Exception {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM attendence a WHERE EXISTS(SELECT * FROM class_student s WHERE s.student_id=a.student_id AND s.class_id=?)AND a.date=?";
		return (List<Attendence>) genericDao.findAll(sql, Attendence.class,
				classId, date);
	}

	public List<User> getAllStudentsNonAllocated() throws Exception {
		String sql = "SELECT * FROM USER u WHERE NOT EXISTS( SELECT * FROM class_student s WHERE u.user_id=s.student_id)AND u.role='Student'";
		return (List<User>) genericDao.findAll(sql, User.class);
	}

	// ======================================================================
	// ManageTeacher
	// ======================================================================
	@SuppressWarnings("unchecked")
	public List<Course> getAllCourseNonAllocated() throws Exception {

		String sql = "SELECT * FROM course c WHERE NOT EXISTS(SELECT * FROM allocate_course ac WHERE c.course_id=ac.course_id)";
		return (List<Course>) genericDao.findAll(sql, Course.class);
	}

	public boolean allocateCourse(AllocateCourse course) throws Exception {
		String sql = "Insert into allocate_course (course_id,teacher_id,admin_id)values (:courseId,:teacherId,:adminId)";
		int n = genericDao.insertOrUpdate(sql, course);
		return n > 0;
	}

	@SuppressWarnings("unchecked")
	public List<AllocateCourse> getallAllocatedCoursesByTeacherId(int teacherId)
			throws Exception {
		String sql = "SELECT * FROM allocate_course WHERE teacher_id=? ";
		return (List<AllocateCourse>) genericDao.findAll(sql,
				AllocateCourse.class, teacherId);
	}

	@SuppressWarnings("unchecked")
	public List<User> getAllTeachersAssignedCourses() throws Exception {

		String sql = "SELECT * FROM USER u WHERE  EXISTS(SELECT * FROM allocate_course ac WHERE u.user_id=ac.teacher_id)";
		return (List<User>) genericDao.findAll(sql, User.class);
	}

	@SuppressWarnings("unchecked")
	public List<ClassHead> getAllClassHead() throws Exception {

		String sql = "Select * From class_head ";
		return (List<ClassHead>) genericDao.findAll(sql, ClassHead.class);
	}

	@SuppressWarnings("unchecked")
	public List<ClassStudent> getAllStudentsForReview(int teacherId)
			throws Exception {

		String sql = "SELECT s.class_id,s.class_student_id,s.student_id FROM class_student s JOIN class_head h ON s.class_id=h.class_id WHERE NOT EXISTS (SELECT * FROM review r WHERE s.student_id=r.student_id) AND h.teacher_id=?";
		return (List<ClassStudent>) genericDao.findAll(sql, ClassStudent.class,
				teacherId);
	}

	public boolean addReview(Review review) throws Exception {
		String sql = "Insert into review (student_id,teacher_id,review_question1,review_question2,review_question3,review_question4,review_question5,review_description)values (:studentId,:teacherId,:reviewQuestion1,:reviewQuestion2,:reviewQuestion3,:reviewQuestion4,:reviewQuestion5,:reviewDescription)";
		int n = genericDao.insertOrUpdate(sql, review);
		return n > 0;
	}

	@SuppressWarnings("unchecked")
	public List<Review> getAllReviewById(int teacherId) throws Exception {

		String sql = "select * from review where teacher_id=?";
		return (List<Review>) genericDao.findAll(sql, Review.class, teacherId);
	}

	@SuppressWarnings("unchecked")
	public List<Review> getAllReviewByStudentId(int studentId) throws Exception {

		String sql = "select * from review where student_id=?";
		return (List<Review>) genericDao.findAll(sql, Review.class, studentId);
	}

	@SuppressWarnings("unchecked")
	public List<User> getAllusersClassStudents(int classId) throws Exception {

		String sql = "SELECT * FROM USER u WHERE EXISTS(SELECT * FROM class_student s WHERE s.student_id=u.user_id AND s.class_id=?)";
		return (List<User>) genericDao.findAll(sql, User.class, classId);
	}

	@SuppressWarnings("unchecked")
	public List<ClassStudent> getAllClassStudents(int classId) throws Exception {

		String sql = "	SELECT * FROM class_student WHERE class_id=?";
		return (List<ClassStudent>) genericDao.findAll(sql, ClassStudent.class,
				classId);
	}

}
