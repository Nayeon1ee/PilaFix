package com.dev.pilafix.admin.faq.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.pilafix.admin.faq.FaqVO;


@Repository
public class FaqInfoDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public List<FaqVO> getFaqInfoList(){
		return sqlSessionTemplate.selectList("FaqInfoDAO.getFaqInfoList");
	}
	public FaqVO getFaqInfo(int fq_number) {
	    return sqlSessionTemplate.selectOne("FaqInfoDAO.getFaqInfo",fq_number);
	}
	
	public int insertFaqInfo(FaqVO vo) {
		return sqlSessionTemplate.insert("FaqInfoDAO.insertFaqInfo", vo);
	}
	
	public int updateFaqInfo(FaqVO vo) {
		return sqlSessionTemplate.update("FaqInfoDAO.updateFaqInfo", vo);
	}
	
	public int deleteFaqInfo(int fq_number) {
		return sqlSessionTemplate.delete("FaqInfoDAO.deleteFaqInfo", fq_number);
	}
	
}
