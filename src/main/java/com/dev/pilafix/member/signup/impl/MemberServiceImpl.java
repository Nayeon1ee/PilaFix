package com.dev.pilafix.member.signup.impl;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.member.signup.MemberService;
import com.dev.pilafix.member.signup.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO dao; 
	
	@Override
	public MemberVO getUserRole() {
		return dao.getUserRole();
	}

	@Override
	public int insertMember(MemberVO vo) {
		return dao.insertMember(vo);
	}

	@Override
	public int idCheck(String csEmailId){
		int value=0;
		value = dao.idCheck(csEmailId);
		return value;
		  
	}
//	public void idCheck(String csEmailId, HttpServletResponse response) throws IOException {
//		int count = dao.idCheck(csEmailId);
//		if(count == 0) {
//			//dao에서 select이 되지 않아야 true
//			//id가 없어야 true(사용 가능)
//			response.getWriter().print("1");
//		}else {
//			//id가 있으면 false(중복으로 사용 불가능)
//			response.getWriter().print("0");
//		}
//		
//	}


}
