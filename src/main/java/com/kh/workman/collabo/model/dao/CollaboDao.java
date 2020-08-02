package com.kh.workman.collabo.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.workman.collabo.model.vo.CollaboCard;
import com.kh.workman.collabo.model.vo.CollaboComment;
import com.kh.workman.collabo.model.vo.CollaboCommentReply;
import com.kh.workman.collabo.model.vo.CollaboList;
import com.kh.workman.collabo.model.vo.CollaboTool;
import com.kh.workman.collabo.model.vo.DataPacket;
import com.kh.workman.member.model.vo.Member;

public interface CollaboDao {

	int createList(SqlSessionTemplate session, DataPacket receive);

	CollaboList selectCollaboListOne(SqlSessionTemplate session, int target);

	List<HashMap> participation(SqlSessionTemplate session, int collaboNo);

	int createCard(SqlSessionTemplate session, DataPacket receive);

	List<CollaboList> selectCollaboLists(SqlSessionTemplate session, int collaboNo);

	List<CollaboCard> selectCollaboCards(SqlSessionTemplate session, int collaboNo);

	int moveCard(SqlSessionTemplate session, DataPacket receive);

	List<Member> selectCollaboMembers(SqlSessionTemplate session, int collaboNo);

	int updateCard(SqlSessionTemplate session, DataPacket receive);

	int deleteCard(SqlSessionTemplate session, DataPacket receive);

	int deleteList(SqlSessionTemplate session, DataPacket receive);

	int deleteListToCards(SqlSessionTemplate session, DataPacket receive);

	int updateList(SqlSessionTemplate session, DataPacket receive);

	int moveList(SqlSessionTemplate session, DataPacket receive);

	List<CollaboTool> selectCollaboTools(SqlSessionTemplate session, String userId);

	int searchListPlaceNo(SqlSessionTemplate session, DataPacket receive);

	List<Map<String, String>> selectCollaboMemberList(SqlSessionTemplate session, String userId);

	int createCollaboTool(SqlSessionTemplate session, Map<String, Object> temp);

	int insertCollaboMember(SqlSessionTemplate session, Map<String, Object> temp);

	CollaboTool selectCollaboTool(SqlSessionTemplate session, int collaboNo);

	Member selectCollaboOwner(SqlSessionTemplate session, int collaboNo);

	int expulsionMember(SqlSessionTemplate session, HashMap<String, Object> receiveData);

	int exitCollabo(SqlSessionTemplate session, HashMap<String, Object> receiveData);

	int updateCollaboOwner(SqlSessionTemplate session, HashMap<String, Object> receiveData);

	List<CollaboComment> requestCommentData(SqlSessionTemplate session, int cardNo);

	List<CollaboCommentReply> requestCommentReply(SqlSessionTemplate session, int cardNo);

	int createComment(SqlSessionTemplate session, DataPacket receive);

	CollaboComment selectOneComment(SqlSessionTemplate session, DataPacket receive);

	int deleteComment(SqlSessionTemplate session, DataPacket receive);

	int createReply(SqlSessionTemplate session, DataPacket receive);

	CollaboCommentReply selectOneReply(SqlSessionTemplate session, DataPacket receive);

	int updateComment(SqlSessionTemplate session, DataPacket receive);

	int delteReply(SqlSessionTemplate session, DataPacket receive);

	int updateReply(SqlSessionTemplate session, DataPacket receive);

	int deleteCollabo(SqlSessionTemplate session, DataPacket receive);
}
