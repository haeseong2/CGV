package com.spring_movie.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberDto {
	
	private String mid;				// 아이디
	private String mpw;				// 비밀번호
	private String mname;			// 이름
	private String mbirth;			// 생년월일
	
	private String memail;			// 이메일
	private String maddress;		// 주소
	
	private String mpostcode;		// 우편번호
	private String maddr;			// 주소
	private String mdetailAddr;		// 상세주소
	private String mextraAddr;		// 참고항목
	
	private String mprofile;		// 프로필 파일 이름
	private MultipartFile mfile;	// 프로필 파일(파일이 그대로 들어갔다고 생각해도 무방)
	
	private int mstate;				// 0: 비활성화, 1: 활성화
	private int mjointype;			// 0: 일반 회원가입, 1: 카카오 회원가입
}
