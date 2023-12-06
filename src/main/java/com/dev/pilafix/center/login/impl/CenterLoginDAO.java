package com.dev.pilafix.center.login.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.common.member.CenterVO;

@Repository
public class CenterLoginDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	
	// 센터코드로 전체정보 가져오기
	public CenterVO getCenterAllInfoByCode(int ctCode) {
		return sqlSessionTemplate.selectOne("CenterLoginDAO.getCenterAllInfoByCode", ctCode);
	}
	
	// 센터아이디로 전체정보 가져오기
	public CenterVO getCenterAllInfoByCtId(String ctId) {
		return sqlSessionTemplate.selectOne("CenterLoginDAO.getCenterAllInfoByCtId", ctId);
	}

	// 아이디 입력받아서 해당아이디의 비밀번호와 비교하기
	public String getPasswordByCtId(String ctId) {
		return sqlSessionTemplate.selectOne("CenterLoginDAO.getPasswordByCtId", ctId);
	}
	
	// 로그인 후 가져올 센터코드, 센터이름
	public CenterVO getLoginCenterCodeName(String ctId) {
		return sqlSessionTemplate.selectOne("CenterLoginDAO.getLoginCenterCodeName",ctId);
	}
	
	// 센터 비밀번호 변경
	public void updatePasswordCenter(int ctCode, String newPassword) {
		Map<String, Object> params = new HashMap<>();
        params.put("ctCode", ctCode);
        params.put("newPassword", newPassword);
		sqlSessionTemplate.update("CenterLoginDAO.updatePasswordCenter",params);
	}
	
	//연동요청 온 회원수와 답변달리지 않은 문의사항 갯수 세옴(네비바에 갯수 보여주려고)
	public CenterVO countForBadge(int ctCode){
		return sqlSessionTemplate.selectOne("CenterLoginDAO.countForBadge", ctCode);
		
	}
	
	// 통계 - 판매 횟수
	public CenterVO getTotalCenterCount(int ctCode) {
		return sqlSessionTemplate.selectOne("CenterLoginDAO.getTotalCenterCount", ctCode);
	}
	
	public Map<String,Object> getMonthlyAmount(int ctCode) {
		Map<String,Object> count = new HashMap<String, Object>();
		count.put("getMonthlyAmount", sqlSessionTemplate.selectList("CenterLoginDAO.getMonthlyAmount", ctCode));
		return count;
	}
	
	public Map<String,Object> getPopularLesson(int ctCode) {
		List<CenterVO> lessonNameCount = sqlSessionTemplate.selectList("CenterLoginDAO.getPopularLesson", ctCode);
		Map<String,Object> nameCount = new HashMap<String, Object>();
		nameCount.put("diet", lessonNameCount.get(0));
		nameCount.put("bodyShaoe", lessonNameCount.get(1));
		nameCount.put("stretching", lessonNameCount.get(2));
		nameCount.put("balance", lessonNameCount.get(3));
		nameCount.put("rehabilitation", lessonNameCount.get(4));
		
		System.out.println("확인" + nameCount.get("diet"));
		return nameCount;
	}
}
