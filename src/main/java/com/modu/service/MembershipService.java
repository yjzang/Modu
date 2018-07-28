package com.modu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.modu.dao.MembershipDao;
import com.modu.vo.MembershipVo;
import com.modu.vo.ModuGroupVo;
import com.modu.vo.UserGroupVo;

@Service
public class MembershipService {
	
	@Autowired
	private MembershipDao membershipdao;
	
	
	
	public ModuGroupVo selectMembership(ModuGroupVo groupvo, UserGroupVo usergroupvo) {
		
		//그룹DB에 집어넣기
		int no = membershipdao.insertMembership(groupvo);
		
		
		//회비DB에 집어넣기 
		MembershipVo mvo = new MembershipVo();
		
		/*userName에 스트링으로 userNo를 가져와서 다시 변환하는 작업*/
		String[] str = usergroupvo.getUserName().split(",");
		 int[] user_groupNo = new int[str.length];
		 for(int i=0; i<str.length; i++) {
			 user_groupNo[i] = Integer.parseInt(str[i]);
			 mvo.setUser_groupNo(user_groupNo[i]);
			 mvo.setPaymentFee(Integer.parseInt(groupvo.getMemberFeeAmount()));
			 mvo.setPaymentDate(groupvo.getMemberFeeDate());
			 membershipdao.insertPayment(mvo);
		 }		
		
		//회비관리에 보여줄 화면 select 하기  
		return membershipdao.selectMembership(no);
		 
		 
		 
	}

}
