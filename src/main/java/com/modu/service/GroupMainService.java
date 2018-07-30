package com.modu.service;

import com.modu.dao.GroupMainDao;
import com.modu.vo.GroupMainVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class GroupMainService {

    @Autowired
    private GroupMainDao groupMainDao;

    public Map<String, Object> getGroupMain(int groupNo) {
        Map<String,Object> inputMap = new HashMap<>();
        inputMap.put("groupNo",groupNo);
        Date today = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
        String lastDay = simpleDateFormat.format(today);
        String splitDate[] = lastDay.split("/");//현재 날짜 스플릿
        Calendar calendar = Calendar.getInstance();//달력 객체 생성
        calendar.set(Integer.parseInt(splitDate[0]),Integer.parseInt(splitDate[1])-1,Integer.parseInt(splitDate[2]));//년,월-1,일
        calendar.add(Calendar.DATE,-5);//계산될 날짜(-5일)
        java.util.Date dayago = calendar.getTime();//담기
 
        inputMap.put("startDay",simpleDateFormat.format(dayago));
        inputMap.put("lastDay",lastDay);
        List<GroupMainVo> newsList = groupMainDao.getNews(inputMap);
        System.out.println("뭐라고나오길래...."+newsList.toString());
        Map<String,Object> outputMap = new HashMap<>();
        outputMap.put("newsList",newsList);
        return outputMap;
    }
}
