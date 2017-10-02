package edu.bnu.projects.studentwatcher.bean;

public class Classes {
	private int classesId;
	private String section;
	private int gradeId;
	private String name;
	private String username;

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

	public int getClassesId() {
		return classesId;
	}

	public void setClassesId(int classId) {
		this.classesId = classId;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public int getGradeId() {
		return gradeId;
	}

	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}

}
