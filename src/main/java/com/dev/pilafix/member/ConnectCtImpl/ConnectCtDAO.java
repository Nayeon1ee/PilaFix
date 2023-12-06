package com.dev.pilafix.member.ConnectCtImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.common.member.MemberVO;
import com.dev.pilafix.member.ConnectCt.ConnectCtVO;

@Repository
public class ConnectCtDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * 센터 조회 
	 * 
	 * @param searchKeyword
	 * @return
	 */
	public List<ConnectCtVO> searchCt(String searchKeyword) {
		System.out.println("DAO");
		return sqlSessionTemplate.selectList("ConnectCtDAO.searchCtList",searchKeyword);
	}


	/**
	 * 연동 요청 
	 * 
	 * @param user
	 * @return
	 */
	public int connectRequest(Map<String, Object> user) {
		return sqlSessionTemplate.insert("ConnectCtDAO.connectRequest", user);
	}


	/**
	 * 연동 요청 가능 여부 체크 
	 * 1. 연동센터 한도 초과 (로그인한 회원의 연동된 센터가 3개)
	 * 
	 * 
	 * @param csMemberCode
	 * @param ctCode
	 * @return
	 */
	public Integer checkMyCenter(int csMemberCode) {
		return sqlSessionTemplate.selectOne("ConnectCtDAO.checkMyCenter", csMemberCode);
	}


	/**
	 * 연동 요청 가능 여부 체크 
	 * 2. 기 요청건 존재 여부 확인 
	 * 
	 * @param csMemberCode
	 * @param ctCode
	 * @return
	 */
	public Integer checkRequest(int csMemberCode, int ctCode) {
		Map<String, Object> params = new HashMap<>();
		params.put("csMemberCode", csMemberCode);
		params.put("ctCode",ctCode );
		
		return sqlSessionTemplate.selectOne("ConnectCtDAO.checkRequest", params);
	}

	

}
