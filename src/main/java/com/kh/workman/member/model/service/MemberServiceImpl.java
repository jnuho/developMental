package com.kh.workman.member.model.service;

import java.util.List;

import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.workman.member.model.dao.MemberDao;
import com.kh.workman.member.model.vo.Member;
import com.kh.workman.member.model.vo.MyStudyBoard;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;
	
	@Autowired
	SqlSessionTemplate session;
	
	
	@Override
	public Member selectLogin(Member m) {
		return dao.selectLogin(session, m);
	}
	
	@Override
	public int insertMember(Member m) {
		
		return dao.insertMember(session, m);
	}
	
	@Override
	public Member selectFindEmail(String toemail) {
		// TODO Auto-generated method stub
		return dao.selectFindEmail(session, toemail);
	}
	
	@Override
	public int updateMember(Member m)
	{
		return dao.updateMember(session, m);
	}
	
	@Override
	public int updateInfoMember(Member m) {
		
		return dao.updateInfoMember(session, m);
	}

	@Override
	public List<Member> selectAllMember() {
		return dao.selectAllMember(session);
	}
	
	
	@Override
	public int selectJobMyBoardCount(String nickname) {
		// TODO Auto-generated method stub
		return dao.selectJobMyBoardCount(session, nickname);
	}
	
	@Override
	public List<Map<String, Object>> selectPageJobMyBoardList(int cPage, int numPerPage, String nickname) {
		// TODO Auto-generated method stub
		return dao.selectPageJobMyBoardList(session, cPage, numPerPage, nickname);
	}
	
	@Override
	public int selectMyStudyBoardCount(String nickname) {
		// TODO Auto-generated method stub
		return dao.selectMyStudyBoardCount(session, nickname);
	}
	
	@Override
	public List<Map<String, Object>> selectStudyMyBoardList(String nickname) {
		// TODO Auto-generated method stub
		return dao.selectStudyMyBoardList(session, nickname);
	}
	
	@Override
	public Member selectMemberNickname(Member m) {
	  return dao.selectMemberNickname(session, m);
	}
	
	@Override
	public int updateMyJobBoardStatus(int no) {
		// TODO Auto-generated method stub
		return dao.updateMyJobBoardStatus(session, no);
	}
	
	@Override
	public int updateMyStudyBoardStatus(int no) {
		// TODO Auto-generated method stub
		return dao.updateMyStudyBoardStatus(session,no);
	}
	
	@Override
	public int updateMyJobBoardContent(MyStudyBoard b) {
		// TODO Auto-generated method stub
		return dao.updateMyJobBoardContent(session, b);
	}
	
	@Override
	public int updateMyStudyBoardContent(MyStudyBoard b) {
		// TODO Auto-generated method stub
		return dao.updateMyStudyBoardContent(session, b);
	}
	
	@Override
	public int updatedeleteMember(Member m) {
		// TODO Auto-generated method stub
		return dao.updatedeleteMember(session, m);
	}

	@Override
	public List<Map<String, Object>> selectApplyList(String nickname) {
		return dao.selectApplylist(session, nickname);
	}


}
