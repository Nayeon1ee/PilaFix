package com.dev.pilafix.admin.faq;

import java.util.List;

public interface FaqService {
	List<FaqVO> getFaqInfoList();
	FaqVO getFaqInfo(int faq_number);
	int insertFaqInfo(FaqVO vo);
	int updateFaqInfo(FaqVO vo);
	int deleteFaqInfo(int faq_number);
}
