package com.spring_movie.dto;

import lombok.Data;

@Data
public class ReserveInfoDto {

	private String mvcode;		// 영화코드
	private String mvtitle;		// 영화이름
	private String mvposter;	// 영화포스터
	
	private String thname;		// 극장이름

	private String scroom;		// 상영관
	private String scdate;		// 상영일시
	
	private String recode;		// 예매코드
	private int reamount;		// 예매인원
	
	private String rvcheck;		// 작성 확인을 위한 관람평_예매코드

	private ReviewDto review;
}
