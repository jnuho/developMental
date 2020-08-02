package com.kh.workman.collabo.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.workman.collabo.model.vo.CollaboCard;
import com.kh.workman.collabo.model.vo.CollaboComment;
import com.kh.workman.collabo.model.vo.CollaboCommentReply;
import com.kh.workman.collabo.model.vo.CollaboList;
import com.kh.workman.collabo.model.vo.CollaboTool;
import com.kh.workman.collabo.model.vo.DataPacket;
import com.kh.workman.member.model.vo.Member;

@Repository
public class CollaboDaoImpl implements CollaboDao {

	@Override
	public int createList(SqlSessionTemplate session, DataPacket receive) {
		return session.insert("collabo.createList", receive);
	}

	@Override
	public CollaboList selectCollaboListOne(SqlSessionTemplate session, int target) {
		return session.selectOne("collabo.selectCollaboListOne", target);
	}

	@Override
	public List<HashMap> participation(SqlSessionTemplate session, int collaboNo) {
		return session.selectList("collabo.participation", collaboNo);
	}

	@Override
	public int createCard(SqlSessionTemplate session, DataPacket receive) {
		return session.insert("collabo.createCard", receive);
	}

	@Override
	public List<CollaboList> selectCollaboLists(SqlSessionTemplate session, int collaboNo) {
		return session.selectList("collabo.selectCollaboLists", collaboNo);
	}

	@Override
	public List<CollaboCard> selectCollaboCards(SqlSessionTemplate session, int collaboNo) {
		return session.selectList("collabo.selectCollaboCards", collaboNo);
	}

	@Override
	public int moveCard(SqlSessionTemplate session, DataPacket receive) {
		return session.update("collabo.moveCard", receive);
	}

	@Override
	public List<Member> selectCollaboMembers(SqlSessionTemplate session, int collaboNo) {
		return session.selectList("collabo.selectCollaboMembers", collaboNo);
	}

	@Override
	public int updateCard(SqlSessionTemplate session, DataPacket receive) {
		return session.update("collabo.updateCard", receive);
	}

	@Override
	public int deleteCard(SqlSessionTemplate session, DataPacket receive) {
		return session.update("collabo.deleteCard", receive);
	}

	@Override
	public int deleteList(SqlSessionTemplate session, DataPacket receive) {
		return session.update("collabo.deleteList", receive);
	}

	@Override
	public int deleteListToCards(SqlSessionTemplate session, DataPacket receive) {
		return session.update("collabo.deleteListToCards", receive);
	}

	@Override
	public int updateList(SqlSessionTemplate session, DataPacket receive) {
		return session.update("collabo.updateList", receive);
	}

	@Override
	public int moveList(SqlSessionTemplate session, DataPacket receive) {
		return session.update("collabo.moveList", receive);
	}

	@Override
	public int searchListPlaceNo(SqlSessionTemplate session, DataPacket receive) {
		return session.selectOne("collabo.searchListPlaceNo", receive);
	}

	@Override
	public List<CollaboTool> selectCollaboTools(SqlSessionTemplate session, String userId) {
		return session.selectList("collabo.selectCollaboTools", userId);
	}

	@Override
	public List<Map<String, String>> selectCollaboMemberList(SqlSessionTemplate session, String userId) {
		return session.selectList("collabo.selectCollaboMemberList", userId);
	}

	@Override
	public int createCollaboTool(SqlSessionTemplate session, Map<String, Object> temp) {
		return session.insert("collabo.createCollaboTool", temp);
	}

	@Override
	public int insertCollaboMember(SqlSessionTemplate session, Map<String, Object> temp) {
		return session.insert("collabo.insertCollaboMember", temp);
	}

	@Override
	public CollaboTool selectCollaboTool(SqlSessionTemplate session, int collaboNo) {
		return session.selectOne("collabo.selectCollaboTool", collaboNo);
	}

	@Override
	public Member selectCollaboOwner(SqlSessionTemplate session, int collaboNo) {
		return session.selectOne("collabo.selectCollaboOwner", collaboNo);
	}

	@Override
	public int expulsionMember(SqlSessionTemplate session, HashMap<String, Object> receiveData) {
		return session.delete("collabo.expulsionMember", receiveData);
	}

	@Override
	public int exitCollabo(SqlSessionTemplate session, HashMap<String, Object> receiveData) {
		return session.delete("collabo.exitCollabo", receiveData);
	}

	@Override
	public int updateCollaboOwner(SqlSessionTemplate session, HashMap<String, Object> receiveData) {
		return session.update("collabo.updateCollaboOwner", receiveData);
	}

	@Override
	public List<CollaboComment> requestCommentData(SqlSessionTemplate session, int cardNo) {
		return session.selectList("collabo.requestCommentData", cardNo);
	}

	@Override
	public List<CollaboCommentReply> requestCommentReply(SqlSessionTemplate session, int cardNo) {
		return session.selectList("collabo.requestCommentReply", cardNo);
	}

	@Override
	public int createComment(SqlSessionTemplate session, DataPacket receive) {
		return session.insert("collabo.createComment", receive);
	}

	@Override
	public CollaboComment selectOneComment(SqlSessionTemplate session, DataPacket receive) {
		return session.selectOne("collabo.selectOneComment", receive);
	}

	@Override
	public int deleteComment(SqlSessionTemplate session, DataPacket receive) {
		return session.update("collabo.deleteComment", receive);
	}

	@Override
	public int createReply(SqlSessionTemplate session, DataPacket receive) {
		return session.insert("collabo.createReply", receive);
	}

	@Override
	public CollaboCommentReply selectOneReply(SqlSessionTemplate session, DataPacket receive) {
		return session.selectOne("collabo.selectOneReply", receive);
	}

	@Override
	public int updateComment(SqlSessionTemplate session, DataPacket receive) {
		return session.update("collabo.updateComment", receive);
	}

	@Override
	public int delteReply(SqlSessionTemplate session, DataPacket receive) {
		return session.update("collabo.deleteReply", receive);
	}

	@Override
	public int updateReply(SqlSessionTemplate session, DataPacket receive) {
		return session.update("collabo.updateReply", receive);
	}

	@Override
	public int deleteCollabo(SqlSessionTemplate session, DataPacket receive) {
		return session.update("collabo.deleteCollabo", receive);
	}

}
