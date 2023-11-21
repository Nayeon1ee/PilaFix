package com.dev.pilafix.center.info.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dev.pilafix.center.info.CenterInfoVO;

@Repository
public class CenterInfoDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<CenterInfoVO> getCenterInfoList(int ctCode){
		return sqlSessionTemplate.selectList("CenterInfoDAO.getCenterInfoList", ctCode);
	}
	
	public CenterInfoVO getCenterInfo(int seq) {
	    return sqlSessionTemplate.selectOne("CenterInfoDAO.getCenterInfo",seq);
	}
	
	@Transactional
	public int insertCenterInfo(CenterInfoVO vo) {
		int result = 0;
		try {
			result = sqlSessionTemplate.insert("CenterInfoDAO.insertCenterInfo", vo);
//			sqlSessionTemplate.insert("", noticeVo );
		}catch (Exception e) {
			throw new RuntimeException("데이터베이스 업데이트 오류", e);
		}
		
		return result;
	}

	
	public int updateCenterInfo(CenterInfoVO vo) {
		return sqlSessionTemplate.update("CenterInfoDAO.updateCenterInfo", vo);
	}
	
	public int deleteCenterInfo(int seq) {
		return sqlSessionTemplate.delete("CenterInfoDAO.deleteCenterInfo", seq);
	}
	
	public int updateCenterInfoViewCnt(int cnt) {
		return sqlSessionTemplate.update("CenterInfoDAO.updateCenterInfoViewCnt", cnt);
	}
	
	/**
	 * 알림 발송을 위한 회원 목록 조회 
	 * @param ctCode
	 */
	public List<String> getMemberCodeList(int ctCode) {
		return sqlSessionTemplate.selectList("CenterInfoDAO.getMemberCodeList", ctCode);
	}
}