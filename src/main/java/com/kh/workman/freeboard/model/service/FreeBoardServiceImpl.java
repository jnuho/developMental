package com.kh.workman.freeboard.model.service;

import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.kh.workman.freeboard.model.dao.FreeBoardDao;
import com.kh.workman.freeboard.model.vo.Attachment;

@Service
public class FreeBoardServiceImpl implements FreeBoardService{

	@Autowired
	FreeBoardDao dao;
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	@Transactional(rollbackFor = Exception.class) 
	public int insertBoard(Map<String, String> param, List<Attachment> attachList) {
		int result=0;
		result=dao.insertBoard(session, param);
		if(attachList.size()>0) {
			for(Attachment a : attachList) {
				a.setNoticeNo(Integer.parseInt(param.get("noticeNo")));
				result=dao.insertAttachment(session,a);
			}
		}		
		return result;
	}

	@Override
	public int selectBoardCount() {
		return dao.selectBoardCount(session);
	}

	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerpage) {
		return dao.selectBoardList(session,cPage,numPerpage);
	}

	@Override
	public Map<String, String> selectBoard(int boardNo) {
		return dao.selectBoard(session, boardNo);
	}

	@Override
	public List<Attachment> selectAttachList(int boardNo) {
		return dao.selectAttachList(session, boardNo);
	}
	
}
