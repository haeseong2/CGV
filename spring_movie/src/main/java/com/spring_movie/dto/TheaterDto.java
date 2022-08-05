package com.spring_movie.dto;

import lombok.Data;

@Data
public class TheaterDto {

	private String thcode;	// 극장코드
	private String thname;	// 극장이름
	private String thaddr;	// 극장주소
	private String thtel;	// 극장전화번호
	
	private int thstate;	// 0 : 비활성화, 1 : 활성화
}
