package com.modu.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.modu.service.ModuAccountbookService;
import com.modu.service.ModuGroupService;
import com.modu.service.ModuUserService;
import com.modu.vo.AccountbookCategoryVo;
import com.modu.vo.AccountbookTagVo;
import com.modu.vo.ModuGroupVo;
import com.modu.vo.ModuUserVo;

@Controller
@RequestMapping(value="/accountbook/{groupNo}")
public class AccountBookController {

	@Autowired
	private ModuUserService moduUserService;	
	@Autowired
	private ModuAccountbookService moduAccountbookService;
	@Autowired
	private ModuGroupService groupService;

	@RequestMapping("")
	public String accountbook(@PathVariable("groupNo") String groupNo,Model model, HttpSession session){

		// 모임 카테고리
	      ModuUserVo uservo =  (ModuUserVo) session.getAttribute("authUser");
	      List<ModuGroupVo> gList  = groupService.selectGroup(uservo.getUserNo());
	      model.addAttribute("gList",gList);

	      // 클릭한 모임  가계부 보여주기
	      ModuGroupVo gvo = groupService.selectGroupImg(Integer.parseInt(groupNo));
	      model.addAttribute("gvo",gvo);

		return "/accountbook/accountbook";
	}
	
	@RequestMapping("/{urlDate}")
	public String accountbook(@PathVariable("groupNo") String groupNo,Model model, HttpSession session, @PathVariable("urlDate") String urlDate){

		// 모임 카테고리
	      ModuUserVo uservo =  (ModuUserVo) session.getAttribute("authUser");
	      List<ModuGroupVo> gList  = groupService.selectGroup(uservo.getUserNo());
	      model.addAttribute("gList",gList);

	      // 클릭한 모임  가계부 보여주기
	      ModuGroupVo gvo = groupService.selectGroupImg(Integer.parseInt(groupNo));
	      model.addAttribute("gvo",gvo);
	      
	      String yy = urlDate.substring(0, 4);
	      String mm = urlDate.substring(6, 8);
	      
	      model.addAttribute("urlDate",yy + " / " + mm);

		return "/accountbook/accountbook";
	}
	
	@ResponseBody
	@RequestMapping( "/getaccountlist")
	public Map<String,Object> getAccountList(@RequestParam("month") String month,
			                                 @RequestParam("spendFlag") String spendFlag,@PathVariable("groupNo") String groupNo){

		Map<String,Object> map = moduAccountbookService.getAccountList(groupNo,month,spendFlag);
		return map;
	}
	
	@ResponseBody
	@RequestMapping( "/saveaccountbook")
	public int saveaccountbook(
			@RequestParam( value="usage", required=false, defaultValue="사용내역") String usage,
			@RequestParam( value="spend", required=false, defaultValue="0") String spend,
			@RequestParam( value="category", required=false, defaultValue="0") String category,
			@PathVariable("groupNo") String groupNo,
			@RequestParam("date") String date,
			@RequestParam("spendFlag") String spendFlag){
		return moduAccountbookService.saveAccountbook(usage,spend,category,groupNo,date,spendFlag);
	}
	
	@ResponseBody
	@RequestMapping( "/deleteaccountbook")
	public void deleteaccountbook(@RequestParam("AccountbookList") String AccountbookList){
		moduAccountbookService.deleteaccountbook(AccountbookList);
	}
	
	@ResponseBody
	@RequestMapping( "/updateaccountbook")
	public void updateaccountbook(@RequestParam("accountbookno") String accountbookno, @RequestParam("data") String data, @RequestParam("updatePos") String updatePos, @RequestParam("spendFlag") String spendFlag){
		moduAccountbookService.updateAccountbook(accountbookno,data,updatePos,spendFlag);
	}
	
	@ResponseBody
	@RequestMapping( "/taggroup")
	public void taggroup(@RequestParam("AccountbookList") String AccountbookList,@RequestParam("tagName") String tagName){
		moduAccountbookService.taggroup(AccountbookList,tagName);
	}

	
	@ResponseBody
	@RequestMapping( "/searchaccountlistbydate")
	public Map<String,Object> searchAccountListByDate(@PathVariable("groupNo") String groupNo, @RequestParam("searchDate1") String searchDate1, @RequestParam("searchDate2") String searchDate2, @RequestParam("spendFlag") String spendFlag){
		Map<String,Object> map = moduAccountbookService.searchAccountListByDate(groupNo,searchDate1,searchDate2,spendFlag);
		return map;
	}
	
	@ResponseBody
	@RequestMapping( "/searchaccountlist")
	public Map<String,Object> searchAccountList(@PathVariable("groupNo") String groupNo, @RequestParam("mode") String mode, @RequestParam("searchText") String searchText, @RequestParam("spendFlag") String spendFlag){
		Map<String,Object> map = moduAccountbookService.searchAccountList(groupNo,mode,searchText,spendFlag);
		return map;
	}
	
	@ResponseBody
	@RequestMapping( "/inserttag")
	public AccountbookTagVo insertTag(@RequestParam("accountbookNo") String accountbookNo, @RequestParam("tagname") String tagname){	
		return moduAccountbookService.insertTag(accountbookNo,tagname);
	}
	
