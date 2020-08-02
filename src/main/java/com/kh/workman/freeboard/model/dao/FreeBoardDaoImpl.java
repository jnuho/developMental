package com.kh.workman.freeboard.model.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.workman.freeboard.model.vo.Attachment;

@Repository
public class FreeBoardDaoImpl implements FreeBoardDao {
			
	@Override
	public int insertBoard(SqlSessionTemplate session, Map<String, String> param) {
		return session.insert("freeboard.insertBoard", param);
	}

	@Override
	public int insertAttachment(SqlSessionTemplate session, Attachment att) {
		return session.insert("freeboard.insertAttachment", att);
	}

	@Override
	public int selectBoardCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("freeboard.selectBoardCount");
	}

	@Override
	public List<Map<String, String>> selectBoardList(SqlSessionTemplate session, int cPage, int numPerPage) {
		RowBounds rows=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("freeboard.selectBoardList",null,rows);
	}

	@Override
	public Map<String, String> selectBoard(SqlSessionTemplate session, int boardNo) {
		return session.selectOne("freeboard.selectBoard", boardNo);
	}

	@Override
	public List<Attachment> selectAttachList(SqlSessionTemplate session, int boardNo) {
		return session.selectList("freeboard.selectAttachList", boardNo);
	}
	
	

}
