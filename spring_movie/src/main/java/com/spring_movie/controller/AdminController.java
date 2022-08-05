package com.spring_movie.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring_movie.dto.MemberDto;
import com.spring_movie.dto.MovieDto;
import com.spring_movie.dto.ScheduleDto;
import com.spring_movie.dto.TheaterDto;
import com.spring_movie.service.AdminService;
import com.spring_movie.service.MemberService;
import com.spring_movie.service.MovieService;

@Controller
public class AdminController {

	private ModelAndView mav;

	@Autowired
	private AdminService adsvc;
	
	@RequestMapping(value = "/adminMovieList")
	public ModelAndView adminMovieList() {
		System.out.println("관리자 영화목록 출력");
		ModelAndView mav = adsvc.adminMovieList();
		return mav;
	}
	
	@RequestMapping(value = "/adminTheaterList")
	public ModelAndView adminTheaterList() {
		System.out.println("관리자 극장목록 출력");
		ModelAndView mav = adsvc.adminTheaterList();
		return mav;
	}
	
	@RequestMapping(value = "/adminSchedule")
	public ModelAndView adminScheduleList() {
		System.out.println("관리자 스케쥴 등록 페이지 이동");
		ModelAndView mav = adsvc.adminSchedule();
		return mav;
	}
	
	@RequestMapping(value = "/adminModifyMvstate")
	public @ResponseBody String adminModifyMvstate(String mvcode, int mvstate) {
		// @ResponseBody : : String을 return하면 해당 주소로 가게되므로 data인 String을 넘겨주기위해 사용
		System.out.println("영화상태 변경");
		System.out.println("mvcode : " + mvcode);
		System.out.println("mvstate : " + mvstate);
		String mvInfo_json = adsvc.adminModifyMvstate(mvcode, mvstate);
		return mvInfo_json;
	}
	
	@RequestMapping(value = "/adminMovieView")
	public ModelAndView adminMovieView(String mvcode) {
		System.out.println("관리자 영화 상세페이지 이동");
		System.out.println("mvcode : " + mvcode);
		ModelAndView mav = adsvc.adminMovieView(mvcode);
		return mav;
	}
	
	@RequestMapping(value = "/adminModifyMovie")
	public ModelAndView adminModifyMovie(MovieDto movie) {
		System.out.println(movie);
		ModelAndView mav = adsvc.adminModifyMovie(movie);
		return mav;
	}
	
	@RequestMapping(value = "adminModifyThstate")
	public @ResponseBody String adminModifyThstate(String thcode, int thstate) {
		System.out.println("thcode : " + thcode);
		System.out.println("thstate : " + thstate);
		String thInfo_json = adsvc.adminModifyThstate(thcode, thstate);
		return thInfo_json;
	}
	
	@RequestMapping(value = "adminTheaterInfo")
	public @ResponseBody String adminTheaterInfo(String thcode) {
		System.out.println("thcode : " + thcode);
		String theaterInfo_json = adsvc.adminTheaterInfo(thcode);
		return theaterInfo_json;
	}
	
	@RequestMapping(value = "adminModifyTheater")
	public @ResponseBody String adminModifyTheater(TheaterDto theater) {
		System.out.println(theater);
		String updateResult = adsvc.adminModifyTheater(theater);
		return updateResult;
	}
	
	@RequestMapping(value = "scheduleWrite")
	public ModelAndView scheduleWrite(ScheduleDto schedule, RedirectAttributes ra) {
		System.out.println(schedule);
		ModelAndView mav = adsvc.adminInsertSchedule(schedule, ra);
		return mav;
	}
	
	@RequestMapping(value = "getScRoomTime")
	public @ResponseBody String getScRoomTime(String scthcode, String scdate) {
		System.out.println("상영관 및 시간 조회");
		String scRoomTimeList_json = adsvc.getScRoomTime(scthcode, scdate);
		return scRoomTimeList_json;
	}
	
	@RequestMapping(value = "adminMemberList")
	public ModelAndView adminMemberList() {
		System.out.println("관리자 회원목록 페이지 이동");
		ModelAndView mav = adsvc.adminMemberList();
		return mav;
	}
	
	@RequestMapping(value = "adminModifyMstate")
	public @ResponseBody String adminModifyMstate(String mid, String mstate) {
		System.out.println("회원 상태 변경 호출");
		String member_json = adsvc.adminModifyMstate(mid, mstate);
		return member_json;
	}
	
	@RequestMapping(value = "adminMemberInfo")
	public @ResponseBody String adminMemberInfo(String mid) {
		System.out.println("회원 상세정보");
		String memberInfo_json = adsvc.adminMemberInfo(mid);
		return memberInfo_json;
	}
}
