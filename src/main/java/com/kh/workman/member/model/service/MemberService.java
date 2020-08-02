package com.kh.workman.member.model.service;

import java.util.List;

import java.util.Map;

import com.kh.workman.member.model.vo.Member;
import com.kh.workman.member.model.vo.MyStudyBoard;

public interface MemberService {
	Member selectLogin(Member m);
	int insertMember(Member m);
	Member selectFindEmail(String toemail);
	int updateMember(Member m);
	int updateInfoMember(Member m);

	
	 List<Map<String, Object>> selectPageJobMyBoardList(int cPage, int numPerPage, String nickname);
	 int selectJobMyBoardCount(String nickname);
	 List<Map<String,Object>> selectStudyMyBoardList(String nickname);
	 int selectMyStudyBoardCount(String nickname);
	List<Member> selectAllMember();
	Member selectMemberNickname(Member m);

	List<Map<String, Object>> selectApplyList(String nickname);

	
	int updateMyJobBoardStatus(int no);
	int updateMyStudyBoardStatus(int no);
	
	int updateMyJobBoardContent(MyStudyBoard b);
	int updateMyStudyBoardContent(MyStudyBoard b);


	int updatedeleteMember(Member m);
}
