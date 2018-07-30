package com.modu.vo;

import java.util.List;

public class BoardVo {

	String boardNo;
	String boardTitle;
	String boardContent;
	String boardRegDate;
	String userNo;
	String tagNo;
	int groupNo;
	String likeState;
	String commentContent;
	String commentNo;
	String commentRegDate;
	String userName; 
	String tagName;
	int likeCount;
	int cmtCount;
	List<FileVo> imgList ;

	String accountbookNo;
	String accountbookUsage;
	String accountbookRegDate;
	String startDate;
	String endDate;
	String accountbookSpend;
	String accountbookPlace;
	String accountbookPersonnel;
	List<BoardVo> accountList ;
	
	
	
	
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public List<BoardVo> getAccountList() {
		return accountList;
	}
	public void setAccountList(List<BoardVo> accountList) {
		this.accountList = accountList;
	}
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getTagNo() {
		return tagNo;
	}
	public void setTagNo(String tagNo) {
		this.tagNo = tagNo;
	}

	
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	
	public List<FileVo> getImgList() {
		return imgList;
	}
	public void setImgList(List<FileVo> imgList) {
		this.imgList = imgList;
	}
	
	public String getBoardRegDate() {
		return boardRegDate;
	}
	public void setBoardRegDate(String boardRegDate) {
		this.boardRegDate = boardRegDate;
	}
	
	public String getLikeState() {
		return likeState;
	}
	public void setLikeState(String likeState) {
		this.likeState = likeState;
	}
	
	
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	
	public String getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(String commentNo) {
		this.commentNo = commentNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getCommentRegDate() {
		return commentRegDate;
	}
	public void setCommentRegDate(String commentRegDate) {
		this.commentRegDate = commentRegDate;
	}
	
	
	public int getCmtCount() {
		return cmtCount;
	}
	public void setCmtCount(int cmtCount) {
		this.cmtCount = cmtCount;
	}
	
	
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	public String getAccountbookNo() {
		return accountbookNo;
	}
	public void setAccountbookNo(String accountbookNo) {
		this.accountbookNo = accountbookNo;
	}
	public String getAccountbookUsage() {
		return accountbookUsage;
	}
	public void setAccountbookUsage(String accountbookUsage) {
		this.accountbookUsage = accountbookUsage;
	}
	public String getAccountbookRegDate() {
		return accountbookRegDate;
	}
	public void setAccountbookRegDate(String accountbookRegDate) {
		this.accountbookRegDate = accountbookRegDate;
	}
	public String getAccountbookSpend() {
		return accountbookSpend;
	}
	public void setAccountbookSpend(String accountbookSpend) {
		this.accountbookSpend = accountbookSpend;
	}
	
	
	public String getAccountbookPlace() {
		return accountbookPlace;
	}
	public void setAccountbookPlace(String accountbookPlace) {
		this.accountbookPlace = accountbookPlace;
	}
	public String getAccountbookPersonnel() {
		return accountbookPersonnel;
	}
	public void setAccountbookPersonnel(String accountbookPersonnel) {
		this.accountbookPersonnel = accountbookPersonnel;
	}
	@Override
	public String toString() {
		return "BoardVo [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardRegDate=" + boardRegDate + ", userNo=" + userNo + ", tagNo=" + tagNo + ", groupNo=" + groupNo
				+ ", likeState=" + likeState + ", commentContent=" + commentContent + ", commentNo=" + commentNo
				+ ", commentRegDate=" + commentRegDate + ", userName=" + userName + ", tagName=" + tagName
				+ ", likeCount=" + likeCount + ", cmtCount=" + cmtCount + ", imgList=" + imgList + ", accountbookNo="
				+ accountbookNo + ", accountbookUsage=" + accountbookUsage + ", accountbookRegDate="
				+ accountbookRegDate + ", accountbookSpend=" + accountbookSpend + ", accountbookPlace="
				+ accountbookPlace + ", accountbookPersonnel=" + accountbookPersonnel + "]";
	}

	
	
	
	
	
	
	
	
	
	
	
}

