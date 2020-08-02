package com.kh.workman.faq.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.workman.admin.model.vo.Faq;
import com.kh.workman.faq.model.dao.FaqDao;

@Service
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	FaqDao dao;
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public int insertFaq(Map<String, String> param) {
		return dao.insertFaq(session, param);
	}

	@Override
	public List<Faq> selectFaqList(int cPage, int numPerPage) {
		return dao.selectFaqList(session,cPage,numPerPage);
	}

	@Override
	public int selectFaqCount() {
		return dao.selectFaqCount(session);
	}

	@Override
	public int deleteFaq(Map<String, Object> map) {
		return dao.deleteFaq(session, map);
	}
	
	
	
	
	
	

}
