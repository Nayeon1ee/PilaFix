package com.dev.pilafix.admin.complaints.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.community.CommunityVO;
import com.dev.pilafix.admin.complaints.ComplaintsService;
import com.dev.pilafix.admin.complaints.ComplaintsVO;

@Service
public class ComplaintsServiceimpl implements ComplaintsService {
	
	
	@Autowired
	private ComplaintsDAO dao;

	/**
	 * 신고글 목록 조회 
	 */
	@Override
	public List<CommunityVO> getTargetComplaintsList() {
		return dao.getTargetComplaintsList();
	}
	
	/**
	 * 신고글 상세 - 대상 글 상세 
	 */
	@Override
	public CommunityVO getComplaintsDetail(int cmNumber) {
		return dao.getComplaintsDetail(cmNumber);
	}

	/**
	 * 신고글 상세 - 신고내역 
	 */
	@Override
	public List<ComplaintsVO> getComplaintsList(int cmNumber) {
		return dao.getComplaintsList(cmNumber);
	}

	/**
	 * 신고글 처리 
	 * 커뮤니티 비공개 처리 
	 */
	@Override
	public void updateComplaintsStatus(int cmNumber) {
		dao.updateComplaintsStatus(cmNumber);
	}


}
