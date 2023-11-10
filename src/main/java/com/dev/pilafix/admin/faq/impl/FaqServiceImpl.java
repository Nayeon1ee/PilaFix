package com.dev.pilafix.admin.faq.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.pilafix.admin.faq.FaqService;
import com.dev.pilafix.admin.faq.FaqVO;

@Service
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	private FaqInfoDAO dao;

	@Override
	public List<FaqVO> getFaqInfoList() {
		return dao.getFaqInfoList();
	}

	@Override
	public FaqVO getFaqInfo(int faq_number) {
		return dao.getFaqInfo(faq_number);
	}

	@Override
	public int insertFaqInfo(FaqVO vo) {
		return dao.insertFaqInfo(vo);
	}

	@Override
	public int updateFaqInfo(FaqVO vo) {
		return dao.updateFaqInfo(vo);
	}

	@Override
	public int deleteFaqInfo(int faq_number) {
		return dao.deleteFaqInfo(faq_number);
	}
	


}