	@ResponseBody
	@RequestMapping( "/updateTag")
	public void updateTag(@RequestParam("accountbookNo") String accountbookNo, @RequestParam("accountbooktagno") String accountbooktagno, @RequestParam("tagno") String tagno, @RequestParam("tagname") String tagname){	
		moduAccountbookService.updateTag(accountbookNo,accountbooktagno,tagno,tagname);
	}
	
	@ResponseBody
	@RequestMapping( "/getTagList")
	public List<AccountbookTagVo> getTagList(@RequestParam("accountNo") String accountNo){
		return moduAccountbookService.getTagList(accountNo);
	}
	
	@ResponseBody
	@RequestMapping( "/tagDelete")
	public void tagDelete(@RequestParam("accountbooktagno") String accountbooktagno,@RequestParam("tagno") String tagno){
		moduAccountbookService.tagDelete(accountbooktagno,tagno);
	}
	
	@ResponseBody
	@RequestMapping( "/getcategorylist")
	public List<AccountbookCategoryVo> getcategorylist(@PathVariable("groupNo") String groupNo){
		return moduAccountbookService.getCategoryList(groupNo);
	}
	
	@ResponseBody
	@RequestMapping( "/categorydelete")
	public void categorydelete(@PathVariable("groupNo") String groupNo,@RequestParam("categoryno") String categoryno){
		moduAccountbookService.categoryDelete(groupNo,categoryno);
	}
	
	@ResponseBody
	@RequestMapping( "/updatecategory")
	public void updateCategory(@RequestParam("categoryno") String categoryno,@RequestParam("categoryname") String categoryname){
		moduAccountbookService.categoryUpdate(categoryno,categoryname);
	}
	
	@ResponseBody
	@RequestMapping( "/insertcategory")
	public int insertCategory(@PathVariable("groupNo") String groupNo,@RequestParam("categoryname") String categoryname){
		return moduAccountbookService.categoryInsert(groupNo,categoryname);
	}

	///////////////////////////////////////로그인/////////////////////////////////////////////
	
	@RequestMapping( "/login")
	public String login(HttpSession session,Model model){
		int userNo = 1;
		
		Map<String,Object> map = moduUserService.login(userNo);
		ModuUserVo authUser = (ModuUserVo) map.get("user"); 
		ModuGroupVo group = (ModuGroupVo) map.get("group"); 

		if (authUser != null) {
			session.setAttribute("authUser", authUser);
			session.setAttribute("group", group);
			System.out.println("asdf"+group.toString());
			return "redirect:/accountbook/accountbook";
		} else {
			model.addAttribute("result", "fail");
			return "redirect:/main";
		}
	}
	
	@RequestMapping( "/test")
	public String test(){

		return "/accountbook/test";
	}
	
	
	@RequestMapping(value = "/trans")
	@ResponseBody
	public String trans(String address) {
		StringBuilder html = new StringBuilder();
		String url = "https://openapi.naver.com/v1/map/geocode?query=" + address; // encodeURIComponent로 인코딩 된 주소
		String clientId = "YX8YchtPnKuE7FGKGyW6";
		String clientSecret = "gnH5o9GF66";

		HttpClient client = HttpClientBuilder.create().build();
		HttpGet request = new HttpGet(url);
		request.addHeader("X-Naver-Client-Id", clientId);  //해더에 Clinet Id와 Client Secret을 넣습니다
		request.addHeader("X-Naver-Client-Secret", clientSecret);
		try {
			HttpResponse response = client.execute(request);
			BufferedReader reader = new BufferedReader(new InputStreamReader(response.getEntity().getContent(), "UTF-8"));
			String current = "";
			while ((current = reader.readLine()) != null) {
				html.append(current);
			}
			reader.close();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	     	return html.toString();
	 }
	
	@RequestMapping(value = "/search")
	@ResponseBody
	public List<String> search(String address) {
		StringBuilder html = new StringBuilder();
		String url = "https://openapi.naver.com/v1/search/local.xml?query=" + address + "&display=50&start=1&sort=random"; // encodeURIComponent로 인코딩 된 주소
		String clientId = "YX8YchtPnKuE7FGKGyW6";
		String clientSecret = "gnH5o9GF66";

		HttpClient client = HttpClientBuilder.create().build();
		HttpGet request = new HttpGet(url);
		request.addHeader("X-Naver-Client-Id", clientId);  //해더에 Clinet Id와 Client Secret을 넣습니다
		request.addHeader("X-Naver-Client-Secret", clientSecret);
		try {
			HttpResponse response = client.execute(request);
			BufferedReader reader = new BufferedReader(new InputStreamReader(response.getEntity().getContent(), "UTF-8"));
			String current = "";
			while ((current = reader.readLine()) != null) {
				html.append(current);
			}
			reader.close();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
			List<String> addrList = new ArrayList<String>();
			int length = html.length();
			int start = 0;
			int end = 0;
			while(end<length) {
				start = html.indexOf("<address>",end);
				if(start == -1 ) {
					break;
				}else {
					start += 9;
				}
				end = html.indexOf("</address>",end);
				
				addrList.add(html.substring(start,end));	
				end = end+10;
			}
			
			//String addr = html.substring(html.indexOf("<address>")+9,html.indexOf("</address>"));

	     	return addrList;
	 }

}
