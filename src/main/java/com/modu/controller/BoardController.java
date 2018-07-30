package com.modu.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.modu.service.BoardService;
import com.modu.service.ModuGroupService;
import com.modu.vo.BoardVo;
import com.modu.vo.FileVo;
import com.modu.vo.ModuGroupVo;
import com.modu.vo.ModuUserVo;

@Controller
@RequestMapping("/board/{groupNo}")
public class BoardController {

	 
	@Autowired
	BoardService service;
	@Autowired
	private ModuGroupService groupService;



	@RequestMapping(value="", method={RequestMethod.GET,RequestMethod.POST})
	public String goBoard(Model model, @PathVariable("groupNo") int groupNo, HttpSession session){

		// 모임 카테고리
	    ModuUserVo uservo =  (ModuUserVo) session.getAttribute("authUser");
		List<ModuGroupVo> gList  = groupService.selectGroup(uservo.getUserNo());
		model.addAttribute("gList",gList);

		// 클릭한 모임  가계부 보여주기
	    ModuGroupVo gvo = groupService.selectGroupImg(groupNo);
		model.addAttribute("gvo",gvo);
		
		int postCheck= service.postCheck(groupNo);
	    
		if(postCheck==0) {
			System.out.println("리스트 없음");
			return "/board/boardStart";
			
		} else {
		
			System.out.println("리스트 있음");
			return "/board/board";
			
		}
	}
	

	@ResponseBody
	@RequestMapping(value="/getList",method= {RequestMethod.GET, RequestMethod.POST})
	public List<BoardVo> getList(HttpSession session) {
		
		ModuUserVo authUser = (ModuUserVo)session.getAttribute("authUser");
		String userNo = String.valueOf(authUser.getUserNo());
		BoardVo boardVo = new BoardVo();
		boardVo.setUserNo(userNo);
		boardVo.setGroupNo(authUser.getGroupNo());
		List<BoardVo> postList =(List<BoardVo>)service.getPostList(boardVo);
		System.out.println(postList);
		return postList;
	
	}

	
	@ResponseBody
	@RequestMapping(value="/delete",method= {RequestMethod.GET, RequestMethod.POST})
	public int deletePost(@RequestParam String boardNo) {
		
		int flag = service.deletePost(boardNo);
		return flag;
		
	}
	
	
	@RequestMapping("/write")
	public String goBoardWrite(Model model, @PathVariable("groupNo") int groupNo, HttpSession session){

		// 모임 카테고리
	    ModuUserVo uservo =  (ModuUserVo) session.getAttribute("authUser");
		List<ModuGroupVo> gList  = groupService.selectGroup(uservo.getUserNo());
		model.addAttribute("gList",gList);

		// 클릭한 모임  가계부 보여주기
	    ModuGroupVo gvo = groupService.selectGroupImg(groupNo);
		model.addAttribute("gvo",gvo);

		List<BoardVo> tagList=service.getTagList(groupNo);
		model.addAttribute("tagList",tagList);
		System.out.println(tagList);
		System.out.println("글쓰기 입장");
		return "/board/boardWrite";
		
	}
	
	@RequestMapping("/modifyForm/{boardNo}")
	public String goBoardModify(Model model, @PathVariable("groupNo") int groupNo, HttpSession session,
								 @PathVariable("boardNo") int boardNo){

		// 모임 카테고리
	    ModuUserVo uservo =  (ModuUserVo) session.getAttribute("authUser");
		List<ModuGroupVo> gList  = groupService.selectGroup(uservo.getUserNo());
		model.addAttribute("gList",gList);

		// 클릭한 모임  가계부 보여주기
	    ModuGroupVo gvo = groupService.selectGroupImg(groupNo);
		model.addAttribute("gvo",gvo);

		BoardVo boardVo = service.getPost(boardNo);
		model.addAttribute("boardVo",boardVo);
		List<BoardVo> tagList=service.getTagList(groupNo);
		model.addAttribute("tagList",tagList);
		System.out.println(tagList);
		System.out.println("글수정 입장");
		return "/board/boardMod";
		
	}
	
