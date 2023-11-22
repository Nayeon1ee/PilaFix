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
	
	
	
	// 연동된 센터 이름과 함께 문의사항 정보를 가져오는 쿼리 호출 메서드
    public QuestionVO getQuestionWithCenterNames(int qsNumber) {
        return sqlSessionTemplate.selectOne("QuestionDAO.getQuestionWithCenterNames", qsNumber);
    }

    // 연동된 회원들의 문의사항 목록을 가져오는 쿼리 호출 메서드
    public List<QuestionVO> getQuestionListWithWriterNames() {
        return sqlSessionTemplate.selectList("QuestionDAO.getQuestionListWithWriterNames");
    }
    
    // 문의사항에 대한 답변을 가져오는 쿼리 호출 메서드
    public QuestionReplyVO getQuestionReply(int qsNumber) {
        return sqlSessionTemplate.selectOne("QuestionDAO.getQuestionReply", qsNumber);
    }
    
    
    // 회원의 문의사항 등록
    public int insertQuestion(QuestionVO vo) {
		return sqlSessionTemplate.insert("QuestionDAO.insertQuestion", vo);
	}
    
    // 로그인한 회원의 코드로 문의사항 리스트 가져오는 쿼리 호출
    public List<QuestionVO> getQuestionsByMemberCode(int csMemberCode) {
        return sqlSessionTemplate.selectList("QuestionDAO.getQuestionsByMemberCode", csMemberCode);
    }
    
    
    // 센터가 작성한 답변 리스트
	public List<QuestionReplyVO> getQuestionReplyCt(int reTargetPostNumber) {
		return null;
	}
    
	
	// 로그인한 회원의 연동된 센터 이름 가져오려고 추가
	public List<String> getConnectedCenters(int csMemberCode) {
		return sqlSessionTemplate.selectList("QuestionDAO.getConnectedCenters", csMemberCode);
	}
	
	
	// 회원코드로 가져오는 문의사항 리스트
	public List<QuestionVO> getQuestionListByMember(int csMemberCode) {
	    return sqlSessionTemplate.selectList("QuestionDAO.getQuestionListByMember", csMemberCode);
	}

	/**
	 * 센터가 답변을 등록하면 회원의 답변여부 true로 업데이트  
	 * ===========================================
	 * *******+ 알림발송도 추가해야함!!!! *******
	 * ===========================================
	 * @param replyvo
	 * @param questionNumber
	 */
	@Transactional
    public void insertReplyAndUpdateQuestion(QuestionReplyVO replyvo, int questionNumber) {
        try {
            sqlSessionTemplate.insert("QuestionMapper.insertReply", replyvo);
           
            sqlSessionTemplate.update("QuestionMapper.updateAnswerYn", questionNumber);
        } catch (Exception e) {
            
            throw new RuntimeException("RuntimeException: ", e);
        }
    }
	
	
	

    
	public List<QuestionVO> getQuestionList() {
		return sqlSessionTemplate.selectList("QuestionDAO.getQuestionList");
	}
	
	
	public QuestionVO getQuestion(int qsNumber) {
		return sqlSessionTemplate.selectOne("QuestionDAO.getQuestion",qsNumber);
	}

	
	public int updateQuestion(QuestionVO vo) {
		return sqlSessionTemplate.update("QuestionDAO.updateQuestion", vo);
	}
	
	public int deleteQuestion(int qsNumber) {
		return sqlSessionTemplate.delete("QuestionDAO.deleteQuestion", qsNumber);
	}
	


	public int getTotalQuestionCount() {
		return sqlSessionTemplate.selectOne("QuestionDAO.getTotalQuestionCount");
	}

	public List<QuestionVO> getQReplyList() {
		// TODO Auto-generated method stub
		return null;
	}

	public int insertQuestionReply(QuestionReplyVO replyvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteQuestionReply(int reNumber) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
	
	
	
	


	
	



}