package com.dev.pilafix.common.notice.impl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.common.notice.NoticeVO;

@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * 알림 발송을 위한 회원 목록 조회 (관리자용)
	 * @param ctCode
	 */
	public List<Integer> getMemberCodeList() {
		 return sqlSessionTemplate.selectList("NoticeDAO.getMemberCodeList");
	}
	
	/**
	 * 알림 발송을 위한 회원 목록 조회 (센터용)
	 * @param ctCode
	 */
	public List<Integer> getMemberCodeList(int ctCode) {
		 return sqlSessionTemplate.selectList("NoticeDAO.getMemberCodeListByCtCode", ctCode);
	}
	
	/**
	 * 알림 등록 
	 * 한 명의 회원 대상 (NoticeVO)
	 * 
	 * @param notice
	 */
	public void insertNotice(NoticeVO notice) {
		System.out.println("NoticeDAO까지 옴 "+notice.getUniqueIdentifierCode());
		sqlSessionTemplate.insert("NoticeDAO.insertNotice", notice);
		System.out.println(notice.getNcNoticeContent()+" ==== 알림 등록 완료");
	}
	
	/**
	 * 알림 등록 
	 * 다수 회원 대상 (List<NoticeVO>)
	 * 
	 * @param noticeList
	 */
	public void insertNotice(List<NoticeVO> noticeList) {

		// noticeList가 비어있는 경우
		if (noticeList == null || noticeList.isEmpty()) {
			System.out.println("noticeList is null");
			return;
		}

		try {
			for (NoticeVO notice : noticeList) {
				sqlSessionTemplate.insert("NoticeDAO.insertNotice", notice);
				System.out.println(notice.getNcNoticeContent()+" ==== 알림 등록 완료");
			}
		} catch (Exception e) {
			System.err.println("알림테이블 등록 실패");
			e.printStackTrace();
		}

	}
	
	/**
	 * 미확인 알림 카운트 조회
	 * 
	 * @param csMemberCode
	 * @return
	 */
	public int getUnReadNotificationCount(int csMemberCode){
		return sqlSessionTemplate.selectOne("NoticeDAO.getUnReadNotificationCount",csMemberCode);
	}

	/**
	 * 미확인 알림 리스트 조회
	 * 
	 * @param csMemberCode
	 * @return
	 */
	public List<NoticeVO> getUnReadNotification(int csMemberCode) {
		return sqlSessionTemplate.selectList("NoticeDAO.getUnReadNotification", csMemberCode);
	}
	
	/**
	 * 미확인 알림 클릭 시 상태 업데이트 
	 * 
	 * @param ncId
	 */
	public void updateNoticeStatus(String ncId) {
		sqlSessionTemplate.update("NoticeDAO.updateNoticeStatus", ncId);
	}

}
