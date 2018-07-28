package com.modu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modu.vo.BoardVo;
import com.modu.vo.FileVo;

@Repository
public class BoardDao {

	
	@Autowired
	SqlSession sqlsession;
	
	public String addPost(BoardVo vo) {
		
		//System.out.println("다오 까지 왓수다"+vo.toString());
		sqlsession.insert("boardDB.insertPost",vo);
		//System.out.println("잘들어갔을까?"+flag);
		String boardNo =vo.getBoardNo();  
		//System.out.println(boardNo);
		return boardNo;
		
	}
	
	
	public String modiPost(BoardVo vo) {
		
		//System.out.println("다오 까지 왓수다"+vo.toString());
		sqlsession.update("boardDB.updatePost",vo);
		//System.out.println("잘들어갔을까?"+flag);
		String boardNo =vo.getBoardNo();  
		//System.out.println(boardNo);
		return boardNo;
		
	}
	
	
	public int postCheck(int groupNo) {
		
		int postCheck = sqlsession.selectOne("boardDB.postCheck",groupNo);
		//System.out.println("post체크 0이면 start페이지로 --- "+postCheck);
		return postCheck;
	}

	public List<BoardVo> getPostList(int groupNo) {
		
		System.out.println("다오 까지 왓수다");
		List<BoardVo> list = sqlsession.selectList("boardDB.getPostList", groupNo);
		return list;
	}
	
	public BoardVo getPost(int boardNo) {
		
		BoardVo boardVo =  sqlsession.selectOne("boardDB.getPost", boardNo);
		return boardVo;
	}
	
	public void restoreFile(FileVo vo){
		
		System.out.println("다오 "+ vo.toString());
		sqlsession.insert("boardDB.insertFile",vo);
	
	}
	
	public List<FileVo> getPostImgs(String boardNo) {
		
		List<FileVo> fileList =sqlsession.selectList("boardDB.getPostImgs",boardNo);
		return fileList;
	}
	
	
	
	
	
	public int deletePost(String boardNo) {
		
		
		int flagPost= sqlsession.delete("boardDB.deletePost",boardNo);
		return flagPost;
		
	}
	
	public int deleteCmt(String commentNo) {
		
		
		int flagCmt= sqlsession.delete("boardDB.deleteCmt",commentNo);
		return flagCmt;
		
	}
	
	public int deleteCmtAll(String boardNo) {
		
		
		int flagCmt= sqlsession.delete("boardDB.deleteCmtAll",boardNo);
		return flagCmt;
		
	}
	
	public int deleteImgAll(String boardNo) {
		
		
		int flagImg= sqlsession.delete("boardDB.deleteImgAll",boardNo);
		return flagImg;
		
	}
	
	public int deleteLikeAll(String boardNo) {
		
		
		int flagLike= sqlsession.delete("boardDB.deleteLikeAll",boardNo);
		return flagLike;
		
	}
	
	
	public int deleteImg(String boardNo) {
		
		int flagImg = sqlsession.delete("boardDB.deleteImg",boardNo);
		return flagImg;
		
	}
// ---------- 좋아요  ------------	
	public void updateLike(BoardVo boardVo) {
		
		int flag = sqlsession.update("boardDB.updateLike",boardVo);
		//System.out.println("다오 업데이트 여부 up"+flag);
	}
	
	
	public int likeCheck(BoardVo boardVo) {
		
		int likeCheck = sqlsession.selectOne("boardDB.likeCheck",boardVo);
		//System.out.println("라이크체크 0이면 인서트 1이상이면 업데이트 --- "+likeCheck);
		return likeCheck;
	}
	
    
	public int likeCount(String boardNo) {
		
		int likeCount = sqlsession.selectOne("boardDB.likeCount",boardNo);
		//System.out.println("다오에서 찍은 좋아요 수 "+likeCount);
		return likeCount;
	}
	
	public String likeState(BoardVo boardVo) {
		
		String likeState = sqlsession.selectOne("boardDB.likeState",boardVo);
		return likeState;		
	}
	
	public void insertLike(BoardVo boardVo) {
		
		int flag = sqlsession.update("boardDB.insertLike",boardVo);
		//System.out.println("다오 업데이트 여부 up"+flag);
	}
	
//-------- 댓 글 ---------
	public int addCmt(BoardVo boardVo) {
		int flag = sqlsession.insert("boardDB.insertCmt",boardVo);
		return flag;
	}
	
	public List<BoardVo> getCmtList(BoardVo boardVo) {
		
		List<BoardVo> list = sqlsession.selectList("boardDB.getCmtList",boardVo);
		
		return list;
	}
	
	public int cmtCount(String boardNo) {
		
		int cmtCount = sqlsession.selectOne("boardDB.cmtCount",boardNo);
		//System.out.println("다오에서 찍은 댓글 수 "+cmtCount);
		return cmtCount;
	}
		
	public int getTagCount(String accountbookNo) {
		
		int tagCount = sqlsession.selectOne("boardDB.getTagCount",accountbookNo);
		return tagCount;
	}
	
	
// ------------태그-------------
	
	public List<BoardVo> getTagList(int groupNo){
		
		System.out.println("#############################그룹넘버---"+groupNo);
	   List<BoardVo> tagList =  sqlsession.selectList("boardDB.getTagList",groupNo);
	   
		return tagList;
	}
	
	public List<BoardVo> getAccountList(String tagNo){
		
	   List<BoardVo> accountList =  sqlsession.selectList("boardDB.getAccountList",tagNo);
	   
		return accountList;
	}
	
	public void updatePlace(BoardVo boardVo) {
		
		System.out.println("###장소 적은거---"+boardVo.toString());
		sqlsession.update("boardDB.updatePlace",boardVo);
		
	}
	

	public String getTagName(BoardVo boardVo) {
		
		String tagName = sqlsession.selectOne("boardDB.getTagName",boardVo.getBoardNo());
		return tagName;
	}
	
	//---------- 날짜-------------
	public List<BoardVo> getAccountBookByDate(BoardVo boardVo){
		
		
		 List<BoardVo> accountList =  sqlsession.selectList("boardDB.getAccountListByDate",boardVo);
		return accountList;
	}
}

