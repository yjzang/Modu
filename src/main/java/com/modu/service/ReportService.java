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


    public Map<String, Object> reportByPeriod(int groupNo, String fromYear, String fromMonth, String toYear, String toMonth) {
//        카테고리 리스트 가져오기
    	List<Integer> categoryList = reportDao.getNonGroupCategoryList(groupNo);
        List<Integer> categoryList2 = reportDao.getCategory(groupNo);
        categoryList.addAll(categoryList2);
         
        System.out.println("카테고리 리스트 확인 : "+categoryList.toString());
        List<Object> reportListByCategory = new ArrayList<>();
        List<String> monthlySpend = new ArrayList<>();
        List<String> monthlyIncome = new ArrayList<>();
        List<String> monthlyTotal = new ArrayList<>();
        int fy = Integer.parseInt(fromYear);
        int ty = Integer.parseInt(toYear);
        int fm = Integer.parseInt(fromMonth);
        int tm = Integer.parseInt(toMonth);
        System.out.println("기간이 안나오나? "+fy+"/"+fm+"/"+ty+"/"+tm);
        if (fy == ty) {//년도가 같으면
            for (int categoryNo : categoryList) {//카테고리별로
            	System.out.println("여기 들어오나 확인...1 카테고리번호 : "+categoryNo);
                List<ReportVo> list = new ArrayList<>();
                for (int i = fm; i <= tm; i++) {//시작월~끝월까지 데이터를 가져오고
                    Map<String, Object> inputMap = new HashMap<>();
                    inputMap.put("groupNo", groupNo);
                    String startDay = fromYear + "/" + i + "/01";
                    String lastDay = getLastDay(Integer.parseInt(toYear), i);
                    inputMap.put("startDay", startDay);
                    inputMap.put("lastDay", lastDay);
                    inputMap.put("categoryNo", categoryNo);
                    System.out.println("여기 들어오나 확인...2 인풋맵"+inputMap.toString());
                    ReportVo reportVo = reportDao.getReportByPeriod(inputMap);
                    if (reportVo == null) {//가져온값이 null 이면
                        reportVo = new ReportVo();//새로운객체를 생성하고
                        System.out.println("여기 들어오나 확인...3 if문 들어옴 vo확인"+reportVo.toString());
                        reportVo.setCategoryName(reportDao.getCategoryName(categoryNo));//카테고리이름만 넣어서
                        list.add(reportVo);//리스트에 추가해라
                    } else {//가져온 값이 null이 아니면
                        list.add(reportVo);//리스트에 바로 추가해라
                    }
                    System.out.println("여기 들어오나 확인...4 리스트 확인"+list.toString());
                }
                if (tmpIsNull(list)) {//리스트가 비어있지 않으면
                    reportListByCategory.add(list);//list를 추가해라
                }
                System.out.println("여기 들어오나 확인...5 리스트 바이 카테고리 확인"+reportListByCategory.toString());
            }

            for (int i = fm; i <= tm; i++) {//시작월~끝월까지
                Map<String, Object> inputMap = new HashMap<>();
                inputMap.put("groupNo", groupNo);
                String startDay = fromYear + "/" + i + "/01";
                String lastDay = getLastDay(ty, i);
                inputMap.put("startDay", startDay);
                inputMap.put("lastDay", lastDay);
                String spend = reportDao.getMonthlySpend(inputMap);//월별 지출을 가져와라
                monthlySpend.add(spend);
                String income = reportDao.getMonthlyIncome(inputMap);//월별 수입을 가져와라
                monthlyIncome.add(income);
                String total = reportDao.getMonthlyTotal(inputMap);//월별 총합계를 가져와라
                monthlyTotal.add(total);
                System.out.println("여기 들어오나 확인...ms"+monthlySpend.toString());
                System.out.println("여기 들어오나 확인...mi"+monthlyIncome.toString());
                System.out.println("여기 들어오나 확인...mt"+monthlyTotal.toString());
            }
        } else {//fromYear 과 toYear 년도가 같지 않으면
            for (int categoryNo : categoryList) {//카테고리별로
                System.out.println("들어오냐 체크포인트 1번");
                List<ReportVo> list = new ArrayList<>();
                for (int i = fm; i <= 12 + tm; i++) {//시작월~끝월까지 데이터를 가져오고
                    System.out.println("들어오냐 체크포인트 2번");
                    int tmpMonth = i;
                    int tmpFyear = fy;
                    int tmpTyear = ty;
                    if (tmpMonth <= 12) {
                        tmpTyear = fy;
                    } else {
                        tmpMonth = tmpMonth - 12;
                        tmpFyear = ty;
                    }
                    Map<String, Object> inputMap = new HashMap<>();
                    inputMap.put("groupNo", groupNo);
                    String startDay = tmpFyear + "/" + tmpMonth + "/01";
                    String lastDay = getLastDay(tmpTyear, tmpMonth);
                    inputMap.put("startDay", startDay);
                    inputMap.put("lastDay", lastDay);
                    inputMap.put("categoryNo", categoryNo);
                    ReportVo reportVo = reportDao.getReportByPeriod(inputMap);
                    if (reportVo == null) {//가져온값이 null 이면
                        reportVo = new ReportVo();//새로운객체를 생성하고
                        reportVo.setCategoryName(reportDao.getCategoryName(categoryNo));//카테고리이름만 넣어서
                        System.out.println("들어오냐 체크포인트 3번 if에 들어옴");
                        list.add(reportVo);//리스트에 추가해라
                    } else {//가져온 값이 null이 아니면
                        System.out.println("들어오냐 체크포인트 3번 else에 들어옴");
                        list.add(reportVo);//리스트에 바로 추가해라
                    }
                }
                System.out.println("들어오냐 체크포인트 4번");
                if (tmpIsNull(list)) {//리스트가 비어있지 않으면
                    reportListByCategory.add(list);//list를 추가해라
                }
                System.out.println("들어오냐 체크포인트 5번");
            }
            for (int i = fm; i <= 12 + tm; i++) {//시작월~끝월까지
                int tmpMonth = i;
                int tmpFyear = fy;
                int tmpTyear = ty;
                if (tmpMonth <= 12) {
                    tmpTyear = fy;
                } else {
                    tmpMonth = tmpMonth - 12;
                    tmpFyear = ty;
                }
                Map<String, Object> inputMap = new HashMap<>();
                inputMap.put("groupNo", groupNo);
                String startDay = tmpFyear + "/" + tmpMonth + "/01";
                String lastDay = getLastDay(tmpTyear, tmpMonth);
                inputMap.put("startDay", startDay);
                inputMap.put("lastDay", lastDay);
                String spend = reportDao.getMonthlySpend(inputMap);//월별 지출을 가져와라
                monthlySpend.add(spend);
                String income = reportDao.getMonthlyIncome(inputMap);//월별 수입을 가져와라
                monthlyIncome.add(income);
                String total = reportDao.getMonthlyTotal(inputMap);//월별 총합계를 가져와라
                monthlyTotal.add(total);
            }
        }
        System.out.println("들어오냐 체크포인트 6번");

        System.out.println("이거라고?" + reportListByCategory.toString());
        Map<String, Object> outputMap = new HashMap<>();
        outputMap.put("reportListByCategory", reportListByCategory);
        outputMap.put("monthlySpend", monthlySpend);
        outputMap.put("monthlyIncome", monthlyIncome);
        outputMap.put("monthlyTotal", monthlyTotal);

        return outputMap;
    }


    public int getRecentTag(String groupNo) {
        return reportDao.getRecentTag(groupNo);
    }


    public Map<String, Object> reportByTag(ModuUserVo userVo, int tagNo, ReportVo reportVo) {
        List<ReportVo> accountbookListByTag = reportDao.getAccountbookListByTag(tagNo);

        int totalCount = reportDao.postCount(reportVo.getGroupNo());//해당카테고리의 모든 포스트 수
        int startRnum = (reportVo.getCrtPage() - 1) * reportVo.getListCnt();//페이지에 표시할 시작번호(첫번째글)
        int endRnum = startRnum + reportVo.getListCnt();//페이지에 표시할 끝번호(세번째글)
        int endPageBtnNo = (int) (Math.ceil(reportVo.getCrtPage() / (double) reportVo.getPageBtnCount()) * reportVo.getPageBtnCount());
        int startPageBtnNo = endPageBtnNo - (reportVo.getPageBtnCount() - 1);
        int last = (int) (Math.ceil(totalCount / (double) reportVo.getListCnt()));
        boolean prev = false;
        if (reportVo.getCrtPage() > reportVo.getPageBtnCount()) {
            prev = true;
        }
        boolean next = false;
        System.out.println(endPageBtnNo+"*"+reportVo.getListCnt()+" = "+totalCount);
        if (endPageBtnNo * reportVo.getListCnt() < totalCount) {
            next = true;
        }
        Map<String, Object> inputMap = new HashMap<>();
        inputMap.put("groupNo", reportVo.getGroupNo());
        inputMap.put("startRnum", startRnum + 1);
        inputMap.put("endRnum", endRnum);
        List<Integer> tagNoList = reportDao.getTagNoList(inputMap);
        System.out.println(tagNoList.toString());
        List<ReportVo> pagingList = new ArrayList<>();
        for (int tmp : tagNoList) {
            pagingList.add(reportDao.getTagListForPaging(tmp));
        }

        Map<String, Object> outputMap = new HashMap<>();
        outputMap.put("tagList", reportDao.getTagList(userVo.getGroupNo()));
        outputMap.put("accountbookListByTag", accountbookListByTag);
        outputMap.put("pagingList", pagingList);
        outputMap.put("crtPage",reportVo.getCrtPage());
        outputMap.put("prev", prev);
        outputMap.put("next", next);
        outputMap.put("endPageBtnNo", endPageBtnNo);
        outputMap.put("startPageBtnNo", startPageBtnNo);
        return outputMap;
    }

    public Map<String, Object> getTagListForPaging(ReportVo reportVo) {
        int totalCount = reportDao.postCount(reportVo.getGroupNo());//해당카테고리의 모든 포스트 수
        int startRnum = (reportVo.getCrtPage() - 1) * reportVo.getListCnt();//페이지에 표시할 시작번호(첫번째글)
        int endRnum = startRnum + reportVo.getListCnt();//페이지에 표시할 끝번호(세번째글)
        int endPageBtnNo = (int) (Math.ceil(reportVo.getCrtPage() / (double) reportVo.getPageBtnCount()) * reportVo.getPageBtnCount());
        int startPageBtnNo = endPageBtnNo - (reportVo.getPageBtnCount() - 1);
        int last = (int) (Math.ceil(totalCount / (double) reportVo.getListCnt()));
        boolean prev = false;
        if (reportVo.getCrtPage() > reportVo.getPageBtnCount()) {
            prev = true;
        }
        boolean next = false;
        System.out.println(endPageBtnNo+"*"+reportVo.getListCnt()+" = "+totalCount);
        if (endPageBtnNo * reportVo.getListCnt() < totalCount) {
            next = true;
        }

        Map<String, Object> inputMap = new HashMap<>();
        inputMap.put("groupNo", reportVo.getGroupNo());
        inputMap.put("startRnum", startRnum + 1);
        inputMap.put("endRnum", endRnum);
        List<Integer> tagNoList = reportDao.getTagNoList(inputMap);
        System.out.println(tagNoList.toString());
        List<ReportVo> pagingList = new ArrayList<>();
        for (int tagNo : tagNoList) {
            pagingList.add(reportDao.getTagListForPaging(tagNo));
        }
        Map<String, Object> outputMap = new HashMap<>();
        outputMap.put("pagingList", pagingList);
        outputMap.put("crtPage",reportVo.getCrtPage());
        outputMap.put("prev", prev);
        outputMap.put("next", next);
        outputMap.put("endPageBtnNo", endPageBtnNo);
        outputMap.put("startPageBtnNo", startPageBtnNo);
        return outputMap;
    }
    

    public boolean tmpIsNull(List<ReportVo> tmp) {
        int count = 0;
        for (ReportVo nullCheck : tmp) {
            int monthNo = nullCheck.getMonthNo();
            if (monthNo == 0) {
                count++;
            }
        }
        if (count == tmp.size()) {
            return false;
        } else {
            return true;
        }
    }

    public String getLastDay(int year, int month) {//마지막날 구하는 함수
        int day = 1;

        Calendar calendar = Calendar.getInstance();

        calendar.set(year, month - 1, day);
        int lastDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);

        String lastDate = String.valueOf(year) + "/" + String.valueOf(month) + "/" + String.valueOf(lastDay);
        return lastDate;
    }
    
}