	@RequestMapping(value="/modify/{boardNo}",method=RequestMethod.POST)
	public String modiPost(  @PathVariable("groupNo") int groupNo,
			                @ModelAttribute BoardVo boardVo,
							@RequestParam("files") MultipartFile[] files ,
							@ModelAttribute FileVo fileVo,
							@PathVariable("boardNo") int boardNo,
							Model model) {
		
		System.out.println("@@@@@@글쓰기 수정 오긴 왔음"+boardVo.getAccountList()+"\n");
		/*service.addPost(boardVo);*/
		
		boardVo.setGroupNo(groupNo);
	
/*
		System.out.println("컨트롤러 :" + fileVo.getUserNo());
		System.out.println("보드VO확인용 - " + boardVo.toString());
		System.out.println("파일VO확인용 - " + fileVo.toString());
		System.out.println("파일 확인용 - " + fileVo.toString());*/
	/*	System.out.println("배열로 받아지는지 보자" +file.getOriginalFilename());*/
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fileVo", fileVo);
		map.put("files",files);
		
		service.addPost(boardVo,map);



	
		
		return "redirect:/board/"+groupNo;
		
		
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String addPost(  @PathVariable("groupNo") int groupNo,
			                @ModelAttribute BoardVo boardVo,
							@RequestParam("files") MultipartFile[] files ,
							@ModelAttribute FileVo fileVo,
							Model model) {
		
		System.out.println("@@@@@@글쓰기 저장 오긴 왔음"+boardVo.getAccountList()+"\n");
		/*service.addPost(boardVo);*/
		
		boardVo.setGroupNo(groupNo);
	
/*
		System.out.println("컨트롤러 :" + fileVo.getUserNo());
		System.out.println("보드VO확인용 - " + boardVo.toString());
		System.out.println("파일VO확인용 - " + fileVo.toString());
		System.out.println("파일 확인용 - " + fileVo.toString());*/
	/*	System.out.println("배열로 받아지는지 보자" +file.getOriginalFilename());*/
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fileVo", fileVo);
		map.put("files",files);
		
		service.addPost(boardVo,map);



	
		
		return "redirect:/board/"+groupNo;
		
		
	}
	
	@ResponseBody
	@RequestMapping(value="/addImg/{boardNo}",method=RequestMethod.POST)
	public List<FileVo> addImg(  @PathVariable("groupNo") int groupNo,
							@RequestParam("files") MultipartFile[] files ,
							@ModelAttribute FileVo fileVo,
							@PathVariable("boardNo") String boardNo,
							HttpSession session,
							Model model) {
		
		System.out.println("@@@@@@글쓰기 저장 오긴 왔음"+files);
		/*service.addPost(boardVo);*/
		
		ModuUserVo authUser = (ModuUserVo)session.getAttribute("authUser");
		fileVo.setUserNo(String.valueOf(authUser.getUserNo()));
		fileVo.setBoardNo(boardNo);
		
		
		System.out.println("컨트롤러 :" + fileVo.getUserNo());
		System.out.println("파일VO확인용 - " + fileVo.toString());
		System.out.println("파일 확인용 - " + fileVo.toString());
		System.out.println("배열로 받아지는지 보자" +files[0].getOriginalFilename());
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fileVo", fileVo);
		map.put("files",files);
		
		List<FileVo> imgList= service.addImg(map);
	
		
		return imgList;
		
		
	}
	
	@ResponseBody
	@RequestMapping(value="/addCmt", method=RequestMethod.POST)
	public int addCmt(@ModelAttribute BoardVo boardVo, HttpSession session) {

		ModuUserVo authVo = (ModuUserVo)session.getAttribute("authUser");
		String userNo = String.valueOf(authVo.getUserNo());
		boardVo.setUserNo(userNo);
		System.out.println("댓글~"+boardVo.toString());
		int cmtCount = service.addCmt(boardVo);
		return cmtCount;

	}

	@ResponseBody
	@RequestMapping(value="/getCmtList", method=RequestMethod.POST)
	public List<BoardVo> getCmtList(@ModelAttribute BoardVo boardVo) {

		List<BoardVo> list= service.getCmtList(boardVo);
		return list;
	}


	@ResponseBody
	@RequestMapping(value="/upLike")
	public BoardVo upLike(@ModelAttribute BoardVo boardVo, HttpSession session) {
		
		ModuUserVo authVo=(ModuUserVo)session.getAttribute("authUser");
		String userNo = String.valueOf(authVo.getUserNo());
		boardVo.setUserNo(userNo);
		System.out.println("스테이트"+boardVo.getLikeState());
		BoardVo resultVo = service.updateLike(boardVo);
		System.out.println("서비스 다녀온"+resultVo.getLikeState());
		System.out.println("좋아요 수"+resultVo.getLikeCount());
		
		return resultVo;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/delCmt", method=RequestMethod.POST)
	public int deleteCmt(@ModelAttribute BoardVo boardVo){

		int cmtCount = service.deleteCmt(boardVo);
		return cmtCount;
	}

	
	@ResponseBody
	@RequestMapping(value="/getAccountList", method=RequestMethod.POST)
	public List<BoardVo> getAccountBook(@ModelAttribute BoardVo boardVo) {
		
		List<BoardVo> list = service.getAccountList(boardVo);
		System.out.println("$$$$$$$$$ 확인하겠소--"+list);
		return list;
		
	}

	
	@ResponseBody
	@RequestMapping(value="/getAccountListByDate", method=RequestMethod.POST)
	public List<BoardVo> getAccountBookByDate(@ModelAttribute BoardVo boardVo, @PathVariable("groupNo") int groupNo ) {
		
		boardVo.setGroupNo(groupNo);
		System.out.println("$$$$$$$$$ 날짜로 불러오기 "+boardVo.getAccountbookRegDate());
		List<BoardVo> list = service.getAccountBookByDate(boardVo);
		return list;
		
	}

	
	
	@RequestMapping("/goCal")
	public String calendar(Model model, @PathVariable("groupNo") int groupNo
								){

	
		return "/board/Calender2";
		
	}
	@RequestMapping("/goAuto")
	public String auto(Model model, @PathVariable("groupNo") int groupNo
			){
		
		
		return "/board/autoComplete";
		
	}


}
	/*
	@ResponseBody
	@RequestMapping(value="/getPostList",method=RequestMethod.POST)
	public List<BoardVo> getPostList() {
		
		
		List<BoardVo> list= service.getPostList();
		return list;
	}
	*/
	
	


