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
	
	public int plusGroup(ModuGroupVo groupvo) {
		System.out.println(groupvo.toString());
	    
	    return sqlSession.insert("group.insert",groupvo);
	}
	
	public List<ModuGroupVo> selectGroup(int manager) {
		//System.out.println("어디냐여긴");
		return sqlSession.selectList("group.selectGroupList",manager);
	}

	public ModuGroupVo selectGroupImg(int groupNo) {

		return sqlSession.selectOne("group.selectImg",groupNo);
	}

	public List<ModuGroupVo> searchGroup(String gSearch){
		return sqlSession.selectList("group.searchList",gSearch);
	}

	public int insertJoin (UserGroupVo usergroupvo) {
		return sqlSession.insert("group.insertJoin",usergroupvo);
	}



}
