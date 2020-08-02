package com.kh.workman.faq.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.workman.admin.model.vo.Faq;

public interface FaqDao {

	int insertFaq(SqlSessionTemplate session, Map<String, String> param);

	List<Faq> selectFaqList(SqlSessionTemplate session, int cPage, int numPerPage);

	int selectFaqCount(SqlSessionTemplate session);

	int deleteFaq(SqlSessionTemplate session, Map<String, Object> map);


}
