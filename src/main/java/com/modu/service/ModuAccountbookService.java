package com.modu.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.modu.dao.ModuAccountbookDao;
import com.modu.vo.AccountbookCategoryVo;
import com.modu.vo.AccountbookTagVo;
import com.modu.vo.AccountbookVo;

@Service
public class ModuAccountbookService {
	
	@Autowired
	private ModuAccountbookDao moduAccountbookDao;
	
	@Transactional
	public Map<String,Object> getAccountList(String groupNo,String month,String spendFlag) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("groupNo", groupNo);
		map.put("spendFlag", spendFlag);
		System.out.println(month);
		
		Calendar cal = Calendar.getInstance();
		int y = Integer.parseInt(month.substring(0, 4));
		int m = Integer.parseInt(month.substring(7, 9));
		cal.set(y, m, 1);
		cal.add(Calendar.DATE, -1);
		 
		String startDate = month.replace(" ", "") + "/01";
		String endDate = month.replace(" ", "") + "/" + cal.get(Calendar.DATE);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		Map<String,Object> returnMap = new HashMap<String,Object>();
		List<AccountbookVo> accountList = moduAccountbookDao.getAccountList(map);
		List<AccountbookTagVo> tagList = moduAccountbookDao.getTagListByGroupNo(groupNo);
			
		for(int i=0; i< accountList.size(); i++) {
			String tagName = "";
			int count = 0;
			for(int j=0; j< tagList.size(); j++) {
				if(accountList.get(i).getAccountbookno() == tagList.get(j).getAccountbookno() && count == 0) {
					tagName =  tagName + tagList.get(j).getTagname();	
					count++;
				}else if(accountList.get(i).getAccountbookno() == tagList.get(j).getAccountbookno() && count != 0) {
					tagName =  tagName + "," + tagList.get(j).getTagname();	
				}
			}
			accountList.get(i).setTagName(tagName);
		}		
		
		returnMap.put("accountList", accountList);
		
		List<AccountbookCategoryVo> categoryList = moduAccountbookDao.getCategoryList(groupNo);
		returnMap.put("categoryList", categoryList);
		
		List<AccountbookCategoryVo> chartDataList = moduAccountbookDao.getChartDataByDate(map);
		returnMap.put("chartDataList", chartDataList);

