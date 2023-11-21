package com.dev.pilafix.center.info.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.center.info.CenterInfoService;
import com.dev.pilafix.center.info.CenterInfoVO;
import com.dev.pilafix.common.notice.NoticeVO;

@Service
public class CenterInfoServiceImple implements CenterInfoService {
	
	@Autowired
	private CenterInfoDAO dao;
	
	@Override
	public List<CenterInfoVO> getCenterInfoList(int ctCode) {
		return dao.getCenterInfoList(ctCode);
	}

	@Override
	public CenterInfoVO getCenterInfo(int seq) {
		return dao.getCenterInfo(seq);
	}

	/**
	 * 공지사항 등록 및 알림 이력 등록
	 */
	@Override
	public int insertCenterInfo(CenterInfoVO vo) {
		
		//세션에 있는 센터 코드 
		int ctCode = vo.getWriterMemberCode();
		
		// 회원 코드 목록 조회 
		List<String> members = getMemberCodeList(ctCode);

		//회원 수만큼 for문 돌면서 NoticeVO 생성 
		List<NoticeVO> noticeList = new ArrayList<>();
		for(int i = 0; i < members.size(); i++) {
//			NoticeVO notice = new NoticeVO();
//			notice.setMemberCode((int)members.get(i).);
			
//			notice.setEventType("공지사항");
//			noticeList.add(notice);
			System.out.println("notice에서 알림 이력 등록 " + members.get(i));
			System.out.println("notice에서 알림 이력 등록 int형 파싱 " + Integer.parseInt(members.get(i)));
					
		}
		
		
				
		// 알림 이력 등록

		
		return dao.insertCenterInfo(vo);
	}

	/**
	 * 알림 발송을 위한 회원 목록 조회 
	 * @param ctCode
	 * @return
	 */
	private List<String> getMemberCodeList(int ctCode) {
		return dao.getMemberCodeList(ctCode);
	}

	@Override
	public int updateCenterInfo(CenterInfoVO vo) {
		return dao.updateCenterInfo(vo);
	}

	@Override
	public int deleteCenterInfo(int seq) {
		return dao.deleteCenterInfo(seq);
	}

	@Override
	public int updateCenterInfoViewCnt(int cnt) {
		return dao.updateCenterInfoViewCnt(cnt);
	}

}
