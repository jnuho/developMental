package com.kh.workman.collabo.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.workman.collabo.model.dao.CollaboDao;
import com.kh.workman.collabo.model.vo.CollaboCard;
import com.kh.workman.collabo.model.vo.CollaboComment;
import com.kh.workman.collabo.model.vo.CollaboCommentReply;
import com.kh.workman.collabo.model.vo.CollaboList;
import com.kh.workman.collabo.model.vo.CollaboTool;
import com.kh.workman.collabo.model.vo.DataPacket;
import com.kh.workman.member.model.vo.Member;

@Service
public class CollaboServiceImpl implements CollaboService {
	@Autowired
	CollaboDao dao;

	@Autowired
	SqlSessionTemplate session;

	@Override
	public int createList(DataPacket receive) {
		return dao.createList(session, receive);
	}

	@Override
	public CollaboList selectCollaboListOne(int target) {
		return dao.selectCollaboListOne(session, target);
	}

	@Override
	public List<HashMap> participation(int collaboNo) {
		return dao.participation(session, collaboNo);
	}

	@Override
	public int createCard(DataPacket receive) {
		return dao.createCard(session, receive);
	}

	@Override
	public List<CollaboList> selectCollaboLists(int collaboNo) {
		return dao.selectCollaboLists(session, collaboNo);
	}

	@Override
	public List<CollaboCard> selectCollaboCards(int collaboNo) {
		return dao.selectCollaboCards(session, collaboNo);
	}

	@Override
	public int moveCard(DataPacket receive) {
		return dao.moveCard(session, receive);
	}

	@Override
	public List<Member> selectCollaboMembers(int collaboNo) {
		return dao.selectCollaboMembers(session, collaboNo);
	}

	@Override
	public int updateCard(DataPacket receive) {
		return dao.updateCard(session, receive);
	}

	@Override
	public List<CollaboTool> selectCollaboTools(String userId) {
		return dao.selectCollaboTools(session, userId);
	}

	@Override
	public int deleteCard(DataPacket receive) {
		return dao.deleteCard(session, receive);
	}

	@Override
	public int deleteList(DataPacket receive) {
		return dao.deleteList(session, receive);
	}

	@Override
	public int deleteListToCards(DataPacket receive) {
		return dao.deleteListToCards(session, receive);
	}

	@Override
	public int updateList(DataPacket receive) {
		return dao.updateList(session, receive);
	}

	@Override
	public int moveList(DataPacket receive) {
		return dao.moveList(session, receive);
	}

	@Override
	public int insertCollaboMember(Map<String, Object> temp) {
		return dao.insertCollaboMember(session, temp);
	}

	@Override
	public int searchListPlaceNo(DataPacket receive) {
		return dao.searchListPlaceNo(session, receive);
	}

	@Override
	public List<Map<String, String>> selectCollaboMemberList(String userId) {
		return dao.selectCollaboMemberList(session, userId);
	}

	@Override
	public int createCollaboTool(Map<String, Object> temp) {
		return dao.createCollaboTool(session, temp);
	}

	@Override
	public CollaboTool selectCollaboTool(int collaboNo) {
		return dao.selectCollaboTool(session, collaboNo);
	}

	@Override
	public Member selectCollaboOwner(int collaboNo) {
		return dao.selectCollaboOwner(session, collaboNo);
	}

	@Override
	public int expulsionMember(HashMap<String, Object> receiveData) {
		return dao.expulsionMember(session, receiveData);
	}

	@Override
	public int exitCollabo(HashMap<String, Object> receiveData) {
		return dao.exitCollabo(session, receiveData);
	}

	@Override
	public int updateCollaboOwner(HashMap<String, Object> receiveData) {
		return dao.updateCollaboOwner(session, receiveData);
	}

	@Override
	public List<CollaboComment> requestCommentData(int cardNo) {
		return dao.requestCommentData(session, cardNo);
	}

	@Override
	public List<CollaboCommentReply> requestCommentReply(int cardNo) {
		return dao.requestCommentReply(session, cardNo);
	}

	@Override
	public int createComment(DataPacket receive) {
		return dao.createComment(session, receive);
	}

	@Override
	public CollaboComment selectOneComment(DataPacket receive) {
		return dao.selectOneComment(session, receive);
	}

	@Override
	public int deleteComment(DataPacket receive) {
		return dao.deleteComment(session, receive);
	}

	@Override
	public int createReply(DataPacket receive) {
		return dao.createReply(session, receive);
	}

	@Override
	public CollaboCommentReply selectOneReply(DataPacket receive) {
		return dao.selectOneReply(session, receive);
	}

	@Override
	public int updateComment(DataPacket receive) {
		return dao.updateComment(session, receive);
	}

	@Override
	public int deleteReply(DataPacket receive) {
		return dao.delteReply(session, receive);
	}

	@Override
	public int updateReply(DataPacket receive) {
		return dao.updateReply(session, receive);
	}

	@Override
	public int deleteCollabo(DataPacket receive) {
		return dao.deleteCollabo(session, receive);
	}
	
	

}
