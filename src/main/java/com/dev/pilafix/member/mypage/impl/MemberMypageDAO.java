package com.dev.pilafix.member.mypage.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.member.mypage.MemberMypageVO;

@Repository
public class MemberMypageDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<MemberMypageVO> getMyPaymentInfo(int csMemberCode) {
		sqlSessionTemplate.selectList("MemberMypageDAO.getMyPaymentInfo",csMemberCode );
		return null;
	}

}
