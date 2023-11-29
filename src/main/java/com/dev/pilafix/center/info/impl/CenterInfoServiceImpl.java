package com.dev.pilafix.center.info.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dev.pilafix.center.info.CenterInfoService;
import com.dev.pilafix.center.info.CenterInfoVO;
import com.dev.pilafix.common.notice.NoticeDAO;
import com.dev.pilafix.common.notice.NoticeVO;

@Service
public class CenterInfoServiceImpl implements CenterInfoService {
	
	@Autowired
	private CenterInfoDAO dao;
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	
	@Override
	public List<CenterInfoVO> getCenterInfoList(int ctCode) {
		return dao.getCenterInfoList(ctCode);
	}

	@Override
	public CenterInfoVO getCenterInfo(int icNumber) {
		return dao.getCenterInfo(icNumber);
	}

	/**
	 * 공지사항 등록 및 알림 이력 등록
	 * 
	 * STEP1. 공지사항 등록 
	 * 
	 * (작성한 공지사항의 공개여부가 TRUE라면)
	 * STEP2. 등록된 공지사항 조회
	 * STEP3. 현재 로그인한 센터에 연동된 회원 코드 목록 조회 
	 * STEP4. 알림 테이블 적재(회원 수만큼)
	 * 
	 * 
	 */
	@Transactional
	public void insertCenterInfoAndLoadNotices(CenterInfoVO vo) {
		
		// ======= STEP01. 공지사항 등록 ======= 
		dao.insertCenterInfo(vo);
		
		// 작성한 공지사항의 공개여부가 비공개면 insert만 하고 반환 
		if(!vo.isOpenYN()) {
			System.out.println("비공개라서 글 등록 완료");
			return;
		}
		
		
		// ======= STEP02. 방금 등록된 공지사항 정보 저장 ======= 
		int icNumber = vo.getIcNumber();// insert되면서 vo에 icNumber가 세팅됨 
		String title = vo.getTitle();
		
		
		
		// ======= STEP03. 현재 로그인한 센터에 연동된 회원 코드 목록 조회 ======= 
		int ctCode = vo.getWriterMemberCode();//세션에 있는 센터 코드
		List<Integer> members = noticeDAO.getMemberCodeList(ctCode);
		
		
		
		// ======= STEP04. 알림 테이블 적재 (회원 수만큼) ======= 
		List<NoticeVO> noticeList = new ArrayList<>();
		for(int i = 0; i < members.size(); i++) {//회원 수만큼 NoticeVO 생성
			NoticeVO notice = new NoticeVO();
			 notice.setMemberCode(members.get(i));
			 notice.setRecipientCode(String.valueOf(ctCode)); // 원래는 int형이나 recipientCode에는 관리자 코드도 같이 쓰이므로 string으로 받음 
			 notice.setEventType("공지사항");
			 notice.setUniqueIdentifierCode(String.valueOf(icNumber));
			 notice.setNcNoticeContent("[공지] "+title);
			 notice.setNcReadYn(false);
			noticeList.add(notice);
		}
		System.out.println(noticeList.toString());
		noticeDAO.insertNotice(noticeList);
		
	}
	
	@Override
	public int insertCenterInfo(CenterInfoVO vo) {
		return dao.insertCenterInfo(vo);
	}

	/**
	 * 업데이트 시 해당 
	 */
	@Override
	public int updateCenterInfo(CenterInfoVO vo) {
		return dao.updateCenterInfo(vo);
	}

	/**
	 * 공지사항 수정 및 알림 이력 등록
	 * 
	 * 비공개글에서 공개글로 수정된 경우 
	 * STEP1. 공지사항 수정 
	 * 
	 * STEP02. 수정된 공지사항 정보 저장 
	 * STEP3. 현재 로그인한 센터에 연동된 회원 코드 목록 조회 
	 * STEP4. 알림 테이블 적재(회원 수만큼)
	 * 
	 * 
	 */
	@Transactional
	public void updateCenterInfoAndLoadNotices(CenterInfoVO vo) {
		// ======= STEP01. 공지사항 수정 ======= 
		dao.updateCenterInfo(vo);

		// ======= STEP02. 수정된 공지사항 정보 저장 ======= 
		int icNumber = vo.getIcNumber();
		String title = vo.getTitle();
		
		// ======= STEP03. 현재 로그인한 센터에 연동된 회원 코드 목록 조회 ======= 
		int ctCode = vo.getWriterMemberCode();
		List<Integer> members = noticeDAO.getMemberCodeList(ctCode);
		
		// ======= STEP04. 알림 테이블 적재 (회원 수만큼) ======= 
		List<NoticeVO> noticeList = new ArrayList<>();
		for(int i = 0; i < members.size(); i++) {//회원 수만큼 NoticeVO 생성
			NoticeVO notice = new NoticeVO();
			 notice.setMemberCode(members.get(i));
			 notice.setRecipientCode(String.valueOf(ctCode)); // 원래는 int형이나 recipientCode에는 관리자 코드도 같이 쓰이므로 string으로 받음 
			 notice.setEventType("공지사항");
			 notice.setUniqueIdentifierCode(String.valueOf(icNumber));
			 notice.setNcNoticeContent("[공지] "+title);
			 notice.setNcReadYn(false);
			noticeList.add(notice);
		}
		System.out.println(noticeList.toString());
		noticeDAO.insertNotice(noticeList);
		
	}
	
	
	
	
	@Override
	public int deleteCenterInfo(int icNumber) {
		return dao.deleteCenterInfo(icNumber);
	}

	@Override
	public int updateCenterInfoViewCnt(int icNumber) {
		return dao.updateCenterInfoViewCnt(icNumber);
	}



}
