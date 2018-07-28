package com.modu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.modu.service.ModuGroupService;
import com.modu.vo.ModuGroupVo;
import com.modu.vo.ModuUserVo;
import com.modu.vo.UserGroupVo;

@Controller
//@RequestMapping(value="/groupmanage/{groupNo}")
public class GroupManageController {

	@Autowired
	private ModuGroupService groupService;

	@RequestMapping("/groupmanage/{groupNo}")
	public String groupmanage(Model model, HttpSession session, @PathVariable("groupNo") int groupNo) {
		System.out.println("모임관리");

		// 모임 카테고리
		ModuUserVo uservo = (ModuUserVo) session.getAttribute("authUser");
		List<ModuGroupVo> gList = groupService.selectGroup(uservo.getUserNo());
		model.addAttribute("gList", gList);

		// 클릭한 모임 모임관리 보여주기
		ModuGroupVo gvo = groupService.selectGroupImg(groupNo);
		model.addAttribute("gvo", gvo);
		
		// 가입신청자 리스트 보여주기 
		List<UserGroupVo> joinList = groupService.selectJoinList(groupNo); 
		model.addAttribute("joinList",joinList);
		
		// 회원명단 보여주기 
		List<UserGroupVo> selectUserList = groupService.selectUserList(groupNo);
		model.addAttribute("selectUserList",selectUserList);

		return "/group/groupManage";
	}
	
	
	@ResponseBody
	@RequestMapping("/check")
		public List<UserGroupVo> check(UserGroupVo usergroupvo ,HttpSession session) {
		
		ModuUserVo uservo =  (ModuUserVo)session.getAttribute("authUser");
		usergroupvo.setGroupNo(uservo.getGroupNo());
		
		List<UserGroupVo> List = groupService.joinCheck(usergroupvo);
		return List;
		}
	
	@ResponseBody
	@RequestMapping("/deleteUser")
	public int deleteUser(@RequestParam("user_groupNo")int user_groupNo) {
		int no = groupService.deleteUser(user_groupNo);
		System.out.println("추방성공");
		return no;
	}

	@RequestMapping(value="/updateMana", method=RequestMethod.POST )
	public String updateMana(UserGroupVo usergroupvo,Model model, HttpSession session) {
		System.out.println("유저번호랑 모임번호 들어갔는지 확인하자"+usergroupvo.toString());
		int no = groupService.updateMana(usergroupvo);
		System.out.println(no+"총무위임성공");
		
		 // 모임 카테고리
		  ModuUserVo uservo = (ModuUserVo) session.getAttribute("authUser");
		  List<ModuGroupVo> gList = groupService.selectGroup(uservo.getUserNo());
		  model.addAttribute("gList", gList);
		  
		  // 클릭한 모임 모임관리 보여주기
		  ModuGroupVo gvo = groupService.selectGroupImg(usergroupvo.getGroupNo());
		  model.addAttribute("gvo", gvo);
		
		return "/index";
	}
	
	
	@RequestMapping(value="/groupModify", method=RequestMethod.POST)
	public String groupModify(ModuGroupVo groupvo, @RequestParam("file") MultipartFile multipartFile,Model model, HttpSession session) {
		
		
		  groupService.updateGroup(groupvo, multipartFile);
		
		  // 모임 카테고리
		  ModuUserVo uservo = (ModuUserVo) session.getAttribute("authUser");
		  List<ModuGroupVo> gList = groupService.selectGroup(uservo.getUserNo());
		  model.addAttribute("gList", gList);
		  
		  // 클릭한 모임 모임관리 보여주기
		  ModuGroupVo gvo = groupService.selectGroupImg(groupvo.getGroupNo());
		  model.addAttribute("gvo", gvo);
		  return"/group/groupManage";
	}

	@RequestMapping(value = "/plusgroup", method = RequestMethod.POST)
	public String groupstart(ModuGroupVo groupvo, @RequestParam("file") MultipartFile multipartFile, Model model,
			UserGroupVo usergroupvo) {
		System.out.println("그룹생성후 첫 화면");
		System.out.println(groupvo.toString());

		List<ModuGroupVo> gList = groupService.plusGroup(groupvo, multipartFile, usergroupvo);
		model.addAttribute("gList", gList);

		return "/group/firstGroupPage";
	}

	@RequestMapping(value = "/joinGroup", method = RequestMethod.POST)
	public String joinGroup(@RequestParam("gSearch")String gSearch,UserGroupVo usergroupvo, Model model, HttpSession session) {
		ModuUserVo uservo = (ModuUserVo) session.getAttribute("authUser");

		if (uservo != null) {
			List<ModuGroupVo> gList = groupService.selectGroup(uservo.getUserNo());
			model.addAttribute("gList", gList);
		}

		List<ModuGroupVo> searchList = groupService.searchGroup(gSearch);
		model.addAttribute("searchList",searchList);

		usergroupvo.setUserNo(uservo.getUserNo());
		ModuGroupVo groupName = groupService.insertJoin(usergroupvo);
		model.addAttribute("gName", groupName);

		return "/group/groupSearch";
	}

}
