package edu.bnu.projects.studentwatcher.bean;

public class Review {
	private int reviewId;
	private int studentId;
	private int teacherId;
	private String reviewQuestion1;
	private String reviewQuestion2;
	private String reviewQuestion3;
	private String reviewQuestion4;
	private String reviewQuestion5;
	private String reviewDescription;
	private String studentName;
	private String teacherName;

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public int getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}

	public String getReviewQuestion1() {
		return reviewQuestion1;
	}

	public void setReviewQuestion1(String reviewQuestion1) {
		this.reviewQuestion1 = reviewQuestion1;
	}

	public String getReviewQuestion2() {
		return reviewQuestion2;
	}

	public void setReviewQuestion2(String reviewQuestion2) {
		this.reviewQuestion2 = reviewQuestion2;
	}

	public String getReviewQuestion3() {
		return reviewQuestion3;
	}

	public void setReviewQuestion3(String reviewQuestion3) {
		this.reviewQuestion3 = reviewQuestion3;
	}

	public String getReviewQuestion4() {
		return reviewQuestion4;
	}

	public void setReviewQuestion4(String reviewQuestion4) {
		this.reviewQuestion4 = reviewQuestion4;
	}

	public String getReviewQuestion5() {
		return reviewQuestion5;
	}

	public void setReviewQuestion5(String reviewQuestion5) {
		this.reviewQuestion5 = reviewQuestion5;
	}

	public String getReviewDescription() {
		return reviewDescription;
	}

	public void setReviewDescription(String reviewDescription) {
		this.reviewDescription = reviewDescription;
	}

}
