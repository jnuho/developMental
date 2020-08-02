package com.kh.workman.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.workman.admin.model.vo.AdminAttachment;
import com.kh.workman.admin.model.vo.AdminNotice;

public interface NoticeDao {


	List<AdminNotice> selectNoticeList(SqlSessionTemplate session, int cPage, int numPerPage);
	int selectNoticeCount(SqlSessionTemplate session);
	
	int insertNotice(SqlSessionTemplate session, Map<String, String> param);
	int insertAttachment(SqlSessionTemplate session, AdminAttachment att);
	int deleteNotice(SqlSessionTemplate session, Map<String, Object> map);
	List<AdminAttachment> selectAttchList(SqlSessionTemplate session);
	AdminNotice selectNoticeOne(SqlSessionTemplate session, int noticeNo);
	List<AdminAttachment> selectAttachment(SqlSessionTemplate session, int noticeNo);
	
	int updateNotice(SqlSessionTemplate session, Map<String, Object> param);
	int updateAttachment(SqlSessionTemplate session, AdminAttachment a);

}
