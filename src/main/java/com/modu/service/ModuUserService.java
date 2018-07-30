package com.modu.service;

import java.util.HashMap;
import java.util.Map;

import com.modu.vo.ModuUserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modu.dao.ModuUserDao;

@Service
public class ModuUserService {

    @Autowired
    private ModuUserDao moduUserDao;

    public Map<String, Object> login(int userNo) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("user", moduUserDao.loginUser(userNo));
        map.put("group", moduUserDao.loginGroup(userNo));
        return map;
    }
 
    public void joinUser(ModuUserVo userVo) {
        String birthday = userVo.getUserBirthday();
        birthday = birthday.replace("년", "/");
        birthday = birthday.replace("월", "/");
        birthday = birthday.replace("일", "");
        System.out.println(birthday);
        birthday = birthday.replaceAll(" ", "");
        System.out.println("최종 수정 결과 : " + birthday);
        if (userVo.getUserPassword() == null) {
            userVo.setUserPassword("-");
        }
        userVo.setUserBirthday(birthday);
        moduUserDao.joinUser(userVo);
    }

    public int emailCheckAjax(ModuUserVo userVo) {
        String email = userVo.getUserEmail();
        return moduUserDao.emailCheckAjax(email);
    }

    public ModuUserVo userLoginCheck(ModuUserVo userVo) {
        String email = userVo.getUserEmail();
        String password = userVo.getUserPassword();
        System.out.println(email + "," + password);
        Map<String, Object> map = new HashMap<>();
        map.put("userEmail", email);
        map.put("userPassword", password);
        ModuUserVo moduUserVo = moduUserDao.userLoginCheck(map);
        System.out.println(moduUserVo.toString());
        System.out.println("유저번호 : " + moduUserVo.getUserNo());
        String groupNo = moduUserDao.loginUserGroupNo(moduUserVo);
        if (groupNo != null) {
            moduUserVo.setGroupNo(Integer.parseInt(groupNo));
        }
        System.out.println("세팅 다 된 유저 정보 : " + moduUserVo.toString());
        return moduUserVo;
    }

    public ModuUserVo kakaoLogin(String userEmail) {
        Map<String, Object> map = new HashMap<>();
        map.put("userEmail", userEmail);
        map.put("userPassword", "-");
        ModuUserVo moduUserVo = moduUserDao.kakaoLogin(map);
        String groupNo = moduUserDao.loginUserGroupNo(moduUserVo);
        if (groupNo != null) {
            moduUserVo.setGroupNo(Integer.parseInt(groupNo));
        }
        System.out.println(moduUserVo.toString());
        return moduUserVo;
    }
}
