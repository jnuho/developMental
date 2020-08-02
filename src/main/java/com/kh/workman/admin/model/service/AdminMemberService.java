package com.kh.workman.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.workman.admin.model.vo.AdminMember;

public interface AdminMemberService {

	int selectMemberCount();
	List<AdminMember> selectMemberList(int cPage,int numPerpage);

	int statusUpdate(Map<String, Object> model);

	int deleteMember(Map<String, Object> map);

	Map<String, String> memberView(String id);
	
	
	List<AdminMember> listAll(String searchType, String keyword);
	int countArticle(String searchType, String keyword);
	int memberReport(int no);
	int memberReportEnd(int no);

	
	
}
