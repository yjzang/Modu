package com.modu.dao;

import com.modu.vo.ReportVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ReportDao {
    @Autowired
    SqlSession sqlSession;


    public List<Integer> getCategory(int groupNo) {
        return sqlSession.selectList("report.getCategoryList",groupNo);
    }

    public String getCategoryName(Integer cateNo) {
        return sqlSession.selectOne("report.getCategoryName",cateNo);
    }

    public ReportVo getReportByPeriod(Map<String,Object> inputMap) {
        ReportVo reportVo = null;
        try{
            reportVo = sqlSession.selectOne("report.getReportByPeriod",inputMap);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return reportVo;
        }

    }

    public String getMonthlyIncome(Map<String, Object> inputMap) {
        return sqlSession.selectOne("report.getMonthlyIncome",inputMap);
    }

    public String getMonthlySpend(Map<String, Object> inputMap) {
        return sqlSession.selectOne("report.getMonthlySpend",inputMap);
    }

    public String getMonthlyTotal(Map<String,Object> inputMap) {
        return sqlSession.selectOne("report.getMonthlyTotal",inputMap);
    }

    public int getRecentTag(String groupNo) {
        int tagNo = 0;
        try{
            tagNo = sqlSession.selectOne("report.getRecentTag",groupNo);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return tagNo;
        }
    }

    public List<ReportVo> getTagList(int groupNo) {
        List<ReportVo> list = sqlSession.selectList("report.getTagList",groupNo);
        System.out.println(list.toString());
        return list;
    }

    public List<ReportVo> getAccountbookListByTag(int tagNo) {
        return sqlSession.selectList("report.getAccountbookListByTag",tagNo);
    }

    public List<Integer> getTagNoList(Map<String, Object> inputMap) {
        return sqlSession.selectList("report.getTagNoList",inputMap);
    }

    public int postCount(int groupNo) {
        return sqlSession.selectOne("report.getTotalCount",groupNo);
    }

    public ReportVo getTagListForPaging(int tagNo) {
        return sqlSession.selectOne("report.getTagListForPaging",tagNo);
    }

}
