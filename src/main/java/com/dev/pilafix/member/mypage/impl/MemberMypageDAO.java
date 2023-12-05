package com.dev.pilafix.member.mypage.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.admin.faq.FaqVO;
import com.dev.pilafix.admin.info.AdminInfoVO;
import com.dev.pilafix.admin.terms.TermsVO;
import com.dev.pilafix.center.info.CenterInfoVO;
import com.dev.pilafix.common.member.CenterVO;
import com.dev.pilafix.common.member.MemberVO;
import com.dev.pilafix.member.mypage.MemberMypageVO;

@Repository
public class MemberMypageDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<MemberMypageVO> getMyPaymentInfo(int csMemberCode) {
		return sqlSessionTemplate.selectList("MemberMypageDAO.getMyPaymentInfo",csMemberCode );
	}

	/**
	 * 연동센터관리
	 * 연동센터 이름, 센터코드 가져오기
	 */
	public List<CenterVO> getConnectedCenterList(int csMemberCode) {
		return sqlSessionTemplate.selectList("MemberMypageDAO.getConnectedCenterList",csMemberCode);
	}
	/**
	 * 연동센터해제 - 선택된 연동센터코드 0 으로 업데이트
	 * @param csMemberCode
	 * @param selectedCenterCode
	 */
	public int disconnectCenter(int csMemberCode, int selectedCenterCode) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("csMemberCode", csMemberCode);
	    params.put("selectedCenterCode", selectedCenterCode);
	    return sqlSessionTemplate.update("MemberMypageDAO.disconnectCenter", params);
	}
    
	/**
	 * 회원탈퇴 - 회원의 탈퇴여부 true로 변경
	 */
	public int withdrawMember(int csMemberCode) {
		return sqlSessionTemplate.update("MemberMypageDAO.withdrawMember",csMemberCode);
	}
	
	public MemberVO getMemberInfo(int csMemberCode) {
        return sqlSessionTemplate.selectOne("MemberLoginDAO.getMemberInfo", csMemberCode);
    }
	
	
	/**
	 * 회원의 수강권 정보조회 (개인/그룹)
	 */
	public MemberVO getPersonalTicketByMember(int csMemberCode) {
		return sqlSessionTemplate.selectOne("MemberMypageDAO.getPersonalTicketByMember",csMemberCode);
	}
	public MemberVO getGroupTicketByMember(int csMemberCode) {
		return sqlSessionTemplate.selectOne("MemberMypageDAO.getGroupTicketByMember",csMemberCode);
	}
	

	/**
	 * 센터와 웹관리자(필라픽스)의 공지사항 리스트, 상세 조회
	 * 센터는 작성자에 센터이름 가져옴
	 * 웹관리자는 작성자 '필라픽스'로 고정
	 */
	public List<CenterInfoVO> getCenterInfoListByMember(int csMemberCode){
		return sqlSessionTemplate.selectList("MemberMypageDAO.getCenterInfoListByMember",csMemberCode);
	}
	public CenterInfoVO getCenterInfoByMember(int icNumber) {
		return sqlSessionTemplate.selectOne("MemberMypageDAO.getCenterInfoByMember",icNumber);
	}
	
	public List<AdminInfoVO> getAdminInfoListByMember(int csMemberCode){
		return sqlSessionTemplate.selectList("MemberMypageDAO.getAdminInfoListByMember",csMemberCode);
	}
	public AdminInfoVO getAdminInfoByMember(int iwNumber) {
		return sqlSessionTemplate.selectOne("MemberMypageDAO.getAdminInfoByMember",iwNumber);
	}
	
	/**
	 * FAQ 리스트, 상세 조회
	 * 작성자 '필라픽스'로 고정
	 */
	public List<FaqVO> getFAQListByMember(){
		return sqlSessionTemplate.selectList("MemberMypageDAO.getFAQListByMember");
	}
	public FaqVO getFaqByMember(int fqNumber) {
		return sqlSessionTemplate.selectOne("MemberMypageDAO.getFaqByMember",fqNumber);
	}
	
	/**
	 * 약관및정책 리스트
	 */
	public List<TermsVO> getMyTermsListByMember(){
		return sqlSessionTemplate.selectList("MemberMypageDAO.getMyTermsListByMember");
	}
	
	/**
	 * 마이페이지의 내정보 조회
	 */
	public MemberVO getMypageMemberInfo(int csMemberCode) {
		return sqlSessionTemplate.selectOne("MemberMypageDAO.getMypageMemberInfo",csMemberCode);
	}
    

}
