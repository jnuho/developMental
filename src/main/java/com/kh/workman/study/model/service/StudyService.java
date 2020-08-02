package com.kh.workman.study.model.service;

import java.util.List;
import java.util.Map;

public interface StudyService {

	int selectStudyBoardCount();
	List<Map<String,String>> selectStudyBoardList(int cPage,int numPerpage);

	int insertStudyBoard(Map<String, String> param);
	int ApplyStudy(Map<String, Object> p);

}
