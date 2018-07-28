package com.modu.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.modu.service.GroupMainService;
import com.modu.vo.GroupMainVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.modu.service.ModuGroupService;
import com.modu.vo.ModuGroupVo;
import com.modu.vo.ModuUserVo;

@Controller
@RequestMapping(value="/groupmain/{groupNo}")
public class GroupMainController {

	@Autowired
	private ModuGroupService groupService;
    @Autowired
    private GroupMainService groupMainService;

    @RequestMapping("")
    public String GroupMain(Model model, HttpSession session,@PathVariable int groupNo){
        System.out.println("모임메인");

        //모임 카테고리
        ModuUserVo userVo =  (ModuUserVo) session.getAttribute("authUser");
        List<ModuGroupVo> gList  = groupService.selectGroup(userVo.getUserNo());
        model.addAttribute("gList",gList);

        //클릭한 모임  메인 보여주기
        ModuGroupVo gvo = groupService.selectGroupImg(groupNo);
        model.addAttribute("gvo",gvo);
        userVo.setGroupNo(gvo.getGroupNo());
        session.setAttribute("authUser",userVo);

        Map<String,Object> map = groupMainService.getGroupMain(groupNo);
        model.addAttribute("newsList",map.get("newsList"));

        return "/group/groupMain";
    }

    @RequestMapping("/groupSearch")
	public String Search(@RequestParam("gSearch")String gSearch,Model model,HttpSession session) {
		ModuUserVo uservo =  (ModuUserVo) session.getAttribute("authUser");

		if(uservo != null) {
			List<ModuGroupVo> gList  = groupService.selectGroup(uservo.getUserNo());
			model.addAttribute("gList",gList);
		}

		List<ModuGroupVo> searchList = groupService.searchGroup(gSearch);
		model.addAttribute("searchList",searchList);

		return"/group/groupSearch";
	}
}
