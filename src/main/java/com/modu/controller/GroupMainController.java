package com.modu.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.modu.service.ModuGroupService;
import com.modu.vo.ModuGroupVo;
import com.modu.vo.ModuUserVo;

@Controller
@RequestMapping(value="/groupmain/{groupNo}")
public class GroupMainController {

	@Autowired
	private ModuGroupService groupService;

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
        
        //
        model.addAttribute("area", "수원");

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
	public Set<String> search(String address) {
		StringBuilder html = new StringBuilder();
		String url = "https://openapi.naver.com/v1/search/local.xml?query=" + address + "&display=6&start=1&sort=random"; // encodeURIComponent로 인코딩 된 주소
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
		
			Set<String> addrSet = new HashSet<String>();
			int length = html.length();
			int addrStart = 0;
			int addrEnd = 0;
			int titleStart = 0;
			int titleEnd = 0;
			boolean firstFlag = true;
			
			while(addrEnd<length) {
				titleStart = html.indexOf("<title>",titleEnd);
				titleStart += 7;
				titleEnd = html.indexOf("</title>",titleEnd);
				
				if(firstFlag) {
					firstFlag = false;
					titleEnd = titleEnd+8;
					continue;
				}
				
				addrStart = html.indexOf("<address>",addrEnd);
				if(addrStart == -1 ) {
					break;
				}else {
					addrStart += 9;
				}
				addrEnd = html.indexOf("</address>",addrEnd);

				String addr = html.substring(addrStart,addrEnd);
				String title = html.substring(titleStart,titleEnd).replaceAll("&lt;b&gt;"," ").replaceAll("&lt;/b&gt;"," ");
				addrSet.add(title+" / "+addr);
				
				if(addrSet.size() >= 6) {
					break;
				}
				
				addrEnd = addrEnd+10;
				titleEnd = titleEnd+8;
			}
			//String addr = html.substring(html.indexOf("<address>")+9,html.indexOf("</address>"));
			
	     	return addrSet;
	}
}
