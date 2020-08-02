package com.kh.workman.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.workman.admin.model.vo.AdminMember;

public interface AdminMemberDao {

	int selectMemberCount(SqlSessionTemplate session);
	List<AdminMember> selectMemberList(SqlSessionTemplate session, int cPage, int numPerpage);

	int statusUpdate(SqlSessionTemplate session, Map<String, Object> model);

	int deleteMember(SqlSessionTemplate session, Map<String, Object> map);

	Map<String, String> memberView(SqlSessionTemplate session, String id);
	
	List<AdminMember> listAll(SqlSessionTemplate session, String searchType, String keyword);
	int countArticle(SqlSessionTemplate session, String searchType, String keyword);
	int memberReport(SqlSessionTemplate session, int no);
	int memberReportEnd(SqlSessionTemplate session, int no);

}
