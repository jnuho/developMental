package com.kh.workman.study.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.workman.study.model.dao.StudyDao;

@Service
public class StudyServiceImpl implements StudyService {

	 @Autowired
	  StudyDao dao;
	  
	  @Autowired
	  SqlSessionTemplate session;
	  
	  @Override
		public int selectStudyBoardCount() {
			return dao.selectStudyBoardCount(session);
		}

		@Override
		public List<Map<String, String>> selectStudyBoardList(int cPage, int numPerpage) {
			return dao.selectStudyBoardList(session,cPage,numPerpage);
		}


		@Override
		public int insertStudyBoard(Map<String, String> param) {
			return dao.insertStudyBoard(session, param);
		}

		@Override
		public int ApplyStudy(Map<String, Object> p) {
			return dao.ApplyStudy(session, p);
		}

	

}
