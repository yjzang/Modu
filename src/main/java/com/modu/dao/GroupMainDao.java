package com.modu.dao;

import com.modu.vo.GroupMainVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class GroupMainDao {

    @Autowired
    private SqlSession sqlSession;

    public List<GroupMainVo> getNews(Map<String,Object> map) {
        return sqlSession.selectList("groupMain.getNews",map);
    }
}
 