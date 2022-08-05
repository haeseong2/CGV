package com.spring_movie.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring_movie.dto.MemberDto;
import com.spring_movie.service.MemberService;

@Controller
public class MemberController {

	private ModelAndView mav;
	
	@Autowired
	private MemberService msvc; // = new MemberService();
	// 의존성주입 : : 주입하려는 대상에 @autowired, service클래스에 @Service, 스프링이 스캔할 범위를 servlet=context.xml에 설정
	
	
	@RequestMapping(value = "/memberJoinForm")
	public String memberJoinForm(Model model) {
		System.out.println("회원가입페이지 이동 요청");
//		model.addAttribute("testdata1", 1234);
		return "member/MemberJoinForm";
	}
	// return이 null이거나 void일 경우 매핑된 주소.jsp를 찾아간다.(잘 사용 안함)
	
	// lombok : : getter, setter, equal, toString등을 자동으로 생성해주는 라이브러리
	@RequestMapping(value = "/memberJoin")
	public ModelAndView memberJoin(MemberDto member) throws IllegalStateException, IOException {
		System.out.println("회원가입요청");
		System.out.println(member);

		mav = msvc.memberJoin(member);
		
		return mav;	//	 return 기본값 : dispatcher, redirect는 따로 명령해야한다.
	}
	/*
	@RequestMapping(value = "/memberView")
	public String memberView(String mid, Model model) {
		System.out.println("회원가입요청");
		model.addAttribute("memberInfo", "model객체")
		return null;
	}
	*/
	
	// ModelAndView : : 데이터와 페이지 url주소를 같이 담는 객체
	
	@RequestMapping(value = "/memberIdCheck")
	public @ResponseBody String memberIdcheck (String inputId) {	
		// @ResponseBody : : page를 return하는 것이 아닌 data를 return함을 표시
		System.out.println("아이디 중복 확인 요청");
		System.out.println("입력한 아이디 : " + inputId);
		String idCheckResult = msvc.memberIdCheck(inputId);
		
		
		return idCheckResult;
	}
	
	@RequestMapping(value = "/memberLoginForm")
	public String memberLoginForm() {
		System.out.println("로그인 페이지 이동요청");
		return "member/MemberLoginForm";
	}
	
	// session에 Id, profile image를 담는다.
	@RequestMapping(value = "/memberLogin")
	public ModelAndView memberLogin(MemberDto loginMember, RedirectAttributes ra) {
		System.out.println("로그인 요청");
		System.out.println("loginId : " + loginMember.getMid());
		System.out.println("loginPw : " + loginMember.getMpw());
		
		mav = msvc.memberLogin(loginMember, ra);
		
		return mav;
	}
	@RequestMapping(value = "/memberLogout")
	public ModelAndView memberLogout(RedirectAttributes ra) {
		System.out.println("로그아웃 요청");
		mav = msvc.memberLogout(ra);
		return mav;
	}
	
	@RequestMapping(value = "/memberView")
	public ModelAndView memberView(){
		// mav.setViewName, mav.addObject를 controller에서 정의하고 값만 service에서 구해도 무방하다.		
		mav = msvc.memberView();
		return mav;
	}
	
	@RequestMapping(value = "/kakaoLogin")
	public ModelAndView kakaoLogin(String kakaoId, String kakaoEmail, String kakaoNickname, String kakaoProfile, RedirectAttributes ra) {
		System.out.println("카카오 로그인 요청");
		System.out.println("kakaoId : " + kakaoId + " | " + "kakaoEmail : " + kakaoEmail + " | " + "kakaoNickname : " + kakaoNickname + " | " + "kakaoProfile : " + kakaoProfile);
		ModelAndView mav = msvc.kakaoLogin(kakaoId, kakaoEmail, kakaoNickname, kakaoProfile, ra);
		return mav;
	}
	
}
