package com.spring_movie.dto;

import lombok.Data;

@Data
public class ReviewDto {

	private String rvrecode;
	private String rvmid;
	private String rvmvcode;
	private String rvcomment;
	private String rvdate;
	private int rvrecommend;

	private String mprofile;
}
