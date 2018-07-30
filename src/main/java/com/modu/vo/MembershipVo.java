package com.modu.vo;

public class MembershipVo {
	
	private int membershipfeeNo; //회비번호
	private int user_groupNo; // 유저 그룹번호 -> 이거로 조인
	private int paymentFee; // 납부해야할 금액
	private String paymentDate; // 납부해야할 날짜
	private int paymentamont; // 납부액 
	private String paymentDay; // 납부일 
	
	 
	public MembershipVo() {
	}
	public MembershipVo(int membershipfeeNo, int user_groupNo, int paymentFee, String paymentDate, int paymentamont,
			String paymentDay) {
		this.membershipfeeNo = membershipfeeNo;
		this.user_groupNo = user_groupNo;
		this.paymentFee = paymentFee;
		this.paymentDate = paymentDate;
		this.paymentamont = paymentamont;
		this.paymentDay = paymentDay;
	}
	@Override
	public String toString() {
		return "MembershipVo [membershipfeeNo=" + membershipfeeNo + ", user_groupNo=" + user_groupNo + ", paymentFee="
				+ paymentFee + ", paymentDate=" + paymentDate + ", paymentamont=" + paymentamont + ", paymentDay="
				+ paymentDay + "]";
	}
	public int getMembershipfeeNo() {
		return membershipfeeNo;
	}
	public void setMembershipfeeNo(int membershipfeeNo) {
		this.membershipfeeNo = membershipfeeNo;
	}
	public int getUser_groupNo() {
		return user_groupNo;
	}
	public void setUser_groupNo(int user_groupNo) {
		this.user_groupNo = user_groupNo;
	}
	public int getPaymentFee() {
		return paymentFee;
	}
	public void setPaymentFee(int paymentFee) {
		this.paymentFee = paymentFee;
	}
	public String getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}
	public int getPaymentamont() {
		return paymentamont;
	}
	public void setPaymentamont(int paymentamont) {
		this.paymentamont = paymentamont;
	}
	public String getPaymentDay() {
		return paymentDay;
	}
	public void setPaymentDay(String paymentDay) {
		this.paymentDay = paymentDay;
	}

	
	
	
}
