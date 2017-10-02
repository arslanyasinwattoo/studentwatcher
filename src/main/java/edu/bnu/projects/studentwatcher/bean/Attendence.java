package edu.bnu.projects.studentwatcher.bean;


public class Attendence {
	private int attendenceId;
	private int studentId;
	private String date;
	private String status;
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

	public int getAttendenceId() {
		return attendenceId;
	}

	public void setAttendenceId(int attendenceId) {
		this.attendenceId = attendenceId;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
