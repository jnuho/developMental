package com.kh.workman.faq.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.workman.admin.model.vo.Faq;

@Repository
public class FaqDaoImpl implements FaqDao {

	@Override
	public int insertFaq(SqlSessionTemplate session, Map<String, String> param) {
		return session.insert("faq.insertFaq", param);
	}

	@Override
	public List<Faq> selectFaqList(SqlSessionTemplate session, int cPage, int numPerPage) {
		RowBounds rows=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("faq.selectFaqList",null,rows);
	}

	@Override
	public int selectFaqCount(SqlSessionTemplate session) {
		return session.selectOne("faq.selectFaqCount");
	}

	@Override
	public int deleteFaq(SqlSessionTemplate session, Map<String, Object> map) {
		return session.delete("faq.deleteFaq", map);
	}
	
	
	
	
	

}
