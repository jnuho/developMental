package com.kh.workman.faq.model.service;

import java.util.List;
import java.util.Map;

import com.kh.workman.admin.model.vo.Faq;

public interface FaqService {

	int insertFaq(Map<String, String> param);

	List<Faq> selectFaqList(int cPage, int numPerPage);

	int selectFaqCount();

	int deleteFaq(Map<String, Object> map);


}
