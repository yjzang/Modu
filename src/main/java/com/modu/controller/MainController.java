package com.modu.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.modu.service.ModuGroupService;
import com.modu.vo.ModuGroupVo;
import com.modu.vo.ModuUserVo;

@Controller
public class MainController{

	@Autowired
    private ModuGroupService groupService;
 

	@RequestMapping( "/main")
	public String hello(Model model,HttpSession session){
		System.out.println("/hellospring/hello");
		ModuUserVo uservo =  (ModuUserVo) session.getAttribute("authUser");
		List<ModuGroupVo> gList  = null;
		if(uservo != null) {
		gList  = groupService.selectGroup(uservo.getUserNo());
		model.addAttribute("gList",gList);

		}
		if(session.getAttribute("authUser") == null) {
			return "/index";
		}else {
			if( !gList.isEmpty()) {
				return "/index";
			}else {
				System.out.println(gList.toString());
				return "/group/createGroup";
			}
		}

	}




}
