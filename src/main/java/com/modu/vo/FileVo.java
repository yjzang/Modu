package com.modu.vo;

public class FileVo {
    private String boardImgNo;
    private String boardNo;
    private String userNo;
    private String boardImgPath;
    private String originalName;
    private String saveName;
    private long imgSize;
    
    
    
       
    
	
	public String getBoardImgNo() {
		return boardImgNo;
	}
	public void setBoardImgNo(String boardImgNo) {
		this.boardImgNo = boardImgNo;
	}
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardImgPath() {
		return boardImgPath;
	}
	public void setBoardImgPath(String boardImgPath) {
		this.boardImgPath = boardImgPath;
	}
	public String getOriginalName() {
		return originalName;
	}
	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}
	public String getSaveName() {
		return saveName;
	}
	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}
	
	public long getImgSize() {
		return imgSize;
	}
	public void setImgSize(long imgSize) {
		this.imgSize = imgSize;
	}
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	
	
	@Override
	public String toString() {
		return "FileVo [boardImgNo=" + boardImgNo + ", boardNo=" + boardNo + ", userNo=" + userNo + ", boardImgPath="
				+ boardImgPath + ", originalName=" + originalName + ", saveName=" + saveName + ", imgSize=" + imgSize
				+ "]";
	}
    
   
    	
    
    
    
}
