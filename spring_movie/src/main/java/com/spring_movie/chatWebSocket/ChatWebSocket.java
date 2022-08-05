package com.spring_movie.chatWebSocket;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.spring_movie.dto.MessageDto;

public class ChatWebSocket extends TextWebSocketHandler{
	
	private ArrayList<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("=====open 시작=====");
		System.out.println("afterConnectionEstablished() 호출");
		System.out.println("session.getId() : " + session.getId());
		sessionList.add(session);
		System.out.println("sessionList.size() : " + sessionList.size());
		
		/*
		Map<String, Object> sessionMap = session.getAttributes();
		String loginId = (String) sessionMap.get("loginId");
		System.out.println("loginId : " + loginId);
		if (loginId == null) {
			loginId = "비회원_" + session.getId();
		} else {
			loginId = loginId + "_" + session.getId();
		}
		*/
		
		// 다른사람에게 나의 접속을 알림
		Gson gson = new Gson();
		MessageDto msgDto = new MessageDto();
		msgDto.setMsgComment("connect");
		msgDto.setLoginId(loginCheck(session.getAttributes(), session));

		for(int i = 0; i < sessionList.size(); i++) {
			if(!sessionList.get(i).getId().equals(session.getId())) {
				System.out.println("msgDto : " + msgDto);
				sessionList.get(i).sendMessage(new TextMessage(gson.toJson(msgDto)));
			}
		}
		
		// 접속중 사용자 목록을 loginId에 담아서 return
		String userList = "";
		System.out.println(sessionList);
		for(int i = 0; i < sessionList.size(); i++) {
			System.out.println("====================");
			System.out.println("sessionList.get(i).getId() : " + sessionList.get(i).getId());
			System.out.println("session.getId() : " + session.getId());
			System.out.println("====================");
			String conUserId = loginCheck(sessionList.get(i).getAttributes(), session);
			userList += conUserId + "++";
		}
		System.out.println("userList : " + userList);
		msgDto.setLoginId(userList);
		session.sendMessage(new TextMessage(gson.toJson(msgDto)));
		System.out.println("=====open 종료=====");
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("=====close 시작=====");
		System.out.println("afterConnectionClosed() 호출");
		System.out.println("session.getId() : " + session.getId());
		sessionList.remove(session);
		System.out.println("sessionList.size() : " + sessionList.size());
		/*
		Map<String, Object> sessionMap = session.getAttributes();
		String loginId = (String) sessionMap.get("loginId");
		System.out.println("loginId : " + loginId);
		
		if (loginId == null) {
			loginId = "비회원_" + session.getId();
		} else {
			loginId = loginId + "_" + session.getId();
		}
		*/
		Gson gson = new Gson();
		MessageDto msgDto = new MessageDto();
		msgDto.setMsgComment("disConnect");
		msgDto.setLoginId(loginCheck(session.getAttributes(), session));
		for(int i = 0; i < sessionList.size(); i++) {
			if(!sessionList.get(i).getId().equals(session.getId())) {
				sessionList.get(i).sendMessage(new TextMessage(gson.toJson(msgDto)));
			}
		}
		System.out.println("=====close 종료=====");
	}
	
	

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("=====message 시작=====");
		System.out.println("handleTextMessage() 호출");
		System.out.println("session.getId() : " + session.getId());
		System.out.println("message.getPayload() : " + message.getPayload());
		
		Gson gson = new Gson();
		MessageDto chatMsg = gson.fromJson(message.getPayload(), MessageDto.class);
		System.out.println(chatMsg);
		if(chatMsg.getLoginId().length() == 0) {
			chatMsg.setLoginId("비회원_" + session.getId());			
		}
		
		for(int i = 0; i < sessionList.size(); i++) {
			String chatMsg_json = gson.toJson(chatMsg);
			System.out.println(chatMsg_json);
			sessionList.get(i).sendMessage(new TextMessage(chatMsg_json));
			
		}
		System.out.println("=====message 종료=====");
	}
	
	private String loginCheck (Map<String, Object> sessionMap, WebSocketSession session) {
		sessionMap = session.getAttributes();
		String loginId = (String) sessionMap.get("loginId");
//		System.out.println("loginId : " + loginId);
		if (loginId == null) {
			loginId = "비회원_" + session.getId();
		} else {
			loginId = loginId + "_" + session.getId();
		}
		
		return loginId;
		
	}
	
	
}
