package com.modu.vo;

public class AccountbookCategoryVo {
	private int categoryNo;
	private String categoryName;
	private int groupNo;
	private int total;
	
	public AccountbookCategoryVo() {
	}
	 
	public AccountbookCategoryVo(String categoryName, int groupNo, int total) {
		this.categoryName = categoryName;
		this.groupNo = groupNo;
		this.total = total;
	}

	public AccountbookCategoryVo(int categoryNo, String categoryName, int groupNo, int total) {
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.groupNo = groupNo;
		this.total = total;
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

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "AccountbookCategoryVo [categoryNo=" + categoryNo + ", categoryName=" + categoryName + ", groupNo="
				+ groupNo + ", total=" + total + "]";
	}
	
	
	
}
