package com.modu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.modu.service.ModuGroupService;
import com.modu.vo.ModuGroupVo;
import com.modu.vo.ModuUserVo;

@Controller
@RequestMapping(value="/membershipfee/{groupNo}")
public class MembershipController {

	@Autowired
	private ModuGroupService groupService;

	@RequestMapping("")
	public String membershipFeeStart(HttpSession session, Model model, @PathVariable("groupNo") int groupNo) {
		System.out.println("/회비설정 전 첫화면");

		// 모임 카테고리
		ModuUserVo uservo = (ModuUserVo) session.getAttribute("authUser");
		List<ModuGroupVo> gList = groupService.selectGroup(uservo.getUserNo());
		model.addAttribute("gList", gList);

		// 클릭한 모임 회비설정 보여주기
		ModuGroupVo gvo = groupService.selectGroupImg(groupNo);
		model.addAttribute("gvo", gvo);

		return "/membership/membershipFeeStart";
	}

	@RequestMapping("/membershipsetting")
	public String membershipSetting(HttpSession session, Model model, @PathVariable("groupNo") int groupNo) {
		System.out.println("/회비 설정하기");

		// 모임 카테고리
		ModuUserVo uservo = (ModuUserVo) session.getAttribute("authUser");
		List<ModuGroupVo> gList = groupService.selectGroup(uservo.getUserNo());
		model.addAttribute("gList", gList);

		// 클릭한 모임 회비설정 보여주기
		ModuGroupVo gvo = groupService.selectGroupImg(groupNo);
		model.addAttribute("gvo", gvo);

		return "/membership/membershipSetting";
	}

	@RequestMapping("/feemanage")
	public String feemanage(HttpSession session, Model model, @PathVariable("groupNo") int groupNo) {
		System.out.println("회비관리페이지");

		// 모임 카테고리
		ModuUserVo uservo = (ModuUserVo) session.getAttribute("authUser");
		List<ModuGroupVo> gList = groupService.selectGroup(uservo.getUserNo());
		model.addAttribute("gList", gList);

		// 클릭한 모임 회비관리 보여주기
		ModuGroupVo gvo = groupService.selectGroupImg(groupNo);
		model.addAttribute("gvo", gvo);

		return "/membership/feeManage";
	}

}
