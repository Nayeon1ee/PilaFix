package com.dev.pilafix.common.question.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dev.pilafix.common.member.CenterVO;
import com.dev.pilafix.common.question.QuestionReplyVO;
import com.dev.pilafix.common.question.QuestionVO;

@Repository
public class QuestionDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;


//작성자 회원 코드가져오기
public int getQuestionWriterMemberCode(int qsNumber) {
	return sqlSessionTemplate.selectOne("QuestionDAO.getQuestionWriterMemberCode", qsNumber);
}
	
	
		// 연동된 센터 이름과 함께 문의사항 정보를 가져오는 쿼리 호출 메서드
	    public QuestionVO getQuestionWithSelectedCenterName(int qsNumber) {
	        return sqlSessionTemplate.selectOne("QuestionDAO.getQuestionWithSelectedCenterName", qsNumber);
	    }

    // 연동된 회원들의 문의사항 목록을 가져오는 쿼리 호출 메서드
    public List<QuestionVO> getQuestionListWithWriterNames(int ctCode) {
        return sqlSessionTemplate.selectList("QuestionDAO.getQuestionListWithWriterNames",ctCode );
    }
    
    // 연동된 회원들의 문의사항 상세를 가져오는 쿼리 호출
    public QuestionVO getQuestionCenterWithNames(int qsNumber){
    	return sqlSessionTemplate.selectOne("QuestionDAO.getQuestionCenterWithNames",qsNumber );
    }
    
    
    // 문의사항에 대한 답변을 가져오는 쿼리 호출 메서드
    public QuestionReplyVO getReplyForQuestion(int qsNumber) {
        return sqlSessionTemplate.selectOne("QuestionDAO.getReplyForQuestion", qsNumber);
    }

    
    // 회원의 문의사항 등록
    public int insertQuestion(QuestionVO vo) {
		return sqlSessionTemplate.insert("QuestionDAO.insertQuestion", vo);
	}
    
    // 로그인한 회원의 코드로 문의사항 리스트 가져오는 쿼리 호출
    public List<QuestionVO> getQuestionsByMemberCode(int csMemberCode) {
        return sqlSessionTemplate.selectList("QuestionDAO.getQuestionsByMemberCode", csMemberCode);
    }

	// 로그인한 회원이 문의사항 작성할때 연동된 센터 이름 SELECT 하려고 추가
	public List<CenterVO> getConnectedCenters(int csMemberCode) {
		return sqlSessionTemplate.selectList("QuestionDAO.getConnectedCenters", csMemberCode);
	}

	// 회원코드로 가져오는 문의사항 리스트
	public List<QuestionVO> getQuestionListByMember(int csMemberCode) {
	    return sqlSessionTemplate.selectList("QuestionDAO.getQuestionListByMember", csMemberCode);
	}

	// 회원 문의사항 상세
	public QuestionVO getQuestion(int qsNumber) {
		return sqlSessionTemplate.selectOne("QuestionDAO.getQuestion",qsNumber);
	}

	// 회원의 문의사항 수정
	public int updateQuestion(QuestionVO vo) {
		return sqlSessionTemplate.update("QuestionDAO.updateQuestion", vo);
	}
	
	public int deleteQuestion(int qsNumber) {
		return sqlSessionTemplate.delete("QuestionDAO.deleteQuestion", qsNumber);
	}
	
	

	/**
	 * 센터가 답변을 등록 / 회원의 답변여부 true로 업데이트 / 알림발송이력추가 '답변등록'
	 * @param replyvo
	 * @param questionNumber
	 */
//	@Transactional
//    public void insertReplyAndUpdateQuestion(QuestionReplyVO replyvo, int questionNumber) {
//        try {
//            sqlSessionTemplate.insert("QuestionMapper.insertReply", replyvo);
//            sqlSessionTemplate.update("QuestionMapper.updateAnswerYn", questionNumber);
//        } catch (Exception e) {
//            
//            throw new RuntimeException("RuntimeException: ", e);
//        }
//    }
	// 1.답변등록
	public int insertQReply(QuestionReplyVO replyVO) {
		return sqlSessionTemplate.insert("QuestionDAO.insertQReply",replyVO);
	}
	
	// 2.회원의 답변여부 = 'true'
	public int updateQAnswerYnToTrue(QuestionVO vo) {
		return sqlSessionTemplate.update("QuestionDAO.updateQAnswerYnToTrue",vo);
	}
	
	// -- 회원의 답변여부 false
	public int updateQAnswerYnToFalse(QuestionVO vo) {
		return sqlSessionTemplate.update("QuestionDAO.updateQAnswerYnToFalse",vo);
	}

	public int deleteQuestionReply(int reNumber) {
		return sqlSessionTemplate.delete("QuestionDAO.deleteQuestionReply",reNumber);
	}

	
	public int getTotalQuestionCount(int ctCode) {
		return sqlSessionTemplate.selectOne("QuestionDAO.getTotalQuestionCount", ctCode);
	}


}
