package com.modu.controller;

import com.modu.service.ModuGroupService;
import com.modu.service.ReportService;
import com.modu.vo.ModuGroupVo;
import com.modu.vo.ModuUserVo;
import com.modu.vo.ReportVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class ReportController {
    @Autowired
    ReportService reportService;
    @Autowired
    ModuGroupService groupService;

 
    @RequestMapping(value = "/reportbyperiod/{groupNo}/{fromYear}/{fromMonth}/{toYear}/{toMonth}", method = RequestMethod.GET)
    public String reportByPeriod(@PathVariable String fromYear, @PathVariable String fromMonth, @PathVariable String toYear, @PathVariable String toMonth, @PathVariable int groupNo, Model model, HttpSession session) {
        //모임 카테고리
        ModuUserVo userVo = (ModuUserVo) session.getAttribute("authUser");
        List<ModuGroupVo> gList = groupService.selectGroup(userVo.getUserNo());
        model.addAttribute("gList", gList);

        //클릭한 모임  메인 보여주기
        ModuGroupVo gvo = groupService.selectGroupImg(userVo.getGroupNo());
        model.addAttribute("gvo", gvo);

        System.out.println("기간별 보고서로 이동");
        model.addAttribute("fromYear", fromYear);
        model.addAttribute("fromMonth", fromMonth);
        model.addAttribute("toYear", toYear);
        model.addAttribute("toMonth", toMonth);
        model.addAttribute("groupNo", userVo.getGroupNo());
        Map<String, Object> map = reportService.reportByPeriod(groupNo, fromYear, fromMonth, toYear, toMonth);
        List<Object> list = (List<Object>) map.get("reportListByCategory");
        if (!list.isEmpty()) {
            System.out.println("RLBC" + map.get("reportListByCategory").toString());
            System.out.println("MT" + map.get("monthlyTotal").toString());
            model.addAttribute("reportListByCategory", map.get("reportListByCategory"));
            model.addAttribute("monthlySpend", map.get("monthlySpend"));
            model.addAttribute("monthlyIncome", map.get("monthlyIncome"));
            model.addAttribute("monthlyTotal", map.get("monthlyTotal"));
            return "/report/report_by_period";
        } else {
            return "redirect:/reportError/" + userVo.getGroupNo();
        }
    }

    @RequestMapping(value = "/report/getRecentTag/{groupNo}", method = RequestMethod.GET)
    public String getRecentTag(@PathVariable String groupNo) {
        int crtPage = 1;
        System.out.println("태그별 보고서를 위한 그룹번호 : " + groupNo);
        int recentTag = reportService.getRecentTag(groupNo);
        if (recentTag == 0) {
            return "redirect:/reportError/" + groupNo;
        } else {
            return "redirect:/reportbytag/" + crtPage + "/" + recentTag;
        }
    }

    @RequestMapping(value = "/reportbytag/{crtPage}/{tagNo}", method = RequestMethod.GET)
    public String reportByTag(@PathVariable int crtPage,@PathVariable int tagNo, HttpSession session, Model model) {
        //모임 카테고리
        ModuUserVo userVo = (ModuUserVo) session.getAttribute("authUser");
        List<ModuGroupVo> gList = groupService.selectGroup(userVo.getUserNo());
        model.addAttribute("gList", gList);

        //클릭한 모임  메인 보여주기
        ModuGroupVo gvo = groupService.selectGroupImg(userVo.getGroupNo());
        model.addAttribute("gvo", gvo);
        System.out.println("태그별 보고서로 이동");
        ReportVo reportVo = new ReportVo();
        reportVo.setCrtPage(crtPage);
        reportVo.setGroupNo(userVo.getGroupNo());
        reportVo.setTagNo(tagNo);
        Map<String, Object> map = reportService.reportByTag(userVo, tagNo, reportVo);
        model.addAttribute("tagList", map.get("tagList"));
        model.addAttribute("accountbookListByTag", map.get("accountbookListByTag"));
        model.addAttribute("tagNo", tagNo);
        model.addAttribute("crtPage", crtPage);
        model.addAttribute("groupNo", userVo.getGroupNo());
        model.addAttribute("pagingList",map.get("pagingList"));
        model.addAttribute("prev",map.get("prev"));
        model.addAttribute("next",map.get("next"));
        model.addAttribute("endPageBtnNo",map.get("endPageBtnNo"));
        model.addAttribute("startPageBtnNo",map.get("startPageBtnNo"));
        System.out.println("태그 리스트 나온값 : " + map.get("tagList").toString());
        System.out.println("accountbookList 나온값 : " + map.get("accountbookListByTag").toString());
        return "/report/report_by_tag";
    }


    @RequestMapping(value = "/report/getTagListForPaging", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getTagListForPaging(@ModelAttribute ReportVo reportVo) {
        System.out.println("ajax페이징 컨트롤러 in");
        Map<String,Object> map = reportService.getTagListForPaging(reportVo);
        System.out.println(map.get("pagingList").toString());
        return map;
    }

    @RequestMapping(value = "/reportError/{groupNo}", method = RequestMethod.GET)
    public String reportErrorPage(@PathVariable int groupNo, Model model) {
        System.out.println("리포트 생성이 불가하여 에러페이지로 이동");
        model.addAttribute("groupNo", groupNo);
        return "/report/reportErrorPage";
    }

}
