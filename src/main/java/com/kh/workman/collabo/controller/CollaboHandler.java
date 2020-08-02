package com.kh.workman.collabo.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.workman.collabo.model.service.CollaboService;
import com.kh.workman.collabo.model.vo.CollaboComment;
import com.kh.workman.collabo.model.vo.CollaboCommentReply;
import com.kh.workman.collabo.model.vo.DataPacket;

public class CollaboHandler extends TextWebSocketHandler {
	private static Map<String, WebSocketSession> sessionList = new HashMap<String, WebSocketSession>();
	private static Map<String, Integer> collaboList = new HashMap<String, Integer>();
	private Logger logger = LoggerFactory.getLogger(CollaboHandler.class);

	@Autowired
	CollaboService service;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		logger.debug("{} 연결종료", session.getId());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		DataPacket receive = parsingJson(message.getPayload());
//		ObjectMapper om = new ObjectMapper();
//		Map<String, Object> temp = om.readValue(message.getPayload(), Map.class);
//		System.out.println(temp);
		switch (receive.getType()) {
		case "connect":
			sessionList.put(receive.getUserId(), session);
			collaboList.put(receive.getUserId(), receive.getCollaboNo());
			logger.debug(receive.getUserId() + " 님이 " + collaboList.get(receive.getUserId())
					+ "번 방에 접속하셨습니다. SESSION ID = {}", sessionList.get(receive.getUserId()).getId());
			break;
		case "list":
			switch (receive.getMethod()) {
			case "create":
				createList(receive, session);
				break;
			case "update":
				updateList(receive, session);
				break;
			case "delete":
				deleteList(receive, session);
				break;
			case "move":
				moveList(receive, session);
				break;
			}
			break;
		case "card":
			switch (receive.getMethod()) {
			case "create":
				createCard(receive, session);
				break;
			case "update":
				updateCard(receive, session);
				break;
			case "delete":
				deleteCard(receive, session);
				break;
			case "move":
				moveCard(receive, session);
				break;
			}
			break;
		case "comment":
			switch (receive.getMethod()) {
			case "write":
				createComment(receive, session);
				break;
			case "delete":
				deleteComment(receive, session);
				break;
			case "update":
				updateComment(receive, session);
			}
			break;
		case "reply":
			switch (receive.getMethod()) {
			case "write":
				createReply(receive, session);
				break;
			case "delete":
				deleteReply(receive, session);
				break;
			case "update":
				updateReply(receive, session);
				break;
			}
			break;
		case "collabo":
			if (receive.getMethod().equals("delete")) {
				deleteCollabo(receive, session);
			}
			break;
		}
	}

	private void deleteCollabo(DataPacket receive, WebSocketSession session) throws IOException {
		boolean isCompleted = service.deleteCollabo(receive) == 1 ? true : false;
		List<HashMap> collabos = service.participation(receive.getCollaboNo());

		if (isCompleted) {
			for (String key : sessionList.keySet()) {
				for (int i = 0; i < collabos.size(); i++) {
					if (key.equals(collabos.get(i).get("ID"))) {
						sessionList.get(key).sendMessage(new TextMessage(toJson(receive)));
						break;
					}
				}
			}
		}
		logger.debug("Move Card Success [USER ID : " + receive.getUserId() + " Card NO : " + receive.getCardNo() + "]");
	}

	private void updateReply(DataPacket receive, WebSocketSession session) throws IOException {
		boolean isCompleted = service.updateReply(receive) == 1 ? true : false;
		List<HashMap> collabos = service.participation(receive.getCollaboNo());

		if (isCompleted) {
			for (String key : sessionList.keySet()) {
				for (int i = 0; i < collabos.size(); i++) {
					if (key.equals(collabos.get(i).get("ID"))) {
						sessionList.get(key).sendMessage(new TextMessage(toJson(receive)));
						break;
					}
				}
			}
		}
		logger.debug("Move Card Success [USER ID : " + receive.getUserId() + " Card NO : " + receive.getCardNo() + "]");
	}

	private void deleteReply(DataPacket receive, WebSocketSession session) throws IOException {
		boolean isCompleted = service.deleteReply(receive) == 1 ? true : false;
		List<HashMap> collabos = service.participation(receive.getCollaboNo());

		if (isCompleted) {
			for (String key : sessionList.keySet()) {
				for (int i = 0; i < collabos.size(); i++) {
					if (key.equals(collabos.get(i).get("ID"))) {
						sessionList.get(key).sendMessage(new TextMessage(toJson(receive)));
						break;
					}
				}
			}
		}
		logger.debug("Move Card Success [USER ID : " + receive.getUserId() + " Card NO : " + receive.getCardNo() + "]");
	}

	private void updateComment(DataPacket receive, WebSocketSession session) throws IOException {
		boolean isCompleted = service.updateComment(receive) == 1 ? true : false;
		List<HashMap> collabos = service.participation(receive.getCollaboNo());

		if (isCompleted) {
			for (String key : sessionList.keySet()) {
				for (int i = 0; i < collabos.size(); i++) {
					if (key.equals(collabos.get(i).get("ID"))) {
						sessionList.get(key).sendMessage(new TextMessage(toJson(receive)));
						break;
					}
				}
			}
		}
		logger.debug("Move Card Success [USER ID : " + receive.getUserId() + " Card NO : " + receive.getCardNo() + "]");
	}

	private void createReply(DataPacket receive, WebSocketSession session) throws IOException {
		if (receive.getContent() != null) {
			boolean isCompleted = service.createReply(receive) == 1 ? true : false;
			CollaboCommentReply cc = service.selectOneReply(receive);
			receive.setRegdate(cc.getRegdate());
			List<HashMap> collabos = service.participation(receive.getCollaboNo());
			logger.debug("" + isCompleted);
			if (isCompleted) {
				for (String key : sessionList.keySet()) {
					for (int i = 0; i < collabos.size(); i++) {
						if (key.equals(collabos.get(i).get("ID"))) {
							logger.debug("" + receive);
							sessionList.get(key).sendMessage(new TextMessage(toJson(receive)));
							break;
						}
					}
				}
			}
			logger.debug("Create REPLY Success [USER ID : " + receive.getUserId() + " CARD NO : " + receive.getCardNo()
					+ "]");
		}
	}

	private void deleteComment(DataPacket receive, WebSocketSession session) throws IOException {
		boolean isCompleted = service.deleteComment(receive) == 1 ? true : false;
		List<HashMap> collabos = service.participation(receive.getCollaboNo());

		if (isCompleted) {
			for (String key : sessionList.keySet()) {
				for (int i = 0; i < collabos.size(); i++) {
					if (key.equals(collabos.get(i).get("ID"))) {
						sessionList.get(key).sendMessage(new TextMessage(toJson(receive)));
						break;
					}
				}
			}
		}
		logger.debug("Move Card Success [USER ID : " + receive.getUserId() + " Card NO : " + receive.getCardNo() + "]");
	}

	private void createComment(DataPacket receive, WebSocketSession session) throws IOException {
		if (receive.getContent() != null) {
			boolean isCompleted = service.createComment(receive) == 1 ? true : false;
			CollaboComment cc = service.selectOneComment(receive);
			receive.setRegdate(cc.getRegdate());
			List<HashMap> collabos = service.participation(receive.getCollaboNo());
			logger.debug("" + isCompleted);
			if (isCompleted) {
				for (String key : sessionList.keySet()) {
					for (int i = 0; i < collabos.size(); i++) {
						if (key.equals(collabos.get(i).get("ID"))) {
							logger.debug("" + receive);
							sessionList.get(key).sendMessage(new TextMessage(toJson(receive)));
							break;
						}
					}
				}
			}
			logger.debug("Create Comment Success [USER ID : " + receive.getUserId() + " CARD NO : "
					+ receive.getCardNo() + "]");
		}
	}

	private void moveList(DataPacket receive, WebSocketSession session) throws IOException {
		DataPacket tempPacket = new DataPacket();
		tempPacket.setListNo(receive.getTargetNo());
		tempPacket.setTargetNo(receive.getListNo());
		tempPacket.setPlaceNo(service.searchListPlaceNo(tempPacket));
		receive.setPlaceNo(service.searchListPlaceNo(receive));

		System.out.println("receive : " + receive);
		System.out.println("tempPacket : " + tempPacket);

		boolean firstCompleted = service.moveList(receive) == 1 ? true : false;
		boolean secondCompleted = service.moveList(tempPacket) == 1 ? true : false;
		List<HashMap> collabos = service.participation(receive.getCollaboNo());

		if (firstCompleted && secondCompleted) {
			for (String key : sessionList.keySet()) {
				for (int i = 0; i < collabos.size(); i++) {
					if (key.equals(collabos.get(i).get("ID"))) {
						sessionList.get(key).sendMessage(new TextMessage(toJson(receive)));
						break;
					}
				}
			}
		}
		logger.debug("Move Card Success [USER ID : " + receive.getUserId() + " Card NO : " + receive.getCardNo() + "]");
	}

	private void updateList(DataPacket receive, WebSocketSession session) throws IOException {
		boolean isCompleted = service.updateList(receive) == 1 ? true : false;
		List<HashMap> collabos = service.participation(receive.getCollaboNo());

		if (isCompleted) {
			for (String key : sessionList.keySet()) {
				for (int i = 0; i < collabos.size(); i++) {
					if (key.equals(collabos.get(i).get("ID"))) {
						sessionList.get(key).sendMessage(new TextMessage(toJson(receive)));
						break;
					}
				}
			}
		}
		logger.debug("Move Card Success [USER ID : " + receive.getUserId() + " Card NO : " + receive.getCardNo() + "]");
	}

	private void deleteList(DataPacket receive, WebSocketSession session) throws IOException {
		int isCardsCompleted = -1;
		isCardsCompleted = service.deleteListToCards(receive);
		boolean isListCompleted = false;

		if (isCardsCompleted != -1) {
			isListCompleted = service.deleteList(receive) == 1 ? true : false;
		}
		List<HashMap> collabos = service.participation(receive.getCollaboNo());

		if (isCardsCompleted != -1 && isListCompleted) {
			for (String key : sessionList.keySet()) {
				for (int i = 0; i < collabos.size(); i++) {
					if (key.equals(collabos.get(i).get("ID"))) {
						sessionList.get(key).sendMessage(new TextMessage(toJson(receive)));
						break;
					}
				}
			}
		}
		logger.debug("Move Card Success [USER ID : " + receive.getUserId() + " Card NO : " + receive.getCardNo() + "]");
	}

	private void deleteCard(DataPacket receive, WebSocketSession session) throws IOException {
		boolean isCompleted = service.deleteCard(receive) == 1 ? true : false;
		List<HashMap> collabos = service.participation(receive.getCollaboNo());

		if (isCompleted) {
			for (String key : sessionList.keySet()) {
				for (int i = 0; i < collabos.size(); i++) {
					if (key.equals(collabos.get(i).get("ID"))) {
						sessionList.get(key).sendMessage(new TextMessage(toJson(receive)));
						break;
					}
				}
			}
		}
		logger.debug("Move Card Success [USER ID : " + receive.getUserId() + " Card NO : " + receive.getCardNo() + "]");
	}

	private void updateCard(DataPacket receive, WebSocketSession session) throws IOException {
		boolean isCompleted = service.updateCard(receive) == 1 ? true : false;
		List<HashMap> collabos = service.participation(receive.getCollaboNo());

		if (isCompleted) {
			for (String key : sessionList.keySet()) {
				for (int i = 0; i < collabos.size(); i++) {
					if (key.equals(collabos.get(i).get("ID"))) {
						sessionList.get(key).sendMessage(new TextMessage(toJson(receive)));
						break;
					}
				}
			}
		}
		logger.debug("Move Card Success [USER ID : " + receive.getUserId() + " Card NO : " + receive.getCardNo() + "]");
	}

	private void createCard(DataPacket receive, WebSocketSession session) throws IOException {
		if (receive.getContent() != null) {
			boolean isCompleted = service.createCard(receive) == 1 ? true : false;
			List<HashMap> collabos = service.participation(receive.getCollaboNo());

			if (isCompleted) {
				for (String key : sessionList.keySet()) {
					for (int i = 0; i < collabos.size(); i++) {
						if (key.equals(collabos.get(i).get("ID"))) {
							sessionList.get(key).sendMessage(new TextMessage(toJson(receive)));
							break;
						}
					}
				}
			}
			logger.debug("Create Card Success [USER ID : " + receive.getUserId() + " CARD NO : " + receive.getCardNo()
					+ "]");
		}
	}

	private void createList(DataPacket receive, WebSocketSession session) throws IOException {
		boolean isCompleted = service.createList(receive) == 1 ? true : false;
		List<HashMap> collabos = service.participation(receive.getCollaboNo());

		if (isCompleted) {
			for (String key : sessionList.keySet()) {
				for (int i = 0; i < collabos.size(); i++) {
					if (key.equals(collabos.get(i).get("ID"))) {
						sessionList.get(key).sendMessage(new TextMessage(toJson(receive)));
						break;
					}
				}
			}
		}
		logger.debug(
				"Create List Success [USER ID : " + receive.getUserId() + " LIST NO : " + receive.getListNo() + "]");
	}

	private void moveCard(DataPacket receive, WebSocketSession session) throws IOException {
		boolean isCompleted = service.moveCard(receive) == 1 ? true : false;
		List<HashMap> collabos = service.participation(receive.getCollaboNo());

		if (isCompleted) {
			for (String key : sessionList.keySet()) {
				for (int i = 0; i < collabos.size(); i++) {
					if (key.equals(collabos.get(i).get("ID"))) {
						sessionList.get(key).sendMessage(new TextMessage(toJson(receive)));
						break;
					}
				}
			}
		}
		logger.debug("Move Card Success [USER ID : " + receive.getUserId() + " Card NO : " + receive.getCardNo() + "]");
	}

	private DataPacket parsingJson(String receiveMessage) {
		Gson gson = new GsonBuilder().create();
		DataPacket temp = gson.fromJson(receiveMessage, DataPacket.class);
		return temp;
	}

	private String toJson(Object obj) {
		Gson gson = new GsonBuilder().create();
		return gson.toJson(obj);
	}

}
