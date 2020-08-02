package com.kh.workman.freeboard.model.service;

import java.util.List;
import java.util.Map;
import com.kh.workman.freeboard.model.vo.Attachment;

public interface FreeBoardService {
	
	int selectBoardCount();
	
	List<Map<String,String>> selectBoardList(int cPage,int numPerpage);
	int insertBoard(Map<String,String> param, List<Attachment> attachList);
	
	Map<String, String> selectBoard(int boardNo);
	List<Attachment> selectAttachList(int boardNo);

}
