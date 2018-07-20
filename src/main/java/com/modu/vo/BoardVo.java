package com.modu.vo;

import java.util.List;

public class BoardVo {

	String boardNo;
	String boardTitle;
	String boardContent;
	String boardRegDate;
	String userNo;
	String tagNo;
	String groupNo;
	String likeState;
	String commentContent;
	String commentNo;
	String commentRegDate;
	String userName;
	int likeCount;
	int cmtCount;
	List<FileVo> imgList ;
	
	
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
	public String getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(String groupNo) {
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
	
	@Override
	public String toString() {
		return "BoardVo [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardRegDate=" + boardRegDate + ", userNo=" + userNo + ", tagNo=" + tagNo + ", groupNo=" + groupNo
				+ ", likeState=" + likeState + ",\n commentContent=" + commentContent + ", commentNo=" + commentNo
				+ ", commentRegDate=" + commentRegDate + ", userName=" + userName + ", likeCount=" + likeCount
				+ ", imgList=" + imgList + "]\n";
	}
	
	
	
	
	
	
	
	
	
	
}

