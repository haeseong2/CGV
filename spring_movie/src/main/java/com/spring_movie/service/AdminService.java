package com.spring_movie.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.spring_movie.dao.AdminDao;
import com.spring_movie.dto.MemberDto;
import com.spring_movie.dto.MovieDto;
import com.spring_movie.dto.ReviewDto;
import com.spring_movie.dto.ScheduleDto;
import com.spring_movie.dto.TheaterDto;

@Service
public class AdminService {

	private ModelAndView mav;
	
	@Autowired
	private AdminDao adao;
	
	@Autowired
	private HttpSession session;
	
	public ModelAndView adminMovieList() {
		System.out.println("AdminService.adminMovieList() 호출");
		mav = new ModelAndView();
		ArrayList<MovieDto> movieList = adao.selectMovieList();
		System.out.println(movieList);
		mav.addObject("movieList", movieList);
		mav.setViewName("admin/AdminMovieList");
		return mav;
	}

	public ModelAndView adminTheaterList() {
		System.out.println("AdminService.adminTheaterList() 호출");
		mav = new ModelAndView();
		ArrayList<TheaterDto> theaterList = adao.selectTheaterList();
		System.out.println(theaterList);
		mav.addObject("theaterList", theaterList);
		mav.setViewName("admin/AdminTheaterList");
		return mav;
	}

	public ModelAndView adminSchedule() {
		System.out.println("AdminService.adminSchedule() 호출");
		mav = new ModelAndView();
		ArrayList<MovieDto> movieList = adao.selectMovieList();
		System.out.println(movieList);
		mav.addObject("movieList", movieList);
		
		ArrayList<TheaterDto> theaterList = adao.selectTheaterList();
		System.out.println(theaterList);
		mav.addObject("theaterList", theaterList);
		mav.setViewName("admin/AdminSchedule");
		return mav;
	}

	public String adminModifyMvstate(String mvcode, int mvstate) {
		System.out.println("AdminService.changeMvstate() 호출");
		adao.changeMvstate(mvcode, mvstate);
		MovieDto mvInfo = adao.selectMovie(mvcode);
		System.out.println(mvInfo);
		
		Gson gson = new Gson();
		String mvInfo_json = gson.toJson(mvInfo);
		System.out.println(mvInfo_json);
		return mvInfo_json;
	}

	public ModelAndView adminMovieView(String mvcode) {
		System.out.println("AdminService.adminMovieView() 호출");
		MovieDto movieInfo = adao.selectMovie(mvcode);
		System.out.println(movieInfo);

		ArrayList<ReviewDto> reviewList = adao.selectReview(mvcode);
		for (int i = 0; i < reviewList.size(); i++) {
			reviewList.get(i).setRvcomment(reviewList.get(i).getRvcomment().replace(" ", "&nbsp"));
			reviewList.get(i).setRvcomment(reviewList.get(i).getRvcomment().replace("\r\n", "<br>"));
		}
		System.out.println(reviewList);
		
		
		mav.addObject("movie", movieInfo);
		mav.addObject("reviewList",reviewList);
		mav.setViewName("admin/AdminMovieView");
		return mav;
	}

	public ModelAndView adminModifyMovie(MovieDto movie) {
		System.out.println("AdminService.adminModifyMovie() 호출");
		adao.modifyMovie(movie);
		ModelAndView mav = adminMovieView(movie.getMvcode());
		return mav;
	}

	public String adminModifyThstate(String thcode, int thstate) {
		System.out.println("AdminService.adminModifyThstate() 호출");
		// 극장 상태변경
		adao.changeThstate(thcode, thstate);
		// 극장정보 조회
		String thInfo_json = adminTheaterInfo(thcode);
		return thInfo_json;
	}

	public String adminTheaterInfo(String thcode) {
		System.out.println("AdminService.adminTheaterInfo() 호출");
		TheaterDto thInfo = adao.selectTheater(thcode);
		System.out.println(thInfo);
		
		Gson gson = new Gson();
		String thInfo_json = gson.toJson(thInfo);
		System.out.println(thInfo_json);
		return thInfo_json;
	}
	
	public String adminModifyTheater(TheaterDto theater) {
		System.out.println("AdminService.adminModifyTheater() 호출");
		int updateResult = adao.modifyTheater(theater);
		// thcode가 없을 경우 결과값이 0이지만, 바꾸려는 thname, thaddr, thtel이 틀릴 경우 query문에서 에러가 발생한다 >> try-catch문으로 처리 가능
		String updateResult_json = updateResult + "";
		return updateResult_json;
	}

	public ModelAndView adminInsertSchedule(ScheduleDto schedule, RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		System.out.println("AdminService.adminModifyTheater() 호출");
//		ArrayList<ScheduleDto> scheduleList = adao.selectMvDateScheduleList(schedule.getScmvcode(), schedule.getScdate());
//		System.out.println(scheduleList);
		System.out.println(schedule);
		System.out.println(schedule.getScroomtime().length);
		int count = 0;
		for(int i = 0; i < schedule.getScroomtime().length; i++) {
			ScheduleDto registSchedule = new ScheduleDto();
			String scmvcode = schedule.getScmvcode();
			System.out.println("scmvcode : " + scmvcode);
			String scthcode = schedule.getScthcode();
			System.out.println("scthcode : " + scthcode);
			String scroom = schedule.getScroomtime()[i].split(" ")[0];
			System.out.println("scroom : " + scroom);
			String scdate = schedule.getScroomtime()[i].split(" ")[1];
			scdate = schedule.getScdate() + " " + scdate;
			System.out.println("scdate : " + scdate);
			
			registSchedule.setScmvcode(scmvcode);
			registSchedule.setScthcode(scthcode);
			registSchedule.setScroom(scroom);
			registSchedule.setScdate(scdate);
			int insertResult = adao.insertSchedule(registSchedule);
			if(insertResult > 0) {
				count++;
			}
			
		}

		ra.addFlashAttribute("msg", "[" + schedule.getScdate() + "] " + count + "개 스케쥴이 등록되었습니다.");
		mav.setViewName("redirect:/adminSchedule");
		return mav;
	}

	public String getScRoomTime(String scthcode, String scdate) {
		System.out.println("AdminService.getScRoomTime() 호출");
		ArrayList<ScheduleDto> scRoomTimeList = adao.getScRoomTime(scthcode, scdate);
		Gson gson = new Gson();
		String scRoomTimeList_json = gson.toJson(scRoomTimeList);
		System.out.println(scRoomTimeList_json);
		return scRoomTimeList_json;
	}

	public ModelAndView adminMemberList() {
		System.out.println("AdminService.adminMemberList() 호출");
		ArrayList<MemberDto> memberList = adao.selectMemberList();
		System.out.println(memberList);
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberList", memberList);
		mav.setViewName("admin/AdminMemberList");
		return mav;
	}

	public String adminModifyMstate(String mid, String mstate) {
		System.out.println("AdminService.adminModifyMstate() 호출");
		adao.updateMstate(mid, mstate);
		String memeberInfo_json = adminMemberInfo(mid);
		return memeberInfo_json;
	}

	public String adminMemberInfo(String mid) {
		MemberDto memberInfo = adao.selectMember(mid);
		Gson gson = new Gson();
		String memeberInfo_json = gson.toJson(memberInfo);
		return memeberInfo_json;
	}

	

}
