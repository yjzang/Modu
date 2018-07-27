package com.modu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modu.vo.AccountbookCategoryVo;
import com.modu.vo.AccountbookTagVo;
import com.modu.vo.AccountbookVo;

@Repository
public class ModuAccountbookDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<AccountbookVo> getAccountList(Map map) {
		//가계부 리스팅 - 날짜 검색 포함
		return sqlSession.selectList("accountbook.getAccountList",map);
	}
	
	public List<AccountbookCategoryVo> getCategoryList(String groupNo) {
		//가계부 카테고리 리스팅
		return sqlSession.selectList("accountbook.getCategoryList",groupNo);
	}
	
	public List<AccountbookCategoryVo> getModalcCtegoryList(String groupNo) {
		//가계부 카테고리 리스팅
		return sqlSession.selectList("accountbook.getModalcCtegoryList",groupNo);
	}
	
	public List<AccountbookVo> searchAccountListByTag(Map map) {
		//태그 검색
		return sqlSession.selectList("accountbook.searchAccountListByTag",map);
	}
	
	public List<AccountbookVo> searchAccountListByUsage(Map map) {
		//사용내역 검색
		return sqlSession.selectList("accountbook.searchAccountListByUsage",map);
	}
	
	public List<AccountbookTagVo> getTagListByGroupNo(String groupNo) {
		//가계부 태그 리스팅
		return sqlSession.selectList("accountbook.getTagListByGroupNo",groupNo);
	}
	
	public List<AccountbookTagVo> getTagListByTagName(Map map) {
		//가계부 태그 리스팅
		return sqlSession.selectList("accountbook.getTagListByTagName",map);
	}

	public AccountbookTagVo checkTag(AccountbookTagVo accountbookTagVo) {
		//태그 존재 여부 확인
		return sqlSession.selectOne("accountbook.checkTag",accountbookTagVo);
	}
	
	public AccountbookTagVo insertTag(AccountbookTagVo accountbookTagVo) {
		//태그 삽입
		sqlSession.insert("accountbook.insertTag",accountbookTagVo);
		return accountbookTagVo;
	}
	
	public void connectTag(AccountbookTagVo accountbookTagVo) {
		//가계부와 태그 연결
		sqlSession.insert("accountbook.connectTag",accountbookTagVo);
	}
	
	public void connectUpdateTag(AccountbookTagVo accountbookTagVo) {
		//가계부와 태그 연결 업데이트
		sqlSession.update("accountbook.connectUpdateTag",accountbookTagVo);
	}
	
	public List<AccountbookTagVo> getTagListByAccountNo(String accountNo) {
		return sqlSession.selectList("accountbook.getTagListByAccountNo",accountNo);
	}
	
	public void tagDelete(AccountbookTagVo accountbookTagVo) {
		sqlSession.delete("accountbook.tagDelete",accountbookTagVo);
	}
	
	public AccountbookVo saveAccountbookSpend(AccountbookVo accountbookVo) {
		sqlSession.insert("accountbook.saveAccountbookSpend",accountbookVo);
		return accountbookVo;
	}
	
	public AccountbookVo saveAccountbookIncome(AccountbookVo accountbookVo) {	
		sqlSession.insert("accountbook.saveAccountbookIncome",accountbookVo);
		return accountbookVo;
	}
	
	public void updateAccountbook(Map map) {
		sqlSession.update("accountbook.updateAccountbook",map);
	}
	
	public void deleteTag(Map map) {
		sqlSession.delete("accountbook.deleteTag",map);
	}
	
	public void tagCleaner() {
		sqlSession.delete("accountbook.tagCleaner");
	}
	
	public void deleteaccountbook(Map map) {
		sqlSession.delete("accountbook.deleteaccountbook",map);
	}
	
	public void connectTagGroup(Map map) {
		sqlSession.insert("accountbook.connectTagGroup",map);
	}
	
	public List<AccountbookCategoryVo> getChartDataByDate(Map map) {
		return sqlSession.selectList("accountbook.getChartDataByDate",map);
	}
	
	public List<AccountbookCategoryVo> getChartDataByTag(Map map) {
		return sqlSession.selectList("accountbook.getChartDataByTag",map);
	}
	
	public List<AccountbookCategoryVo> getChartDataByUsage(Map map) {
		return sqlSession.selectList("accountbook.getChartDataByUsage",map);
	}
	
	public void categoryDelete(Map map) {
		sqlSession.selectList("accountbook.categoryDelete",map);
	}
	
	public void categoryUpdate(Map map) {
		sqlSession.update("accountbook.categoryUpdate",map);
	}
	
	public AccountbookCategoryVo categoryInsert(AccountbookCategoryVo categoryVo) {
		sqlSession.insert("accountbook.categoryInsert",categoryVo);
		return categoryVo;
	}
	
	public List<AccountbookCategoryVo> getRecommendCategory(String usage) {
		return sqlSession.selectList("accountbook.getRecommendCategory",usage);
	}
}
