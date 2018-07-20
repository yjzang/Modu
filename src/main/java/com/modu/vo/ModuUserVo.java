package com.modu.vo;

public class ModuUserVo {
	private int userNo;
	private String userEmail;
	private String userPassword;
	private String userName;
	private String userBirthday;
	private int groupNo;



	public ModuUserVo() {
		
	}

	public ModuUserVo(int userNo, String userEmail, String userPassword, String userName, String userBirthday, int groupNo) {
		this.userNo = userNo;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userBirthday = userBirthday;
		this.groupNo = groupNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserBirthday() {
		return userBirthday;
	}

	public void setUserBirthday(String userBirthday) {
		this.userBirthday = userBirthday;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	@Override
	public String toString() {
		return "ModuUserVo{" +
				"userNo=" + userNo +
				", userEmail='" + userEmail + '\'' +
				", userPassword='" + userPassword + '\'' +
				", userName='" + userName + '\'' +
				", userBirthday='" + userBirthday + '\'' +
				", groupNo=" + groupNo +
				'}';
	}
}
