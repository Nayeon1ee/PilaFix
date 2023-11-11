package com.dev.pilafix.admin.member_trainer_manage.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.admin.member_trainer_manage.CenterConnectHistoryVO;
import com.dev.pilafix.admin.member_trainer_manage.MemberVO;
import com.dev.pilafix.admin.member_trainer_manage.PaymentHistoryVO;

@Repository
public class MemberTrainerManageDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<MemberVO> getMemberList() {
		return sqlSessionTemplate.selectList("MemberManageDAO.getMemberList");
	}
	
	public List<MemberVO> getTrainerList() {
		return sqlSessionTemplate.selectList("MemberManageDAO.getTrainerList");
	}
	
	public MemberVO getMember(int csMemberCode) {
		return sqlSessionTemplate.selectOne("MemberManageDAO.getMember", csMemberCode);
	}
	
    public List<PaymentHistoryVO> getPaymentList(int csMemberCode) {
        return sqlSessionTemplate.selectList("MemberManageDAO.getPaymentList", csMemberCode);
    }

    public List<CenterConnectHistoryVO> getConnectCenterList(int csMemberCode) {
        return sqlSessionTemplate.selectList("MemberManageDAO.getCenterConnectHistory", csMemberCode);
    }

}
