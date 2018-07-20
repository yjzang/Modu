package com.modu.vo;

public class AccountbookVo {
	private int accountbookno;
	private String accountbookRegDate;
	private String accountbookUsage;
	private int accountbookSpend;
	private int accountbookIncome;
	private int categoryNo;
	private String categoryName;
	private int groupNo;
	private int tagNo;
	private String tagName;

	public AccountbookVo() {

	}
	
	public AccountbookVo(String accountbookRegDate, String accountbookUsage, int accountbookSpend,
			int accountbookIncome, int categoryNo, String categoryName, int groupNo, int tagNo, String tagName) {
		this.accountbookRegDate = accountbookRegDate;
		this.accountbookUsage = accountbookUsage;
		this.accountbookSpend = accountbookSpend;
		this.accountbookIncome = accountbookIncome;
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.groupNo = groupNo;
		this.tagNo = tagNo;
		this.tagName = tagName;
	}

	public AccountbookVo(int accountbookno, String accountbookRegDate, String accountbookUsage, int accountbookSpend,
			int accountbookIncome, int categoryNo, String categoryName, int groupNo, int tagNo, String tagName) {
		this.accountbookno = accountbookno;
		this.accountbookRegDate = accountbookRegDate;
		this.accountbookUsage = accountbookUsage;
		this.accountbookSpend = accountbookSpend;
		this.accountbookIncome = accountbookIncome;
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.groupNo = groupNo;
		this.tagNo = tagNo;
		this.tagName = tagName;
	}

	public int getAccountbookno() {
		return accountbookno;
	}

	public void setAccountbookno(int accountbookno) {
		this.accountbookno = accountbookno;
	}

	public String getAccountbookRegDate() {
		return accountbookRegDate;
	}

	public void setAccountbookRegDate(String accountbookRegDate) {
		this.accountbookRegDate = accountbookRegDate;
	}

	public String getAccountbookUsage() {
		return accountbookUsage;
	}

	public void setAccountbookUsage(String accountbookUsage) {
		this.accountbookUsage = accountbookUsage;
	}

	public int getAccountbookSpend() {
		return accountbookSpend;
	}

	public void setAccountbookSpend(int accountbookSpend) {
		this.accountbookSpend = accountbookSpend;
	}

	public int getAccountbookIncome() {
		return accountbookIncome;
	}

	public void setAccountbookIncome(int accountbookIncome) {
		this.accountbookIncome = accountbookIncome;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getTagNo() {
		return tagNo;
	}

	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	@Override
	public String toString() {
		return "AccountbookVo [accountbookno=" + accountbookno + ", accountbookRegDate=" + accountbookRegDate
				+ ", accountbookUsage=" + accountbookUsage + ", accountbookSpend=" + accountbookSpend
				+ ", accountbookIncome=" + accountbookIncome + ", categoryNo=" + categoryNo + ", categoryName="
				+ categoryName + ", groupNo=" + groupNo + ", tagNo=" + tagNo + ", tagName=" + tagName + "]";
	}

}
