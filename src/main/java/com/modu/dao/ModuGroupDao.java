package com.modu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modu.vo.ModuGroupVo;
import com.modu.vo.UserGroupVo;


@Repository
public class ModuGroupDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	// 모임 추가하기
	public int plusGroup(ModuGroupVo groupvo) {
		System.out.println(groupvo.toString());
		sqlSession.insert("group.insert",groupvo);
		
	    return groupvo.getGroupNo();
	}
	
	//내가 속한 그룹명단
	public List<ModuGroupVo> selectGroup(int userNo) {
		return sqlSession.selectList("group.selectGroupList",userNo);
	}
    
	//내가 클릭한 그룹이미지, 이름
	public ModuGroupVo selectGroupImg(int groupNo) {

		return sqlSession.selectOne("group.selectImg",groupNo);
	}
    
	// 검색조건에 맞는 그룹리스트
	public List<ModuGroupVo> searchGroup(String gSearch){
		return sqlSession.selectList("group.searchList",gSearch);
	}
    
	// 그룹신청하기
	public int insertJoin (UserGroupVo usergroupvo) {
		return sqlSession.insert("group.insertJoin",usergroupvo);
	}
	
	//그룹 - 신청자명단 리스트(joinState=대기)
	public List<UserGroupVo> selectJoinList(int groupNo){
		return sqlSession.selectList("group.selectList",groupNo);
	}
	
	//그룹 - 회원자명단(joinState=완료)
	public List<UserGroupVo> selectUserList(int groupNo){
		return sqlSession.selectList("group.selectUserList",groupNo);
	}
	
	// 신청자 중 수락
	public int updateState(UserGroupVo usergroupvo) {
		return sqlSession.update("group.updateJoinState",usergroupvo);
		
	}
	
	// 신청자 중 거절 그리고 회원 중 추방하기 
	public int deleteState(int User_groupNo) {
		System.out.println(User_groupNo);
		return sqlSession.delete("group.deleteJoinState",User_groupNo);
	}
	
	// 회원 중 총무위임 
	public int updateMana(ModuGroupVo gvo) {
		return sqlSession.update("group.updateMana",gvo);
	}
	
	//그룹 수정
	public int updateGroup(ModuGroupVo groupvo) {
		return sqlSession.update("group.updateGroup",groupvo);
	}
	
	



}
