package com.dev.pilafix.admin.complaints.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.admin.community.CommunityVO;
import com.dev.pilafix.admin.complaints.ComplaintsVO;


@Repository
public class ComplaintsDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<CommunityVO> getTargetComplaintsList(){
		return sqlSessionTemplate.selectList("ComplaintsDAO.getTargetComplaintsList");
	}

	public CommunityVO getComplaintsDetail(int cmNumber) {
		return sqlSessionTemplate.selectOne("ComplaintsDAO.getComplaintsDetail", cmNumber);
	}
	

	public List<ComplaintsVO> getComplaintsList(int cmNumber) {
		return sqlSessionTemplate.selectList("ComplaintsDAO.getComplaintsList",cmNumber);
	}

	public void updateComplaintsStatus(int cmNumber) {
		sqlSessionTemplate.update("ComplaintsDAO.updateComplaintsStatus",cmNumber );
	}


	
}
