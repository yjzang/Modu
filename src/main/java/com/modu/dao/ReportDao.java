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

//    public int getRecentEvent(String groupNo) {
//        return sqlSession.selectOne("report.getRecentEvent",groupNo);
//    }
//
//    public ReportVo getMonthlyAnnualList(Map<String,Object> inputMap) {
//        System.out.println("연간보고서 긁기");
//        return sqlSession.selectOne("report.getMonthlyAnnualList",inputMap);
//    }
//
//
//    public String getCategoryName(Integer cateNo) {
//        return sqlSession.selectOne("report.getCategoryName",cateNo);
//    }
//
//    public String getAnnualSum(Map<String, Object> inputMap) {
//        return sqlSession.selectOne("report.getAnnualSum",inputMap);
//    }
//
//    public String getMonthlyIncome(Map<String, Object> inputMap) {
//        return sqlSession.selectOne("report.getMonthlyIncome",inputMap);
//    }
//
//    public String getMonthlySpend(Map<String, Object> inputMap) {
//        return sqlSession.selectOne("report.getMonthlySpend",inputMap);
//    }
//
//    public List<Integer> getTagList(Map<String,Object> inputMap) {
//        return sqlSession.selectList("report.getTagList",inputMap);
//    }
//
//    public int monthCheck(int tagNo) {
//        return sqlSession.selectOne("report.monthCheck",tagNo);
//    }
//
//    public ReportVo getMonthlyTagList(int tagNo) {
//        return sqlSession.selectOne("report.monthlyTagList",tagNo);
//    }
//
//    public int getMonthlyTagTotal(Map<String,Object> map) {
//        return sqlSession.selectOne("report.monthlyTagTotal",map);
//    }
//
//    public String getAnnualIncomeTotal(Map<String,Object> tmpMap) {
//        return sqlSession.selectOne("report.annualIncomeTotal",tmpMap);
//    }
//
//    public String getAnnualSpendTotal(Map<String,Object> tmpMap) {
//        return sqlSession.selectOne("report.annualSpendTotal",tmpMap);
//    }
//
//    public List<Integer> getAccountNoByTagList(int tagNo) {
//        return sqlSession.selectList("report.getAccountNoByTagList",tagNo);
//    }
//
//    public List<Integer> getAccountNoTotalList(Map<String,Object> inputMap) {
//        return sqlSession.selectList("report.getAccountNoTotalList",inputMap);
//    }
//
//    public ReportVo getNullList(int accountbookNo) {
//        return sqlSession.selectOne("report.getNullList",accountbookNo);
//    }
    public List<Integer> getCategory(int groupNo) {
        return sqlSession.selectList("report.getCategoryList",groupNo);
    }


    public ReportVo getReportByPeriod(Map<String,Object> inputMap) {
        return sqlSession.selectOne("report.getReportByPeriod",inputMap);
    }
}
