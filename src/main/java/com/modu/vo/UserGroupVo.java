package com.modu.vo;

public class UserGroupVo {
	
	private int user_groupNo;
	private int userNo; //내번호
	private int groupNo; //그룹번호
	private String joinDate; //신청하고 총무수락시 날짜
	private String joinMessage; //신청할때 자기소개
	private String joinState; //신청상태 
	private String userName; //조인

	
	
	public UserGroupVo() {
	}
	public UserGroupVo(int user_groupNo, int userNo, int groupNo, String joinDate, String joinMessage,
			String joinState,String userName) {
		this.user_groupNo = user_groupNo;
		this.userNo = userNo;
		this.groupNo = groupNo;
		this.joinDate = joinDate;
		this.joinMessage = joinMessage;
		this.joinState = joinState;
		this.userName = userName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}


	public int getUser_groupNo() {
		return user_groupNo;
	}
	
	public void setUser_groupNo(int user_groupNo) {
		this.user_groupNo = user_groupNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	public String getJoinMessage() {
		return joinMessage;
	}
	public void setJoinMessage(String joinMessage) {
		this.joinMessage = joinMessage;
	}
	public String getJoinState() {
		return joinState;
	}
	public void setJoinState(String joinState) {
		this.joinState = joinState;
	}
	@Override
	public String toString() {
		return "UserGroupVo [user_groupNo=" + user_groupNo + ", userNo=" + userNo + ", groupNo=" + groupNo
				+ ", joinDate=" + joinDate + ", joinMessage=" + joinMessage + ", joinState=" + joinState + ", userName="
				+ userName + "]";
	}
	
	

}
