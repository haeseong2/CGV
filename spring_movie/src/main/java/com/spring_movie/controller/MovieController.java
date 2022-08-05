package com.spring_movie.controller;

import java.io.IOException;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring_movie.dto.ReservationDto;
import com.spring_movie.dto.ReviewDto;
import com.spring_movie.service.MovieService;

@Controller
public class MovieController {

	@Autowired
	MovieService mvsvc;
	
	
	@RequestMapping(value = "/cgvMovieList")
	public ModelAndView getCgvMovieList() throws IOException{
		ModelAndView mav = mvsvc.getCgvMovieList();
				
		return mav;
	}
	
	@RequestMapping(value = "/movieChart")
	public ModelAndView movieChart() {
		System.out.println("영화목록 페이지 이동요청");
		ModelAndView mav = mvsvc.movieChart();
		
		return mav;
	}
	
	@RequestMapping(value = "/movieView")
	public ModelAndView movieView(@RequestParam("mvcode") String mvcode) {
		System.out.println("영화 상세 페이지 이동요청");
		ModelAndView mav = mvsvc.movieView(mvcode);
		
		return mav;
	}
	
	@RequestMapping(value = "/movieReservationPage")
	public ModelAndView movieReservationPage() {
		System.out.println("영화 예매 페이지 이동요청");
		ModelAndView mav = mvsvc.movieReservationPage();
		
		return mav;
	}
		
	@RequestMapping(value = "/getThList")
	public @ResponseBody String getThList(@RequestParam("mvcode") String mvcode) {
		System.out.println("극장목록 요청");
		System.out.println("mvcode : " + mvcode);
		String thList_json = mvsvc.getThList(mvcode);
		
		
		return thList_json;
	
	}
	
	@RequestMapping(value = "/getScDateList")
	public @ResponseBody String getScDateList(@RequestParam("mvcode") String mvcode, @RequestParam String thcode) {
		System.out.println("날짜목록 요청");
		System.out.println("mvcode : " + mvcode);
		System.out.println("thcode : " + thcode);
		String scDateList_json = mvsvc.getScDateList(mvcode, thcode);
		return scDateList_json;
	}
	
	@RequestMapping(value = "/getScRoomTimeList")
	public @ResponseBody String getScRoomTimeList(@RequestParam("mvcode") String mvcode, @RequestParam String thcode, @RequestParam("scdate") String scdate) {
		System.out.println("상영관 및 시간 목록요청");
		System.out.println("mvcode : " + mvcode);
		System.out.println("thcode : " + thcode);
		System.out.println("scdate : " + scdate);
		String scRoomTimeList_json = mvsvc.getScRoomTimeList(mvcode, thcode, scdate);
		return scRoomTimeList_json;
	}
	
	@RequestMapping(value = "/movieReservation")
	public ModelAndView movieReservation(ReservationDto reservation, RedirectAttributes ra) {
		System.out.println("영화예매 요청");
		ModelAndView mav = mvsvc.movieReservation(reservation, ra);
		return mav;
	}
	
	@RequestMapping(value = "/movieReservationList")
	public ModelAndView movieReservationListPage(RedirectAttributes ra) {
		System.out.println("영화 예매목록 페이지 이동요청");
		ModelAndView mav = mvsvc.movieReservationList(ra);
		return mav;
	}

	@RequestMapping(value = "/cancelReservation")
	public ModelAndView cancelReservation(@RequestParam("recode") String recode, RedirectAttributes ra) {
		System.out.println("영화예매 취소 요청");
		ModelAndView mav = mvsvc.cancelReservation(recode, ra);
		return mav;
	}
	
	@RequestMapping(value = "/reviewWrite")
	public ModelAndView reviewWrite(ReviewDto reviewInfo, RedirectAttributes ra) {
		System.out.println("관람평 작성 요청");
		System.out.println(reviewInfo);
		ModelAndView mav = mvsvc.reviewWrite(reviewInfo, ra);
		return mav;
	}
	
	@RequestMapping(value = "/reviewView")
	public @ResponseBody String reviewView(String recode) {
		System.out.println("관람평 확인");
		System.out.println(recode);
		String review_json = mvsvc.reviewView(recode);
		return review_json;
	}
	
	@RequestMapping(value = "/getMyReview")
	public @ResponseBody String getMyReview(@RequestParam("rvmvcode") String rvmvcode, @RequestParam("rvmid") String rvmid) {
		System.out.println("내 리뷰 보기");
		String myReview_json = mvsvc.getMyReview(rvmvcode, rvmid);
		return myReview_json;
	}
	
	@RequestMapping(value = "/myReviewView")
	public @ResponseBody String myReviewView(String rvrecode) {
		System.out.println("관람평 수정 페이지 요청");
		String myReviewView_json = mvsvc.myReviewView(rvrecode);
		return myReviewView_json;
	}
	
	@RequestMapping(value = "/reviewModify")
	public ModelAndView reviewModify(ReviewDto review) {
		System.out.println("관람평 수정 요청");
		System.out.println(review);
		ModelAndView mav = mvsvc.reviewModify(review);
		return mav;
	}
	
	@RequestMapping(value = "/searchList")
	public ModelAndView searchList(String searchWord) {
		System.out.println("검색 요청");
		System.out.println(searchWord);
		ModelAndView mav = mvsvc.searchList(searchWord);
		return mav;
	}
	
}
