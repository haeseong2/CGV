package com.spring_movie.testWebSocket;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

public class TestWebSocket extends TextWebSocketHandler {

	private ArrayList<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception { // 접속될 때 실행되는 부분
		System.out.println("afterConnectionEstablished() 호출");
		System.out.println("session.getId() : " + session.getId());
		sessionList.add(session);
		System.out.println("sessionList.size() : " + sessionList.size());
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception { // 접속이 끝어질때 실행되는 부분
		System.out.println("afterConnectionClosed() 호출");
		System.out.println("session.getId() : " + session.getId());
		sessionList.remove(session);
		System.out.println("sessionList.size() : " + sessionList.size());
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception { // .send()시 실행되는 부분
		System.out.println("handleTextMessage() 호출");
		System.out.println("session.getId() : " + session.getId());
		System.out.println("message.getPayload() : " + message.getPayload());	// message.getPayload() : : message를 String타입으로 return
		
		Gson gson = new Gson();
		
		TestMsgDto testMsg = gson.fromJson(message.getPayload(), TestMsgDto.class);
		System.out.println(testMsg);
		
		// 여기서 service, dao 등을 호출하여 채팅 내역을 db에 저장할 수 있다.
		// 만약 이를 DB에 저장한다면
		// testDao.insert(testMsg);
		// >> INSERT ...
		
		// HttpSession과 WebSocketSession은 같은 Session을 쓰지만, 사용하는 방법이 다르다.
		session.getAttributes();	// map객체를 반환 : key - value값을 같는 객체
		
		for (int i = 0; i < sessionList.size(); i++) {
			Map<String, Object> sessionMap = sessionList.get(i).getAttributes();
			String loginId = (String) sessionMap.get("loginId");
			System.out.println(loginId);
			
			if (!sessionList.get(i).getId().equals(session.getId()) && loginId != null ) {
				// msg OK
				sessionList.get(i).sendMessage(new TextMessage(message.getPayload()));
				// 다른 session에 .메세지를 보냄 (새로운 TextMessage객체(전송받은 메세지를 담아서))
			}else {
				// msg NG
				
			}
		}
		
	}
	
	
}
