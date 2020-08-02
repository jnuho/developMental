package com.kh.workman.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.workman.admin.model.vo.AdminAttachment;
import com.kh.workman.admin.model.vo.AdminNotice;

public interface NoticeService {

	List<AdminNotice> selectNoticeList(int cPage, int numPerPage);
	int selectNoticeCount();
	
	int insertNotice(Map<String, String> param, List<AdminAttachment> attachList);
	int deleteNotice(Map<String, Object> map);
	
	List<AdminAttachment> selectAttachList();
	AdminNotice selectNoticeOne(int noticeNo);
	List<AdminAttachment> selectAttachment(int noticeNo);
	int updateNotice(Map<String, Object> param, List<AdminAttachment> attachList);

}
