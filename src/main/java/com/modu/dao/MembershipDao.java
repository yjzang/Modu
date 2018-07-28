package com.modu.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modu.vo.MembershipVo;
import com.modu.vo.ModuGroupVo;

@Repository
public class MembershipDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertMembership(ModuGroupVo groupvo) {
		
	 sqlSession.insert("membership.insertMembership",groupvo);
		
		return groupvo.getGroupNo();
	}
	
	public int insertPayment(MembershipVo mvo) {
		
		return sqlSession.insert("membership.insertPayment",mvo);
	}
	
	public ModuGroupVo selectMembership(int groupNo) {
		
		return sqlSession.selectOne("membership.selectMembership",groupNo);
	}

}
