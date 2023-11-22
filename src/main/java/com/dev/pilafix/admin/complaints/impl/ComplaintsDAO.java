package com.dev.pilafix.admin.complaints.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.admin.complaints.ComplaintsVO;


@Repository
public class ComplaintsDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<ComplaintsVO> getComplaintsInfoList(){
		return sqlSessionTemplate.selectList("ComplaintsDAO.getComplaintsInfoList");
	}
	public ComplaintsVO getComplaintsInfo(int cpCode) {
	    return sqlSessionTemplate.selectOne("ComplaintsDAO.getComplaintsInfo",cpCode);
	}
	
	public int insertComplaintsInfo(ComplaintsVO vo) {
		return sqlSessionTemplate.insert("ComplaintsDAO.insertComplaintsInfo", vo);
	}
	
	public int updateComplaintsInfo(ComplaintsVO vo) {
		return sqlSessionTemplate.update("ComplaintsDAO.updateComplaintsInfo", vo);
	}
	
	public int deleteComplaintsInfo(int cp_code) {
		return sqlSessionTemplate.delete("ComplaintsDAO.deleteComplaintsInfo", cp_code);
	}
	
	public void revokeComplaints(int cpCode) {
		sqlSessionTemplate.update("ComplaintsDAO.updateContractRevokeYN", cpCode);
	}
	public List<ComplaintsVO> getAllComplaintsList(){
		return sqlSessionTemplate.selectList("ComplaintsDAO.getAllComplaintsList");
	}
	
	
}
