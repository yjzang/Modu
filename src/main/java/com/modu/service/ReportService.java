package com.modu.service;

import com.modu.dao.ReportDao;
import com.modu.vo.ModuUserVo;
import com.modu.vo.ReportVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class ReportService {
    @Autowired
    ReportDao reportDao;

    //    public int getRecentEvent(String groupNo) {
//        return reportDao.getRecentEvent(groupNo);
//    }
//
//    public Map<String, Object> annualReport(int groupNo, String year) {
////        카테고리 리스트 불러오기
//        List<Integer> cateList = reportDao.getCategory(groupNo);
//        List<Object> outputList = new ArrayList<>();
//        int count = 1;
////        카테고리 리스트를 가지고 월별로 쪼개서 데이터 가져오기
//        for (Integer cateNo : cateList) {
//            List<ReportVo> tmp = new ArrayList<>();
//            System.out.println("카테고리번호 : " + cateNo);
//            Map<String, Object> inputMap = new HashMap<>();
//            inputMap.put("categoryNo", cateNo);
//            inputMap.put("groupNo", groupNo);
////            해당 카테고리의 1~6월 정보 가져오기
//            for (int i = 1; i <= 12; i++) {
//                String startDay = year + "/" + i + "/01";
//                String lastDay = getLastDay(Integer.parseInt(year), i);
//                inputMap.put("startDay", startDay);
//                inputMap.put("lastDay", lastDay);
//                ReportVo reportVo = reportDao.getMonthlyAnnualList(inputMap);
////                null일 경우 RVO객체 만들어 넣기
//                if (reportVo == null) {
//                    ReportVo noData = new ReportVo();
//                    noData.setCategoryNo(cateNo);
////                    카테고리번호의 카테고리이름 가져오기
//                    noData.setCategoryName(reportDao.getCategoryName(cateNo));
//                    tmp.add(noData);
//                } else {
//                    System.out.println(reportVo);
//                    tmp.add(reportVo);
//                }
//            }
//
////            null체크(12달 모두 null인 카테고리 제외시키기)
//            boolean flag = false;
//            flag = tmpIsNull(tmp);
//            if (flag == false) {
//                System.out.println("리스트에 넣을 자료가 없음");
//            } else {
//                System.out.println("최종 리스트에 추가" + count);
//                count++;
//                outputList.add(tmp);
//            }
//        }
////        월별 총합계
//        Map<String, Object> outputMap = new HashMap<>();
//        List<String> annualSum = new ArrayList<>();
//        System.out.println("총합계 구하기");
//        for (int i = 1; i <= 12; i++) {
//            Map<String, Object> inputMap = new HashMap<>();
//            inputMap.put("groupNo", groupNo);
//            String startDay = year + "/" + i + "/01";
//            inputMap.put("startDay", startDay);
//            inputMap.put("lastDay", getLastDay(Integer.parseInt(year), i));
//
//            String tmpTotal = reportDao.getAnnualSum(inputMap);
//            if (tmpTotal == null) {
//                annualSum.add("0");
//            } else {
//                annualSum.add(tmpTotal);
//            }
//            System.out.println("가지고 나온 합계 값 : " + tmpTotal);
//        }
////        월별 수입
//        List<String> monthlyIncome = new ArrayList<>();
//        for (int i = 1; i <= 12; i++) {
//            Map<String, Object> inputMap = new HashMap<>();
//            inputMap.put("groupNo", groupNo);
//            String startDay = year + "/" + i + "/01";
//            inputMap.put("startDay", startDay);
//            inputMap.put("lastDay", getLastDay(Integer.parseInt(year), i));
//
//            String income = reportDao.getMonthlyIncome(inputMap);
//            if (income == null) {
//                monthlyIncome.add("0");
//            } else {
//                monthlyIncome.add(income);
//            }
//        }
////        월별 지출
//        List<String> monthlySpend = new ArrayList<>();
//        for (int i = 1; i <= 12; i++) {
//            Map<String, Object> inputMap = new HashMap<>();
//            inputMap.put("groupNo", groupNo);
//            String startDay = year + "/" + i + "/01";
//            inputMap.put("startDay", startDay);
//            inputMap.put("lastDay", getLastDay(Integer.parseInt(year), i));
//
//            String spend = reportDao.getMonthlySpend(inputMap);
//            if (spend == null) {
//                monthlySpend.add("0");
//            } else {
//                monthlySpend.add(spend);
//            }
//        }
////        연간 총 수입,지출
//        String startDay = year + "/01/01";
//        String lastDay = year + "/12/31";
//        Map<String, Object> tmpMap = new HashMap<>();
//        tmpMap.put("startDay", startDay);
//        tmpMap.put("lastDay", lastDay);
//        tmpMap.put("groupNo", groupNo);
//        String incomeTotal = reportDao.getAnnualIncomeTotal(tmpMap);
//        String spendTotal = reportDao.getAnnualSpendTotal(tmpMap);
//
//
////        싸서 보내기
////        System.out.println(annualSum.toString());
////        System.out.println(outputList.toString());
//        System.out.println(monthlyIncome.toString());
//        System.out.println(monthlySpend.toString());
//        outputMap.put("monthlyIncome", monthlyIncome);
//        outputMap.put("monthlySpend", monthlySpend);
//        outputMap.put("annualSum", annualSum);
//        outputMap.put("outputList", outputList);
//        outputMap.put("incomeTotal", incomeTotal);
//        outputMap.put("spendTotal", spendTotal);
//        return outputMap;
//    }
//
//
//    public boolean tmpIsNull(List<ReportVo> tmp) {
//        int count = 0;
//        for (ReportVo nullCheck : tmp) {
//            int monthNo = nullCheck.getMonthNo();
//            if (monthNo == 0) {
//                count++;
//            }
//        }
//        if (count == 12) {
//            return false;
//        } else {
//            return true;
//        }
//    }
//
//
//    public Map<String, Object> monthlyReport(String groupNo, String fromYear, String fromMonth, String toYear, String toMonth) {
//        //        월별 지출
//        List<String> monthlySpend = new ArrayList<>();
//        for (int i = 1; i <= 12; i++) {
//            Map<String, Object> inputMap = new HashMap<>();
//            inputMap.put("groupNo", groupNo);
//            String startDay = fromYear + "/" + i + "/01";
//            inputMap.put("startDay", startDay);
//            inputMap.put("lastDay", getLastDay(Integer.parseInt(toYear), i));
//
//            String spend = reportDao.getMonthlySpend(inputMap);
//            if (spend == null) {
//                monthlySpend.add("0");
//            } else {
//                monthlySpend.add(spend);
//            }
//        }
////        해당 월의 태그별 총 지출
////        태그목록 가져오기
//        Map<String, Object> inputMap = new HashMap<>();
//        String startDay = fromYear + "/" + fromMonth + "/01";
//        inputMap.put("startDay", startDay);
//        String lastDay = getLastDay(Integer.parseInt(toYear), Integer.parseInt(toMonth));
//        inputMap.put("lastDay", lastDay);
//        inputMap.put("groupNo", groupNo);
//        System.out.println("태그목록 가져오기 in");
//        List<Integer> tagList = reportDao.getTagList(inputMap);
//        System.out.println("태그목록 가져오기 out : " + tagList.toString());
////        해당월에 속하는지 확인
//        List<ReportVo> monthlyTagList = new ArrayList<>();
//        System.out.println("해당월에 속하는지 확인 in");
//        List<Integer> tagListForRemove = new ArrayList<>();
//        for (int tmp : tagList) {
//            int monthCheck = reportDao.monthCheck(tmp);
//            System.out.println("기간 체크 가져온 월 : " + monthCheck);
//            int from = Integer.parseInt(fromMonth);
//            int to = Integer.parseInt(toMonth);
//            if (from <= monthCheck && monthCheck <= to) {//만약 해당월에 속하면
////                가계부 긁어오기
//                ReportVo reportVo = reportDao.getMonthlyTagList(tmp);
//                monthlyTagList.add(reportVo);
//                tagListForRemove.add(tmp);
//            }
//        }
////                총 지출액 긁어오기
//        System.out.println("해당월에 속하는지 확인 out");
////        해당월 총 지출액 합하기
//        System.out.println("해당월 총 지출액 구하기 in");
//        int monthlySum = reportDao.getMonthlyTagTotal(inputMap);
//        System.out.println("해당월 총 지출액 구하기 out : " + monthlySum);
////        천단위 콤마찍기
//        String monthlyTotalSum = String.format("%,d", monthlySum);
//
////        태그안달린 지출내역 가져오기
//        Set<Integer> forDeduplication = new HashSet<>();
////        제거할 accountNo 가져오기
//        for (int tmpForRemove : tagListForRemove) {
//            List<Integer> tmpList = reportDao.getAccountNoByTagList(tmpForRemove);
////        제거리스트 숫자만 뽑아서 셋에 넣기
//            for (int tmpI : tmpList) {
//                forDeduplication.add(tmpI);
//                System.out.println(tmpI);
//            }
//        }
//        System.out.println("제외시킬 accountbookNo : " + forDeduplication.toString());
////        해당월 전체 리스트 가져오기
//        List<Integer> totalList = reportDao.getAccountNoTotalList(inputMap);
////        전체리스트에서 제거할 accountNo 제외시키기
//        System.out.println("토탈 리스트 : "+totalList.toString());
//        System.out.println("제거할 리스트 : "+forDeduplication.toString());
//        for (int i : forDeduplication) {
////            for (int j : totalList) {
////                System.out.println("비교할 대상 : "+i+" 랑 "+j+" 비교");
////                if (i == j) {
////                    totalList.remove((Integer)j);
////                }
////            }
//
//            if (totalList.contains(i)) {
//                System.out.println("제거할 번호 : " + i);
//                totalList.remove((Integer)i);
//            }
//        }
//        System.out.println("제외시키고 남은 accountbookNo : " + totalList);
////        제외시킨 리스트로 vo 가져오기
//        List<ReportVo> nullList = new ArrayList<>();
//        for (int num : totalList) {
//            ReportVo reportVo = reportDao.getNullList(num);
//            nullList.add(reportVo);
//        }
//
//
//        Map<String, Object> outputMap = new HashMap<>();
//        outputMap.put("monthlyTotalSum", monthlyTotalSum);
//        outputMap.put("monthlyTagList", monthlyTagList);
//        outputMap.put("monthlySpend", monthlySpend);
//        outputMap.put("nullList", nullList);
//        return outputMap;
//    }
    public String getLastDay(int year, int month) {//마지막날 구하는 함수
        int day = 1;

        Calendar calendar = Calendar.getInstance();

        calendar.set(year, month - 1, day);
        int lastDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);

        String lastDate = String.valueOf(year) + "/" + String.valueOf(month) + "/" + String.valueOf(lastDay);
        System.out.println("만들어진 마지막 날짜 : " + lastDate);
        return lastDate;
    }

    public List<ReportVo> getReportVoByPeriod(int groupNo, int categoryNo, String fromYear, String fromMonth, String toYear, String toMonth){
        List<ReportVo> list = new ArrayList<>();
        for (int i = Integer.parseInt(fromMonth); i <= Integer.parseInt(toMonth); i++) {
            Map<String, Object> inputMap = new HashMap<>();
            inputMap.put("groupNo", groupNo);
            String startDay = fromYear + "/" + i + "/01";
            String lastDay = getLastDay(Integer.parseInt(toYear), i);
            inputMap.put("startDay", startDay);
            inputMap.put("lastDay", lastDay);
            inputMap.put("categoryNo", categoryNo);
            ReportVo reportVo = reportDao.getReportByPeriod(inputMap);
            if (reportVo == null) {
                reportVo = new ReportVo();
                list.add(reportVo);
            } else {
                list.add(reportVo);
            }
        }
        return list;
    }

    public Map<String, Object> reportByPeriod(int groupNo, String fromYear, String fromMonth, String toYear, String toMonth) {
//        카테고리 리스트 가져오기
        List<Integer> categoryList = reportDao.getCategory(groupNo);
        List<Object> reportListByCategory = new ArrayList<>();
        int fy = Integer.parseInt(fromYear);
        int ty = Integer.parseInt(toYear);
        if (fy == ty) {
            for (int categoryNo : categoryList) {
                List<ReportVo> reportList = getReportVoByPeriod(groupNo,categoryNo,fromYear,fromMonth,toYear,toMonth);
                reportListByCategory.add(reportList);
                System.out.println(reportListByCategory.toString());
            }
        } else {
            for (int categoryNo : categoryList) {
                List<ReportVo> tmp1List = getReportVoByPeriod(groupNo,categoryNo,fromYear,fromMonth,fromYear,String.valueOf(12));
                List<ReportVo> tmp2List = getReportVoByPeriod(groupNo,categoryNo,toYear,String.valueOf(1),toYear,toMonth);
                tmp1List.addAll(tmp2List);
                reportListByCategory.addAll(tmp1List);
                System.out.println(reportListByCategory.toString());
            }
        }
        Map<String, Object> outputMap = new HashMap<>();
        outputMap.put("reportListByCategory", reportListByCategory);
        return outputMap;
    }
}
