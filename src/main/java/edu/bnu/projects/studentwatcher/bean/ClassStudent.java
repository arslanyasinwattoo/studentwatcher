package edu.bnu.projects.studentwatcher.bean;

public class ClassStudent {
	private int classStudentId;
	private int studentId;
	private int classId;
	private String name;
	private String username;
	private String section;
	private int gradeId;

	public int getGradeId() {
		return gradeId;
	}

	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public int getClassStudentId() {
		return classStudentId;
	}

	public void setClassStudentId(int classStudentId) {
		this.classStudentId = classStudentId;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}

}
