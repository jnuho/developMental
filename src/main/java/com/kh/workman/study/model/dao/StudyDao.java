package com.kh.workman.study.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface StudyDao {

	
	int selectStudyBoardCount(SqlSessionTemplate session);
	
	List<Map<String,String>> selectStudyBoardList(SqlSessionTemplate session, int cPage, int numPerPage);


	int insertStudyBoard(SqlSessionTemplate session, Map<String, String> param);

	int ApplyStudy(SqlSessionTemplate session, Map<String, Object> p);

}
