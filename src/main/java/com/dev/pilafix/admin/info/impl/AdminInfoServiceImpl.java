package com.dev.pilafix.admin.info.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dev.pilafix.admin.info.AdminInfoService;
import com.dev.pilafix.admin.info.AdminInfoVO;
import com.dev.pilafix.center.info.CenterInfoVO;
import com.dev.pilafix.common.notice.NoticeVO;
import com.dev.pilafix.common.notice.impl.NoticeDAO;

@Service
public class AdminInfoServiceImpl implements AdminInfoService {
	
	@Autowired
	private AdminInfoDAO dao;
	
	@Autowired
	private NoticeDAO noticeDAO;

	@Override
	public List<AdminInfoVO> getAdminInfoList() {
		return dao.getAdminInfoList();
	}

	@Override
	public AdminInfoVO getInfo(int iwNumber) {
		return dao.getAdminInfo(iwNumber);
	}


	/**
	 * 공지사항 등록 및 알림 이력 등록
	 * 
	 * STEP1. 공지사항 등록 
	 * 
	 * (작성한 공지사항의 공개여부가 TRUE라면)
	 * STEP2. 등록된 공지사항 조회
	 * STEP3. 전체 회원 코드 목록 조회
	 * STEP4. 알림 테이블 적재(회원 수만큼)
	 * 
	 * 
	 */
	@Transactional
	public void insertAdminInfoAndLoadNotices(AdminInfoVO vo) {
		
		// ======= STEP01. 공지사항 등록 ======= 
		dao.insertAdminInfo(vo);
		
		// 작성한 공지사항의 공개여부가 비공개면 insert만 하고 반환 
		if(!vo.isOpenYN()) {
			System.out.println("비공개라서 글 등록 완료");
			return;
		}
		
		
		// ======= STEP02. 방금 등록된 공지사항 정보 저장 ======= 
		int iwNumber = vo.getIwNumber();// insert되면서 vo에 icNumber가 세팅됨 
		String title = vo.getTitle();
		System.out.println("공지사항 등록 번호 "+iwNumber);
		
		// ======= STEP03. 전체 회원 코드 목록 조회 ======= 
		List<Integer> members = noticeDAO.getMemberCodeList();
		
		
		
		// ======= STEP04. 알림 테이블 적재 (회원 수만큼) ======= 
		List<NoticeVO> noticeList = new ArrayList<>();
		String adCode = vo.getWriterMemberCode();
		for(int i = 0; i < members.size(); i++) {//회원 수만큼 NoticeVO 생성
			NoticeVO notice = new NoticeVO();
			 notice.setMemberCode(members.get(i));
			 notice.setRecipientCode(adCode); 
			 notice.setEventType("공지사항");
			 notice.setUniqueIdentifierCode(String.valueOf(iwNumber));
			 notice.setNcNoticeContent("[공지] "+title);
			 notice.setNcReadYn(false);
			noticeList.add(notice);
		}
		System.out.println(noticeList.toString());
		noticeDAO.insertNotice(noticeList);
		
	}
	
	@Override
	public int insertAdminInfo(AdminInfoVO vo) {
		return dao.insertAdminInfo(vo);
	}
	
	/**
	 * 업데이트 시 해당 
	 */
	@Override
	public int updateAdminInfo(AdminInfoVO vo) {
		return dao.updateAdminInfo(vo);
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
	 */
	@Transactional
	public void updateAdminInfoAndLoadNotices(AdminInfoVO vo) {
		// ======= STEP01. 공지사항 수정 =======
		dao.updateAdminInfo(vo);

		// ======= STEP02. 수정된 공지사항 정보 저장 =======
		int iwNumber = vo.getIwNumber();
		String title = vo.getTitle();

		// ======= STEP03. 현재 로그인한 센터에 연동된 회원 코드 목록 조회 =======
		String adCode = vo.getWriterMemberCode();
		List<Integer> members = noticeDAO.getMemberCodeList();

		// ======= STEP04. 알림 테이블 적재 (회원 수만큼) =======
		List<NoticeVO> noticeList = new ArrayList<>();
		for (int i = 0; i < members.size(); i++) {// 회원 수만큼 NoticeVO 생성
			NoticeVO notice = new NoticeVO();
			notice.setMemberCode(members.get(i));
			notice.setRecipientCode(adCode); // 원래는 int형이나 recipientCode에는 관리자 코드도 같이 쓰이므로 string으로 받음
			notice.setEventType("공지사항");
			 notice.setUniqueIdentifierCode(String.valueOf(iwNumber));
			notice.setNcNoticeContent("[공지] " + title);
			notice.setNcReadYn(false);
			noticeList.add(notice);
		}
		System.out.println(noticeList.toString());
		noticeDAO.insertNotice(noticeList);
	}
	
	@Override
	public int deleteAdminInfo(int iwNumber) {
		return dao.deleteAdminInfo(iwNumber);
	}
	
	@Override
	public void updateAdminInfoViewCnt(int iwNumber) {
		dao.updateAdminInfoViewCnt(iwNumber);
	}
}
