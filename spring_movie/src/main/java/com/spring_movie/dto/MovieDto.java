package com.spring_movie.dto;

import lombok.Data;

@Data
public class MovieDto {
	
	private String mvcode;		// 영화코드
	private String mvtitle;		// 영화제목
	private String mvpd;		// 영화감독
	private String mvactor;		// 영화배우
	private String mvgenre;		// 영화장르
	private String mvage;		// 관람연령
	private String mvtime;		// 러닝타임
	private String mvopen;		// 개봉일
	
	private String mvposter;	// 영화포스터

	private int mvstate;		// 영화 상영 유무 (0 : 상영중지, 1: 상영중)
	
	private int repeople;		// 예매인원
	private double rerate;		// 예매율
	private int rvlike;			// 추천수
	private int rvdislike;		// 비추천수
	
	
}
