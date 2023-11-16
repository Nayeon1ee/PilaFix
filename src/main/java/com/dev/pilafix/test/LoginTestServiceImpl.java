package com.dev.pilafix.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.dev.pilafix.common.member.MemberVO;

@Service 
public class LoginTestServiceImpl {
	
	@Autowired
	private LoginTestDAO dao;
	
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();


	public boolean signupTest(MemberVO vo) {
		String csPassword = vo.getCsPassword();
		
		System.out.println("[LoginTestServiceImpl에서 signupTest] 암호화 전 csPassword 출력 "+csPassword);
		
		//암호화 
		String encodedPwd = encoder.encode(csPassword);
		vo.setCsPassword(encodedPwd);
		
		System.out.println("[LoginTestServiceImpl에서 signupTest] 암호화 후 csPassword 출력 "+encodedPwd);
		
		return dao.signupTest(vo);
		
	}

	public boolean loginTest(String csEmailId, String pass) {
		//DB에서 조회 
		String dbPw = dao.loginTest(csEmailId);
		
		System.out.println("[LoginTestServiceImpl에서 loginTest] 사용자에게 입력받은 비밀번호 : "+pass);
		System.out.println("[LoginTestServiceImpl에서 loginTest] 사용자에게 입력받은 비밀번호 암호화 : "+encoder.encode(pass));
		System.out.println("[LoginTestServiceImpl에서 loginTest] DB에서 조회해온 비밀번호 : "+dbPw);
		
		if (encoder.matches(pass, dbPw)) {
            return true;
        }
		return false;
	}


	public void pwUpdateTest(String id, String currentPw, String newPw) {
		String encodedNewPw = encoder.encode(newPw);
		
		System.out.println("[LoginTestServiceImpl에서 pwUpdateTest] 사용자 이메일 : "+id);
		System.out.println("[LoginTestServiceImpl에서 pwUpdateTest] 사용자에게 입력받은 현재 비밀번호 : "+currentPw);
		System.out.println("[LoginTestServiceImpl에서 pwUpdateTest] 사용자에게 입력받은 새 비밀번호 : "+newPw);
		System.out.println("[LoginTestServiceImpl에서 pwUpdateTest] 사용자에게 입력받은 새 비밀번호 암호화 : "+encoder.encode(newPw));
		
		dao.updateNewPw(id, encodedNewPw);
		
	}

	
}
