package com.modu.vo;

public class ModuGroupVo {
	private int groupNo;
	private String groupName;
	private String groupExplain;
	private String groupImg;
	private String groupType;
	private String memberFeeAmount;
	private String memberFeeDate;
	private int manager;
	private String groupBank;
	private String groupAccount;
	private String groupAccountHolder;

	
	public ModuGroupVo() {
	}

	public ModuGroupVo(String groupName, String groupExplain, String groupImg, String groupType,
			String memberFeeAmount, String memberFeeDate, int manager, String groupBank, String groupAccount,
			String groupAccountHolder) {
		this.groupName = groupName;
		this.groupExplain = groupExplain;
		this.groupImg = groupImg;
		this.groupType = groupType;
		this.memberFeeAmount = memberFeeAmount;
		this.memberFeeDate = memberFeeDate;
		this.manager = manager;
		this.groupBank = groupBank;
		this.groupAccount = groupAccount;
		this.groupAccountHolder = groupAccountHolder;
	}

	public ModuGroupVo(int groupNo, String groupName, String groupExplain, String groupImg, String groupType,
			String memberFeeAmount, String memberFeeDate, int manager, String groupBank, String groupAccount,
			String groupAccountHolder) {
		this.groupNo = groupNo;
		this.groupName = groupName;
		this.groupExplain = groupExplain;
		this.groupImg = groupImg;
		this.groupType = groupType;
		this.memberFeeAmount = memberFeeAmount;
		this.memberFeeDate = memberFeeDate;
		this.manager = manager;
		this.groupBank = groupBank;
		this.groupAccount = groupAccount;
		this.groupAccountHolder = groupAccountHolder;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getGroupExplain() {
		return groupExplain;
	}

	public void setGroupExplain(String groupExplain) {
		this.groupExplain = groupExplain;
	}

	public String getGroupImg() {
		return groupImg;
	}

	public void setGroupImg(String groupImg) {
		this.groupImg = groupImg;
	}

	public String getGroupType() {
		return groupType;
	}

	public void setGroupType(String groupType) {
		this.groupType = groupType;
	}

	public String getMemberFeeAmount() {
		return memberFeeAmount;
	}

	public void setMemberFeeAmount(String memberFeeAmount) {
		this.memberFeeAmount = memberFeeAmount;
	}

	public String getMemberFeeDate() {
		return memberFeeDate;
	}

	public void setMemberFeeDate(String memberFeeDate) {
		this.memberFeeDate = memberFeeDate;
	}

	public int getManager() {
		return manager;
	}

	public void setManager(int manager) {
		this.manager = manager;
	}

	public String getGroupBank() {
		return groupBank;
	}

	public void setGroupBank(String groupBank) {
		this.groupBank = groupBank;
	}

	public String getGroupAccount() {
		return groupAccount;
	}

	public void setGroupAccount(String groupAccount) {
		this.groupAccount = groupAccount;
	}

	public String getGroupAccountHolder() {
		return groupAccountHolder;
	}

	public void setGroupAccountHolder(String groupAccountHolder) {
		this.groupAccountHolder = groupAccountHolder;
	}

	@Override
	public String toString() {
		return "ModuGroupVo [groupNo=" + groupNo + ", groupName=" + groupName + ", groupExplain=" + groupExplain
				+ ", groupImg=" + groupImg + ", groupType=" + groupType + ", memberFeeAmount=" + memberFeeAmount
				+ ", memberFeeDate=" + memberFeeDate + ", manager=" + manager + ", groupBank=" + groupBank
				+ ", groupAccount=" + groupAccount + ", groupAccountHolder=" + groupAccountHolder + "]";
	}

	
	
}