		return returnMap;
	}
	
	@Transactional
	public AccountbookVo saveAccountbook(String usage,String spend,String category,String groupNo,String date,String spendFlag) {
		
		AccountbookVo accountbookVo = new AccountbookVo();
		if(!usage.equals("사용내역")) {
			List<AccountbookCategoryVo> cateList = moduAccountbookDao.getRecommendCategory(usage);
			if(!cateList.isEmpty()) {
				category = String.valueOf(cateList.get(0).getCategoryNo());
			}
		}
		
		accountbookVo.setAccountbookUsage(usage);
		accountbookVo.setAccountbookSpend(Integer.parseInt(spend));
		accountbookVo.setCategoryNo(Integer.parseInt(category));
		accountbookVo.setGroupNo(Integer.parseInt(groupNo));
		String y = date.substring(0, 4);
		String m = date.substring(6, 8);
		String d = date.substring(10, 12);
		accountbookVo.setAccountbookRegDate(y+"/"+m+"/"+d);

		if(spendFlag.equals("spend")) {
			moduAccountbookDao.saveAccountbookSpend(accountbookVo);
		}else {
			moduAccountbookDao.saveAccountbookIncome(accountbookVo);
		}
		
		return accountbookVo;
	}
	
	@Transactional
	public void deleteaccountbook(String AccountbookList) {		
		AccountbookList = AccountbookList.substring(1);
		String[] array = AccountbookList.split(",");
		
		ArrayList<String> Acclist = new ArrayList<>();

		for(String item : array) {
			Acclist.add(item);
		}
		
		Map map = new HashMap();
		
		map.put("Acclist", Acclist);
		
		moduAccountbookDao.deleteTag(map);
		moduAccountbookDao.deleteaccountbook(map);
	}
	
	@Transactional
	public void taggroup(String AccountbookList, String tagName) {		
		AccountbookList = AccountbookList.substring(1);
		String[] array = AccountbookList.split(",");
		
		ArrayList<String> Acclist = new ArrayList<>();

		for(String item : array) {
			Acclist.add(item);
		}
		
		Map map = new HashMap();
		
		map.put("Acclist", Acclist);
		
		AccountbookTagVo accountbookTagVo = new AccountbookTagVo();
		
		accountbookTagVo.setTagname(tagName);
		AccountbookTagVo tempTag;
		tempTag = moduAccountbookDao.checkTag(accountbookTagVo);	
		if(tempTag == null) {
			tempTag = moduAccountbookDao.insertTag(accountbookTagVo);
		}
		tempTag.setTagname(tagName);
		map.put("tagno", tempTag.getTagno());
		moduAccountbookDao.connectTagGroup(map);
	}
	
	@Transactional
	public void updateAccountbook(String accountbookno, String data, String updatePos, String spendFlag) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("accountbookno", accountbookno);
		if(updatePos.equals("accountbookregdate")) {
			String y = data.substring(0, 4);
			String m = data.substring(6, 8);
			String d = data.substring(10, 12);
			data=y+"/"+m+"/"+d;
		}
		map.put("data", data);
		map.put("updatePos", updatePos);
		map.put("spendFlag", spendFlag);
		moduAccountbookDao.updateAccountbook(map);
	}
	
	@Transactional
	public Map<String,Object> searchAccountListByDate(String groupNo,String searchDate1,String searchDate2,String spendFlag) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("groupNo", groupNo);
		map.put("spendFlag", spendFlag);
		String sy = searchDate1.substring(0, 4);
		String sm = searchDate1.substring(6, 8);
		String sd = searchDate1.substring(10, 12);
		
		String ey = searchDate2.substring(0, 4);
		String em = searchDate2.substring(6, 8);
		String ed = searchDate2.substring(10, 12);

		searchDate1 = sy+"/"+sm+"/"+sd;
		searchDate2 = ey+"/"+em+"/"+ed;
		map.put("startDate", searchDate1);
		map.put("endDate", searchDate2);
		
		Map<String,Object> returnMap = new HashMap<String,Object>();
		List<AccountbookVo> accountList = moduAccountbookDao.getAccountList(map);
		List<AccountbookTagVo> tagList = moduAccountbookDao.getTagListByGroupNo(groupNo);
		
		for(int i=0; i< accountList.size(); i++) {
			String tagName = "";
			int count = 0;
			for(int j=0; j< tagList.size(); j++) {
				if(accountList.get(i).getAccountbookno() == tagList.get(j).getAccountbookno() && count == 0) {
					tagName =  tagName + tagList.get(j).getTagname();	
					count++;
				}else if(accountList.get(i).getAccountbookno() == tagList.get(j).getAccountbookno() && count != 0) {
					tagName =  tagName + "," + tagList.get(j).getTagname();	
				}
			}
			accountList.get(i).setTagName(tagName);
		}	
		returnMap.put("accountList", accountList);
		
		List<AccountbookCategoryVo> categoryList = moduAccountbookDao.getCategoryList(groupNo);
		returnMap.put("categoryList", categoryList);
		
		List<AccountbookCategoryVo> chartDataList = moduAccountbookDao.getChartDataByDate(map);
		returnMap.put("chartDataList", chartDataList);

		return returnMap;
	}
	
	@Transactional
	public Map<String,Object> searchAccountList(String groupNo,String mode,String searchText,String spendFlag) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("groupNo", groupNo);
		map.put("data", "%"+searchText+"%");
		map.put("spendFlag", spendFlag);
		
		Map<String,Object> returnMap = new HashMap<String,Object>();		
		List<AccountbookVo> accountList = null;
		List<AccountbookTagVo> tagList = moduAccountbookDao.getTagListByGroupNo(groupNo);
		if(mode.equals("2")) {
			accountList = moduAccountbookDao.searchAccountListByTag(map);
			tagList = moduAccountbookDao.getTagListByTagName(map);
			
			List<AccountbookCategoryVo> chartDataList = moduAccountbookDao.getChartDataByTag(map);
			returnMap.put("chartDataList", chartDataList);
			
		}else if (mode.equals("3")) {
			accountList = moduAccountbookDao.searchAccountListByUsage(map);		
			tagList = moduAccountbookDao.getTagListByGroupNo(groupNo);
			
			List<AccountbookCategoryVo> chartDataList = moduAccountbookDao.getChartDataByUsage(map);
			returnMap.put("chartDataList", chartDataList);
		}
		
		
		
		for(int i=0; i< accountList.size(); i++) {
			String tagName = "";
			int count = 0;
			for(int j=0; j< tagList.size(); j++) {
				if(accountList.get(i).getAccountbookno() == tagList.get(j).getAccountbookno() && count == 0) {
					tagName =  tagName + tagList.get(j).getTagname();	
					count++;
				}else if(accountList.get(i).getAccountbookno() == tagList.get(j).getAccountbookno() && count != 0) {
					tagName =  tagName + "," + tagList.get(j).getTagname();	
				}
			}
			accountList.get(i).setTagName(tagName);
		}
		returnMap.put("accountList", accountList);
		
		List<AccountbookCategoryVo> categoryList = moduAccountbookDao.getCategoryList(groupNo);
		returnMap.put("categoryList", categoryList);

		return returnMap;
	}
	
	@Transactional
	public AccountbookTagVo insertTag(String accountbookNo,String tagname) {
		AccountbookTagVo accountbookTagVo = new AccountbookTagVo();
		
		accountbookTagVo.setAccountbookno(Integer.parseInt(accountbookNo));
		accountbookTagVo.setTagname(tagname);

		int accountbookno = accountbookTagVo.getAccountbookno();
		
		AccountbookTagVo tempTag;
		tempTag = moduAccountbookDao.checkTag(accountbookTagVo);	
		
		if(tempTag == null) {
			tempTag = moduAccountbookDao.insertTag(accountbookTagVo);
		}
		tempTag.setAccountbookno(accountbookno);	
		
		moduAccountbookDao.connectTag(tempTag);
		
		return tempTag;
	}
	
	@Transactional
	public void updateTag(String accountbookno,String accountbooktagno,String tagno,String tagname) {
		AccountbookTagVo accountbookTagVo = new AccountbookTagVo(Integer.parseInt(accountbooktagno),Integer.parseInt(accountbooktagno),
				Integer.parseInt(tagno),tagname);

		AccountbookTagVo tempTag;
		tempTag = moduAccountbookDao.checkTag(accountbookTagVo);
		
		if(tempTag == null) {
			tempTag = moduAccountbookDao.insertTag(accountbookTagVo);
		}

		tempTag.setAccountbooktagno(Integer.parseInt(accountbooktagno));
		tempTag.setAccountbookno(Integer.parseInt(accountbookno));

		moduAccountbookDao.connectUpdateTag(tempTag);
	}
	
	public List<AccountbookTagVo> getTagList(String accountNo) {
		return moduAccountbookDao.getTagListByAccountNo(accountNo);
	}
	
	public void tagDelete(String accountbooktagno,String tagno) {
		AccountbookTagVo accountbookTagVo = new AccountbookTagVo();
		accountbookTagVo.setAccountbooktagno(Integer.parseInt(accountbooktagno));
		accountbookTagVo.setTagno(Integer.parseInt(tagno));
		moduAccountbookDao.tagDelete(accountbookTagVo);
		moduAccountbookDao.tagCleaner();
	}
	
	public List<AccountbookCategoryVo> getCategoryList(String groupno) {
		return moduAccountbookDao.getCategoryList(groupno);
	}
	
	public void categoryDelete(String groupNo, String categoryno) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("groupNo", groupNo);
		map.put("categoryno", categoryno);	
		moduAccountbookDao.categoryDelete(map);
	}
	
	public void categoryUpdate(String categoryno, String categoryname) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("categoryno", categoryno);
		map.put("categoryname", categoryname);	
		moduAccountbookDao.categoryUpdate(map);
	}
	
	public int categoryInsert(String groupNo, String categoryname) {
		AccountbookCategoryVo categoryVo = new AccountbookCategoryVo();
		categoryVo.setCategoryName(categoryname);
		categoryVo.setGroupNo(Integer.parseInt(groupNo));
		moduAccountbookDao.categoryInsert(categoryVo);
		System.out.println(categoryVo.getCategoryNo());
		return categoryVo.getCategoryNo();
	}
	
	public List<AccountbookCategoryVo> getModalcCtegoryList(String groupno) {
		return moduAccountbookDao.getModalcCtegoryList(groupno);
	}
	
}
