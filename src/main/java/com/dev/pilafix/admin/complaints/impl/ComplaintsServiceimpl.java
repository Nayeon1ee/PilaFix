package com.dev.pilafix.admin.complaints.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.complaints.ComplaintsService;
import com.dev.pilafix.admin.complaints.ComplaintsVO;

@Service
public class ComplaintsServiceimpl implements ComplaintsService {
	
	
	@Autowired
	private ComplaintsDAO dao;

	@Override
	public List<ComplaintsVO> getComplaintsInfoList() {
		return dao.getComplaintsInfoList();
	}

	@Override
	public ComplaintsVO getComplaintsInfo(int cpCode) {
		return dao.getComplaintsInfo(cpCode);
	}

	@Override
	public int insertComplaintsInfo(ComplaintsVO vo) {
		return dao.insertComplaintsInfo(vo);
	}

	@Override
	public int updateComplaintsInfo(ComplaintsVO vo) {
		return dao.updateComplaintsInfo(vo);
	}

	@Override
	public int deleteComplaintsInfo(int cp_code) {
		return dao.deleteComplaintsInfo(cp_code);
	}

	/**
     * 상태 변경 메서드 
     * 파라미터로 받은 cpCode에 해당하는 센터의 계약 해지 true 변경
     */
	@Override
	public void revokeComplaints(int cpCode) {
		dao.revokeComplaints(cpCode);

	}

	

}
