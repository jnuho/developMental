package com.kh.workman.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.workman.admin.model.vo.AdminMember;

@Repository
public class AdminMemberDaoImpl implements AdminMemberDao {
	
	@Override
	public int selectMemberCount(SqlSessionTemplate session) {
		return session.selectOne("member.selectMemberCount");
	}

	@Override
	public List<AdminMember> selectMemberList(SqlSessionTemplate session, int cPage, int numPerpage ) {
		RowBounds rows=new RowBounds((cPage-1)*numPerpage,numPerpage);
		return session.selectList("member.selectMemberList",null,rows);
	}

	@Override
	public int statusUpdate(SqlSessionTemplate session, Map<String, Object> model) {
		return session.update("member.statusUpdate", model);
	}

	@Override
	public int deleteMember(SqlSessionTemplate session, Map<String, Object> map) {
		return session.delete("member.deleteMember", map);
	}

	@Override
	public Map<String, String> memberView(SqlSessionTemplate session, String id) {
		return session.selectOne("member.selectMember", id);
	}

	@Override
	public List<AdminMember> listAll(SqlSessionTemplate session, String searchType, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		return session.selectList("member.listAll", map);
		
	}

	@Override
	public int countArticle(SqlSessionTemplate session, String searchType, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		return session.selectOne("member.countArticle", map);
	}

	@Override
	public int memberReport(SqlSessionTemplate session, int no) {
		return session.update("member.memberReport", no);
	}

	@Override
	public int memberReportEnd(SqlSessionTemplate session, int no) {
		return session.update("member.memberReportEnd", no);
	}
	
	
	
}
