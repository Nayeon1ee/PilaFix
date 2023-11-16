package com.dev.pilafix.member.login_kakao.impl;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.dev.pilafix.member.login_kakao.KakaoVO;

@Repository
public class KakaoLoginDAO {
	
	private SqlSessionTemplate sqlSessionTemplate;
	
//	public static final String MAPPER = "com.dev.pilafix.member.login_kakao";
	
	@Autowired
    public KakaoLoginDAO(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

//	// 정보 저장
//    public void kakaoinsert(HashMap<String, Object> userInfo) {
//    	sqlSessionTemplate.insert(MAPPER+".insert",userInfo);
//    }
	
	 // 정보 확인
    public KakaoVO findkakao(HashMap<String, Object> userInfo) {
        System.out.println("RN:"+userInfo.get("nickname"));
        System.out.println("RE:"+userInfo.get("email"));

        return sqlSessionTemplate.selectOne("kakaoLoginDAO.kakaoLoginTest", userInfo);
    }
    
    

}
