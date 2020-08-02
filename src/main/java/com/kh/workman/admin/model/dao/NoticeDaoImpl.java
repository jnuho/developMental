package com.kh.workman.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.workman.admin.model.vo.AdminAttachment;
import com.kh.workman.admin.model.vo.AdminNotice;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Override
	public List<AdminNotice> selectNoticeList(SqlSessionTemplate session, int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("adminNotice.selectNoticeList",null,rows);
	}

	@Override
	public int selectNoticeCount(SqlSessionTemplate session) {
		return session.selectOne("adminNotice.selectNoticeCount");
	}

	@Override
	public int insertNotice(SqlSessionTemplate session, Map<String, String> param) {
		return session.insert("adminNotice.insertNotice", param);
	}

	@Override
	public int insertAttachment(SqlSessionTemplate session, AdminAttachment att) {
		return session.insert("adminNotice.insertAttachment", att);
	}

	@Override
	public int deleteNotice(SqlSessionTemplate session, Map<String, Object> map) {
		return session.delete("adminNotice.deleteNotice", map);
	}

	@Override
	public List<AdminAttachment> selectAttchList(SqlSessionTemplate session) {
		return session.selectList("adminNotice.selectAttchList");
	}

	@Override
	public AdminNotice selectNoticeOne(SqlSessionTemplate session, int noticeNo) {
		return session.selectOne("adminNotice.selectNoticeOne", noticeNo);
	}

	@Override
	public List<AdminAttachment> selectAttachment(SqlSessionTemplate session, int noticeNo) {
		return session.selectList("adminNotice.selectAttachment", noticeNo);
	}

	@Override
	public int updateNotice(SqlSessionTemplate session, Map<String, Object> param) {
		return session.update("adminNotice.updateNotice", param);
	}

	@Override
	public int updateAttachment(SqlSessionTemplate session, AdminAttachment att) {
		return session.update("adminNotice.updateAttachment", att);
	}
		
}
