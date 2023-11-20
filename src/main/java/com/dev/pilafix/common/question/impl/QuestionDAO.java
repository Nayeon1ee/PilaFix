package com.dev.pilafix.common.question.impl;

import java.util.List;
import java.util.Map;

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

	public List<Map<String, Object>> getQuestionList() {
	    return sqlSessionTemplate.selectList("QuestionDAO.getQuestionList");
	}
	
	public List<QuestionReplyVO> getQuestionReply(int writerMemberCode) {
		return sqlSessionTemplate.selectList("QuestionDAO.getQReplyList",writerMemberCode);
	}
	
	public QuestionVO getQuestion(int qsNumber) {
		return sqlSessionTemplate.selectOne("QuestionDAO.getQuestion",qsNumber);
	}
	
	public int insertQuestion(QuestionVO vo) {
		return sqlSessionTemplate.insert("QuestionDAO.insertQuestion", vo);
	}
	
	public int updateQuestion(QuestionVO vo) {
		return sqlSessionTemplate.update("QuestionDAO.updateQuestion", vo);
	}
	
	public int deleteQuestion(int qsNumber) {
		return sqlSessionTemplate.delete("QuestionDAO.deleteQuestion", qsNumber);
	}
	
	// �α����� ȸ���� ������ ���� �̸� ���������� �߰�
	public List<CenterVO> getConnectedCT(int csMemberCode) {
        return sqlSessionTemplate.selectList("QuestionDAO.getConnectedCT", csMemberCode);
    }

	public int getTotalQuestionCount() {
		// TODO Auto-generated method stub
		return 0;
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

	
	/**
	 * ���ǻ��� �亯 ��Ͻ� ȸ���� �亯���� ������Ʈ
	 * @param replyvo
	 * @param questionNumber
	 */
	@Transactional
    public void insertReplyAndUpdateQuestion(QuestionReplyVO replyvo, int questionNumber) {
        try {
            // �亯 ���
            sqlSessionTemplate.insert("QuestionMapper.insertReply", replyvo);
            
            // ���ǻ��� �亯���� ������Ʈ
            sqlSessionTemplate.update("QuestionMapper.updateAnswerYn", questionNumber);
        } catch (Exception e) {
            // ���� ó��
            throw new RuntimeException("�亯 ��� �� ���ǻ��� ������Ʈ ����", e);
        }
    }
	
	



}