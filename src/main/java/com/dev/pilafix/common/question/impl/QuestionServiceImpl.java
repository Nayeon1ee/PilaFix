package com.dev.pilafix.common.question.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dev.pilafix.center.info.CenterInfoVO;
import com.dev.pilafix.common.member.CenterVO;
import com.dev.pilafix.common.notice.NoticeVO;
import com.dev.pilafix.common.notice.impl.NoticeDAO;
import com.dev.pilafix.common.question.QuestionReplyVO;
import com.dev.pilafix.common.question.QuestionService;
import com.dev.pilafix.common.question.QuestionVO;

@Service
public class QuestionServiceImpl implements QuestionService {
	@Autowired
	private QuestionDAO dao;

	@Autowired
	private NoticeDAO noticeDAO;

	/**
	 * 회원이 작성한 문의사항에 센터의 답변이 등록되면 해당 답변을 가져와서 Ajax처리
	 */
	@Override
	public QuestionReplyVO getReplyForQuestion(int qsNumber) {
		return dao.getReplyForQuestion(qsNumber);
	}

	/**
	 * 회원의 연동된 센터이름
	 */
	@Override
	public List<CenterVO> getConnectedCenters(int csMemberCode) {
		return dao.getConnectedCenters(csMemberCode);
	}

	/**
	 * 문의사항 전체 건수 가져오기
	 */
	@Override
	public int getTotalQuestionCount(int ctCode) {
		return dao.getTotalQuestionCount(ctCode);
	}

	/**
	 * 센터가 조회하는 회원의 문의사항리스트 (+회원이름)
	 */
	@Override
	public List<QuestionVO> getQuestionListWithWriterNames(int ctCode) {
		return dao.getQuestionListWithWriterNames(ctCode);
	}

	/**
	 * 센터가 조회한 회원의 문의사항상세 (+회원이름)
	 */
	@Override
	public QuestionVO getQuestionCenterWithNames(int qsNumber) {
		return dao.getQuestionCenterWithNames(qsNumber);
	}

	/**
	 * 답변이 등록될때 회원문의사항 답변여부 컬럼 true로 업데이트 (insert + update)
	 * 
	 * 문의사항 답변등록 / 회원의 답변여부 업데이트 / 및 알림발송이력 추가
	 * 
	 * STEP1. 문의사항 답변 등록 STEP2. 회원의 답변여부 업데이트 STEP3. 회원의 문의사항과 등록된 답변정보 저장 STEP4. 알림
	 * 발송이력 추가 : '답변등록'
	 */
	@Transactional
	public void insertQstReplyUpdateYnAndNotice(QuestionReplyVO replyVO, QuestionVO vo) {

		// 1. 회원의 문의사항에 답변 등록
		dao.insertQReply(replyVO);

		// 2. 회원의 답변여부 업데이트
		dao.updateQAnswerYnToTrue(vo);

		// 3.
		int qsNumber = vo.getQsNumber();
//		int qsNumber = replyVO.getReTargetPostNumber();
//		String title = replyVO.getReTitle();
		int writerMemberCode = dao.getQuestionWriterMemberCode(vo.getQsNumber());

		
		
		
		
		// 4.
		int ctCode = replyVO.getWriterMemberCode();// 세션에 있는 센터 코드
		NoticeVO notice = new NoticeVO();
		notice.setMemberCode(writerMemberCode);
		notice.setRecipientCode(String.valueOf(ctCode)); // 원래는 int형이나 recipientCode에는 관리자 코드도 같이 쓰이므로 string으로 받음
		notice.setEventType("답변등록");
		notice.setUniqueIdentifierCode(String.valueOf(qsNumber));
		notice.setNcNoticeContent("[알림] 문의사항에 대한 답변이 등록되었습니다.");
		notice.setNcReadYn(false);

		noticeDAO.insertNotice(notice);
	}

	/**
	 * 답변이 삭제될때 답변 여부 false로 업데이트
	 * 
	 * @param reNumber
	 * @param vo
	 */
	@Transactional
	public void deleteQuestionReplyAndUpdateYn(int reNumber, QuestionVO vo) {
		dao.deleteQuestionReply(reNumber);
		dao.updateQAnswerYnToFalse(vo);

	}

	/**
	 * 회원코드로 필터링해서 가져오는 문의사항 리스트
	 */
	@Override
	public List<QuestionVO> getQuestionsByMemberCode(int csMemberCode) {
		return dao.getQuestionsByMemberCode(csMemberCode);
	}

	/**
	 * 회원의 문의사항 수정
	 */
	@Override
	public int updateQuestion(QuestionVO vo) {
		return dao.updateQuestion(vo);
	}

	/**
	 * 회원의 문의사항 상세
	 */
	@Override
	public QuestionVO getQuestion(int qsNumber) {
		return dao.getQuestion(qsNumber);
	}

	@Override
	public int insertQuestion(QuestionVO vo) {
		return dao.insertQuestion(vo);
	}

	@Override
	public int deleteQuestion(int qsNumber) {
		return dao.deleteQuestion(qsNumber);
	}

	@Override
	public int deleteQuestionReply(int reNumber) {
		return dao.deleteQuestionReply(reNumber);
	}

}