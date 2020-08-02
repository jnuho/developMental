package com.kh.workman.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.workman.admin.model.dao.NoticeDao;
import com.kh.workman.admin.model.vo.AdminAttachment;
import com.kh.workman.admin.model.vo.AdminNotice;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	NoticeDao dao;
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<AdminNotice> selectNoticeList(int cPage, int numPerPage) {
		return dao.selectNoticeList(session,cPage,numPerPage);
	}
	@Override
	public int selectNoticeCount() {
		return dao.selectNoticeCount(session);
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class) //RuntimeException 발생시
	public int insertNotice(Map<String, String> param, List<AdminAttachment> attachList) {
		int result=0;
		result=dao.insertNotice(session,param);//notice테이블에 데이터 입력!
		if(attachList.size()>0) {
			for(AdminAttachment a : attachList) {
				a.setNoticeNo(Integer.parseInt(param.get("noticeNo")));
				result=dao.insertAttachment(session,a);
			}
		}
		
		return result;
	}
	@Override
	public int deleteNotice(Map<String, Object> map) {
		return dao.deleteNotice(session, map);
	}
	@Override
	public List<AdminAttachment> selectAttachList() {
		return dao.selectAttchList(session);
	}
	
	@Override
	public AdminNotice selectNoticeOne(int noticeNo) {
		return dao.selectNoticeOne(session, noticeNo);
	}
	@Override
	public List<AdminAttachment> selectAttachment(int noticeNo) {
		return dao.selectAttachment(session,noticeNo);
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class) //RuntimeException 발생시
	public int updateNotice(Map<String, Object> param, List<AdminAttachment> attachList) {
		int result=0;
		result=dao.updateNotice(session,param);//notice테이블에 데이터 입력!
		if(attachList.size()>0) {
			for(AdminAttachment a : attachList) {
				a.setNoticeNo((int)param.get("noticeNo"));
				result=dao.updateAttachment(session,a);
			}
		}
		
		return result;
	}	
	
}
