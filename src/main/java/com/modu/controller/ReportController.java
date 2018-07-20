package com.modu.controller;

import com.modu.service.ReportService;
import com.modu.vo.ModuUserVo;
import com.modu.vo.ReportVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Map;

@Controller
public class ReportController {
    @Autowired
    ReportService reportService;

//    @RequestMapping(value = "/monthlyreport/{groupNo}/{fromYear}/{fromMonth}/{toYear}/{toMonth}",method = RequestMethod.GET)
//    public String monthlyReport(@PathVariable String groupNo,@PathVariable String fromYear,@PathVariable String toYear,@PathVariable String fromMonth,@PathVariable String toMonth,Model model){
//        System.out.println("월간 보고서로 이동");
//        model.addAttribute("groupNo",groupNo);
//        model.addAttribute("fromYear",fromYear);
//        model.addAttribute("toYear",toYear);
//        model.addAttribute("fromMonth",fromMonth);
//        model.addAttribute("toMonth",toMonth);
//        Map<String,Object> tmp = reportService.monthlyReport(groupNo,fromYear,fromMonth,toYear,toMonth);
//        model.addAttribute("monthlySpend",tmp.get("monthlySpend"));
//        model.addAttribute("monthlyTotalSum",tmp.get("monthlyTotalSum"));
//        model.addAttribute("monthlyTagList",tmp.get("monthlyTagList"));
//        System.out.println("월 보고서 데이터 다 가지고 나오면 출력");
//        System.out.println(tmp.get("monthlySpend").toString());
//        System.out.println(tmp.get("monthlyTotalSum").toString());
//        System.out.println(tmp.get("monthlyTagList").toString());
//        model.addAttribute("nullList",tmp.get("nullList"));
//        System.out.println("널 리스트 : "+tmp.get("nullList"));
//        return "/report/monthly_report";
//    }
//
//    @RequestMapping(value = "/eventreport/{eventNo}",method = RequestMethod.GET)
//    public String eventReport(@PathVariable String eventNo){
//        System.out.println("행사별 보고서로 이동");
//        return "/report/event_report";
//    }
//
//    @RequestMapping(value = "/getRecentEvent/{groupNo}",method = RequestMethod.GET)
//    public String getRecentEvent(@PathVariable String groupNo){
//        System.out.println("행사별 보고서를 위한 그룹번호 : "+groupNo);
//        int recentEvent = reportService.getRecentEvent(groupNo);
//        return "redirect:/eventreport/"+recentEvent;
//    }


    @RequestMapping(value = "/reportbyperiod/{groupNo}/{fromYear}/{fromMonth}/{toYear}/{toMonth}",method = RequestMethod.GET)
    public String annualReport(@PathVariable String fromYear,@PathVariable String fromMonth,@PathVariable String toYear,@PathVariable String toMonth,@PathVariable int groupNo,Model model){
        System.out.println("기간별 보고서로 이동");
        model.addAttribute("fromYear",fromYear);
        model.addAttribute("fromMonth",fromMonth);
        model.addAttribute("toYear",toYear);
        model.addAttribute("toMonth",toMonth);
        model.addAttribute("groupNo",groupNo);
        Map<String,Object> map = reportService.reportByPeriod(groupNo,fromYear,fromMonth,toYear,toMonth);
        return "/report/report_by_period";
    }

}
