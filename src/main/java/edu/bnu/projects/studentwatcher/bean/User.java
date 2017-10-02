package edu.bnu.projects.studentwatcher.bean;

public class User {
	private int userId;
	private String username;
	private String password;
	private String name;
	private String role;
	private String contactNo;
	private String address;
	private int parentsId;
	private String parentsUsername;
	private String parentsName;
	private String parentsContactNo;
	private String parentsAddress;

	public int getParentsId() {
		return parentsId;
	}

	public void setParentsId(int parentsId) {
		this.parentsId = parentsId;
	}

	public String getParentsUsername() {
		return parentsUsername;
	}

	public void setParentsUsername(String parentsUsername) {
		this.parentsUsername = parentsUsername;
	}

	public String getParentsName() {
		return parentsName;
	}

	public void setParentsName(String parentsName) {
		this.parentsName = parentsName;
	}

	public String getParentsContactNo() {
		return parentsContactNo;
	}

	public void setParentsContactNo(String parentsContactNo) {
		this.parentsContactNo = parentsContactNo;
	}

	public String getParentsAddress() {
		return parentsAddress;
	}

	public void setParentsAddress(String parentsAddress) {
		this.parentsAddress = parentsAddress;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
