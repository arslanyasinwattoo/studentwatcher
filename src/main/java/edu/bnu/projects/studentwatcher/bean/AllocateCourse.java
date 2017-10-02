package edu.bnu.projects.studentwatcher.bean;

public class AllocateCourse {
	private int allocateCourseId;
	private Course course;
	private int courseId;
	private int teacherId;
	private int adminId;
	private int gradeId;
	private String courseName;
	private String description;

	public int getGradeId() {
		return gradeId;
	}

	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getAllocateCourseId() {
		return allocateCourseId;
	}

	public void setAllocateCourseId(int allocateCourseId) {
		this.allocateCourseId = allocateCourseId;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public int getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}

	public int getAdminId() {
		return adminId;
	}

	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}

}
