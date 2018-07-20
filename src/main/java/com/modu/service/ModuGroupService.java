package com.modu.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.executor.keygen.SelectKeyGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.modu.dao.ModuGroupDao;
import com.modu.vo.ModuGroupVo;
import com.modu.vo.ModuUserVo;
import com.modu.vo.UserGroupVo;

@Service
public class ModuGroupService {

	@Autowired
	private ModuGroupDao groupDao;

	public List<ModuGroupVo> plusGroup(ModuGroupVo groupvo,MultipartFile multipartFile,int userNo) {
		//오리지날 파일명
        String OrgName = multipartFile.getOriginalFilename(); 
        System.out.println("오리지날 파일명 = "+OrgName);


        //확장자
        String exname =multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf(".")); //확장자는 점으로 구별하니까//오리지널파일명에서 마지막 점부터 자른다.
        System.out.println("확장자 = "+exname);

        
        //저장파일명
        String saveName = System.currentTimeMillis()+UUID.randomUUID().toString() + exname; //지금시간과 랜덤수 +확장자
        System.out.println("저장파일명 = "+saveName );


        //폴더에 저장할 것 이다.
        String saveDir ="D:\\modu\\upload";
        String filepath = saveDir+"\\"+saveName;
        System.out.println("파일패스 = "+filepath);

        //파일사이즈
        long fileSize = multipartFile.getSize();
        System.out.println("파일사이즈 = "+ fileSize);
		
        groupvo.setGroupImg(saveName);
        groupvo.setManager(userNo);

        
        try {                     
        	byte[] fileData = multipartFile.getBytes();
        	OutputStream out = new FileOutputStream(saveDir +"/"+ saveName);
        	BufferedOutputStream bout = new BufferedOutputStream(out);
        	bout.write(fileData);
        	if(bout != null) {
        		bout.close();
        		}
        	} catch (IOException e) {
        		// TODO Auto-generated catch block
        		e.printStackTrace();
        		}

		
        int no = groupDao.plusGroup(groupvo);
        System.out.println(no+"그룹생성");
        
		return groupDao.selectGroup(userNo);
	}

	public List<ModuGroupVo> selectGroup(int userNo) {
		return groupDao.selectGroup(userNo);
	}


	public ModuGroupVo selectGroupImg(int groupNo) {
		return groupDao.selectGroupImg(groupNo);
	}

	public List<ModuGroupVo> searchGroup(String gSearch){
		return groupDao.searchGroup(gSearch);
	}

	public ModuGroupVo  insertJoin (UserGroupVo usergroupvo) {
		usergroupvo.setJoinState("대기");
	    groupDao.insertJoin(usergroupvo);

	    return groupDao.selectGroupImg(usergroupvo.getGroupNo());
	}
	
	

}
