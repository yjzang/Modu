package com.modu.vo;

public class AccountbookTagVo {
	private int accountbooktagno;
	private int accountbookno;
	private int tagno;
	private String tagname;

	public AccountbookTagVo() {

	}

	public AccountbookTagVo(int accountbooktagno, int accountbookno, int tagno, String tagname) {
		super();
		this.accountbooktagno = accountbooktagno;
		this.accountbookno = accountbookno;
		this.tagno = tagno;
		this.tagname = tagname;
	}

	public int getAccountbooktagno() {
		return accountbooktagno;
	}

	public void setAccountbooktagno(int accountbooktagno) {
		this.accountbooktagno = accountbooktagno;
	}

	public int getAccountbookno() {
		return accountbookno;
	}

	public void setAccountbookno(int accountbookno) {
		this.accountbookno = accountbookno;
	}

	public int getTagno() {
		return tagno;
	}

	public void setTagno(int tagno) {
		this.tagno = tagno;
	}

	public String getTagname() {
		return tagname;
	}

	public void setTagname(String tagname) {
		this.tagname = tagname;
	}

	@Override
	public String toString() {
		return "AccountbookTagVo [accountbooktagno=" + accountbooktagno + ", accountbookno=" + accountbookno
				+ ", tagno=" + tagno + ", tagname=" + tagname + "]";
	}

	
}
