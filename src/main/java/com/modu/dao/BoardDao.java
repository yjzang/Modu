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
		
		System.out.println("다오 까지 왓수다"+vo.toString());
		int flag = sqlsession.insert("boardDB.insert",vo);
		System.out.println("잘들어갔을까?"+flag);
		String boardNo =vo.getBoardNo();  
		System.out.println(boardNo);
		return boardNo;
		
	}
	
	public int postCheck() {
		
		int postCheck = sqlsession.selectOne("boardDB.postCheck");
		System.out.println("post체크 0이면 start페이지로 --- "+postCheck);
		return postCheck;
	}

	public List<BoardVo> getPostList() {
		
		System.out.println("다오 까지 왓수다");
		List<BoardVo> list = sqlsession.selectList("boardDB.getPostList");
		return list;
	}
	
	
	public void restore(FileVo vo){
		
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
	
	
	
	public int deleteImg(String boardNo) {
		
		int flagImg = sqlsession.delete("boardDB.deleteImg",boardNo);
		return flagImg;
		
	}
// ---------- 좋아요  ------------	
	public void updateLike(BoardVo boardVo) {
		
		int flag = sqlsession.update("boardDB.updateLike",boardVo);
		System.out.println("다오 업데이트 여부 up"+flag);
	}
	
	
	public int likeCheck(BoardVo boardVo) {
		
		int likeCheck = sqlsession.selectOne("boardDB.likeCheck",boardVo);
		System.out.println("라이크체크 0이면 인서트 1이상이면 업데이트 --- "+likeCheck);
		return likeCheck;
	}
	
    
	public int likeCount(String boardNo) {
		
		int likeCount = sqlsession.selectOne("boardDB.likeCount",boardNo);
		System.out.println("다오에서 찍은 좋아요 수 "+likeCount);
		return likeCount;
	}
	
	public String likeState(BoardVo boardVo) {
		
		String likeState = sqlsession.selectOne("boardDB.likeState",boardVo);
		return likeState;		
	}
	
	public void insertLike(BoardVo boardVo) {
		
		int flag = sqlsession.update("boardDB.insertLike",boardVo);
		System.out.println("다오 업데이트 여부 up"+flag);
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
		System.out.println("다오에서 찍은 댓글 수 "+cmtCount);
		return cmtCount;
	}
		
}

